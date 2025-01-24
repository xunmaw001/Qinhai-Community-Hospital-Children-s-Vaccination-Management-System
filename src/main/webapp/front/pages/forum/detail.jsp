<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>
<!-- 论坛详情 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>论坛详情</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css" />
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css" />
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css" />
</head>
<style>
    #swiper {
        overflow: hidden;
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

    .index-title {
        text-align: center;
        box-sizing: border-box;
        width: 980px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    .forum-container .btn-container {
        display: flex;
        align-items: center;
        box-sizing: border-box;
        width: 100%;
        flex-wrap: wrap;
        justify-content: space-between !important;
    }
    .forum-container .btn-container button i {
        margin-right: 4px;
    }
</style>
<body style="padding-bottom: 20px;background-color: #fff">

<div id="app">
    <!-- 标题 -->
    <div class="index-title sub_backgroundColor sub_borderColor" :style='{"padding":"10px","margin":"10px auto","borderColor":"rgba(0,0,0,.3)","color":"rgba(255, 255, 255, 1)","borderRadius":"4px","borderWidth":"0","fontSize":"20px","borderStyle":"solid","height":"auto"}'>
        <span>FORUM / INFORMATION</span><span>论坛</span>
    </div>
    <!-- 标题 -->

    <div class="forum-container">
        <h1 class="title">{{detail.forumName}}</h1>
        <div v-if="detail.yonghuId" class="auth-container">
            发布人{{detail.yonghuName}}&nbsp;&nbsp;&nbsp;发布人权限：用户&nbsp;&nbsp;&nbsp;时间：{{detail.insertTime}}
        </div>
        <div v-if="detail.yishengId" class="auth-container">
            发布人{{detail.yishengName}}&nbsp;&nbsp;&nbsp;发布人权限：医生&nbsp;&nbsp;&nbsp;时间：{{detail.insertTime}}
        </div>
        <div v-if="detail.usersId" class="auth-container">
            发布人：管理员&nbsp;&nbsp;&nbsp;发布人权限：管理员&nbsp;&nbsp;&nbsp;时间：{{detail.insertTime}}
        </div>
        <div class="content" v-html="detail.forumContent">
        </div>

        <div class="btn-container main_backgroundColor" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"10px 0 10px 0","borderColor":"rgba(0,0,0,.3)","borderRadius":"4px","alignItems":"center","borderWidth":"0","borderStyle":"solid","justifyContent":"flex-end","height":"64px"}'>
            <div class="title" style="color:#666;font-size: 18px;">
                评论列表
            </div>
        </div>

        <div class="message-list" v-if="dataList&&dataList.length" :style='{"padding":"0 20px 20px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0","borderColor":"rgba(135, 206, 250, 1)","backgroundColor":"#fff","borderRadius":"4px","borderWidth":"0","borderStyle":"solid"}'>
            <div :style='{"padding":"20px 0","boxShadow":"0 0 0px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"solid"}'  class="message-item" v-for="(item,index) in dataList" v-bind:key="index" >
                <div style="display:flex;align-items: center;justify-content: space-between;">
                    <div v-if="item.yonghuId" class="username-container" style="display: flex;align-items: center;">
                        <img :style='{"boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0 10px 0 0","borderColor":"rgba(0,0,0,.3)","borderRadius":"50%","borderWidth":"0","width":"40px","borderStyle":"solid","height":"40px"}' class="avator" :src="baseUrl+item.yonghuPhoto">
                        <span style="display: inline-block;" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"rgba(6, 82, 121, 1)","borderRadius":"4px","borderWidth":"0","width":"auto","lineHeight":"28px","fontSize":"14px","borderStyle":"solid"}' class="username">用户：{{item.yonghuName}}</span>
                    </div>
                    <div v-if="item.yishengId" class="username-container" style="display: flex;align-items: center;">
                        <img :style='{"boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0 10px 0 0","borderColor":"rgba(0,0,0,.3)","borderRadius":"50%","borderWidth":"0","width":"40px","borderStyle":"solid","height":"40px"}' class="avator" :src="baseUrl+item.yishengPhoto">
                        <span style="display: inline-block;" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"rgba(6, 82, 121, 1)","borderRadius":"4px","borderWidth":"0","width":"auto","lineHeight":"28px","fontSize":"14px","borderStyle":"solid"}' class="username">医生：{{item.yishengName}}</span>
                    </div>
                    <div v-if="item.usersId" class="username-container" style="display: flex;align-items: center;">
                        <img :style='{"boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0 10px 0 0","borderColor":"rgba(0,0,0,.3)","borderRadius":"50%","borderWidth":"0","width":"40px","borderStyle":"solid","height":"40px"}' class="avator" src="../../img/avator.png">
                        <span style="display: inline-block;" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"rgba(6, 82, 121, 1)","borderRadius":"4px","borderWidth":"0","width":"auto","lineHeight":"28px","fontSize":"14px","borderStyle":"solid"}' class="username">管理员</span>
                    </div>
                    <div v-if="user.id == item.yonghuId" @click="deleteData(item)" style="width: 50px;height: 20px;border: 1px solid var(--publicMainColor) ; text-align: center; border-radius: 15px;font-size: 12px;line-height: 20px">删除
                    </div>
                </div>
                <div class="content" class="content" style="margin: 0;flex: 1;">
                    <span style="display: inline-block;" class="message main_color" :style='{"padding":"8px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"8px 0 0 50px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(255, 0, 0, 0)","borderRadius":"4px","borderWidth":"0","fontSize":"14px","borderStyle":"solid"}'>
                        {{item.forumContent}}
                    </span>
                </div>
            </div>
        </div>


        <div>
            <label  :style='{"width":"110px","borderColor": "rgba(255, 255, 255, 0)","padding":"0 12px 0 0","backgroundColor":"rgba(255, 255, 255, 0)","fontSize":"15px","color":"#333","textAlign":"left"}' class="layui-form-label">
                评论内容：
            </label>
            <div class="layui-input-block">
                <textarea class="main_borderColor" style="width: 90%;height: 100px"  v-model="ruleForm.forumContent" lay-verify="required"  name="forumContent" id="forumContent" autocomplete="off"></textarea>
            </div>
            <div class="layui-form-item main_borderColor" :style='{"padding":"10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 0 10px 0","backgroundColor":"rgba(255, 255, 255, 0)","borderRadius":"1px","borderWidth":"0 0 1px 0","borderStyle":"solid"}'>
                <div class="layui-input-block" style="text-align: right;">
                    <button :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.5)","margin":"0 10px","borderColor":"#ccc","backgroundColor":"var(--publicMainColor)","color":"#fff","borderRadius":"8px","borderWidth":"0","width":"25%","fontSize":"14px","borderStyle":"solid","height":"44px"}' class="layui-btn btn-submit"
                            @click="addComment">添加评论</button>
                </div>
            </div>
        </div>


        <div class="pager" id="pager"></div>
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


