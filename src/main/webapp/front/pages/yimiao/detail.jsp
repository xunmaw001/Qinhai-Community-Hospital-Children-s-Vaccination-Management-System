<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>疫苗详情页</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css"/>
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css"/>
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css">
</head>
<style>
    /*padding-bottom 属性设置元素的下内边距（底部空白）*/
    .pb-120 {
        padding-bottom: 50px;
    }
    /*padding-top 属性设置元素的上内边距（头部空白）*/
    .pt-120 {
        padding-top: 20px;
    }

    .cmn-accordion .card-header .acc-btn .plus-icon::after {
        position: absolute;
        content: '';
        top: 50%;
        left: 50%;
        height: 25px;
        width: 1px;
        background-color: #bec452;
        -webkit-transform: translate(-50%, -50%) rotate(90deg);
        -ms-transform: translate(-50%, -50%) rotate(90deg);
        transform: translate(-50%, -50%) rotate(90deg);
        -webkit-transition: all 0.3s;
        -o-transition: all 0.3s;
        transition: all 0.3s;
    }

    .cmn-accordion .card-body {
        padding: 0;
    }

    blockquote {
        padding: 0 50px;
    }

    @media (max-width: 767px) {
        blockquote {
            padding: 0 30px;
        }
    }

    blockquote p {
        font-size: 24px;
        font-style: italic;
        text-align: center;
        font-family: "Playfair Display", serif;
    }

    @media (max-width: 767px) {
        blockquote p {
            font-size: 20px;
        }
    }


    /* 评论样式 和文本框样式 */
    body {
        font-family: "Raleway", sans-serif;
        font-size: 16px;
        padding: 0;
        margin: 0;
        font-weight: 400;
        position: relative;
        overflow-x: hidden;
    }

    img {
        max-width: 100%;
        height: auto;
    }

    ul, ol {
        padding: 0;
        margin: 0;
        list-style: none;
    }

    button {
        border: none;
    }

    input, textarea {
        padding: 10px 20px;
        border: 1px solid #e5e5e5;
        width: 100%;
        background-color: #ffffff;
    }


    textarea {
        min-height: 150px;
        resize: none;
    }

    /* 标题下面的蓝色字体 删除就会换行 */

    .post-meta {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
        margin: 0 -8px;
        margin-top: 5px;
    }

    .post-meta li {
        margin: 3px 8px;
    }

    .post-meta li a {
        font-size: 12px;
    }


    .blog-single-classic .content {
        margin-top: 25px;
    }



    /* 博客详情部分 css start */
    .blog-details-wrapper .blog-details-header {
        margin-top: 25px;
        padding-bottom: 15px;
        border-bottom: 1px solid #e5e5e5;
    }



    .comments-area {
        margin-top: 50px;
    }

    .comments-area .title {
        text-transform: capitalize;
        margin-bottom: 30px;
    }

    .comments-list .single-comment {
        display: flex;
        flex-wrap: wrap;
        padding: 30px 0;
        border-bottom: 1px solid #e5e5e5;
    }

    .comments-list .single-comment:first-child {
        padding-top: 0;
    }

    .comments-list .single-comment:last-child {
        padding-bottom: 0;
        border-bottom: none;
    }

    .comments-list .single-comment .thumb {
        flex: 0 0 80px;
        -ms-flex: 0 0 80px;
        max-width: 80px;
        height: 80px;
        border-radius: 50%;
        -webkit-border-radius: 50%;
        -moz-border-radius: 50%;
        -ms-border-radius: 50%;
        -o-border-radius: 50%;
        overflow: hidden;
    }

    .comments-list .single-comment .content {
        flex: 0 0 calc(100% - 80px);
        -ms-flex: 0 0 calc(100% - 80px);
        max-width: calc(100% - 80px);
        padding-left: 20px;
    }



    .comments-list .single-comment .content .date {
        font-size: 14px;
    }

    .comments-list .single-comment .content p {
        margin-top: 5px;
    }

    .comments-list .single-comment .content .comment-action {
        margin-top: 3px;
    }

    .comment-form-area {
        margin-top: 50px;
    }

    .comment-form-area .title {
        margin-bottom: 30px;
    }

    .comment-form-area .comment-form .form-group {
        margin-bottom: 30px;
    }

    .sidebar .widget + .widget {
        margin-top: 50px;
    }


    .sidebar .widget-title {
        font-size: 24px;
        text-transform: capitalize;
        margin-bottom: 30px;
        position: relative;
        padding-left: 15px;
    }

    .sidebar .widget-title::before {
        position: absolute;
        content: '';
        top: 4px;
        left: 0;
        width: 5px;
        height: 23px;
        background-color: var(--publicMainColor);
    }

    .sidebar .category-list li {
        padding: 10px 0;
        border-bottom: 1px solid #e5e5e5;
    }

    /*位置为 Latest Blog Post 意思 最新博客 样式*/
    .small-post-list .small-post-single:first-child {
        padding-top: 0;
    }
    .small-post-list .small-post-single {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
        padding: 20px 0;
        border-bottom: 1px solid #e5e5e5;
    }

    .small-post-list .small-post-single .content {
        width: calc(100% - 65px);
        padding-left: 15px;
    }



    /* 侧边栏 css end */

    .cmn-btn-border {
        padding: 13px 35px;
        font-size: 18px;
        text-transform: capitalize;
        color: #ffffff;
        background-color: var(--publicMainColor);
        position: relative;
        z-index: 1;
        -webkit-transition: all 0.3s;
        -o-transition: all 0.3s;
        transition: all 0.3s;
        border-radius: 3px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        -ms-border-radius: 3px;
        -o-border-radius: 3px;
    }

    .cmn-btn-border:hover {
        color: #ffffff;
        box-shadow: 0 5px 10px 0 rgba(0, 0, 0, 0.15);
    }

    .cmn-btn-border:hover::before {
        top: 0;
        left: 0;
    }

    .cmn-btn-border::before {
        position: absolute;
        content: '';
        top: -5px;
        left: -5px;
        width: 100%;
        height: 100%;
        background-color: var(--publicMainColor);
        z-index: -10;
        border: 2px solid #ffffff;
        -webkit-transition: all 0.3s;
        -o-transition: all 0.3s;
        transition: all 0.3s;
    }

    .cmn-btn-border::after {
        position: absolute;
        content: '';
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: var(--publicMainColor);
        z-index: -10;
        border: 2px solid #ffffff;
    }

    .blog-details-wrapper .blog-details-footer {
        padding: 20px 20px;
        border: 1px solid #f2f2f2;
        margin-top: 40px;
        display: -ms-flexbox;
        display: flex;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
        justify-content: space-between;
    }</style>
