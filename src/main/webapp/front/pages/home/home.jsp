<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <title>首页</title>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="author" content="order by mobanxiu.cn"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/common.css"/>
    <link rel="stylesheet" href="../../xznstatic/css/style.css"/>
    <link rel="stylesheet" href="../../xznstatic/css/animate.css"/><!-- 动画效果 -->
    <link rel="stylesheet" href="../../xznstatic/css/swiper.min.css"/>
    <script src="../../xznstatic/js/jquery-1.11.3.min.js"></script>
    <script src="../../xznstatic/js/jquery.SuperSlide.2.1.1.js"></script>
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css"/>

    <link rel="stylesheet" href="../../css/theme.css"/>
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
    }

    #test1 {
        overflow: hidden;
    }

    /*轮播图css*/
    #test1 .layui-carousel-ind li {
        width: 20px;
        height: 10px;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0, 0, 0, .3);
        border-radius: 6px;
        background-color: #f7f7f7;
        box-shadow: 0 0 6px rgba(255, 0, 0, .8);
    }

    #test1 .layui-carousel-ind li.layui-this {
        width: 30px;
        height: 10px;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0, 0, 0, .3);
        border-radius: 6px;
    }

    .layui-carousel-ind{
        top: 0;

    }
    .layui-carousel-ind ul{
        position: absolute;

        bottom: 8px !important;
        z-index: 10;
    }

    .title {
        padding: 10px 5px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }

   .title span {
        padding: 0 10px;
        line-height: 1.4;
    }

   .box .list {
        display: flex;
        flex-wrap: wrap;
    }




    .box .list img {
        width: 100%;
        height: 100px;
        display: block;
        margin: 0 auto;
        object-fit: cover;
        max-width: 100%;
    }

    .box .list .name {
        padding-top: 5px;
        color: red;
        font-size: 14px;
        text-align: center;
        box-sizing: border-box;
    }


    .box .list .list-item {
        flex: 0 0 25%;
        padding: 0 10px;
        box-sizing: border-box;
    }

    /*
   .box .list .list-item-body {
        border: 1px solid rgba(0, 0, 0, 3);
        padding: 5px;
        box-sizing: border-box;
        cursor: pointer;
   }
    .box .list .list-item .list-item-body {
        border: 1px solid rgba(0, 0, 0, 3);
        padding: 10px;
        box-sizing: border-box;
        display: flex;
        cursor: pointer;
    }

    .box .list .list-item .list-item-body img {
        width: 120px;
        height: 100%;
        display: block;
        margin: 0 auto;
        object-fit: cover;
        max-width: 100%;
    }

    .box .list .list-item .list-item-body .item-info {
        flex: 1;
        display: flex;
        justify-content: space-between;
        flex-direction: column;
        padding-left: 10px;
        box-sizing: border-box;
    }

    .box .list .list-item .list-item-body .item-info .name {
        padding-top: 5px;
        color: red;
        font-size: 14px;
        box-sizing: border-box;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
    }
    .box .list .list-item .list-item-body .item-info .time {
        padding-top: 5px;
        color: red;
        font-size: 14px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
    }
    #new-list-6 .swiper-wrapper {
        -webkit-transition-timing-function: linear;
        -moz-transition-timing-function: linear;
        -ms-transition-timing-function: linear;
        -o-transition-timing-function: linear;
        transition-timing-function: linear;
    }*/

    .list-item1 {
        flex: 0 0 100%;
    }
    .list-item2 {
        flex: 0 0 50%;
    }
    .list-item3 {
        flex: 0 0 33.3%;
    }
    .list-item4 {
        flex: 0 0 25%;
    }
    .list-item5 {
        flex: 0 0 20%;
    }
    /*限制内容长度*/
    .line1 {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
        overflow: hidden;
    }
    .line2 {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
    }
    .line3 {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 3;
        overflow: hidden;
    }
    /*轮播图css*/
    /*套装样式*/
    /*腰线*/
    /*home页面主要样式*/

    .index-pv000 .animation-box:hover {
        transform: perspective(1000px) translate3d(0px, 0px, 0px) scale(1) rotate(0deg) skew(0deg, 0deg);
        transition: all 0.3s;
        z-index: 2;
        position: relative;
    }
    .index-pv000 .animation-box img:hover {
        transform: perspective(1000px) translate3d(0px, 0px, 0px) scale(1) rotate(0deg) skew(0deg, 0deg);
        transition: all 0.3s;
        z-index: 2;
        position: relative;
    }
    /*home页面普通数据样式*/
.tox-pop{
    z-index: -99999;
}

