    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="true" %>
<!-- 论坛中心 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>论坛</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <script type="text/javascript" src="../../xznstatic/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/jquery.SuperSlide.2.1.1.js"></script>
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
    }
    .forum-container .btn-container button i {
        margin-right: 4px;
    }

    .layui-laypage .layui-laypage-count {
        padding: 0 10px;
    }
    .layui-laypage .layui-laypage-skip {
        padding-left: 10px;
    }
</style>
<body>

<div id="app">
    <div class="index-title sub_backgroundColor" :style='{"padding":"10px","boxShadow":"0 0 2px rgba(160, 67, 26, 1)","margin":"10px auto","borderColor":"rgba(0,0,0,.3)","color":"rgba(255, 255, 255, 1)","borderRadius":"4px","borderWidth":"0","fontSize":"20px","borderStyle":"solid","height":"auto"}'>
        <span>FORUM / INFORMATION</span><span>论坛</span>
    </div>
    <div class="forum-container">


        <div class="btn-container main_backgroundColor" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"10px 0 10px 0","borderColor":"rgba(0,0,0,.3)","borderRadius":"4px","alignItems":"center","borderWidth":"0","borderStyle":"solid","justifyContent":"flex-end","height":"64px"}'>
            <button class="layui-btn layui-btn-lg btn-theme main_backgroundColor"
                    :style='{"padding":"0 15px","boxShadow":"0 0 8px rgba(0,0,0,0)","margin":"0 0 0 10px","borderColor":"rgba(135, 206, 250, 1)","color":"#fff","borderRadius":"4px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"40px"}'
                    @click="forumTop" type="button"
            >
                <i v-if="true" class="layui-icon">&#xe654;</i> 发布帖子
            </button>
        </div>
        <div class="forum-list">
            <div v-for="(item,index) in dataList" v-bind:key="index" href="javascript:void(0);" class="forum-item">
                <div  @click="jump('../forum/detail.jsp?id='+item.id);" style="display:flex;width: 98%;align-items: center;justify-content: space-between;">
                    <div style="width: 79%;">
                      <h2 v-if="item.yonghuId" class="h2" style="width: 83%;display: flex;justify-content: space-between;">
                          <span>{{(item.forumName).length> 30?item.forumName.substring(0, 30)+'...':item.forumName}}</span>
                          <span>发布人：{{item.yonghuName}} （用户）</span>
                      </h2>
                      <h2 v-if="item.yishengId" class="h2" style="width: 83%;display: flex;justify-content: space-between;">
                          <span>{{(item.forumName).length> 30?item.forumName.substring(0, 30)+'...':item.forumName}}</span>
                          <span>发布人：{{item.yishengName}} （医生）</span>
                      </h2>
                      <h2 v-if="item.usersId" class="h2" style="width: 83%;display: flex;justify-content: space-between;">
                          <span>{{(item.forumName).length> 30?item.forumName.substring(0, 30)+'...':item.forumName}}</span>
                          <span>发布人：管理员 （管理员）</span>
                      </h2>
                    </div>
                    <div class="create-time" style="margin-right: 7px;">
                        {{item.insertTime}}
                    </div>
                </div>
                <span @click="deleteData(item)" v-if="item.yonghuId != null && item.yonghuId == user.id" style="font-size: 12px;width: 2%"><i class="layui-icon">&#xe640;</i>
                </span>
            </div>
        </div>


        <div class="pager" id="pager" :style="{textAlign:1==1?'left':1==2?'center':'right'}"></div>
    </div>



    <el-dialog title="发布帖子" :visible.sync="dialogFormVisible" class="demo-ruleForm">
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm">
            <el-form-item label="标题" :label-width="formLabelWidth" prop="forumName">
                <el-input v-model="ruleForm.forumName" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="帖子内容" :label-width="formLabelWidth" prop="forumContent">
                <el-input type="textarea" v-model="ruleForm.forumContent"></el-input>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="addForum('ruleForm')">确 定</el-button>
        </div>
    </el-dialog>



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
            user:{},
            forumTypes: -1,
            dataList: [],
            forumTypesList:[],
            ruleForm:{
                forumStateTypes: 1,
                forumName: '',
                forumContent: '',
            },
            rules: {
                forumName: [
                    { required: true, message: '请输入标题', trigger: 'blur' },
                ],
                forumContent: [
                    { required: true, message: '请输入帖子内容', trigger: 'blur' }
                ],
            },
            dialogFormVisible: false,
            formLabelWidth: '120px'
        },
        filters: {
            newsDesc: function(val) {
                if (val) {
                    if (val.length > 200) {
                        return val.substring(0, 200).replace(/<[^>]*>/g).replace(/undefined/g, '');
                    } else {
                        return val.replace(/<[^>]*>/g).replace(/undefined/g, '');
                    }
                }
                return '';
            }
        },
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
            forumTop(){
                this.jump("./add.jsp")
            },
            jump(url) {
                jump(url)
            },
            addForum() {
                let _this = this;
                this.$refs["ruleForm"].validate((valid) => {
                    if (valid) {
                        layui.http.requestJson('forum/save', 'post',_this.ruleForm, function (res) {
                            layer.msg('发布成功', {
                                time: 1000,
                                icon: 6
                            }, function () {
                                _this.pageList();
                                _this.dialogFormVisible = false
                            });
                        });
                    }
                });
            },
            pageList(category) {
                let _this = this;
                let param = {
                    page: 1,
                    limit: 10
                }
                if (category != null && category != -1) {
                    param['forumTypes'] = category;
                }
                layui.http.request('forum/list?forumStateTypes=1', 'get',param, function (res) {
                    _this.dataList = res.data.list
                    // 分页
                    layui.laypage.render({
                        elem: 'pager',
                        count: res.data.total,
                        limit: 10,
                        groups: 3,
                        layout: ["prev","page","next"],
                        jump: function(obj, first) {
                            //首次不执行
                            if (!first) {
                                layui.http.request('forum/list?forumStateTypes=1', 'get', {
                                    page: obj.curr,
                                    limit: obj.limit
                                }, function(res) {
                                    _this.dataList = res.data.list
                                })
                            }
                        }
                    });
                });
            },

        }
    })

    layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery'], function() {
        var layer = layui.layer;
        var element = layui.element;
        var carousel = layui.carousel;
        var laypage = layui.laypage;
        var http = layui.http;
        var jquery = layui.jquery;

        localStorage.setItem("goUtl","./pages/forum/list.jsp")

        var limit = 10;

        let table = localStorage.getItem("userTable");
        if(table){
            http.request(table+"/session", 'get', {}, function (data) {
                vue.user = data.data;
            });
        }

        vue.pageList()
    });
</script>
</body>
</html>
