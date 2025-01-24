<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">


    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
</head>
<style>

</style>
<body>
    <%-- 模态框相关 --%>
    <div class="modal fade" id="yimiaoChuruInoutListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="margin-left: 450px;">
            <div class="modal-content" style="height:auto;width:1000px;">
                <%-- 模态框标题--%>
                <div class="modal-header">
                    <h5 class="modal-title" id="yimiaoChuruInoutListModalTitle">列表</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%-- 模态框内容 --%>
                <div class="modal-body">
                    <div class="col-sm-12">
                        <label class="col-sm-4">
                            出入库名称:<input type="text" id="yimiaoChuruInoutName" class="form-control" placeholder="出入库名称">
                        </label>
                        <%-- 详情表 --%>
                        <label class="col-sm-6">
                            疫苗:
                            <select id="yimiaoSelect" name="yimiaoSelect"
                                    class="selectpicker form-control"  data-live-search="true"
                                    title="请选择" data-header="请选择" data-size="5">
                            </select>
                        </label>

                        <input type="hidden" id="yimiaoChuruInoutListFlag">
                        <label class="col-sm-1">
                            <button onclick="addYimiaoChuruInoutList()" type="button" class="btn btn-success 出入库">添加</button>
                        </label>
                    </div>
                    <%-- 详情列表 --%>
                    <table id="yimiaoChuruInoutTable" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>疫苗名称</th>
                                <th>金额</th>
                                <th>接种人数</th>
                                <th>操作数量</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody id="yimiaoChuruInoutListTableTbody">
                        </tbody>
                    </table>
                </div>
                <%-- 模态框按钮 --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关 闭</button>
                    <button type="button" onclick="submitYimiaoChuruInoutList()" class="btn btn-primary">提 交</button>
                </div>
            </div>
        </div>
    </div>


    <%--  列表查看 --%>
    <div class="modal fade" id="showYimiaoChuruInoutListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="margin-left: 450px;">
            <div class="modal-content" style="height:auto;width:1000px;">
                <%-- 模态框标题--%>
                <div class="modal-header">
                    <h5 class="modal-title" id="modal-list-title">查看列表</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%-- 模态框内容 --%>
                <div class="modal-body">
                    <div class="col-sm-12">
                        <label class="col-sm-6">
                            出入库名称:<input type="text" id="showYimiaoChuruInoutName" class="form-control" disabled placeholder="出入库名称">
                        </label>
                    </div>
                    <table id="showyimiaoChuruInoutTable" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>疫苗名称</th>
                                <th>金额</th>
                                <th>接种人数</th>
                                <th>操作数量</th>
                                <th >操作</th>
                            </tr>
                        </thead>
                        <tbody id="showYimiaoChuruInoutListTableTbody">
                        </tbody>
                    </table>
                </div>
                <%-- 模态框按钮 --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>


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
                        <ul id="navUl" class="navbar-nav mr-auto">
                        </ul>
                    </div>
                </nav>
            </div>
            <!-- /Menu -->
            <!-- Breadcrumb -->
            <!-- Page Title -->
            <div class="container mt-0">
                <div class="row breadcrumb-bar">
                    <div class="col-md-6">
                        <h3 class="block-title">出入库管理</h3>
                    </div>
                    <div class="col-md-6">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/index.jsp">
                                    <span class="ti-home"></span>
                                </a>
                            </li>
                            <li class="breadcrumb-item">出入库管理</li>
                            <li class="breadcrumb-item active">出入库列表</li>
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
                            <h3 class="widget-title">出入库列表</h3>
                            <div class="table-responsive mb-3" id="tableDiv">
                                <div class="col-sm-12">
                                                                                                             
                                        <label>出入库名称</label>
                                        <input type="text" id="yimiaoChuruInoutNameSearch" placeholder="请输入出入库名称" aria-controls="tableId" class="form-control form-control-sm">
                                     
                                        <label>出入库类型</label>
                                        <select name="yimiaoChuruInoutTypesSelectSearch" id="yimiaoChuruInoutTypesSelectSearch" aria-controls="tableId" class="form-control form-control-sm"></select>
                                                                                                            
                                        <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                        <button onclick="add()" type="button" class="btn btn-primary 新增">添加</button>
                                        <button onclick="inYimiaoChuruInoutList()" type="button" class="btn btn-primary 出入库">入库</button>
                                        <button onclick="outYimiaoChuruInoutList()" type="button" class="btn btn-primary 出入库">出库</button>
                                        <button onclick="chartDialog()" type="button" class="btn btn-primary 报表">报表</button>
                                        <span class="导入导出">
                                            导入<input name="file" id="yimiaoChuruInoutExcelFile" type="file" class="btn btn-success" style="width: 70px!important; line-height: 35px;">
                                            <button class="btn btn-success" onclick="download('/upload/yimiaoChuruInoutMuBan.xls')">导入模板下载</button>
                                        </span>
                                        <button onclick="exportExcel()" type="button" class="btn btn-success 导入导出"><i class="fa fa-file-excel-o" aria-hidden="true"></i>导出</button>
                                        <button onclick="deleteMore()" type="button" class="btn btn-danger 删除">批量删除</button>
                                </div>
                                <table id="tableId" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th class="no-sort" style="min-width: 35px;">
                                            <div class="custom-control custom-checkbox">
                                                <input class="custom-control-input" type="checkbox" id="select-all"
                                                       onclick="chooseAll()">
                                                <label class="custom-control-label" for="select-all"></label>
                                            </div>
                                        </th>

                                        <th onclick="sort('yimiao_churu_inout_uuid_number')">出入库流水号<i id="yimiaoChuruInoutUuidNumberIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('yimiao_churu_inout_name')">出入库名称<i id="yimiaoChuruInoutNameIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('yimiao_churu_inout_types')">出入库类型<i id="yimiaoChuruInoutTypesIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('insert_time')">添加时间<i id="insertTimeIcon" class="fa fa-sort"></i></th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="thisTbody">
                                    </tbody>
                                </table>
                                <div class="col-md-6 col-sm-3" style="flex:none;max-width:inherit;display:flex;">
                                    <div class="dataTables_length" id="tableId_length">
                                        <select name="tableId_length" aria-controls="tableId" id="selectPageSize" onchange="changePageSize()">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                       <span class="text">条每页</span>
                                    </div>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-end">
                                            <li class="page-item" id="tableId_previous" onclick="pageNumChange('pre')"> <a class="page-link" href="#" tabindex="-1">上一页</a></li>
                                            <li class="page-item" id="tableId_next" onclick="pageNumChange('next')"> <a class="page-link" href="#">下一页</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Widget Item -->
                </div>
            </div>
            <!-- /Main Content -->

        </div>
        <!-- /Page Content -->
    </div>
    <div class="modal fade" style="margin-left: -700px" id="chartVisiable" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="z-index: 3000">
            <div class="modal-content" style="width: 1300px;">
                <div class="modal-header">
                    <h5 class="modal-title">报表模态框</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div style="display: flex;" class="form-row row">
                            <!--<label>条件a：</label>
                            <select id="tiaojian111Types" style="width: 300px" name="tiaojian111Types" class="form-control">
                                <option value="1">条件1</option>
                                <option value="2">条件2</option>
                            </select>-->
                            <label>年月</label>
                            <input type="text" id="echartsDate" style="width: 300px" placeholder="请选择年"  class="form-control form-control-sm">
                        <button onclick="chartDialog()" type="button" class="btn btn-primary">查询</button>
                    </div>
                    <div id="statistic" style="width:1200px;height:600px;"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭模态框</button>
                </div>
            </div>
        </div>
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

    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/excel-gen.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/jszip.min.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/FileSaver.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/echarts.min.js"></script>
    <script>

        <%@ include file="../../utils/menu.jsp"%>
        <%@ include file="../../static/setMenu.js"%>
        <%@ include file = "../../static/utils.js" %>
        <%@ include file="../../utils/baseUrl.jsp"%>
        <%@ include file="../../static/getRoleButtons.js"%>
        <%@ include file="../../static/crossBtnControl.js"%>
        var sessionTable = window.sessionStorage.getItem("accountTableName");//登录账户所在表名
        var role         = window.sessionStorage.getItem("role");//权限
        var userId       = window.sessionStorage.getItem("userId");//当前登录人的id
        var tableName = "yimiaoChuruInout";
        var pageType = "list";
        var searchForm = {key: ""};
        var pageIndex = 1;
        var pageSize = 10;
        var totalPage = 0;
        var dataList = [];
        var sortColumn = 'id';
        var sortOrder = 'desc';
        var ids = [];
        var checkAll = false;
        var id = null;//查看详情中的id
        //详情级联表的
        var yimiaoChuruInoutOptions = [];
        var yimiaoChuruInout = null;
        var yimiaoOptions = [];
        var yimiao = null;

        <!-- 级联表的级联字典表 -->

        <!-- 本表的级联字段表 -->
        var yimiaoChuruInoutTypesOptions = [];

        function init() {
            // 满足条件渲染提醒接口
        }

        // 改变每页记录条数
        function changePageSize() {
            var selection = document.getElementById('selectPageSize');
            var index = selection.selectedIndex;
            pageSize = selection.options[index].value;
            getDataList();
        }

        //排序
        function sort(columnName) {
            var iconId = '#' + columnName + 'Icon'
            $('th i').attr('class', 'fa fa-sort');
            if (sortColumn == '' || sortColumn != columnName) {
                sortColumn = columnName;
                sortOrder = 'asc';
                $(iconId).attr('class', 'fa fa-sort-asc');
            }
            if (sortColumn == columnName) {
                if (sortOrder == 'asc') {
                    sortOrder = 'desc';
                    $(iconId).attr('class', 'fa fa-sort-desc');
                } else {
                    sortOrder = 'asc';
                    $(iconId).attr('class', 'fa fa-sort-asc');
                }
            }
            pageIndex = 1;
            getDataList();
        }



        // 查询
        function search() {
            searchForm = {key: ""};

        <!-- 级联表的级联字典表 -->
    <!-- 本表的查询条件 -->

             
            //出入库名称
            var yimiaoChuruInoutNameSearchInput = $('#yimiaoChuruInoutNameSearch');
            if( yimiaoChuruInoutNameSearchInput != null){
                if (yimiaoChuruInoutNameSearchInput.val() != null && yimiaoChuruInoutNameSearchInput.val() != '') {
                    searchForm.yimiaoChuruInoutName = $('#yimiaoChuruInoutNameSearch').val();
                }
            }
     
                //出入库类型
            var yimiaoChuruInoutTypesSelectSearchInput = document.getElementById("yimiaoChuruInoutTypesSelectSearch");
            if(yimiaoChuruInoutTypesSelectSearchInput != null){
                var yimiaoChuruInoutTypesIndex = yimiaoChuruInoutTypesSelectSearchInput.selectedIndex;
                if( yimiaoChuruInoutTypesIndex  != 0){
                    searchForm.yimiaoChuruInoutTypes= document.getElementById("yimiaoChuruInoutTypesSelectSearch").options[yimiaoChuruInoutTypesIndex].value;
                }
            }
                        getDataList();
        }

        // 获取数据列表
        function getDataList() {
            http("yimiaoChuruInout/page", "GET", {
                page: pageIndex,
                limit: pageSize,
                sort: sortColumn,//字段
                order: sortOrder,//asc desc
                yimiaoChuruInoutDelete: 1,
                //本表的
                yimiaoChuruInoutName: searchForm.yimiaoChuruInoutName,
                yimiaoChuruInoutTypes: searchForm.yimiaoChuruInoutTypes,
            //级联表的
            }, (res) => {
                getRoleButtons();// 权限按钮控制
                if(res.code == 0) {
                    clear();
                    $("#thisTbody").html("");
                    getRoleButtons();// 权限按钮控制
                    dataList = res.data.list;
                    totalPage = res.data.totalPage;
                    for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据
                        var trow = setDataRow(dataList[i], i); //定义一个方法,返回tr数据
                        $('#thisTbody').append(trow);
                    }
                    pagination(); //渲染翻页组件
                    getRoleButtons();// 权限按钮控制
                }
            });
        }

        // 渲染表格数据
        function setDataRow(item, number) {
            //创建行
            var row = document.createElement('tr');
            row.setAttribute('class', 'useOnce');
            //创建勾选框
            var checkbox = document.createElement('td');
            var checkboxDiv = document.createElement('div');
            checkboxDiv.setAttribute("class", "custom-control custom-checkbox");
            var checkboxInput = document.createElement('input');
            checkboxInput.setAttribute("class", "custom-control-input");
            checkboxInput.setAttribute("type", "checkbox");
            checkboxInput.setAttribute('name', 'chk');
            checkboxInput.setAttribute('value', item.id);
            checkboxInput.setAttribute("id", number);
            checkboxDiv.appendChild(checkboxInput);
            var checkboxLabel = document.createElement('label');
            checkboxLabel.setAttribute("class", "custom-control-label");
            checkboxLabel.setAttribute("for", number);
            checkboxDiv.appendChild(checkboxLabel);
            checkbox.appendChild(checkboxDiv);
            row.appendChild(checkbox)


            //出入库流水号
            var yimiaoChuruInoutUuidNumberCell = document.createElement('td');
            yimiaoChuruInoutUuidNumberCell.innerHTML = item.yimiaoChuruInoutUuidNumber;
            row.appendChild(yimiaoChuruInoutUuidNumberCell);


            //出入库名称
            var yimiaoChuruInoutNameCell = document.createElement('td');
            yimiaoChuruInoutNameCell.innerHTML = item.yimiaoChuruInoutName;
            row.appendChild(yimiaoChuruInoutNameCell);


            //出入库类型
            var yimiaoChuruInoutTypesCell = document.createElement('td');
            yimiaoChuruInoutTypesCell.innerHTML = item.yimiaoChuruInoutValue;
            row.appendChild(yimiaoChuruInoutTypesCell);


            //添加时间
            var insertTimeCell = document.createElement('td');
            insertTimeCell.innerHTML = item.insertTime;
            row.appendChild(insertTimeCell);



            //每行按钮
            var btnGroup = document.createElement('td');

            //详情按钮
            var detailBtn = document.createElement('button');
            var detailAttr = "detail(" + item.id + ')';
            detailBtn.setAttribute("type", "button");
            detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
            detailBtn.setAttribute("onclick", detailAttr);
            detailBtn.innerHTML = "查看";
            btnGroup.appendChild(detailBtn);

            if(sessionTable=='wuyong'){
                var tempBtn = document.createElement('button');
                var tempAttr = 'wuyong(' + item.id + ')';
                tempBtn.setAttribute("type", "button");
                tempBtn.setAttribute("class", "btn btn-warning btn-sm");
                tempBtn.setAttribute("onclick", tempAttr);
                tempBtn.innerHTML = "无用";
                btnGroup.appendChild(tempBtn);
            }
            //查看列表详情
            var detailListBtn = document.createElement('button');
            var detailListAttr = "getId(" + item.id+')';
            detailListBtn.setAttribute("type", "button");
            detailListBtn.setAttribute("class", "btn btn-info btn-sm 查看");
            detailListBtn.setAttribute("onclick", detailListAttr);
            detailListBtn.innerHTML = "查看列表详情";
            btnGroup.appendChild(detailListBtn);




            //修改按钮
            var editBtn = document.createElement('button');
            var editAttr = 'edit(' + item.id + ')';
            editBtn.setAttribute("type", "button");
            editBtn.setAttribute("class", "btn btn-warning btn-sm 修改");
            editBtn.setAttribute("onclick", editAttr);
            editBtn.innerHTML = "修改";
            btnGroup.appendChild(editBtn);



            //删除按钮
            var deleteBtn = document.createElement('button');
            var deleteAttr = 'remove(' + item.id + ')';
            deleteBtn.setAttribute("type", "button");
            deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
            deleteBtn.setAttribute("onclick", deleteAttr);
            deleteBtn.innerHTML = "删除";
            btnGroup.appendChild(deleteBtn);

            row.appendChild(btnGroup);

            return row;
    }




        // 翻页
        function pageNumChange(val) {
            if (val == 'pre') {
                pageIndex--;
            } else if (val == 'next') {
                pageIndex++;
            } else {
                pageIndex = val;
            }
            getDataList();
        }

        // 下载
        function download(url) {
            window.open(baseUrl+url);
        }
        // 打开新窗口播放媒体
        function mediaPlay(url){
            window.open(baseUrl+url);
        }

        /*导入*/
        function upload() {
            /*导入数据*/
            $('#yimiaoChuruInoutExcelFile').fileupload({
                url: baseUrl + 'file/upload',
                headers: {token: window.sessionStorage.getItem("token")},
                dataType: "json",
                done: function (e, data) {
                    http("yimiaoChuruInout/batchInsert?fileName="+data.result.file, "get", {} , (res) => {
                        if(res.code == 0){
                            layui.layer.msg("操作成功", {time: 2000,icon: 6});
                        }
                    });
                }
            });
        }

        // 渲染翻页组件
        function pagination() {
            var beginIndex = pageIndex;
            var endIndex = pageIndex;
            var point = 4;
            //计算页码
            for (var i = 0; i < 3; i++) {
                if (endIndex == totalPage) {
                    break;
                }
                endIndex++;
                point--;
            }
            for (var i = 0; i < 3; i++) {
                if (beginIndex == 1) {
                    break;
                }
                beginIndex--;
                point--;
            }
            if (point > 0) {
                while (point > 0) {
                    if (endIndex == totalPage) {
                        break;
                    }
                    endIndex++;
                    point--;
                }
                while (point > 0) {
                    if (beginIndex == 1) {
                        break;
                    }
                    beginIndex--;
                    point--
                }
            }
            // 是否显示 前一页 按钮
            if (pageIndex > 1) {
                $('#tableId_previous').show();
            } else {
                $('#tableId_previous').hide();
            }
            // 渲染页码按钮
            for (var i = beginIndex; i <= endIndex; i++) {
                var pageNum = document.createElement('li');
                pageNum.setAttribute('onclick', "pageNumChange(" + i + ")");
                if (pageIndex == i) {
                    pageNum.setAttribute('class', 'paginate_button page-item active useOnce');
                } else {
                    pageNum.setAttribute('class', 'paginate_button page-item useOnce');
                }
                var pageHref = document.createElement('a');
                pageHref.setAttribute('class', 'page-link');
                pageHref.setAttribute('href', '#');
                pageHref.setAttribute('aria-controls', 'tableId');
                pageHref.setAttribute('data-dt-idx', i);
                pageHref.setAttribute('tabindex', 0);
                pageHref.innerHTML = i;
                pageNum.appendChild(pageHref);
                $('#tableId_next').before(pageNum);
            }
            // 是否显示 下一页 按钮
            if (pageIndex < totalPage) {
                $('#tableId_next').show();
                $('#tableId_next a').attr('data-dt-idx', endIndex + 1);
            } else {
                $('#tableId_next').hide();
            }
            var pageNumInfo = "当前第 " + pageIndex + " 页，共 " + totalPage + " 页";
            $('#tableId_info').html(pageNumInfo);
        }

        // 跳转到指定页
        function toThatPage() {
            //var index = document.getElementById('pageIndexInput').value;
            if (index < 0 || index > totalPage) {
                layui.layer.msg('请输入正确的页码', {time: 2000,icon: 5});
            } else {
                pageNumChange(index);
            }
        }

        // 全选/全不选
        function chooseAll() {
            checkAll = !checkAll;
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                boxs[i].checked = checkAll;
            }
        }

        // 批量删除
        function deleteMore() {
            ids = []
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                if (boxs[i].checked) {
                    ids.push(boxs[i].value)
                }
            }
            if (ids.length == 0) {
                layui.layer.msg('请勾选要删除的记录', {time: 2000,icon: 5});
            } else {
                remove(ids);
            }
        }

        // 删除
        function remove(id) {
            var mymessage = confirm("真的要删除吗？");
            if (mymessage == true) {
                var paramArray = [];
                if (id == ids) {
                    paramArray = id;
                } else {
                    paramArray.push(id);
                }
                httpJson("yimiaoChuruInout/delete", "POST", paramArray, (res) => {
                    if(res.code == 0){
                        getDataList();
                        layui.layer.msg(res.msg, {time: 2000,icon: 6});
                    }
                });
            } else {
                layui.layer.msg('已取消操作', {time: 2000,icon: 5});
            }
        }
        function wuyong(id) {
            var mymessage = confirm("确定 了么？");
            if (mymessage == true) {
                httpJson("yimiaoChuruInout/update", "POST", {
                    id:id,
                    yimiaoChuruInoutTypes:2
                }, (res) => {
                    if(res.code == 0){
                        getDataList();
                        layui.layer.msg("操作成功", {time: 2000,icon: 6});
                    }
                });
            }
        }

        // 用户登出
        <%@ include file="../../static/logout.jsp"%>

        //修改
        function edit(id) {
            window.sessionStorage.setItem('updateId', id)
            window.location.href = "add-or-update.jsp"
        }

        //清除会重复渲染的节点
        function clear() {
            var elements = document.getElementsByClassName('useOnce');
            for (var i = elements.length - 1; i >= 0; i--) {
                elements[i].parentNode.removeChild(elements[i]);
            }
        }

        //添加
        function add() {
            window.sessionStorage.setItem("addyimiaoChuruInout", "addyimiaoChuruInout");
            window.location.href = "add-or-update.jsp"
        }
        function exportExcel() {
            excel = new ExcelGen({
                "src_id": "tableId",
                "show_header": true,
                "file_name": 'yimiaoChuruInout.xlsx'
            });
            excel.generate();
        }

        // 查看详情
        function detail(id) {
            window.sessionStorage.setItem("updateId", id);
            window.location.href = "info.jsp";
        }


    //填充级联表搜索下拉框

    //填充本表搜索下拉框
             
     
        function yimiaoChuruInoutTypesSelectSearch() {
            var yimiaoChuruInoutTypesSelectSearch = document.getElementById('yimiaoChuruInoutTypesSelectSearch');
            if(yimiaoChuruInoutTypesSelectSearch != null) {
                yimiaoChuruInoutTypesSelectSearch.add(new Option('-请选择-',''));
                if (yimiaoChuruInoutTypesOptions != null && yimiaoChuruInoutTypesOptions.length > 0){
                    for (var i = 0; i < yimiaoChuruInoutTypesOptions.length; i++) {
                            yimiaoChuruInoutTypesSelectSearch.add(new Option(yimiaoChuruInoutTypesOptions[i].indexName,yimiaoChuruInoutTypesOptions[i].codeIndex));
                    }
                }
            }
        }
            
    //查询级联表搜索条件所有列表

    //查询当前表搜索条件所有列表
            function yimiaoChuruInoutTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=yimiao_churu_inout_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        yimiaoChuruInoutTypesOptions = res.data.list;
                    }
                });
            }










        // 模态框

        //出库
        function outYimiaoChuruInoutList() {
            document.getElementById("yimiaoChuruInoutListModalTitle").innerHTML = "出库列表";
            $("#yimiaoChuruInoutListFlag").val(2);
            $('#yimiaoChuruInoutName').val("");//出入库名称置空
            $('#yimiaoChuruInoutListModal').modal('show');
        }
        //入库
        function inYimiaoChuruInoutList() {
            document.getElementById("yimiaoChuruInoutListModalTitle").innerHTML = "入库列表";
            $("#yimiaoChuruInoutListFlag").val(1);
            $('#yimiaoChuruInoutName').val("");//出入库名称置空
            $('#yimiaoChuruInoutListModal').modal('show');

        }

        // 操作出入库模态框打开
        $('#yimiaoChuruInoutListModal').on('show.bs.modal', function () {

            // 疫苗相关
            yimiaoSelect();//查询
            initializationYimiaoSelect();//初始化
            $(".selectpicker" ).selectpicker('refresh');//刷新缓存
        });
        // 模态框关闭
        $('#yimiaoChuruInoutListModal').on('hide.bs.modal', function () {
            $("#yimiaoChuruInoutListModalTitle").val("")
            $("#yimiaoChuruInoutListFlag").val(0);
            $('#yimiaoChuruInoutName').val("");//出入库名称置空
            $("#yimiaoChuruInoutListTableTbody").html("");
            // 疫苗置空
            $("#yimiaoSelect").empty();
            $(".selectpicker" ).selectpicker('refresh');
        });

        // 模态框的 疫苗数据查询
        function yimiaoSelect() {
            http("yimiao/page?page=1&limit=100&sort=&order=", "GET", {}, (res) => {
                if(res.code == 0){
                    yimiaoOptions = res.data.list;
                }
            });
        }
        // 模态框的 疫苗的数据绑定到下拉框上
        function initializationYimiaoSelect() {
            var yimiaoSelect = document.getElementById('yimiaoSelect');
            if(yimiaoSelect != null && yimiaoOptions != null  && yimiaoOptions.length > 0 ) {
                for (var i = 0; i < yimiaoOptions.length; i++) {
                    yimiaoSelect.add(new Option(yimiaoOptions[i].yimiaoName, yimiaoOptions[i].id));
                }
            }
            $("#yimiaoSelect").change(function(e) {
                var id = e.target.value;
                http("yimiao/info/"+id, "GET", {}, (res) => {
                    if(res.code == 0){
                        yimiao = res.data;
                    }
                });
            });
        }

        // 模态框的添加按钮
        function addYimiaoChuruInoutList() {
            var id = document.getElementById("yimiaoSelect").options[document.getElementById("yimiaoSelect").selectedIndex].value;//获取当前选择项的值.
            if(id ==null || id=="" || id<=0){
                layui.layer.msg('请选择疫苗', {time: 2000,icon: 5});
                return;
            }
            if($("#rowId"+id).val() == null ){
                http("yimiao/info/"+id, "GET", {}, (res) => {
                    if(res.code == 0){
                        var span =  setYimiaoChuruInoutListDataRow(res.data);
                        $('#yimiaoChuruInoutListTableTbody').append(span);
                        chickYimiaoChuruInoutListCaozuoNumber(1,id);
                    }else{
                        layui.layer.msg('添加疫苗失败,请联系管理员查看日志详情', {time: 2000,icon: 5});
                        return;
                    }
                });
            }else{
                layui.layer.msg('您已经添加过此疫苗', {time: 2000,icon: 5});
            }
        }

        // 添加疫苗到待提交列表
        function setYimiaoChuruInoutListDataRow(item) {
            //创建行
            var row = document.createElement('tr');
            row.setAttribute("id", "rowId"+item.id);

                //疫苗名称
                var yimiaoNameCell = document.createElement('td');
                yimiaoNameCell.innerHTML = item.yimiaoName;
                row.appendChild(yimiaoNameCell);

                //金额
                var yimiaoNewMoneyCell = document.createElement('td');
                yimiaoNewMoneyCell.innerHTML = item.yimiaoNewMoney;
                row.appendChild(yimiaoNewMoneyCell);

                //接种人数
                var yimiaoKucunNumberCell = document.createElement('td');
                yimiaoKucunNumberCell.setAttribute("id", "td"+item.id);
                yimiaoKucunNumberCell.setAttribute("name", "td"+item.id);
                yimiaoKucunNumberCell.innerHTML = item.yimiaoKucunNumber;
                row.appendChild(yimiaoKucunNumberCell);

                //操作数量
                var yimiaoChuruInoutListNumberCell = document.createElement('input');
                yimiaoChuruInoutListNumberCell.setAttribute("id", "inputNumbertd"+item.id);
                yimiaoChuruInoutListNumberCell.setAttribute("name", "inputNumber");
                yimiaoChuruInoutListNumberCell.setAttribute("type", "number");
                yimiaoChuruInoutListNumberCell.setAttribute("value", 1);
                yimiaoChuruInoutListNumberCell.setAttribute("class", "form-control");
                yimiaoChuruInoutListNumberCell.setAttribute("onchange", "chickYimiaoChuruInoutListCaozuoNumber(this.value,"+item.id+")");
                row.appendChild(yimiaoChuruInoutListNumberCell);

                //每行按钮
                var btnGroup = document.createElement('td');
                    //删除按钮
                    var deleteBtn = document.createElement('button');
                    deleteBtn.setAttribute("type", "button");
                    deleteBtn.setAttribute("class", "btn btn-danger btn-sm 出入库");
                    deleteBtn.setAttribute("onclick","removeSelectYimiaoChuruInoutOne("+item.id+")");
                    deleteBtn.innerHTML = "删除";
                btnGroup.appendChild(deleteBtn);
            row.appendChild(btnGroup);

            return row;
        }

        function chickYimiaoChuruInoutListCaozuoNumber(this_val,id){
            // var this_val = e.value || 0;
            if(this_val == 0){
                $("#inputNumbertd"+id).val(1);
                layui.layer.msg("数量为0无意义", {time: 2000,icon: 5});
                return false;
            }
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                $("#inputNumbertd"+id).val(1);
                layui.layer.msg("只能输入正整数数字", {time: 2000,icon: 5});
                return false;
            }
            var tdid = "#td"+id;
            var number = $(tdid).text();
            if(number==null || number==""){
                layui.layer.msg("疫苗数量不正确,请进入疫苗中修改该疫苗数量", {time: 2000,icon: 5});
                return false;
            }
            var yimiaoChuruInoutListFlag =$("#yimiaoChuruInoutListFlag").val();
            if(yimiaoChuruInoutListFlag !=2){
                //数量效验
                if((parseInt(number)-parseInt(this_val))<0){
                    $("#inputNumbertd"+id).val(1);
                    layui.layer.msg("操作数量不能大于疫苗数量", {time: 2000,icon: 5});
                    return false;
                }
            }
        }

        function removeSelectYimiaoChuruInoutOne(id) {
            var rowId = "#rowId"+ id;
            $(rowId).remove();
        }

        // 提交操作
        function submitYimiaoChuruInoutList() {

            var yimiaoChuruInoutName = $("#yimiaoChuruInoutName").val();
            if(yimiaoChuruInoutName ==null || yimiaoChuruInoutName == "" || yimiaoChuruInoutName=="null"){
                layui.layer.msg("请输入要生成的出入库名称", {time: 2000,icon: 5});
                return false;
            }

            var elementsByName = document.getElementsByName("inputNumber"); // 获取当前模态框表格中输入的input值
            var flag=false;// 用于判断是否有输入为空或者0这种无意义参数情况
            let map = {};//map就是传到后台的值,key:id value:数字
            for (var i = 0; i < elementsByName.length; i++) {//遍历一下表格数据
                var value = elementsByName[i].value;
                if(value ==null || value =="" ||  value =="null" || value == 0){
                    flag=true;
                }else{
                    var id = parseInt(elementsByName[i].id.replace("inputNumbertd",""));
                    map[id]=parseInt(value);
                }
            }
            if(flag){
                layui.layer.msg("数量中有空或者为0情况", {time: 2000,icon: 5});
                return false;
            }

            var flag = parseInt($("#yimiaoChuruInoutListFlag").val());
            var urlParam=null;



            var msg=null;
            if(flag==1){
                urlParam="inYimiaoChuruInoutList";
                msg="入库成功";
            }else if(flag==2){
                urlParam="outYimiaoChuruInoutList";
                msg="出库成功";
            }else{
                layui.layer.msg("未知错误,请联系管理员", {time: 2000,icon: 5});
                return false;
            }
            if(map == null || Object.keys(map).length==0){
                layui.layer.msg("不允许添加空值", {time: 2000,icon: 5});
                return false;
            }

            httpJson("yimiaoChuruInout/" + urlParam, "POST", {
                map : map,
                yimiaoChuruInoutName : yimiaoChuruInoutName,
        }, (res) => {
                if(res.code == 0){
                    layui.layer.msg(msg, {time: 2000,icon: 6});
                    $('#yimiaoChuruInoutListModal').modal('hide');
                    getDataList();
                }else{
                    layui.layer.msg(res.msg, {time: 2000,icon: 5});
                }
            });
        }







        //列表查看
        // 获取选择的列表的id
        function getId(thisId) {
            if(thisId == null || thisId=="" || thisId=="null"){
                layui.layer.msg("未知错误,请联系管理员处理", {time: 2000,icon: 5});
                return;
            }
            id=thisId;
            $('#showYimiaoChuruInoutListModal').modal('show');
        }

        //模态框打开的时候会执行这个里面的东西
        $('#showYimiaoChuruInoutListModal').on('show.bs.modal', function () {
            //清理表格内容,防止重复回显
            $("#showYimiaoChuruInoutListTableTbody").html("");
            if(id ==null){
                layui.layer.msg("获取当前列id错误,请联系管理员处理", {time: 2000,icon: 5});
                $('#showYimiaoChuruInoutListModal').modal('hide');
                return;
            }
            showYimiaoChuruInoutList();//查询数据列表
        });

        //列表查看的查询数据
        function showYimiaoChuruInoutList(){
            // 查询当前数据详情 给name赋值
            http("yimiaoChuruInout/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                    // 给name赋值
                    $("#showYimiaoChuruInoutName").val(res.data.yimiaoChuruInoutName);
                }
            });

            //查询列表详情
            http("yimiaoChuruInoutList/page", "GET", {
                page: 1,
                limit: 100,
                yimiaoChuruInoutId: id,
            }, (res) => {
                if(res.code == 0){
                    var list = res.data.list;
                    $("#showYimiaoChuruInoutListTableTbody").html("");
                    for (var i = 0; i < list.length; i++) {//遍历一下表格数据
                        var trow = setShowYimiaoChuruInoutListDataRow(list[i]);//在 setShowYimiaoChuruInoutListDataRow 中拼接数据,然后返回再追加到列表中
                        $('#showYimiaoChuruInoutListTableTbody').append(trow);
                    }
                }else{
                    layui.layer.msg("查询列表错误,请联系管理员处理", {time: 2000,icon: 5});
                    $('#showYimiaoChuruInoutListModal').modal('hide');
                    return;
                }
            });
        }

        // 一行数据
        function setShowYimiaoChuruInoutListDataRow(item) {
            //创建行
            var row = document.createElement('tr');
            row.setAttribute("id", "rowId"+item.id);

            //疫苗名称
            var yimiaoNameCell = document.createElement('td');
            yimiaoNameCell.innerHTML = item.yimiaoName;
            row.appendChild(yimiaoNameCell);

            //金额
            var yimiaoNewMoneyCell = document.createElement('td');
            yimiaoNewMoneyCell.innerHTML = item.yimiaoNewMoney;
            row.appendChild(yimiaoNewMoneyCell);

            //接种人数
            var yimiaoKucunNumberCell = document.createElement('td');
            yimiaoKucunNumberCell.innerHTML = item.yimiaoKucunNumber;
            row.appendChild(yimiaoKucunNumberCell);

            //操作数量
            var yimiaoChuruInoutListNumberCell = document.createElement('td');
            yimiaoChuruInoutListNumberCell.innerHTML = item.yimiaoChuruInoutListNumber;
            row.appendChild(yimiaoChuruInoutListNumberCell);

            //每行按钮
            var btnGroup = document.createElement('td');
            //删除按钮
            var deleteBtn = document.createElement('button');
            deleteBtn.setAttribute("type", "button");
            deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
            deleteBtn.setAttribute("onclick","removeShowYimiaoChuruInoutOne("+item.id+")");
            deleteBtn.innerHTML = "删除";
            btnGroup.appendChild(deleteBtn);
            row.appendChild(btnGroup);

            return row;
        }

        //模态框关闭的时候会执行这个里面的东西
        $('#showYimiaoChuruInoutListModal').on('hide.bs.modal', function () {
            $("#showYimiaoChuruInoutListTableTbody").html("");//模态框列表置空
            id=null;//id置空
            $("#yimiaoChuruInoutName").val("");//name赋值为空
            getDataList();//查询大页面数据
        });

        // 查看的删除方法
        function removeShowYimiaoChuruInoutOne(id) {
            var mymessage = confirm("真的要删除吗？");
            if (mymessage == true) {
                var paramArray = [];
                paramArray.push(id);
                httpJson("yimiaoChuruInoutList/delete", "POST",paramArray, (res) => {
                    if(res.code == 0){
                    layui.layer.msg('删除成功', {time: 2000,icon: 6});
                    showYimiaoChuruInoutList();
                }else{
                    layui.layer.msg(res.msg, {time: 2000,icon: 5});
                }
            });
            } else {
                layui.layer.msg("已取消操作", {time: 2000,icon: 6});
            }
        }
