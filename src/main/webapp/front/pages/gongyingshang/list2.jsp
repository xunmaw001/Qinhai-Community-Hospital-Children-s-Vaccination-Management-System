    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <title>供应商信息</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/common.css"/>
    <link rel="stylesheet" href="../../xznstatic/css/style.css"/>
    <script type="text/javascript" src="../../xznstatic/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/jquery.SuperSlide.2.1.1.js"></script>
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../css/theme.css"/>
</head>
<style>
    .center-container {
        width: 1200px;
        margin: 0 auto;
        margin-top: 20px;
        display: flex;
        margin-bottom: 20px;
    }
    .header {
        padding-bottom: 26px;
        padding-top: 70px;
        position: relative;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        margin-bottom: 40px;
    }

    #plheader {
        top: 48px;
        padding-bottom: 40px;
        width: 100%;;
        position: relative;
        height: 151px;
        border-radius: 3px 3px 0px 0px;
        padding-top: 40px !important;
    }

    .header p.title {
        color: #fff;
        font-size: 25px;
        margin-bottom: 8px;
        text-align: left;
        white-space: nowrap;
        overflow: hidden;
        margin-left: 31px;
        font-weight: bold;
        padding-bottom: 8px;
        margin-top: 0px;
        width: 100%;
        border-bottom: 1px solid rgba(255, 255, 255, 0.16);
        letter-spacing: 1px;
    }

    #category {
        margin-left: 0px;
        width: 100%;
        float: left;
        margin-top: -120px;
        background-color: var(--publicMainColor);
        border-radius: 0px 0px 3px 3px;
        padding: 0px 17px 30px;
    }

    .header p.subtitle {
        font-family: HELVETICANEUELTPRO-THEX, "微软雅黑";
        letter-spacing: 1px;
        font-size: 15px;
        display: inline-block;
        padding-top: 0px;
        color: #ffffff;
        margin-top: 0px;
        margin-right: 31px;
        float: right;
        overflow: hidden;
        width: 100%;
        text-align: right;
    }

    #category a.active::before {
        display: none;
    }

    #category a.active::after {
        display: none;
    }

    #category a.active, #category a:hover {
        /*background: var(--publicSubColor);*/
        color: #FFFFFF;
        border-color: #838383;
        transition: 0.3s;
        transform-origin: bottom;
    }

    #category li {
        height: auto;
        position: relative;
        float: none;
        display: block;
        margin-top: 1px;
        margin-bottom: 1px;
        line-height: 43px;
        border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        padding-left: 15px;
        transition: all 0.6s cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
    }

    #category li:last-child {
        border-bottom: none;
    }

    #category a {
        border: 0px;
        background: none;
        font-size: 14px;
        position: relative;
        padding: 0;
        line-height: 42px;
        height: 42px;
        color:#FFFFFF;
        text-decoration: none;
    }

    #category a::before {
        content: '';
        position: absolute;
        content: '';
        position: absolute;
        width: 100%;
        background-color: #AEAEAF;
        height: 42px;
        background: transparent;
        left: -16px;
        position: absolute;
        transition: all 0.6s cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
    }

    #category a.active::before {
        display: none;
    }

    #category li:hover {
        padding-left: 30px;
        background-color: var(--publicSubColor);
        transition: all 0.6s cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
    }

    #category .bbbb, #category li .aaaa {
        padding-left: 30px;
        transition: all 0.6s cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
        color: #FFFFFF;
        transition: 0.3s;
        transform-origin: bottom;
    }

    #category li:hover ul li {
        width: 100%;
    }

    #category li:hover ul li a {
        color: rgba(255, 255, 255, 0.45);
        width: 100%;
        overflow: hidden;
        background-color: rgb(34, 73, 160);
        padding-left: 0px;
    }

    #category li ul li:hover a {
        padding-left: 0px;
        margin-left: 0px;
    }

    #category li:hover a {
        color: #fff
    }</style>
<body class='bodyClass'>
<div id="app">
    <el-dialog title="弹出内容" :visible.sync="showContentModal" :modal-append-to-body="false">
        <div class="content" style="word-break: break-all;" v-html="showContent">
        </div>
        <div slot="footer" class="dialog-footer">
            <el-button @click="showContentModal = false">关 闭</el-button>
        </div>
    </el-dialog>
<!-- 标题 -->


    <!-- 标题 -->
    <div class="center-container">
        <!-- 个人中心菜单 config.js-->
<div style=" width:20%; ">
    <div class="header" id="plheader" style="top: 0px;background-color: var(--publicMainColor);">
        <p class="title">供应商信息</p>
        <p class="subtitle">USER / CENTER</p>
    </div>
    <ul id="category" style="padding-top:100px;">
        <li v-for="(item,index) in centerMenu" v-bind:key="index" :class="item.url=='../gongyingshang/list.jsp'?'bbbb':''" style="width: 100%;">
            <a :href="'javascript:jump(\''+item.url+'\')'"
               :class="item.url=='../gongyingshang/list.jsp'?'aaaa':''">{{item.name}}</a>
        </li>
    </ul>