.show-reel a img{
    width:100%;
}
.show-reel:nth-child(2){
    margin:2em 0;
}
.agile-gallery{
    position: relative;
    overflow: hidden;
    text-align: center;;
}
.agileits-caption {
    background: rgba(0, 0, 0, 0.62);
    padding: 2em 1em 1em 1em;
    position: absolute;
    left: 0;
    bottom: -105%;
    text-align: center;
    width: 100%;
    height: 100%;
    -webkit-transition: .5s all;
    transition: .5s all;
    -moz-transition: .5s all;
}
.agile-gallery:hover .agileits-caption {
    bottom: 0%;
}
.agileits-caption h4{
    color: #FFFFFF;
    margin: 0 0 .5em 0;
    font-size: 1.5em;
    font-weight: 600;
    font-family: 'Laila', serif;
    line-height: 8em;
    text-transform: capitalize;
}
.agileits-caption p{
    color: #FFFFFF;
    font-size: 1.3em;
    margin-top:  3px;
}
.gallery-grids {
    padding: 5em 0;
}
    /*home页面新闻数据样式*/
</style>
<body>
<div id="app" >
    <div class="banner">

        <div class="layui-carousel" id="test1" style="height: 800px !important;position: relative;" :style='{"boxShadow":"0 0 0px rgba(255,0,0,.8)","margin":"0 auto","borderColor":"rgba(0,0,0,.3)","borderRadius":"0px","borderWidth":"0","width":"100%","borderStyle":"solid"}'>
            <div carousel-item class="slideInLeft" style="visibility: visible; animation-duration: 3s; animation-name: slideInLeft;height: 800px">
                <div v-for="(item,index) in swiperList" :key="index">
                    <img style="width: 100%;height: 100%;object-fit:cover;" :src="baseUrl+item.img"/>
                </div>
            </div>
        </div>
    </div>

    <div id="content">
                <div style="display: flex;justify-content: center;background-repeat: no-repeat;background-position: center center;background-size: cover;">
                    <div class="box" style='width:100%;'>
                        <div style="width: 1200px;height: auto;margin:  0 auto;padding: 10px 0">
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div class="title main_backgroundColor"
     :style='{"padding":"10px 0 10px 0","boxShadow": "#fff 0px 0px 6px","margin":"10px 0 10px 0","borderColor":"rgba(252, 210, 50, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"8px","alignItems":"center","borderWidth":"0 10px","fontSize":"17px","borderStyle":""}'>
         <span>DATA SHOW</span>
    <span>异常信息展示</span>
