<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>出入库详情添加</title>
    <!-- bootstrap样式，地图插件使用 -->
    <link rel="stylesheet" href="../../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css" />
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css" />
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css" />
</head>
<style>
    html::after {
        position: fixed;
        top: 0;
        right: 0;
        left: 0;
        bottom: 0;
        content: '';
        display: block;
        background-attachment: fixed;
        background-size: cover;
        background-position: center;
        z-index: -1;
    }
    #swiper {
        overflow: hidden;
        margin: 0 auto;
    }
    #swiper .layui-carousel-ind li {
        width: 20px;
        height: 10px;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,.3);
        border-radius: 6px;
        background-color: #f7f7f7;
        box-shadow: 0 0 6px rgba(255,0,0,.8);
    }
    #swiper .layui-carousel-ind li.layui-this {
        width: 30px;
        height: 10px;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0,0,0,.3);
        border-radius: 6px;
    }

    button, button:focus {
        outline: none;
    }

    .data-add-container .add .layui-select-title .layui-unselect {
        padding: 0 12px;
        height: 40px;
        font-size: 15px;
        border-radius: 4px;
        border-width: 1px;
        border-style: solid;
        text-align: center;
    }
    .data-add-container .add .layui-form-item {
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .data-add-container .layui-form-pane .layui-form-item[pane] .layui-form-label {
        margin: 0;
        position: inherit;
        background: transparent;
        border: 0;
    }
    .data-add-container .add .layui-input-block {
        margin: 0;
        flex: 1;
    }
    .data-add-container .layui-form-pane .layui-form-item[pane] .layui-input-inline {
        margin: 0;
        flex: 1;
        display: flex;
    }
</style>
<body style="background: #fff; ">
    <div id="app">
        <div class="data-add-container  sub_borderColor" :style='{"padding":"20px","margin":"30px auto","backgroundColor":"rgba(255, 255, 255, 0)","borderRadius":"10px","borderWidth":"1px","borderStyle":"solid"}'>

            <form class="layui-form layui-form-pane add" lay-filter="myForm">
                <!-- 级联表 出入库 -->
                <!--<div class="layui-form-item main_borderColor" :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"rgba(255, 255, 255, 0)","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                    <label  :style='{"width":"auto","borderColor": "rgba(255, 255, 255, 0)","padding":"0 12px 0 0","backgroundColor":"rgba(255, 255, 255, 0)","fontSize":"15px","color":"#333","textAlign":"left"}' class="layui-form-label">
                        出入库：
                    </label>
                    <div class="layui-input-block">
                        <select name="yimiaoChuruInoutId" id="yimiaoChuruInoutId" lay-filter="yimiaoChuruInoutId">
                            <option v-for="(item,index) in yimiaoChuruInoutList" v-bind:key="index" :value="item.id" :selected="detail.yimiaoChuruInoutId == item.id?true:false" :key="item.id">{{ item.yimiaoChuruInoutName }}</option>
                        </select>
                    </div>
                </div>-->
                <!-- 级联表 商品 -->
                <!--<div class="layui-form-item main_borderColor" :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"rgba(255, 255, 255, 0)","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                    <label  :style='{"width":"auto","borderColor": "rgba(255, 255, 255, 0)","padding":"0 12px 0 0","backgroundColor":"rgba(255, 255, 255, 0)","fontSize":"15px","color":"#333","textAlign":"left"}' class="layui-form-label">
                        商品：
                    </label>
                    <div class="layui-input-block">
                        <select name="yimiaoId" id="yimiaoId" lay-filter="yimiaoId">
                            <option v-for="(item,index) in yimiaoList" v-bind:key="index" :value="item.id" :selected="detail.yimiaoId == item.id?true:false" :key="item.id">{{ item.yimiaoName }}</option>
                        </select>
                    </div>
                </div>-->
    <!-- 当前表的 -->
                <!-- 级联表的表id -->
                <input type="hidden" :value="detail.yimiaoChuruInoutId" id="yimiaoChuruInoutId" name="yimiaoChuruInoutId"/>
                <!-- 级联表的表id -->
                <input type="hidden" :value="detail.yimiaoId" id="yimiaoId" name="yimiaoId"/>
                <div class="layui-form-item main_borderColor" :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"rgba(255, 255, 255, 0)","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                    <label  :style='{"width":"auto","borderColor": "rgba(255, 255, 255, 0)","padding":"0 12px 0 0","backgroundColor":"rgba(255, 255, 255, 0)","fontSize":"15px","color":"#333","textAlign":"left"}' class="layui-form-label">
                        操作数量：
                    </label>
                    <div class="layui-input-block">
                        <input class="layui-input main_borderColor" :style='{"padding":"0 12px","boxShadow":"0 0 0px rgba(160, 67, 26, 1)","backgroundColor":"#fff","color":"rgba(135, 206, 250, 1)","borderRadius":"4px","textAlign":"left","borderWidth":"1px","fontSize":"15px","borderStyle":"solid","height":"40px"}'
                           v-model="detail.yimiaoChuruInoutListNumber" lay-verify="integer|required" type="text" :readonly="ro.yimiaoChuruInoutListNumber" name="yimiaoChuruInoutListNumber" id="yimiaoChuruInoutListNumber" autocomplete="off">
                    </div>
                </div>
                <div class="layui-form-item main_borderColor" :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"rgba(255, 255, 255, 0)","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                    <div class="layui-input-block" style="text-align: right;">
                        <button :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.5)","margin":"0 10px","borderColor":"#ccc","backgroundColor":"rgba(75, 92, 196, 1)","color":"#fff","borderRadius":"8px","borderWidth":"0","width":"25%","fontSize":"14px","borderStyle":"solid","height":"44px"}' class="layui-btn btn-submit" lay-submit lay-filter="thisSubmit">提交</button>
                    </div>
                </div>

            </form>
        </div>
    </div>

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
    <!-- 校验格式工具类 -->
    <script src="../../js/validate.js"></script>
    <!-- 地图 -->
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=ca04cee7ac952691aa67a131e6f0cee0"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.AMapPositionPicker.js"></script>

    <script>
        var jquery = $;

        var vue = new Vue({
            el: '#app',
            data: {
                //项目路径
                baseUrl:"",
                dataList: [],
                ro:{
                    yimiaoChuruInoutId: false,
                    yimiaoId: false,
                    yimiaoChuruInoutListNumber: false,
                    insertTime: false,
                    createTime: false,
                },
                detail: {
                    yimiaoChuruInoutId: '',
                    yimiaoId: '',
                    yimiaoChuruInoutListNumber: '',
                    insertTime: '',
                    createTime: '',
                },
                yimiaoChuruInoutList:[],//级联表列表 出入库
                yimiaoChuruInout: {},//级联表单个 出入库
                yimiaoList:[],//级联表列表 商品
                yimiao: {},//级联表单个 商品

                // 下拉框

                centerMenu: centerMenu
            },
            updated: function() {
                layui.form.render('select', 'myForm');
            },
            computed: {
            },
            methods: {
                jump(url) {
                    jump(url)
                }
            }
        })


        layui.use(['layer', 'element', 'carousel', 'http', 'jquery', 'form', 'upload', 'laydate','tinymce'], function() {
            var layer = layui.layer;
            var element = layui.element;
            var carousel = layui.carousel;
            var http = layui.http;
            var jquery = layui.jquery;
            var form = layui.form;
            var upload = layui.upload;
            var laydate = layui.laydate;
            var tinymce = layui.tinymce;
            vue.baseUrl = http.baseurl

            localStorage.setItem("goUtl","./pages/yimiaoChuruInoutList/list.jsp")

            //var yimiaoChuruInoutId = http.getParam('yimiaoChuruInoutId');
            let yimiaoChuruInoutId = localStorage.getItem("yimiaoChuruInoutId")
            if(yimiaoChuruInoutId != null && yimiaoChuruInoutId != ""){
                //单个 出入库查询
                initializationYimiaoChuruInout(yimiaoChuruInoutId);
            }
            //列表 出入库查询
            initializationYimiaoChuruInoutList();
            //var yimiaoId = http.getParam('yimiaoId');
            let yimiaoId = localStorage.getItem("yimiaoId")
            if(yimiaoId != null && yimiaoId != ""){
                //单个 商品查询
                initializationYimiao(yimiaoId);
            }
            //列表 商品查询
            initializationYimiaoList();
            // 下拉框

           // 上传文件
            // 日期效验规则及格式
            dateTimePick();
            // 表单效验规则
            form.verify({
                // 正整数效验规则
                integer: [
                    /^[1-9][0-9]*$/
                    ,'必须是正整数'
                ]
                // 小数效验规则
                ,double: [
                    /^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/
                    ,'最大整数位为6为,小数最大两位'
                ]
            });

            // session独取
            let table = localStorage.getItem("userTable");
            http.request(table+"/session", 'get', {}, function (data) {
                // 表单赋值
                //form.val("myForm", data.data);
                // data = data.data;
                for (var key in data) {
                    vue.detail[table+"Id"] = data.id
                }
            });

            //修改
            if(http.getParam('yimiaoChuruInoutListId')){
                http.request(`yimiaoChuruInoutList/info/${http.getParam('yimiaoChuruInoutListId')}`, 'get', {}, function(data) {
                    vue.detail = data.data
                    jquery("#insertTime").val(vue.detail.insertTime)
                    jquery("#createTime").val(vue.detail.createTime)
                });
            }

            // 提交
            form.on('submit(thisSubmit)', function (data) {
                data = data.field;
                    data["yonghuId"]= localStorage.getItem("userid");
                if(http.getParam('yimiaoChuruInoutListId')){
                    data["id"]= http.getParam('yimiaoChuruInoutListId')
                }
                // 提交数据
                http.requestJson(`yimiaoChuruInoutList/${http.getParam("yimiaoChuruInoutListId")?"update":"add"}`, 'post', data, function (res) {
                    if(res.code == 0){
                        layer.msg('提交成功', {
                            time: 2000,
                            icon: 6
                        }, function () {
                            vue.jump("../yimiaoChuruInoutList/list.jsp");
                                http.remove('yimiaoChuruInoutListId')
                            // back();
                        });
                    }else{
                        layer.msg(res.msg, {time: 5000,icon: 5});
                    }
                });
                return false
            });

        });
        // 日期框初始化
        function dateTimePick(){
            var myDate = new Date();  //获取当前时间
            /*
                ,change: function(value, date, endDate){
                    value       得到日期生成的值，如：2017-08-18
                    date        得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
                    endDate     得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
            */
        }





        //单个 出入库查询
        function initializationYimiaoChuruInout(id){
            layui.http.request("yimiaoChuruInout/detail/" + id, 'get', {}, function (res) {
                if(res.code ==0){
                    vue.yimiaoChuruInout = res.data;
                    vue.detail.yimiaoChuruInoutId=vue.yimiaoChuruInout.id//赋值给detail
                }
            });
        }
        //列表 出入库查询
        function initializationYimiaoChuruInoutList(){
            layui.http.request("yimiaoChuruInout/page?page=1&limit=100&sort=&order=", 'get', {}, function (res) {
                if(res.code ==0){
                    vue.yimiaoChuruInoutList = res.data.list;
                }
            });
        }
        //单个 商品查询
        function initializationYimiao(id){
            layui.http.request("yimiao/detail/" + id, 'get', {}, function (res) {
                if(res.code ==0){
                    vue.yimiao = res.data;
                    vue.detail.yimiaoId=vue.yimiao.id//赋值给detail
                }
            });
        }
        //列表 商品查询
        function initializationYimiaoList(){
            layui.http.request("yimiao/page?page=1&limit=100&sort=&order=", 'get', {}, function (res) {
                if(res.code ==0){
                    vue.yimiaoList = res.data.list;
                }
            });
        }
    </script>
</body>
</html>
