<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto"></ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑疫苗</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">疫苗管理</li>
                        <li class="breadcrumb-item active">编辑疫苗</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">疫苗信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                                    <div class="form-group col-md-6 aaaaaa gongyingshang">
                                        <label>供应商信息</label>
                                        <div>
                                            <select style="width: 450px" id="gongyingshangSelect" name="gongyingshangSelect"
                                                    class="selectpicker form-control"  data-live-search="true"
                                                    title="请选择" data-header="请选择" data-size="5" data-width="650px">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6 gongyingshang">
                                        <label>供应商唯一编号</label>
                                        <input style="width: 450px" id="gongyingshangUuidNumber" name="gongyingshangUuidNumber" placeholder="供应商唯一编号" class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-md-6 gongyingshang">
                                        <label>供应商名称</label>
                                        <input style="width: 450px" id="gongyingshangName" name="gongyingshangName" placeholder="供应商名称" class="form-control" readonly>
                                    </div>
                                    <div class="form-group col-md-6 gongyingshang">
                                        <label>供应商类型</label>
                                        <input style="width: 450px" id="gongyingshangValue" name="gongyingshangValue" placeholder="供应商类型" class="form-control" readonly>
                                    </div>
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                <input id="gongyingshangId" name="gongyingshangId" type="hidden">
                                    <div class="form-group col-md-6 yimiaoNameDiv">
                                        <label>疫苗名称</label>
                                        <input style="width: 450px" id="yimiaoName" name="yimiaoName" class="form-control"
                                               placeholder="疫苗名称">
                                    </div>
                                    <div class="form-group col-md-6 yimiaoUuidNumberDiv">
                                        <label>疫苗编号</label>
                                        <input style="width: 450px" id="yimiaoUuidNumber" name="yimiaoUuidNumber" class="form-control"
                                               placeholder="疫苗编号">
                                    </div>
                                    <div class="form-group col-md-6 yimiaoPhotoDiv">
                                        <label>疫苗照片</label>
                                        <img id="yimiaoPhotoImg" src="" width="100" height="100">
                                        <input name="file" type="file" id="yimiaoPhotoupload"
                                               class="form-control-file">
                                        <input name="yimiaoPhoto" id="yimiaoPhoto-input" type="hidden">
                                    </div>
                                    <div class="form-group col-md-6 yimiaoAddressDiv">
                                        <label>疫苗接种地点</label>
                                        <input style="width: 450px" id="yimiaoAddress" name="yimiaoAddress" class="form-control"
                                               placeholder="疫苗接种地点">
                                    </div>
                                    <div class="form-group col-md-6 yimiaoKucunNumberDiv">
                                        <label>接种人数</label>
                                        <input style="width: 450px" id="yimiaoKucunNumber" name="yimiaoKucunNumber" class="form-control"
                                               onchange="integerChickValue(this)"  placeholder="接种人数">
                                    </div>

                                    <div class="form-group col-md-6 yimiaoNewMoneyDiv">
                                        <label>金额</label>
                                        <input style="width: 450px" id="yimiaoNewMoney" name="yimiaoNewMoney" class="form-control"
                                               onchange="doubleChickValue(this)" placeholder="金额">
                                    </div>
                                    <div class="form-group col-md-6 yimiaoTypesDiv">
                                        <label>疫苗类型</label>
                                        <select style="width: 450px" id="yimiaoTypesSelect" name="yimiaoTypes" class="form-control"></select>
                                    </div>
                                    <div class="form-group  col-md-6 yimiaoContentDiv">
                                        <label>疫苗介绍</label>
                                        <input id="yimiaoContentupload" name="file" type="file">
                                        <script id="yimiaoContentEditor" type="text/plain"
                                                style="width:100%;height:230px;"></script>
                                        <script type = "text/javascript" >
                                        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                                        //相见文档配置属于你自己的编译器
                                        var yimiaoContentUe = UE.getEditor('yimiaoContentEditor', {
                                            toolbars: [
                                                [
                                                    'undo', //撤销
                                                    'bold', //加粗
                                                    'redo', //重做
                                                    'underline', //下划线
                                                    'horizontal', //分隔线
                                                    'inserttitle', //插入标题
                                                    'cleardoc', //清空文档
                                                    'fontfamily', //字体
                                                    'fontsize', //字号
                                                    'paragraph', //段落格式
                                                    'inserttable', //插入表格
                                                    'justifyleft', //居左对齐
                                                    'justifyright', //居右对齐
                                                    'justifycenter', //居中对
                                                    'justifyjustify', //两端对齐
                                                    'forecolor', //字体颜色
                                                    'fullscreen', //全屏
                                                    'edittip ', //编辑提示
                                                    'customstyle', //自定义标题
                                                ]
                                            ]
                                        });
                                        </script>
                                        <input type="hidden" name="yimiaoContent" id="yimiaoContent-input">
                                    </div>
                                    <div class="form-group-1 col-md-6 mb-3" style="display: flex;flex-wrap: wrap;">
                                        <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                        <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                    </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/validate/card.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js" type="text/javascript" charset="utf-8"></script>