</div>

                            </div>
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
                                <div v-if="gonggaoList.length" class="new-list-7" style="display: flex;">
                                    <div v-for="(item,index) in gonggaoList" v-if="index<4" :key="index" @click="jump('../gonggao/detail.jsp?id='+item.id)" class="new7-list-item animation-box" style="cursor: pointer;" :style='{"padding":"0","boxShadow":"0 0 0px rgba(0,0,0, .3)","margin":"0 2%","borderColor":"#ccc","backgroundColor":"rgba(255, 255, 255, 1)","borderRadius":"0","borderWidth":"0","width":"21%","borderStyle":"solid","height":"320px"}'>
                                        <img :style='{"padding":"0","boxShadow":"0 0 0px rgba(0,0,0, 0)","margin":"0","borderColor":"#ccc","backgroundColor":"#ccc","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"200px"}' style="box-sizing: border-box;object-fit: cover;width: 100%;height: 250px;" :src="baseUrl+item.gonggaoPhoto">
                                        <div style="box-sizing: border-box;" :style='{"padding":"5px 10px","boxShadow":"0 0 6px rgba(0,0,0,0)","margin":" 0","borderColor":"#ccc","backgroundColor":"rgba(0,0,0,0)","color":"rgba(142, 79, 27, 1)","textAlign":"center","borderRadius":"0","borderWidth":"0","width":"100%","lineHeight":"16px","fontSize":"16px","borderStyle":"solid"}' class="new7-list-item-title">{{ item.gonggaoName }}</div>
                                        <div style="box-sizing: border-box;" :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(0,0,0,0)","margin":"0","borderColor":"#ccc","backgroundColor":"rgba(0,0,0,0)","color":"#999","textAlign":"right","borderRadius":"0","borderWidth":"0","width":"100%","lineHeight":"12px","fontSize":"12px","borderStyle":"solid"}' class="new7-list-item-time">{{ item.insertTime}}</div>
                                        <div v-if="item.gonggaoContent.length>10">
                                            <div style="box-sizing: border-box;" :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(0,0,0,0)","margin":"0","borderColor":"#ccc","backgroundColor":"rgba(0,0,0,0)","color":"rgba(119, 119, 119, 1)","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"100%","lineHeight":"21px","fontSize":"14px","borderStyle":"solid"}' class="new7-list-item-descript">{{ item.gonggaoContent.substring(0,10)}}...</div>
                                        </div>
                                        <div v-else>
                                            <div style="box-sizing: border-box;" :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(0,0,0,0)","margin":"0","borderColor":"#ccc","backgroundColor":"rgba(0,0,0,0)","color":"rgba(119, 119, 119, 1)","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"100%","lineHeight":"21px","fontSize":"14px","borderStyle":"solid"}' class="new7-list-item-descript" v-html="myFilters(item.gonggaoContent)"></div>
                                        </div>
                                        <div class="new7-list-item-info" style="box-sizing: border-box;display: flex;justify-content: space-between;align-items: center;">
                                            <div :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(0,0,0,.3)","margin":"20px 0 0 10px","borderColor":"#ccc","backgroundColor":"rgba(142, 79, 24, 0.5)","color":"#fff","borderRadius":"2px","borderWidth":"0","width":"auto","lineHeight":"20px","fontSize":"14px","text":"异常信息","borderStyle":"solid"}' class="new7-list-item-identification">异常信息</div>
                                            <div :style='{"padding":"0","boxShadow":"0 0 6px rgba(0,0,0,0)","margin":"20px 10px 0 0","borderColor":"#ccc","backgroundColor":"rgba(255,0,0,0)","color":"#999","borderRadius":"0","borderWidth":"0","width":"auto","lineHeight":"20px","fontSize":"18px","text":"→","borderStyle":"solid"}' class="new7-list-item-icon">→</div>
                                        </div>
                                    </div>
                                </div>
                                <div style="margin-top:40px;text-align: center;">
                                    <button @click="jump('../gonggao/list.jsp')" style="display: block;cursor: pointer;" type="button" :style='{"padding":"0 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"4px auto","borderColor":"#ccc","backgroundColor":"#fff","color":"rgba(160, 67, 26, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"34px"}'>
                                        查看更多
                                        <i :style='{"isshow":true,"padding":"0 0 0 1px","fontSize":"14px","color":"rgba(160, 67, 26, 1)"}' class="layui-icon layui-icon-next"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="display: flex;justify-content: center;background-repeat: no-repeat;background-position: center center;background-size: cover;">
                    <div class="box" style='width:100%;'>
                        <div style="width: 1200px;height:auto;margin:  0 auto;padding: 10px 0">
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div class="title main_backgroundColor"
     :style='{"padding":"10px 0 10px 0","boxShadow": "#fff 0px 0px 6px","margin":"10px 0 10px 0","borderColor":"rgba(252, 210, 50, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"8px","alignItems":"center","borderWidth":"0 10px","fontSize":"17px","borderStyle":""}'>
         <span>DATA SHOW</span>
    <span>疫苗展示</span>
</div>

                            </div>
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
                    <div class="show-reel row" style="display: flex;justify-content: space-around;">
                        <div v-for="(item,index) in yimiaoList" v-bind:key="index" class="list-item4 list-item3B" style="padding: 6px">
                            <div class="agile-gallery">
                                <a @click="jumpCheck('../yimiao/detail.jsp?id='+item.id , item.aaaaaaaaaa == null?'':item.aaaaaaaaaa , item.shangxiaTypes == null?'':item.shangxiaTypes)" class="lsb-preview" data-lsb-group="header">
                                    <img :src="item.yimiaoPhoto?baseUrl+item.yimiaoPhoto.split(',')[0]:''" style="height: 350px;width:100%;" />
                                    <div class="agileits-caption">
                                        <h4>{{item.yimiaoName}}</h4>
                                        <p v-if="item.yimiaoNewMoney != null" >￥{{item.yimiaoNewMoney}}</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                                <div style="text-align: center;margin-top: 40px;">
                                    <button @click="jump('../yimiao/list.jsp')" style="display: block;cursor: pointer;" type="button"
                                            :style='{"padding":"0 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"4px auto","borderColor":"#ccc","backgroundColor":"#fff","color":"rgba(160, 67, 26, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"34px"}'>
                                        查看更多
                                        <i :style='{"isshow":true,"padding":"0 0 0 1px","fontSize":"14px","color":"rgba(160, 67, 26, 1)"}' class="layui-icon layui-icon-next"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    </div>
</div>