<script>
    var vue = new Vue({
        el: '#app',
        data: {
            //当前登录用户信息
            user: {},
            //项目路径
            baseUrl:"",
            id:null,
            dialogVisible:false,
            detail: {},
            dataList: [],
            dialogFormVisible: false,
            formLabelWidth: '120px',
            ruleForm:{
                forumStateTypes: 2,
                forumContent: '',
                forumPhoto: '',
            },
            rules: {
                forumContent: [
                    { required: true, message: '请输入回复内容', trigger: 'blur' }
                ],
            },
        },
        /*created () {
            this.pageList()
        },*/
        methods: {
            deleteData(data){
                var mymessage = confirm("确定要删除这条数据吗？");
                if(!mymessage){
                    return false;
                }
                // 删除信息
                layui.http.requestJson(`forum/delete`, 'post', [data.id], (res) => {
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
            jump(url) {
                jump(url)
            },
            addComment(){
                let _this = this;
                _this.ruleForm.superIds = this.detail.id
                if(_this.ruleForm.forumContent == "" || _this.ruleForm.forumContent == "null" || _this.ruleForm.forumContent == null){
                    layer.msg('回复内容不能为空', {
                        time: 1000,
                        icon: 6
                    });
                }
                layui.http.requestJson('forum/save', 'post',_this.ruleForm, function (res) {
                    layer.msg('回复成功', {
                        time: 1000,
                        icon: 6
                    }, function () {
                        _this.pageList()
                        _this.dialogFormVisible = false
                    });
                });
            },
            pageList() {
                let _this = this
                layui.http.request('forum/info/' + _this.id, 'get', {}, function(res) {
                    res.data.forumContent = res.data.forumContent.replace("<img","<img  class=\"daxiao\"").replace("src=\"upload/","src=\""+layui.http.baseurl+ "upload/");
                    _this.detail = res.data
                    var data = {
                        superIds : _this.detail.id,
                        forumStateTypes:2
                    }
                    //评论信息
                    layui.http.request('forum/list', 'get', data, function(res) {
                        _this.dataList = res.data.list
                    });
                });
            },
        }
    })

    layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery','upload'], function() {
        var layer = layui.layer;
        var element = layui.element;
        var carousel = layui.carousel;
        var laypage = layui.laypage;
        var http = layui.http;
        var jquery = layui.jquery;
        var upload = layui.upload;

        localStorage.setItem("goUtl","./pages/forum/detail.jsp?id="+ http.getParam('id'))

        vue.baseUrl = http.baseurl
        vue.id = http.getParam('id');

        let table = localStorage.getItem("userTable");
        if (table) {
            http.request(table + "/session", 'get', {}, function (data) {
                vue.user = data.data;
            });
        }

        var forumPhotoUpload = upload.render({
            //绑定元素
            elem: '#forumPhotoUpload',
            //上传接口
            url: http.baseurl + 'file/upload',
            // 请求头
            headers: {
                Token: localStorage.getItem('Token')
            },
            // 允许上传时校验的文件类型
            accept: 'images',
            before: function() {
                //loading层
                var index = layer.load(1, {
                    shade: [0.1, '#fff'] //0.1透明度的白色背景
                });
            },
            // 上传成功
            done: function(res) {
                console.log(res);
                layer.closeAll();
                if (res.code == 0) {
                    layer.msg("上传成功", {
                        time: 2000,
                        icon: 6
                    })
                    var url = 'upload/' + res.file;
                    vue.ruleForm.forumPhoto = url;
                } else {
                    layer.msg(res.msg, {
                        time: 2000,
                        icon: 5
                    })
                }
            },
            //请求异常回调
            error: function() {
                layer.closeAll();
                layer.msg("请求接口异常", {
                    time: 2000,
                    icon: 5
                })
            }
        });


        vue.pageList()

    });
</script>
</body>
</html>