// 101 102 103 104 105


            function chartDialog(){
                let echartsDate = $("#echartsDate").val();
                $('#chartVisiable').modal('show');//打开模态框
                //柱状图
                // var statistic = echarts.init( document. getElementById( 'statistic'),'macarons');
                // http("barSumOne", "GET", {
                //     riqi:echartsDate
                // }, (res) => {//barCountOne barCountTwo barSumOne barSumTwo
                //     if(res && res.code === 0){
                //         let yAxisName = "数值";//y轴
                //         let xAxisName = "类型";//x轴
                //         let series = [];//具体数据值
                //         res.data.yAxis.forEach(function (item,index) {//点击可关闭的按钮字符串在后台方法中
                //             let tempMap = {};
                //             tempMap.name=res.data.legend[index];
                //             tempMap.type='bar';
                //             tempMap.data=item;
                //             series.push(tempMap);
                //         })
                //         var option = {
                //             tooltip: {
                //                 trigger: 'axis',
                //                 axisPointer: {
                //                     type: 'cross',
                //                     crossStyle: {
                //                         color: '#999'
                //                     }
                //                 }
                //             },
                //             toolbox: {
                //                 feature: {
                //                     // dataView: { show: true, readOnly: false },  // 数据查看
                //                     magicType: { show: true, type: ['line', 'bar'] },//切换图形展示方式
                //                     // restore: { show: true }, // 刷新
                //                     saveAsImage: { show: true }//保存
                //                 }
                //             },
                //             legend: {
                //                 data: res.data.legend//标题  可以点击导致某一列数据消失
                //             },
                //             xAxis: [
                //                 {
                //                     type: 'category',
                //                     axisLabel:{interval: 0},
                //                     name: xAxisName,
                //                     data: res.data.xAxis,
                //                     axisPointer: {
                //                         type: 'shadow'
                //                     }
                //                 }
                //             ],
                //             yAxis: [
                //                 {
                //                     type: 'value',//不能改
                //                     name: yAxisName,//y轴单位
                //                     axisLabel: {
                //                         formatter: '{value}' // 后缀
                //                     }
                //                 }
                //             ],
                //             series:series//具体数据
                //         };
                //         statistic.setOption(option,true);
                //         window.onresize = function () {
                //             statistic.resize();
                //         };
                //     }else {
                //         layui.layer.msg("报表未查询到数据", {time: 3000,icon: 5});
                //     }
                // });
                ////饼状图
                var statistic = echarts.init( document. getElementById( 'statistic'),'macarons');
                http("newSelectGroupCount", "GET", {
                   tableName: "yimiao_churu_inout",
                   groupColumn: "yimiao_churu_inout_types",
                   // riqi:echartsDate
                }, (res) => {//pieSum pieCount
                   if (res && res.code === 0) {
                       let data = res.data;
                       let xAxis = [];
                       let yAxis = [];
                       let pArray = []
                       var option = {};
                       for(let i=0;i<data.length;i++){
                           xAxis.push(data[i].name);
                           yAxis.push(data[i].value);
                           pArray.push({
                               value: data[i].value,
                               name: data[i].name
                           })
                           option = {
                               title: {
                                   text: '疫苗出入类型统计',
                                   left: 'center'
                               },
                               tooltip: {
                                   trigger: 'item',
                                   formatter: '{b} : {c} ({d}%)'
                               },
                               legend: {
                                   orient: 'vertical',
                                   left: 'left'
                               },
                               series: [
                                   {
                                       type: 'pie',
                                       radius: '55%',
                                       center: ['50%', '60%'],
                                       data: pArray,
                                       emphasis: {
                                           itemStyle: {
                                               shadowBlur: 10,
                                               shadowOffsetX: 0,
                                               shadowColor: 'rgba(0, 0, 0, 0.5)'
                                           }
                                       }
                                   }
                               ]
                           };
                       }
                       statistic.setOption(option,true);
                       window.onresize = function() {
                           statistic.resize();
                       };
                   }
                });
            }

        layui.use(['layer', 'carousel', 'jquery', 'form', 'upload', 'laydate', 'rate'], function () {
            var rate = layui.rate;//评分
            var laydate  = layui.laydate ;//laydate
            var jquery = layui.jquery;//jquery
            var echartsDate = laydate.render({
                elem: '#echartsDate'
                ,type: 'year'//month
                ,value: new Date()
            });
            var $=jquery;

        });


        $(document).ready(function () {
            //激活翻页按钮
            $('#tableId_previous').attr('class', 'paginate_button page-item previous')
            $('#tableId_next').attr('class', 'paginate_button page-item next')
            //隐藏原生搜索框
            $('#tableId_filter').hide()
            //设置右上角用户名
            $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
            //设置项目名
            $('.sidebar-header h3 a').html(projectName)
            setMenu();
            init();

            upload()
            //查询级联表的搜索下拉框

            //查询当前表的搜索下拉框
            yimiaoChuruInoutTypesSelect();
            getDataList();

        //级联表的下拉框赋值

        //当前表的下拉框赋值
                                     
             
            yimiaoChuruInoutTypesSelectSearch();
                                    
        <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>

</html>