<script src="../../xznstatic/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../xznstatic/js/echarts.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 引入element组件库 -->
<script src="../../xznstatic/js/element.min.js"></script>
<!-- 引入element样式 -->
<link rel="stylesheet" href="../../xznstatic/css/element.min.css">
<script src="../../xznstatic/js/swiper.min.js"></script>
<script src="../../js/config.js"></script>
<script src="../../modules/config.js"></script>
<script src="../../js/utils.js"></script>
<script src="../../xznstatic/js/wow.min.js"></script>
<script type="text/javascript">
    // 动画效果
    new WOW().init();

    Vue.prototype.myFilters = function (msg) {
        if(msg==null || msg==""){
            return "";
        }else if (msg.length>20){
            msg.replace(/\n/g, "<br>");
            return msg.substring(0,20)+"......";
        }else{
            return msg.replace(/\n/g, "<br>");
        }
    };
    var vue = new Vue({
        el: '#app',
        data: {
            swiperList: [],
            baseUrl:"",
            // dianyingRecommend: [],
            gonggaoList: [],
            gonggaoTypesList: [],
            yimiaoList: [],
            yimiaoTypesList: [],
            //类型查询条件
            gonggaoTypes: "",
            yimiaoTypes: "",
        },
        filters: {
            newsDesc: function (val) {
                if (val) {
                    val = val.replace(/<[^<>]+>/g, '').replace(/undefined/g, '');
                    if (val.length > 60) {
                        val = val.substring(0, 60);
                    }

                    return val;
                }
                return '';
            }
        },
        methods: {
            jump(url) {
                jump(url)
            }
            , jumpCheck(url, check1, check2) {
                if (check1 == "2" || check1 == 2) {//级联表的逻辑删除字段[1:未删除 2:已删除]
                    layui.layer.msg("已经被删除", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                if (check2 == "2" || check2 == 2) {//是否下架[1:上架 2:下架]
                    layui.layer.msg("已经下架", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                this.jump(url);
            }
        }
    });

    layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var form = layui.form;
        var carousel = layui.carousel;
        var http = layui.http;
        var jquery = layui.jquery;
        vue.baseUrl = http.baseurl

        // 获取轮播图 数据
        http.request('config/list', 'get', {
            page: 1,
            limit: 5
        }, function (res) {
            if (res.data.list.length > 0) {
                let swiperList = [];
                res.data.list.forEach(element => {
                    if (element.value != null
                    ) {
                        swiperList.push({
                            img: element.value
                        });
                    }
                })
                ;

                vue.swiperList = swiperList;

                vue.$nextTick(() => {
                    carousel.render({
                        elem: '#test1',
                        width: '100%',
                        height: '100%',
                        arrow: 'hover',
                        anim: 'default',
                        autoplay: 'true',
                        interval: '3000',
                        indicator: 'inside'
                    });

                })

                // vue.$nextTick(()=>{
                //   window.xznSlide();
                // });
            }
        });

        gonggaoSelect();
        //类型动态搜索
        $(document).on("click", ".gonggaoTypes-search", function(e) {
            vue.gonggaoTypes = $(this).attr('index');
            gonggaoSelect();
        });
        gonggaoTypesSelect();//类型查询
        yimiaoSelect();
        //类型动态搜索
        $(document).on("click", ".yimiaoTypes-search", function(e) {
            vue.yimiaoTypes = $(this).attr('index');
            yimiaoSelect();
        });
        yimiaoTypesSelect();//类型查询

        function gonggaoTypesSelect() {//类型查询
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=gonggao_types",'get',{},function(res) {
                if (res.code == 0) {vue.gonggaoTypesList = res.data.list;}
            });
        }
        function gonggaoSelect(){//数据查询
            http.request('gonggao/list', 'get', {
                page: 1,
                limit: 8,
                gonggaoTypes: vue.gonggaoTypes,//类型
                order: "desc",//asc desc
            },function (res) {
                vue.gonggaoList = res.data.list;
            })
        };
        function yimiaoTypesSelect() {//类型查询
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=yimiao_types",'get',{},function(res) {
                if (res.code == 0) {vue.yimiaoTypesList = res.data.list;}
            });
        }
        function yimiaoSelect(){//数据查询
            http.request('yimiao/gexingtuijian', 'get', {
                page: 1,
                limit: 8,
                yimiaoDelete: 1,
                yimiaoTypes: vue.yimiaoTypes,//类型
                order: "desc",//asc desc
            },function (res) {
                vue.yimiaoList = res.data.list;
            })
        };

    });

    window.xznSlide = function () {
        // jQuery(".banner").slide({mainCell:".bd ul",autoPlay:true,interTime:5000});
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
<script src="../../xznstatic/js/index.js"></script>
</body>
</html>