<body>

    <div id="app">
    <section class="blog-details-section pt-120 pb-120">
        <div class="sub_backgroundColor data-detail-breadcrumb" style="width: 1110px;"
             :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"20px auto","borderColor":"rgba(135, 206, 250, 1)","borderRadius":"4px","borderWidth":"0","borderStyle":"solid","height":"54px"}'>
                <span class="layui-breadcrumb">
                    <a class="first"
                       :style='{"padding":"8px 10px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0 5px","borderColor":"rgba(255,0,0,.3)","backgroundColor":"rgba(255, 255, 255, 0)","color":"rgba(14, 14, 14, 1)","borderRadius":"0","borderWidth":"0","fontSize":"16px","borderStyle":"solid"}'
                       href="../home/home.jsp">
                        首页
                    </a>
                    <a>
                        <cite :style='{"padding":"8px 15px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0 15px","borderColor":"rgba(255,0,0,.3)","backgroundColor":"rgba(255, 255, 255, 0)","color":"rgba(129, 84, 118, 1)","borderRadius":"4px","borderWidth":"0","fontSize":"16px","borderStyle":"solid"}'>
                            {{title}}
                        </cite>
                    </a>
                </span>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="blog-details-wrapper">
                        <div class="thumb">
                            <img :src="baseUrl+detail.yimiaoPhoto" alt="image">
                        </div>
                        <div class="blog-details-header">
                            <h3 class="blog-details-title">{{title}}</h3>
                            <ul class="post-meta">
                                <li v-if="detail.yimiaoUuidNumber">疫苗编号：
                                    {{detail.yimiaoUuidNumber}}
                                </li>
                                <li v-if="detail.yimiaoAddress">疫苗接种地点：
                                    {{detail.yimiaoAddress}}
                                </li>
                                <li v-if="detail.yimiaoKucunNumber">接种人数：
                                    {{detail.yimiaoKucunNumber}}
                                </li>
                                <li v-if="detail.yimiaoNewMoney">金额：
                                    {{detail.yimiaoNewMoney}}
                                </li>
                                <li v-if="detail.yimiaoTypes">疫苗类型：
                                    {{detail.yimiaoValue}}
                                </li>
                            </ul>

                            <ul class="post-meta">
                                <li>
                                                                    </li>
                            </ul>

                            <div style="padding: 20px;border: 1px solid #f2f2f2;margin-top: 20px;display: flex">
                                <div class="num-picker">
        <!-- 座位 -->
                                    <button style="height:auto;" class="sub_backgroundColor"
                                            :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,.3)","borderRadius":"4px 0 0 4px","borderWidth":"1px","width":"34px","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}'
                                            type="button" @click="buyNumber>0?buyNumber--:buyNumber"
                                            class="layui-btn layui-btn-primary">
                                        -
                                    </button>
                                    <input style="text-align:center;padding:10px 20px;width:300px;height: 36px"
                                           :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,.3)","borderRadius":"0","borderWidth":"1px 0","width":"44px","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}'
                                           type="number" v-model="buyNumber" id="buyNumber" name="buyNumber"
                                           class="layui-input" disabled="disabled"/>
                                    <button style="height:auto;" class="sub_backgroundColor"
                                            :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,.3)","borderRadius":"0 4px 4px 0","borderWidth":"1px","width":"34px","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}'
                                            type="button" @click="buyNumber++" class="layui-btn layui-btn-primary">
                                        +
                                    </button>
                                    <button @click="addYimiaoOrder()" style="height:auto;"
                                            :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0 5px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(23, 124, 176, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","lineHeight":"40px","fontSize":"16px","borderStyle":"solid"}'
                                            type="button" class="layui-btn btn-submit">
                                        立即预约
                                    </button>
                                </div>
                            </div>
                        <!-- <div style="padding: 20px;border: 0px solid #f2f2f2;margin-top: 20px;display: flex">
                                 <div class="num-picker">
                                     <button @click="yimiaoYuyue()" style="height:auto;" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0 5px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(23, 124, 176, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","lineHeight":"40px","fontSize":"16px","borderStyle":"solid"}' type="button" class="layui-btn btn-submit">
                                         立即预约
                                     </button>
                                 </div>
                             </div>-->
                        </div>
                        <div class="blog-details-content" v-html="myFilters(detail.yimiaoContent)">
                        </div>
                    </div>

                </div>
                <div class="col-lg-4" v-if="yimiaoRecommendList">
                    <div class="sidebar">
                        <div class="widget">
                            <h3 class="widget-title">系统推荐</h3>
                            <ul class="small-post-list">
                                <li class="small-post-single" v-for="(item,index) in yimiaoRecommendList"
                                    v-bind:key="index"
                                    @click="jump('../yimiao/detail.jsp?id='+item.id)">
                                    <div class="thumb"><img width="65px" :src="baseUrl+item.yimiaoPhoto"
                                                            alt="image">
                                    </div>
                                    <div class="content">
                                        <a class="main_color" class="date">{{item.yimiaoName}}</a>
                                        <h6 v-if="item.yimiaoNewMoney" class="post-title"><a
                                                style="color: red">{{item.yimiaoNewMoney}}</a>RMB</h6>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>    </div>


    <script src="../../layui/layui.js"></script>
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

    <script>
        Vue.prototype.myFilters= function (msg) {
            if(msg != null){
                return msg.replace(/\n/g, "<br>");
            }else{
                return "";
            }
        };
        var vue = new Vue({
            el: '#app',
            data: {
                //当前登录用户信息
                user:{},
                // 轮播图
                swiperList: [],//用于当前表的图片
                // 数据详情
                detail: {
                    id: 0
                },
                // 商品标题
                title: '',
                totalScore: 0,//评分
                baseUrl:"",//路径
                storeupFlag: 0,//收藏 [0为收藏 1已收藏]
                //系统推荐
                yimiaoRecommendList: [],
    <!-- 是订单并且非座位才有购物车 -->
                // 加入购物车数量
                buyNumber: 1,
                // 当前详情页表
                detailTable: 'yimiao',
            },
            methods: {
                //分享
                share(){
                    let element = createElement("http://localhost:8080/qhsqyyetyfjzglxt/front/index.jsp?url="+"./pages/yimiao/detail.jsp?id="+this.id);
                    element.select();
                    element.setSelectionRange(0, element.value.length);
                    document.execCommand('copy');
                    element.remove();
                    layui.layer.msg('复制分享页面成功,快去分享吧!', {time: 2000,icon: 6});
                },

                jump(url) {
                    jump(url)
                },
                isAuth(tablename, button) {
                    return isFrontAuth(tablename, button)
                },
                //预约
                yimiaoYuyue(){
                    let _this = this;
                    var mymessage = confirm("确定要预约吗？");if(!mymessage){return false;}
                    // localStorage.setItem('yimiaoId', _this.detail.id);
                    // _this.jump("../yimiaoOrder/add.jsp");

                    let data={
                        yimiaoId:_this.detail.id,
                        yonghuId:localStorage.getItem("userid"),
                        yimiaoOrderYesnoTypes:1,
                    }
                    // 提交数据
                    layui.http.requestJson('yimiaoOrder/add', 'post', data, function (res) {
                        if(res.code == 0) {
                            layui.layer.msg('预约成功', {
                                time: 2000,
                                icon: 6
                            }, function () {
                                _this.jump("../yimiaoOrder/list.jsp");
                            });
                        }else{
                            layui.layer.msg(res.msg, {
                                time: 5000,
                                icon: 5
                            });
                        }
                    });
                },
                // 立即购买
                addYimiaoOrder() {
                                                                                                          // 库存限制
                    if (this.detail.yimiaoKucunNumber > 0 && this.detail.yimiaoKucunNumber < this.buyNumber) {
                        layui.layer.msg(`疫苗库存不足`, {
                            time: 2000,
                            icon: 5
                        });
                        return false;
                    }
                    // 保存到storage中，在确认下单页面中获取要购买的商品
                localStorage.setItem('yimiaos', JSON.stringify([{
                        yimiaoId: vue.detail.id,
                    gongyingshangId: vue.detail.gongyingshangId,
                    yimiaoName: vue.detail.yimiaoName,
                    yimiaoUuidNumber: vue.detail.yimiaoUuidNumber,
                    yimiaoPhoto: vue.detail.yimiaoPhoto,
                    yimiaoAddress: vue.detail.yimiaoAddress,
                    yimiaoKucunNumber: vue.detail.yimiaoKucunNumber,
                    yimiaoNewMoney: vue.detail.yimiaoNewMoney,
                    yimiaoTypes: vue.detail.yimiaoTypes,
                    yimiaoContent: vue.detail.yimiaoContent,
                    yimiaoDelete: vue.detail.yimiaoDelete,
                    createTime: vue.detail.createTime,
                        buyNumber: this.buyNumber,
                    yonghuId: localStorage.getItem('userid'),
                }]));
                    // 跳转到确认下单页面
                    jump('../yimiaoOrder/confirm.jsp');
                },

                }
        });

        layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery', 'laypage', 'util'], function () {
            var layer = layui.layer;
            var util = layui.util;
            var element = layui.element;
            var form = layui.form;
            var carousel = layui.carousel;
            var http = layui.http;
            var jquery = layui.jquery;
            var laypage = layui.laypage;
            vue.baseUrl = http.baseurl

            localStorage.setItem("goUtl","./pages/yimiao/detail.jsp?id="+ http.getParam('id'))

            var limit = 10;

            let table = localStorage.getItem("userTable");
            if(table){
                http.request(table+"/session", 'get', {}, function (data) {
                    vue.user = data.data;
                });
            }

            // 数据ID
            var id = http.getParam('id');
            vue.detail.id = id;
            // 数据信息
            http.request(`${vue.detailTable}/detail/` + id, 'get', {}, function (res) {
                // 详情信息
                vue.detail = res.data;
                vue.title = vue.detail.yimiaoName;
                vue.detail.yimiaoContent = vue.detail.yimiaoContent.replaceAll("src=\"upload/","src=\""+vue.baseUrl+"upload/");
                // 轮播图片
                vue.swiperList = vue.detail.yimiaoPhoto ? vue.detail.yimiaoPhoto.split(",") : [];
                // 轮播图
                vue.$nextTick(() => {
                    carousel.render({
                        elem: '#swiper',
                        width: '420px',
                        height: '400px',
                        arrow: 'hover',
                        anim: 'default',
                        autoplay: 'true',
                        interval: '3000',
                        indicator: 'inside'
                    });
                });

            });


            // 系统推荐
            http.request(`yimiao/gexingtuijian`, 'get', {
                page: 1,
                limit: 5,
                yimiaoTypes: vue.detail.yimiaoTypes,
                yimiaoDelete: 1,
            }, function (res) {
                vue.yimiaoRecommendList = res.data.list;
            });

        });
    </script>
</body>
</html>