</div>        <!-- 个人中心菜单 -->
        <div class="right-container sub_borderColor" style="overflow: auto" :style='{"padding":"20px","boxShadow":"0px rgba(255,0,0,.8)","margin":"0","backgroundColor":"#fff","borderRadius":"0","borderWidth":"1px","borderStyle":"solid","width":"80%"}'>
            <div style="display: flex;height: 60px;align-items: center;margin-left: 15px;justify-content: space-between">
                <div style="display: flex;height: 60px;align-items: center;margin-left: 15px;">
                    <div class="thisTableType-search" style="margin-left: 15px;"
                         :style='searchForm.gongyingshangTypes=="" || searchForm.gongyingshangTypes==null?{"color":"red","borderBottom":"1px solid red"}:{"color":"#000"}'>
                        全部
                    </div>
                    <div style="margin-left: 15px;" v-for="item in gongyingshangTypesList" :index="item.codeIndex" class="thisTableType-search"
                         :style='searchForm.gongyingshangTypes==item.codeIndex?{"color":"red","borderBottom":"1px solid red"}:{"color":"#000"}'>
                        {{item.indexName}}
                    </div>
                </div>
<!--                <button @click="jump('../gongyingshang/add.jsp')" class="layui-btn layui-btn-lg btn-theme sub_backgroundColor" :style='{"padding":"0 15px","boxShadow":"0 0 8px rgba(0,0,0,0)","margin":"0 0 0 10px","borderColor":"#409EFF","color":"#333","borderRadius":"4px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"40px"}'>
                    <i v-if="true" class="layui-icon">&#xe654;</i> 添加供应商信息信息
                </button>-->
            </div>
            <table class="layui-table" lay-skin="nob">
                <thead>
                    <tr>
                        <!-- 当前表 -->
                        <th>供应商唯一编号</th>
                        <th>供应商名称</th>
                        <th>联系人姓名</th>
                        <th>联系人手机号</th>
                        <th>地址</th>
                        <th>供应商类型</th>
                        <th>信用等级</th>
                        <th>供应商详情</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item,index) in dataList" v-bind:key="index">
                        <td>{{item.gongyingshangUuidNumber}}</td>
                        <td>{{item.gongyingshangName}}</td>
                        <td>{{item.lianxirenName}}</td>
                        <td>{{item.lianxirenPhone}}</td>
                        <td>{{item.lianxirenAddress}}</td>
                        <td>{{item.gongyingshangValue}}</td>
                        <td>{{item.gongyingshangXinyongdengjiValue}}</td>
                        <td><button v-if="item.gongyingshangContent!=null&&item.gongyingshangContent!=''" @click="showContentFunction(item.gongyingshangContent)" type="button" class="layui-btn layui-btn-success">点击查看</button></td>
                        <td style="width: 100px;">
                        <!--
                            <button @click="jump('../gongyingshang/add.jsp?gongyingshangId='+item.id)" type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm">
                                 修改
                            </button>
                        -->
                            <button @click="deleteData(item)" type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm">
                                <i class="layui-icon">&#xe640;</i> 删除
                            </button>
                            <button v-if="item.gongyingshangTypes==1 && false" @click="wuyong(item.id)" type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm">
                                无用按钮
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="pager" id="pager" :style="{textAlign:'center'}"></div>
        </div>
    </div></div>

<script src="../../xznstatic/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../xznstatic/js/echarts.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 引入element组件库 -->
<script src="../../xznstatic/js/element.min.js"></script>
<!-- 引入element样式 -->
<link rel="stylesheet" href="../../xznstatic/css/element.min.css">
<script src="../../js/config.js"></script>
<script src="../../modules/config.js"></script>
<script src="../../js/utils.js"></script>