<!-- <script src="${pageContext.request.contextPath}/resources/js/laydate.js"></script> -->
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file = "../../static/utils.js" %>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var sessionTable = window.sessionStorage.getItem("accountTableName");//登录账户所在表名
    var role         = window.sessionStorage.getItem("role");//权限
    var userId       = window.sessionStorage.getItem("userId");//当前登录人的id
    var tableName = "yimiao";
    var pageType = "add-or-update";
    var updateId = "";
    var ruleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var yimiaoTypesOptions = [];
        <!-- 级联表的下拉框数组 -->
    var gongyingshangOptions = [];

    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->
        $('#yimiaoPhotoupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                var photoUrl= 'file/download?fileName=' + data.result.file;
                document.getElementById('yimiaoPhotoImg').setAttribute('src',baseUrl+photoUrl);
                document.getElementById('yimiaoPhoto-input').setAttribute('value',photoUrl);
            }
        });


        $('#yimiaoContentupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                UE.getEditor('yimiaoContentEditor').execCommand('insertHtml', '<img src=\"' + baseUrl + 'upload/' + data.result.file + '\" width=900 height=560>');
            }
        });


    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            if(window.sessionStorage.getItem('role') != '供应商信息'){//当前登录用户不为这个
                if($("#gongyingshangId") !=null){
                    var gongyingshangId = $("#gongyingshangId").val();
                    if(gongyingshangId == null || gongyingshangId =='' || gongyingshangId == 'null'){
                        layui.layer.msg("供应商不能为空", {time: 2000,icon: 5});
                        return;
                    }
                }
            }
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                    successMes = '添加成功';

            }
            httpJson("yimiao/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addyimiao');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        layui.layer.msg(successMes, {time: 2000,icon: 5});
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href = "list.jsp";
                    }
                }
            });
        } else {
            layui.layer.msg("表单未填完整或有错误", {time: 2000,icon: 5});
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        function yimiaoTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=yimiao_types", "GET", {}, (res) => {
                if(res.code == 0){
                    yimiaoTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->
        function gongyingshangSelect() {
            //填充下拉框选项
            http("gongyingshang/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    gongyingshangOptions = res.data.list;
                }
            });
        }

        function gongyingshangSelectOne(id) {
            http("gongyingshang/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                    ruleForm = res.data;
                    gongyingshangShowImg();
                    gongyingshangShowVideo();
                    gongyingshangDataBind();
                }
            });
        }



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationYimiaoTypesSelect(){
            var yimiaoTypesSelect = document.getElementById('yimiaoTypesSelect');
            if(yimiaoTypesSelect != null && yimiaoTypesOptions != null  && yimiaoTypesOptions.length > 0 ){
                yimiaoTypesSelect.options.length=0;
                for (var i = 0; i < yimiaoTypesOptions.length; i++) {
                    yimiaoTypesSelect.add(new Option(yimiaoTypesOptions[i].indexName,yimiaoTypesOptions[i].codeIndex));
                }
            }
        }

        function initializationgongyingshangSelect() {
            var gongyingshangSelect = document.getElementById('gongyingshangSelect');
            if(gongyingshangSelect != null && gongyingshangOptions != null  && gongyingshangOptions.length > 0 ) {
                for (var i = 0; i < gongyingshangOptions.length; i++) {
                        gongyingshangSelect.add(new Option(gongyingshangOptions[i].gongyingshangName, gongyingshangOptions[i].id));
                }

                $("#gongyingshangSelect").change(function(e) {
                        gongyingshangSelectOne(e.target.value);
                });
            }

        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->
        var yimiaoTypesSelect = document.getElementById("yimiaoTypesSelect");
        if(yimiaoTypesSelect != null && yimiaoTypesOptions != null  && yimiaoTypesOptions.length > 0 ) {
            for (var i = 0; i < yimiaoTypesOptions.length; i++) {
                if (yimiaoTypesOptions[i].codeIndex == ruleForm.yimiaoTypes) {//下拉框value对比,如果一致就赋值汉字
                        yimiaoTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
            var gongyingshangSelect = document.getElementById("gongyingshangSelect");
            if(gongyingshangSelect != null && gongyingshangOptions != null  && gongyingshangOptions.length > 0 ) {
                for (var i = 0; i < gongyingshangOptions.length; i++) {
                    if (gongyingshangOptions[i].id == ruleForm.gongyingshangId) {//下拉框value对比,如果一致就赋值汉字
                        gongyingshangSelect.options[i+1].selected = true;
                        $("#gongyingshangSelect" ).selectpicker('refresh');
                    }
                }
            }
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
        if (ruleForm.yimiaoContent != null && ruleForm.yimiaoContent != 'null' && ruleForm.yimiaoContent != '' && $("#yimiaoContentupload").length>0) {

            var yimiaoContentUeditor = UE.getEditor('yimiaoContentEditor');
            yimiaoContentUeditor.ready(function () {
                var mes = '';
                if(ruleForm.yimiaoContent != null){
                    mes = ''+ ruleForm.yimiaoContent;
                    mes= mes.replaceAll("src=\"upload/","src=\""+baseUrl+"upload/")
                    // mes = mes.replace(/\n/g, "<br>");
                }
                yimiaoContentUeditor.setContent(mes);
            });
        }
    }
    // 获取富文本框内容
    function getContent() {
        <!-- 获取当前表的富文本框内容 -->
        if($("#yimiaoContentupload").length>0) {
            var yimiaoContentEditor = UE.getEditor('yimiaoContentEditor');
            if (yimiaoContentEditor.hasContents()) {
                $('#yimiaoContent-input').attr('value', yimiaoContentEditor.getContent().replaceAll(baseUrl,""));
            }
        }
    }
    function jiaofei() {
        window.location.href = "../../pay.jsp";
    }
    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addyimiao');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                gongyingshangId: "required",
                yimiaoName: "required",
                yimiaoUuidNumber: "required",
                yimiaoPhoto: "required",
                yimiaoAddress: "required",
                yimiaoKucunNumber: "required",
                // yimiaoNewMoney: "required",
                yimiaoTypes: "required",
                yimiaoContent: "required",
            },
            messages: {
                gongyingshangId: "供应商不能为空",
                yimiaoName: "疫苗名称不能为空",
                yimiaoUuidNumber: "疫苗编号不能为空",
                yimiaoPhoto: "疫苗照片不能为空",
                yimiaoAddress: "疫苗接种地点不能为空",
                yimiaoKucunNumber: "接种人数不能为空",
                // yimiaoNewMoney: "金额不能为空",
                yimiaoTypes: "疫苗类型不能为空",
                yimiaoContent: "疫苗介绍不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addyimiao = window.sessionStorage.getItem("addyimiao");
        if (addyimiao != null && addyimiao != "" && addyimiao != "null") {
            //注册表单验证
            $(validform());
            $("#yimiaoUuidNumber").val(new Date().getTime()+Math.ceil(Math.random()*10));//设置唯一号

            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            if(window.sessionStorage.getItem('accountTableName') =='yimiao'){
                updateId = window.sessionStorage.getItem('userId');//登录用户查看自己的信息
            }else{
                updateId = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            }
            window.sessionStorage.removeItem('updateId');
            http("yimiao/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 设置视频src
                    showVideo();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {

    }


    function dataBind() {


    <!--  级联表的数据回显  -->
        gongyingshangDataBind();


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#gongyingshangId").val(ruleForm.gongyingshangId);
        $("#yimiaoName").val(ruleForm.yimiaoName);
        $("#yimiaoUuidNumber").val(ruleForm.yimiaoUuidNumber);
        $("#yimiaoAddress").val(ruleForm.yimiaoAddress);
        $("#yimiaoKucunNumber").val(ruleForm.yimiaoKucunNumber);
        $("#yimiaoNewMoney").val(ruleForm.yimiaoNewMoney);
        $("#yimiaoContent").val(ruleForm.yimiaoContent);

    }
    <!--  级联表的数据回显  -->
    function gongyingshangDataBind(){

                    <!-- 把id赋值给当前表的id-->
        $("#gongyingshangId").val(ruleForm.id);

        $("#gongyingshangUuidNumber").val(ruleForm.gongyingshangUuidNumber);
        $("#gongyingshangName").val(ruleForm.gongyingshangName);
        $("#lianxirenName").val(ruleForm.lianxirenName);
        $("#lianxirenPhone").val(ruleForm.lianxirenPhone);
        $("#lianxirenAddress").val(ruleForm.lianxirenAddress);
        $("#gongyingshangValue").val(ruleForm.gongyingshangValue);
        $("#gongyingshangXinyongdengjiValue").val(ruleForm.gongyingshangXinyongdengjiValue);
        $("#gongyingshangContent").val(ruleForm.gongyingshangContent);
    }


    //图片显示
    function showImg() {
        <!--  当前表的图片  -->
        $("#yimiaoPhotoImg").attr("src",baseUrl+ruleForm.yimiaoPhoto);

        <!--  级联表的图片  -->
        gongyingshangShowImg();
    }


    <!--  级联表的图片  -->

    function gongyingshangShowImg() {
    }



    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
        gongyingshangShowVideo();
    }


    <!--  级联表的视频  -->

    function gongyingshangShowVideo() {
    }



    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            yimiaoTypesSelect();

            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->
            gongyingshangSelect();



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationYimiaoTypesSelect();
            <!--  初始化级联表的下拉框  -->
            initializationgongyingshangSelect();

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
        window.sessionStorage.removeItem('addyimiao');
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') == '管理员') {
            //$('#jifen').attr('readonly', 'readonly');
            //$('#role').attr('style', 'pointer-events:none;width:450px;');
        }
		else if (window.sessionStorage.getItem('role') == '用户') {
            // $(".aaaaaa").remove();
            $(".yonghu").remove();//删除当前用户的信息
            // 金额设置不可选
            $('#yimiaoNewMoney').attr('readonly', 'readonly');
            if(sessionTable=="yimiao"){//个人中心修改
            }
        }
		else if (window.sessionStorage.getItem('role') == '医生') {
            // $(".aaaaaa").remove();
            $(".yisheng").remove();//删除当前用户的信息
            // 金额设置不可选
            $('#yimiaoNewMoney').attr('readonly', 'readonly');
            if(sessionTable=="yimiao"){//个人中心修改
            }
        }
        else{
            // alert("未知情况.......");
            // var replyTextUeditor = UE.getEditor('replyTextEditor');
            // replyTextUeditor.ready(function () {
            //     replyTextUeditor.setDisabled('fullscreen');
            // });
        }
    }


        layui.use(['layer' , 'jquery' , 'laydate'], function() {
            var layer = layui.layer;
            var jquery = layui.jquery;
            var laydate = layui.laydate;

        var insertTime = laydate.render({
            elem: '#insertTime-input'
            ,type: 'datetime'
        });
			// layui.layer.msg("输入不合法", {time: 2000,icon: 5});
			//    5失败 6成功
        });


        //比较大小
        function compare() {
            var largerVal = null;
            var smallerVal = null;
            if (largerVal != null && smallerVal != null) {
                if (largerVal <= smallerVal) {
                    alert(smallerName + '不能大于等于' + largerName);
                    return false;
                }
            }
            return true;
        }
    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>
