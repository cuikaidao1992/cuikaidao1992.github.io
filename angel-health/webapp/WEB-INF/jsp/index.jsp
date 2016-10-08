<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>天使健康</title>
    
    <link rel="shortcut icon" href="${ctx}/home/common/img/favicon.png" type="image/x-icon">
	<!--Basic Styles-->
    <link href="${ctx}/dep/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/css/font-awesome.min.css" rel="stylesheet" />
    <!--Beyond styles-->
    <link href="${ctx}/dep/css/beyond.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/css/demo.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/css/typicons.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/css/animate.min.css" rel="stylesheet" />
    
    <script src="${ctx}/dep/skins.min.js"></script>

</head>

<body>
    
    <!-- 导航 -->
    <div class="navbar">
        <div class="navbar-inner">
            <div class="navbar-container">
                <!-- logo -->
                <div class="navbar-header pull-left">
                    <a href="#" class="navbar-brand">
                        <small>
                            <img src="${ctx}/dep/img/angel-logo.png"alt="" />
                        </small>
                    </a>
                </div>
                <!-- /logo -->

                <!-- 显示隐藏按钮 -->
                <div class="sidebar-collapse" id="sidebar-collapse">
                    <i class="collapse-icon fa fa-bars"></i>
                </div>
                <!-- /显示隐藏按钮 -->
                <!-- 提醒--->
                <div class="navbar-header pull-right">
                    <div class="navbar-account">
                        <ul class="account-area">
                            <li>
                                <a class=" dropdown-toggle" data-toggle="dropdown" title="Help" href="#">
                                    <i class="icon fa fa-warning"></i>
                                </a>
                                <!--Notification Dropdown-->
                                <ul class="pull-right dropdown-menu dropdown-arrow dropdown-notifications">
                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <div class="notification-icon">
                                                    <i class="fa fa-phone bg-themeprimary white"></i>
                                                </div>
                                                <div class="notification-body">
                                                    <span class="title">Skype meeting with Patty</span>
                                                    <span class="description">01:00 pm</span>
                                                </div>
                                                <div class="notification-extra">
                                                    <i class="fa fa-clock-o themeprimary"></i>
                                                    <span class="description">office</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <div class="notification-icon">
                                                    <i class="fa fa-check bg-darkorange white"></i>
                                                </div>
                                                <div class="notification-body">
                                                    <span class="title">Uncharted break</span>
                                                    <span class="description">03:30 pm - 05:15 pm</span>
                                                </div>
                                                <div class="notification-extra">
                                                    <i class="fa fa-clock-o darkorange"></i>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <div class="notification-icon">
                                                    <i class="fa fa-gift bg-warning white"></i>
                                                </div>
                                                <div class="notification-body">
                                                    <span class="title">Kate birthday party</span>
                                                    <span class="description">08:30 pm</span>
                                                </div>
                                                <div class="notification-extra">
                                                    <i class="fa fa-calendar warning"></i>
                                                    <i class="fa fa-clock-o warning"></i>
                                                    <span class="description">at home</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <div class="notification-icon">
                                                    <i class="fa fa-glass bg-success white"></i>
                                                </div>
                                                <div class="notification-body">
                                                    <span class="title">Dinner with friends</span>
                                                    <span class="description">10:30 pm</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="dropdown-footer ">
                                        <span>
                                            Today, March 28
                                        </span>
                                        <span class="pull-right">
                                            10°c
                                            <i class="wi wi-cloudy"></i>
                                        </span>
                                    </li>
                                </ul>
                                <!--/提醒-->
                            </li>
                            <li>
                                <a class="wave in dropdown-toggle" data-toggle="dropdown" title="Help" href="#">
                                    <i class="icon fa fa-envelope"></i>
                                    <span class="badge">3</span>
                                </a>
                                <!--Messages Dropdown-->
                                <ul class="pull-right dropdown-menu dropdown-arrow dropdown-messages">
                                    <li>
                                        <a href="#">
                                            <img src="${ctx}/dep/img/avatars/divyia.jpg" class="message-avatar" alt="Divyia Austin">
                                            <div class="message">
                                                <span class="message-sender">
                                                    Divyia Austin
                                                </span>
                                                <span class="message-time">
                                                    2 minutes ago
                                                </span>
                                                <span class="message-subject">
                                                    Here's the recipe for apple pie
                                                </span>
                                                <span class="message-body">
                                                    to identify the sending application when the senders image is shown for the main icon
                                                </span>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img src="${ctx}/dep/img/avatars/bing.png" class="message-avatar" alt="Microsoft Bing">
                                            <div class="message">
                                                <span class="message-sender">
                                                    Bing.com
                                                </span>
                                                <span class="message-time">
                                                    Yesterday
                                                </span>
                                                <span class="message-subject">
                                                    Bing Newsletter: The January Issue‏
                                                </span>
                                                <span class="message-body">
                                                    Discover new music just in time for the Grammy® Awards.
                                                </span>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img src="${ctx}/dep/img/avatars/adam-jansen.jpg" class="message-avatar" alt="Divyia Austin">
                                            <div class="message">
                                                <span class="message-sender">
                                                    Nicolas
                                                </span>
                                                <span class="message-time">
                                                    Friday, September 22
                                                </span>
                                                <span class="message-subject">
                                                    New 4K Cameras
                                                </span>
                                                <span class="message-body">
                                                    The 4K revolution has come over the horizon and is reaching the general populous
                                                </span>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                                <!--/Messages Dropdown-->
                            </li>

                            <li>
                                <a class="dropdown-toggle" data-toggle="dropdown" title="Tasks" href="#">
                                    <i class="icon fa fa-tasks"></i>
                                    <span class="badge">4</span>
                                </a>
                                <!--Tasks Dropdown-->
                                <ul class="pull-right dropdown-menu dropdown-tasks dropdown-arrow ">
                                    <li class="dropdown-header bordered-darkorange">
                                        <i class="fa fa-tasks"></i>
                                        4 Tasks In Progress
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <span class="pull-left">Account Creation</span>
                                                <span class="pull-right">65%</span>
                                            </div>

                                            <div class="progress progress-xs">
                                                <div style="width:65%" class="progress-bar"></div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <span class="pull-left">Profile Data</span>
                                                <span class="pull-right">35%</span>
                                            </div>

                                            <div class="progress progress-xs">
                                                <div style="width:35%" class="progress-bar progress-bar-success"></div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <span class="pull-left">Updating Resume</span>
                                                <span class="pull-right">75%</span>
                                            </div>

                                            <div class="progress progress-xs">
                                                <div style="width:75%" class="progress-bar progress-bar-darkorange"></div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="clearfix">
                                                <span class="pull-left">Adding Contacts</span>
                                                <span class="pull-right">10%</span>
                                            </div>

                                            <div class="progress progress-xs">
                                                <div style="width:10%" class="progress-bar progress-bar-warning"></div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="dropdown-footer">
                                        <a href="#">
                                            See All Tasks
                                        </a>
                                        <button class="btn btn-xs btn-default shiny darkorange icon-only pull-right"><i class="fa fa-check"></i></button>
                                    </li>
                                </ul>
                                <!--/Tasks Dropdown-->
                            </li>
                            <li>
                                <a class="login-area dropdown-toggle" data-toggle="dropdown">
                                    <div class="avatar" title="View your public profile">
                                        <img src="${ctx}/dep/img/avatars/adam-jansen.jpg">
                                    </div>
                                    <section>
                                        <h2><span class="profile"><span>冰的原点</span></span></h2>
                                    </section>
                                </a>
                                <!--用户登录-->
                                <ul class="pull-right dropdown-menu dropdown-arrow dropdown-login-area">
                                    <li class="username"><a>冰的原点</a></li>
                                    <li class="email"><a>992609485@qq.com</a></li>
                                    <!--Avatar Area-->
                                    <li>
                                        <div class="avatar-area">
                                            <img src="${ctx}/dep/img/avatars/adam-jansen.jpg" class="avatar">
                                            <span class="caption">更换头像</span>
                                        </div>
                                    </li>
                                   
                                    <li class="edit">
                                        <a href="" class="pull-left">修改资料</a>
                                        <a href="#" class="pull-right">个人主页</a>
                                    </li>
                                    <!--颜色-->
                                    <li class="theme-area">
                                        <ul class="colorpicker" id="skin-changer">
                                            <li><a class="colorpick-btn" href="#" style="background-color:#5DB2FF;" rel="${ctx}/assets/css/skins/blue.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#2dc3e8;" rel="${ctx}/assets/css/skins/azure.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#03B3B2;" rel="${ctx}/assets/css/skins/teal.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#53a93f;" rel="${ctx}/assets/css/skins/green.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#FF8F32;" rel="${ctx}/assets/css/skins/orange.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#cc324b;" rel="${ctx}/assets/css/skins/pink.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#AC193D;" rel="${ctx}/assets/css/skins/darkred.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#8C0095;" rel="${ctx}/assets/css/skins/purple.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#0072C6;" rel="${ctx}/assets/css/skins/darkblue.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#585858;" rel="${ctx}/assets/css/skins/gray.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#474544;" rel="${ctx}/assets/css/skins/black.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#001940;" rel="${ctx}/assets/css/skins/deepblue.min.css"></a></li>
                                        </ul>
                                    </li>
                                   
                                    <li class="dropdown-footer">
                                        <a href="${ctx}/login/login.html">
                                           退出登录
                                        </a>
                                    </li>
                                </ul>
                                <!--/用户登录-->
                            </li>
                            <!-- /Account Area -->
                            
                            <!-- 设置图标 -->
                        </ul><div class="setting">
                            <a id="btn-setting" title="Setting" href="#">
                                <i class="icon glyphicon glyphicon-cog"></i>
                            </a>
                        </div><div class="setting-container">
                            <label>
                                <input type="checkbox" id="checkbox_fixednavbar">
                                <span class="text">Fixed Navbar</span>
                            </label>
                            <label>
                                <input type="checkbox" id="checkbox_fixedsidebar">
                                <span class="text">Fixed SideBar</span>
                            </label>
                            <label>
                                <input type="checkbox" id="checkbox_fixedbreadcrumbs">
                                <span class="text">Fixed BreadCrumbs</span>
                            </label>
                            
                        </div>
                        <!-- 设置图标 -->
                    </div>
                </div>
                <!-- /Account Area and Settings -->
            </div>
        </div>
    </div>
    <!-- /Navbar -->
    <!-- Main Container -->
    <div class="main-container container-fluid">
        <!-- Page Container -->
        <div class="page-container">
            <!-- Page Sidebar -->
            <div class="page-sidebar" id="sidebar">
                <!-- Page Sidebar Header-->
                <div class="sidebar-header-wrapper">
                    <input type="text" class="searchinput" placeholder="搜索" />
                    <i class="searchicon fa fa-search"></i>
                  
                </div>
                <!-- /Page Sidebar Header -->
                <!-- Sidebar Menu -->
                <ul class="nav sidebar-menu">
                    <!--Dashboard-->
                    <li class="active">
                        <a href="${ctx}/index.html"class="menu-dropdown">
                             <i class="menu-icon glyphicon glyphicon-home"></i>
                            <span class="menu-text"> 控制台 </span>
                        </a>
                    </li>
           		</ul>
            
            
            
            
            
                <!-- /导航菜单 -->
            </div>
                onload="Javascript:SetWinHeight(this)"
            <div class="row J_mainContent" id="content-main" style="padding:0 15px;">
               <iframe class="J_iframe"  name="iframe0" width="100%" height="100%" onload="this.height=iframe0.document.body.scrollHeight"
               		 frameborder="0" scrolling="no" src="control.html" frameborder="0" 
               		data-id="sysconfig/area_manager.html" seamless>
               </iframe>
           </div>
           
        </div>
       
    </div>

    	
	<script src="${ctx}/dep/jquery-2.0.3.min.js"></script>
	<script src="${ctx}/dep/bootstrap.min.js"></script>
	
	<script src="${ctx}/dep/beyond.min.js"></script>

    <!--Page Related Scripts-->
    <!--Sparkline Charts Needed Scripts-->
    <script src="${ctx}/dep/charts/sparkline/jquery.sparkline.js"></script>
    <script src="${ctx}/dep/charts/sparkline/sparkline-init.js"></script>

    <!--Easy Pie Charts Needed Scripts-->
    <script src="${ctx}/dep/charts/easypiechart/jquery.easypiechart.js"></script>
    <script src="${ctx}/dep/charts/easypiechart/easypiechart-init.js"></script>

    <!--Flot Charts Needed Scripts-->
    <script src="${ctx}/dep/charts/flot/jquery.flot.js"></script>
    <script src="${ctx}/dep/charts/flot/jquery.flot.resize.js"></script>
    <script src="${ctx}/dep/charts/flot/jquery.flot.pie.js"></script>
    <script src="${ctx}/dep/charts/flot/jquery.flot.tooltip.js"></script>
    <script src="${ctx}/dep/charts/flot/jquery.flot.orderBars.js"></script>
   <script type="text/javascript" src="${ctx}/dep/metisMenu/jquery.metisMenu.js"></script>
   <script type="text/javascript" src="${ctx}/dep/slimscroll/jquery.slimscroll.min.js"></script>
   <script type="text/javascript" src="${ctx}/dep/layer/layer.min.js"></script>
   <script type="text/javascript" src="${ctx}/dep/hplus.min.js"></script>
   <script type="text/javascript" src="${ctx}/dep/contabs.min.js"></script>
	
    <script>
        // If you want to draw your charts with Theme colors you must run initiating charts after that current skin is loaded
        $(window).bind("load", function () {

            /*Sets Themed Colors Based on Themes*/
            themeprimary = getThemeColorFromCss('themeprimary');
            themesecondary = getThemeColorFromCss('themesecondary');
            themethirdcolor = getThemeColorFromCss('themethirdcolor');
            themefourthcolor = getThemeColorFromCss('themefourthcolor');
            themefifthcolor = getThemeColorFromCss('themefifthcolor');

            
            //Sets The Hidden Chart Width
            $('#dashboard-bandwidth-chart')
                .data('width', $('.box-tabbs')
                    .width() - 20);

            //-------------------------Visitor Sources Pie Chart----------------------------------------//
            var data = [
                {
                    data: [[1, 21]],
                    color: '#fb6e52'
                },
                {
                    data: [[1, 12]],
                    color: '#e75b8d'
                },
                {
                    data: [[1, 11]],
                    color: '#a0d468'
                },
                {
                    data: [[1, 10]],
                    color: '#ffce55'
                },
                {
                    data: [[1, 46]],
                    color: '#5db2ff'
                }
            ];
            var placeholder = $("#dashboard-pie-chart-sources");
            placeholder.unbind();

            $.plot(placeholder, data, {
                series: {
                    pie: {
                        innerRadius: 0.45,
                        show: true,
                        stroke: {
                            width: 4
                        }
                    }
                }
            });

            //------------------------------Visit Chart------------------------------------------------//
            var data2 = [{
                color: themesecondary,
                label: "Direct Visits",
                data: [[3, 2], [4, 5], [5, 4], [6, 11], [7, 12], [8, 11], [9, 8], [10, 14], [11, 12], [12, 16], [13, 9],
                [14, 10], [15, 14], [16, 15], [17, 9]],

                lines: {
                    show: true,
                    fill: true,
                    lineWidth: .1,
                    fillColor: {
                        colors: [{
                            opacity: 0
                        }, {
                            opacity: 0.4
                        }]
                    }
                },
                points: {
                    show: false
                },
                shadowSize: 0
            },
                {
                    color: themeprimary,
                    label: "Referral Visits",
                    data: [[3, 10], [4, 13], [5, 12], [6, 16], [7, 19], [8, 19], [9, 24], [10, 19], [11, 18], [12, 21], [13, 17],
                    [14, 14], [15, 12], [16, 14], [17, 15]],
                    bars: {
                        order: 1,
                        show: true,
                        borderWidth: 0,
                        barWidth: 0.4,
                        lineWidth: .5,
                        fillColor: {
                            colors: [{
                                opacity: 0.4
                            }, {
                                opacity: 1
                            }]
                        }
                    }
                },
                {
                    color: themethirdcolor,
                    label: "Search Engines",
                    data: [[3, 14], [4, 11], [5, 10], [6, 9], [7, 5], [8, 8], [9, 5], [10, 6], [11, 4], [12, 7], [13, 4],
                    [14, 3], [15, 4], [16, 6], [17, 4]],
                    lines: {
                        show: true,
                        fill: false,
                        fillColor: {
                            colors: [{
                                opacity: 0.3
                            }, {
                                opacity: 0
                            }]
                        }
                    },
                    points: {
                        show: true
                    }
                }
            ];
            var options = {
                legend: {
                    show: false
                },
                xaxis: {
                    tickDecimals: 0,
                    color: '#f3f3f3'
                },
                yaxis: {
                    min: 0,
                    color: '#f3f3f3',
                    tickFormatter: function (val, axis) {
                        return "";
                    },
                },
                grid: {
                    hoverable: true,
                    clickable: false,
                    borderWidth: 0,
                    aboveData: false,
                    color: '#fbfbfb'

                },
                tooltip: true,
                tooltipOpts: {
                    defaultTheme: false,
                    content: " <b>%x May</b> , <b>%s</b> : <span>%y</span>",
                }
            };
            var placeholder = $("#dashboard-chart-visits");
            var plot = $.plot(placeholder, data2, options);

            //------------------------------Real-Time Chart-------------------------------------------//
            var data = [],
                totalPoints = 300;

            function getRandomData() {

                if (data.length > 0)
                    data = data.slice(1);

                // Do a random walk

                while (data.length < totalPoints) {

                    var prev = data.length > 0 ? data[data.length - 1] : 50,
                        y = prev + Math.random() * 10 - 5;

                    if (y < 0) {
                        y = 0;
                    } else if (y > 100) {
                        y = 100;
                    }

                    data.push(y);
                }

                // Zip the generated y values with the x values

                var res = [];
                for (var i = 0; i < data.length; ++i) {
                    res.push([i, data[i]]);
                }

                return res;
            }
            // Set up the control widget
            var updateInterval = 100;
            var plot = $.plot("#dashboard-chart-realtime", [getRandomData()], {
                yaxis: {
                    color: '#f3f3f3',
                    min: 0,
                    max: 100,
                    tickFormatter: function (val, axis) {
                        return "";
                    }
                },
                xaxis: {
                    color: '#f3f3f3',
                    min: 0,
                    max: 100,
                    tickFormatter: function (val, axis) {
                        return "";
                    }
                },
                colors: [themeprimary],
                series: {
                    lines: {
                        lineWidth: 0,
                        fill: true,
                        fillColor: {
                            colors: [{
                                opacity: 0.5
                            }, {
                                opacity: 0
                            }]
                        },
                        steps: false
                    },
                    shadowSize: 0
                },
                grid: {
                    hoverable: true,
                    clickable: false,
                    borderWidth: 0,
                    aboveData: false
                }
            });

            function update() {

                plot.setData([getRandomData()]);

                plot.draw();
                setTimeout(update, updateInterval);
            }
            update();


            //-------------------------Initiates Easy Pie Chart instances in page--------------------//
            InitiateEasyPieChart.init();

            //-------------------------Initiates Sparkline Chart instances in page------------------//
            InitiateSparklineCharts.init();
        });

    </script>
    <!--Google Analytics::Demo Only-->
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'http://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-52103994-1', 'auto');
        ga('send', 'pageview');

    </script>
    <script>
      /* function SetWinHeight(obj)
		{
		var win=obj;
		console.log(win);
		if (document.getElementById)
		{
		if (win && !window.opera)
		{
		if (win.contentDocument && win.contentDocument.body.offsetHeight)
		win.height = win.contentDocument.body.offsetHeight;
		else if(win.Document && win.Document.body.scrollHeight)
		win.height = win.Document.body.scrollHeight;
		}
		}
		} */
		
		$(function(){
			$.ajax({
                url: "${ctx}/manager/menu/findAllMenu",
                type: "POST",
                dataType : "json",
        		success : function(data) {
        			var obj = eval(data);
        			var i = 1;
    	     		//遍历菜单数组
    	     		for(var i = 0; i<obj.length; i++){
   	     				var id = obj[i]["id"];
   	     				var pid = obj[i]["pId"];
   	     				var pids = obj[i]["pIds"];
   	     				var name = obj[i]["name"];
   	     				var icon = obj[i]["file"];
   	     				var url = obj[i]["url"];
   	     				if(pids == '-1'){
   	     					var str = "<li ><a href='#' class='menu-dropdown'><i class='"+icon+"'></i><span class='menu-text'>"+name+" </span> <i class='menu-expand'></i></a><ul class='submenu' id="+id+"></ul></li>";
   	     					$(".sidebar-menu").append(str);
   	     				}else {
   	     					var _pids = pids.split("-");
   	     					if(_pids.length == 1){
   	     						var nodeStr = " <li liid="+id+"><a href='javascript:void(0);' onclick=aa('"+url+"') ><span class='menu-text'>"+name+"</span></a></li>";
   	     						$("#"+pid+"").append(nodeStr);
   	     					}else{
   	     						var first_id = _pids[0];
	     						var sc_id = _pids[1];
     							var nodeStr = " <li liid="+id+"><a href='javascript:void(0);' onclick=aa('"+url+"') ><span class='menu-text'>"+name+"</span></a></li>";
     							if(!$("#"+sc_id).html()){
     								$("li[liid="+sc_id+"]").find("a").addClass("menu-dropdown").removeAttr("onclick").append("<i class='menu-expand'></i>");
     								$("li[liid="+sc_id+"]").append("<ul class='submenu' id="+sc_id+"></ul>");
     							}
     							$("#"+sc_id).append(nodeStr);
   	     					}
   	     					
   	     				}
	        		}
				}
			});
		})
		function aa(val){
			var s = '${ctx}';
			$('.J_iframe').attr("src",s+"/"+val);
		}
    </script>
    

</body>
<!--  /Body -->
</html>