<script type="text/javascript">
    Vue.prototype.myFilters = function (msg) {
        if(msg==null || msg==""){
            return "";
        }else if (msg.length>20){
            msg.replace(/\n/g, "<br>");
            return msg.substring(0,30)+"......";
        }else{
            return msg.replace(/\n/g, "<br>");
        }
    };
    var vue = new Vue({
        el: '#app',
        data: {
            userId: localStorage.getItem("userid"),//当前登录人的id
            sessionTable: localStorage.getItem("userTable"),//登录账户所在表名
            role: localStorage.getItem("role"),//权限
            //小菜单
            centerMenu: centerMenu,
            //项目路径
            baseUrl:"",
            //弹出内容模态框
            showContentModal:false,
            showContent:"",
            gongyingshangTypesList: [],
            gongyingshangXinyongdengjiTypesList: [],

            //查询条件
            searchForm: {
                page: 1
                ,limit: 8
                ,sort: "id"//字段
                ,order: "desc"//asc desc
                ,yonghuId: localStorage.getItem('userid')//只能查询自己
                    ,gongyingshangUuidNumber: ""
                ,gongyingshangName: ""
                ,lianxirenName: ""
                ,lianxirenPhone: ""
                ,lianxirenAddress: ""
                ,gongyingshangTypes: ""
                ,gongyingshangXinyongdengjiTypes: ""
                ,gongyingshangContent: ""
            },

            dataList: [],
        },
        filters: {
            subString: function(val) {
                if (val) {
                    val = val.replace(/<[^<>]+>/g, '').replace(/undefined/g, '');
                    if (val.length > 60) {
                        val = val.substring(0, 60);
                        val+='...';
                    }
                    return val;
                }
                return '';
            }
        },
        computed: {
        },
        methods: {
            isAuth(tablename, button) {
                return isFrontAuth(tablename, button);
            },
            jump(url) {
                jump(url);
            },
            jumpCheck(url,check1,check2) {
                if(check1 == "2" || check1 == 2){//级联表的逻辑删除字段[1:未删除 2:已删除]
                    layui.layer.msg("已经被删除", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                if(check2 == "2"  || check2 == 2){//是否下架[1:上架 2:下架]
                    layui.layer.msg("已经下架", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                this.jump(url);
            },
            showContentFunction(content) {
                this.showContentModal=true;
                this.showContent=content.replaceAll("src=\"upload/","src=\""+this.baseUrl+"upload/");
            },
            wuyong(id) {
                var mymessage = confirm("确定要    吗？");if(!mymessage){return false;}
                layui.http.requestJson(`gongyingshang/update`, 'post', {
                    id:id,
//                    gongyingshangTypes:1,
                }, function (res) {
                    if(res.code == 0){
                        layui.layer.msg('操作成功', {time: 2000, icon: 6 }, function () {window.location.reload();});
                    }else{
                        layui.layer.msg(res.msg, {time: 5000,icon: 5});
                    }
                });
            },
            deleteData(data){
                var mymessage = confirm("确定要删除这条数据吗？");
                if(!mymessage){
                    return false;
                }
                // 删除信息
                layui.http.requestJson(`gongyingshang/delete`, 'post', [data.id], (res) => {
                    if(res.code==0){
                        layer.msg('删除成功', {
                            time: 2000,
                            icon: 6
                        });
                        window.location.reload();
                    }else{
                        layer.msg(res.msg, {
                            time: 2000,
                            icon: 2
                        });
                    }
                });
            },

        }
    });

    layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery', 'laydate', 'tinymce'], function() {
        var layer = layui.layer;
        var element = layui.element;
        var carousel = layui.carousel;
        var laypage = layui.laypage;
        var http = layui.http;
        var laydate = layui.laydate;
        var tinymce = layui.tinymce;
        window.jQuery = window.$ = jquery = layui.jquery;
        vue.baseUrl = http.baseurl

        localStorage.setItem("goUtl","./pages/gongyingshang/list2.jsp")

        // var id = http.getParam('id');

        //供应商类型的动态搜素
        $(document).on("click", ".thisTableType-search", function (e) {
            vue.searchForm.gongyingshangTypes = $(this).attr('index');
            pageList();
        });


            //当前表的 信用等级 字段 字典表查询
            gongyingshangXinyongdengjiTypesSelect();
           //当前表的 供应商类型 字段 字典表查询方法
           function gongyingshangTypesSelect() {
               http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=gongyingshang_types", 'get', {}, function (res) {
                   if(res.code == 0){
                       vue.gongyingshangTypesList = res.data.list;
                   }
               });
           }
           //当前表的 信用等级 字段 字典表查询方法
           function gongyingshangXinyongdengjiTypesSelect() {
               http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=gongyingshang_xinyongdengji_types", 'get', {}, function (res) {
                   if(res.code == 0){
                       vue.gongyingshangXinyongdengjiTypesList = res.data.list;
                   }
               });
           }
            // 分页列表
            pageList();

            // 搜索按钮
            jquery('#btn-search').click(function (e) {
                pageList();
            });

            function pageList() {
                // 获取列表数据
                http.request('gongyingshang/list', 'get', vue.searchForm, function (res) {
                    vue.dataList = res.data.list;
                    // 分页
                    laypage.render({
                        elem: 'pager',
                        count: res.data.total,
                        limit: vue.searchForm.limit,
                        groups: 3,
                        layout: ["prev", "page", "next"],
                        jump: function (obj, first) {
                            vue.searchForm.page = obj.curr;//翻页
                            //首次不执行
                            if (!first) {
                                http.request('gongyingshang/list', 'get', vue.searchForm, function (res1) {
                                    vue.dataList = res1.data.list;
                                })
                            }
                        }
                    });
                });
            }
    });

    window.xznSlide = function () {
        jQuery(".banner").slide({mainCell: ".bd ul", autoPlay: true, interTime: 5000});
        jQuery("#ifocus").slide({
            titCell: "#ifocus_btn li",
            mainCell: "#ifocus_piclist ul",
            effect: "leftLoop",
            delayTime: 200,
            autoPlay: true,
            triggerTime: 0
        });
        jQuery("#ifocus").slide({titCell: "#ifocus_btn li", mainCell: "#ifocus_tx ul", delayTime: 0, autoPlay: true});
        jQuery(".product_list").slide({
            mainCell: ".bd ul",
            autoPage: true,
            effect: "leftLoop",
            autoPlay: true,
            vis: 5,
            trigger: "click",
            interTime: 4000
        });
    };
</script>
</body>
</html>
