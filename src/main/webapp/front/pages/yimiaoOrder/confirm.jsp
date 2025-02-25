<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>
<!-- 个人中心 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>确认预约</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css" />
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css" />
</head>
<style>

    .container {
        margin: 0 auto;
        width: 980px;
    }
    .index-title {
        text-align: center;
        box-sizing: border-box;
        width: 980px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    .index-title span {
        padding: 0 10px;
        line-height: 1.4;
    }

    .common_title{width:1200px;margin:20px auto 0;font-size:14px;}

    .common_list_con{width:1200px;border:1px solid #dddddd;border-top:2px solid var(--publicSubColor);margin:10px auto 0;background-color:#f7f7f7;position:relative;}

    .common_list_con dl{margin:20px;}
    .common_list_con dt{font-size:14px;font-weight:bold;margin-bottom:10px}
    .common_list_con dd input{vertical-align:bottom;margin-right:10px;margin-top: 5px;margin-left: 30px;}


    .goods_list_th{height:40px;border-bottom:1px solid #ccc}
    .goods_list_th li{float:left;line-height:40px;text-align:center;}
    .goods_list_th .col01{width:25%}
    .goods_list_th .col02{width:20%}
    .goods_list_th .col04{width:20%}
    .goods_list_th .col05{width:20%}

    .goods_list_td{height:80px;border-bottom:1px solid #eeeded}
    .goods_list_td li{float:left;line-height:80px;text-align:center;}
    .goods_list_td .col01{width:8%}
    .goods_list_td .col02{width:6%}
    .goods_list_td .col03{width:15%}
    .goods_list_td .col04{width:20%}
    .goods_list_td .col05{width:13%}
    .goods_list_td .col06{width:26%}
    .goods_list_td .col07{width:15%}

    .goods_list_td .col02{text-align:right}
    .goods_list_td .col02 img{width:63px;height:63px;border:1px solid #ddd;display:block;margin:7px 0;float:right;}
    .goods_list_td .col03{text-align:left;text-indent:20px}


    .settle_con{margin:10px}
    .total_goods_count,.transit,.total_pay{line-height:24px;text-align:right}
    .total_goods_count em,.total_goods_count b,.transit b,.total_pay b{font-size:14px;color:#ff4200;padding:0 5px;}

    .order_submit{width:1200px;margin:20px auto;}
    .order_submit a{width:160px;height:40px;line-height:40px;text-align:center;background-color:var(--publicSubColor);color:#fff;font-size:16px;display:block;float:right}


</style>
<body>

<div id="app">
    <div class="index-title sub_backgroundColor" style="width: 1200px" :style='{"padding":"10px","boxShadow":"0 0 2px rgba(160, 67, 26, 1)","margin":"10px auto","borderColor":"rgba(0,0,0,.3)","color":"rgba(255, 255, 255, 1)","borderRadius":"4px","borderWidth":"0","fontSize":"20px","borderStyle":"solid","height":"auto"}'>
        <span>CONFIRM / ORDER</span><span>确认预约</span>
    </div>
    <!-- 标题 -->
		            <h3 class="common_title">预约时间</h3>
            <div class="common_list_con clearfix" style="width: 1200px;  ">
                <el-date-picker style="width: 98%;margin: 10px"
                                v-model="yimiaoOrderTime"
                                type="datetime"
                                placeholder="选择预约时间">
                </el-date-picker>
            </div>

            <h3 class="common_title">清单</h3>
            <div class="common_list_con clearfix">
                <ul class="goods_list_th clearfix">
                    <li class="col01">名称</li>
                    <li class="col02">价格</li>
                    <li class="col04">数量</li>
                    <li class="col05">小计</li>
                </ul>
                <ul class="goods_list_td clearfix"  v-for="(item,index) in dataList" v-bind:key="index">
                    <li class="col01">{{index+1}}</li>
                    <li class="col02"><img :src="baseUrl+item.yimiaoPhoto"></li><!-- style="width: 100px;height: 100px;object-fit: cover;"-->
                    <li class="col03">{{item.yimiaoName}}</li>
                    <li class="col05">{{item.yimiaoNewMoney}} RMB</li>
                    <li class="col06">{{item.buyNumber}}</li>
					<li class="col07">{{(item.yimiaoNewMoney*item.buyNumber).toFixed(2)}} RMB</li>
                </ul>
            </div>

			<h3 class="common_title">结算</h3>
			<div class="common_list_con clearfix">
				<div class="settle_con" v-if="this.yimiaoOrderPaymentTypes == 1">
					<div class="total_goods_count">共<em>{{dataList.length}}</em>件，总金额:<b>{{totalMoney.toFixed(2)}} RMB</b></div>
					<div class="total_pay">实付款:<b>{{(totalMoney * zhekou).toFixed(2)}} RMB</b></div>
				</div>
				<div class="settle_con" v-if="this.yimiaoOrderPaymentTypes == 2">
					<div class="total_goods_count">共<em>{{dataList.length}}</em>件，总积分:<b>{{totalMoney.toFixed(2)}} 积分</b></div>
					<!--<div class="total_pay">实付款:<b>{{(totalMoney * zhekou).toFixed(2)}} 积分</b></div>-->
				</div>
			</div>


			<div class="order_submit clearfix" @click="payClick()">
				<a id="order_btn"><i class="layui-icon">&#xe657;</i> 确定提交</a>
			</div>
</div>
		<!-- layui -->
		<script src="../../layui/layui.js"></script>
		<!-- vue -->
		<script src="../../js/vue.js"></script>
        <!-- 引入element组件库 -->
        <script src="../../xznstatic/js/element.min.js"></script>
        <!-- 引入element样式 -->
        <link rel="stylesheet" href="../../xznstatic/css/element.min.css">
		<!-- 组件配置信息 -->
		<script src="../../js/config.js"></script>
		<!-- 扩展插件配置信息 -->
		<script src="../../modules/config.js"></script>
		<!-- 工具方法 -->
		<script src="../../js/utils.js"></script>
		<!-- 校验格式工具类 -->
		<script src="../../js/validate.js"></script>

		<script>
            var vue = new Vue({
                el: '#app',
                data: {
                    //项目路径
                    baseUrl:"",
                    dataList: [],
                    yimiaoOrderTime:new Date(),
                    yimiaoOrderPaymentTypes: 1,
                    zhekou:1,
                    // 当前用户信息
                    user: {}
                },
                computed: {
                    totalMoney: function() {
                        var total = 0;
                        for (var item of this.dataList) {
                            total += item.yimiaoNewMoney * item.buyNumber
                        }
                        return total;
                    }
                },
                methods: {
                    jump(url) {
                        jump(url)
                    }
                    // 正常预约，生成订单，减少余额，添加积分，减少库存，修改状态已支付
                    ,payClick() {
                    let data={
                        buyNumber:JSON.parse(localStorage.getItem('yimiaos'))[0].buyNumber,
                        yimiaoId:JSON.parse(localStorage.getItem('yimiaos'))[0].yimiaoId,
                        yimiaos:localStorage.getItem('yimiaos'),
			            yonghuId: localStorage.getItem('userid'),
                            yimiaoOrderTime:getDatetimeFormat(vue.yimiaoOrderTime),//年月日时分秒
                    }
                        // 获取商品详情信息
                        layui.http.requestJson(`yimiaoOrder/add`, 'POST', data, (res) => {
                            if(res.code == 0){
                                layui.layer.msg('预约成功', {
                                    time: 2000,
                                    icon: 6
                                },function (){
                                    window.location.href='../yimiaoOrder/list.jsp';
                                });
                            }else{
                                layui.layer.msg(res.msg, {
                                    time: 2000,
                                    icon: 5
                                });
                            }
                        });
                    }
                }
            });

            layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'form', 'upload'], function() {
                var layer = layui.layer;
                var element = layui.element;
                var carousel = layui.carousel;
                var http = layui.http;
                var jquery = layui.jquery;
                var form = layui.form;
                var upload = layui.upload;
                vue.baseUrl = http.baseurl

                // 充值
                jquery('#btn-recharge').click(function(e) {
                    layer.open({
                        type: 2,
                        title: '用户充值',
                        area: ['900px', '600px'],
                        content: '../shop-recharge/recharge.jsp'
                    });
                });

                // 获取疫苗购买的清单列表
				var yimiaos = localStorage.getItem('yimiaos');
				// 转换成json类型，localstorage保存的是string数据
				vue.dataList = JSON.parse(yimiaos);

                // 用户当前用户信息
                let table = localStorage.getItem("userTable");
                if (!table) {
                    layer.msg('请先登录', {
                        time: 2000,
                        icon: 5
                    }, function () {
                        window.parent.location.href = '../login/login.jsp';
                    });
                }
                http.request(`yonghu/session`, 'get', {}, function(data) {
                    vue.user = data.data;
                    // 用户当前用户折扣信息
                    http.request('dictionary/page', 'get', {
                        dicCode: "huiyuandengji_types",
                        dicName: "会员等级类型",
                        codeIndexStart: vue.user.huiyuandengjiTypes,
                        codeIndexEnd: vue.user.huiyuandengjiTypes,
                    }, function(res) {
                        if(res.data.list.length >0){
                            vue.zhekou = res.data.list[0].beizhu;
                        }
                    })
                });
            });
        </script>
	</body>
</html>
