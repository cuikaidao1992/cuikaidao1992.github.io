//加载完成之后 去掉菜单栏的选中效果，重新添加选中效果
function removeLiActive (id){
	$("#sidebar li").removeClass("active");
	$(id).addClass("active");
}

//logo蓝条~~可传模块名称
//index_href为界面中左上角的连接，grxx_href是右上角点击头像里个人信息的连接
function topBlock(title,index_href,grxx_href,tg,gk,ht,name){
	var topBlock =	'<script type="text/javascript">'+
						'try {'+
							'ace.settings.check("navbar", "fixed")'+
						'} catch (e) {}'+
					'</script>'+
					'<div class="navbar-container" id="navbar-container">'+
						'<div class="navbar-header pull-left">'+
							'<a href="'+index_href+'" class="navbar-brand">'+
								'<small> <i class="icon-leaf"></i> '+title+' </small>'+
							'</a>'+
						'</div>'+
						'<div class="navbar-header pull-right" role="navigation">'+
							'<ul class="nav ace-nav nohigh">'+
								'<li class="highlight" style="border-left:1px solid #DDD">'+
									'<a class="dropdown-toggle" href="'+tg+'" title="投稿平台">'+ 
										'<i class="icon-pencil" style="padding-top:10px;"></i>'+
									'</a>'+
								'</li>'+
								'<li >'+
									'<a class="dropdown-toggle" target="_blank" href='+gk+' title="稿库">'+ 
										'<i class="icon-signal" style="padding-top:10px;"></i>'+
									'</a>'+
								'</li>'+
								'<li >'+
									'<a class="dropdown-toggle" target="_blank" href='+ht+' title="后台管理">'+ 
										'<i class="icon-cogs" style="padding-top:10px;"></i>'+
									'</a>'+
								'</li>'+
								'<li class="light-blue">'+
								'<a data-toggle="dropdown" href="#" class="dropdown-toggle">'+ 
									'<span class="user-info" style="padding: 8px;">'+name+'</span>'+
									'<i class="icon-caret-down" style="padding: 10px;"></i>'+
								'</a>'+
								'<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">'+

									'<li>'+
										'<a href="javascript:void(0);"onclick="loginOut()"> <i class="icon-off"></i> 退出 </a>'+
									'</li>'+
								'</ul>'+
							'</li>'+
							'</ul>'+
						'</div>'+
					'</div>';
	$("#navbar").append(topBlock);
}

//左边菜单栏~~可传页面名称id（后台管理）
function menusBlockhoutai(id){
	var menusBlock ='<script type="text/javascript">'+
						'try {'+
							'ace.settings.check("sidebar", "fixed")'+
						'} catch (e) {}'+
					'</script>'+
					'<ul class="nav nav-list">'+
						'<li id="yh" class="active">'+
							'<a href="yh.html" class="dropdown-toggle"> '+
								'<i class="icon-user"></i> <span class="menu-text"> 用户管理 </span> '+
							'</a>'+
						'</li>'+
						'<li id="js">'+
							'<a href="js.html" class="dropdown-toggle"> '+
								'<i class="icon-lock"></i> <span class="menu-text"> 角色管理 </span> '+
							'</a>'+
						'</li>'+
						'<li id="gj">'+
							'<a href="gj.html"> '+
								'<i class="icon-text-width"></i> <span class="menu-text"> 稿件管理 </span> '+
							'</a>'+
						'</li>'+
						'<li id="zt">'+
							'<a href="zt.html"> '+
								'<i class=" icon-th-list"></i> <span class="menu-text"> 事件管理 </span> '+
							'</a>'+
						'</li>'+
						'<li id="fl">'+
							'<a href="fl.html"> '+
								'<i class=" icon-indent-left"></i> <span class="menu-text"> 分类管理 </span> '+
							'</a>'+
						'</li>'+
						'<li id="z" class="hidden">'+
							'<a href="z.html"> '+
								'<i class="icon-picture"></i> <span class="menu-text"> 组管理 </span> '+
							'</a>'+
						'</li>'+
						'<li id="zd">'+
							'<a href="zd.html"> '+
								'<i class="icon-book"></i> <span class="menu-text"> 词典更新 </span> '+
							'</a>'+
						'</li>'+
						'<li id="rz">'+
							'<a href="rz.html" class="dropdown-toggle"> '+
								'<i class="icon-file"></i> <span class="menu-text"> 日志管理 </span> '+
							'</a>'+
						'</li>'+
						'<li id="xtjk">'+
							'<a href="xtjk.html" class="dropdown-toggle"> '+
								'<i class="icon-eye-open"></i> <span class="menu-text"> 系统监控 </span>'+
							'</a>'+
						'</li>'+
						'<li id="pzgl">'+
							'<a href="pzgl.html" class="dropdown-toggle"> '+
								'<i class=" icon-wrench"></i> <span class="menu-text"> 配置管理 </span>'+
							'</a>'+
						'</li>'+
					'</ul>'+
					'<div class="sidebar-collapse" id="sidebar-collapse">'+
						'<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>'+
					'</div>'+
					'<script type="text/javascript">'+
						'try {'+
							'ace.settings.check("sidebar", "collapsed")'+
						'} catch (e) {}'+
					'</script>';
	$("#sidebar").append(menusBlock);
	removeLiActive(id);
}

function menusBlocktougao(li1,li2){
	var menusBlock =	
					'<ul class="nav nav-list">'+
						'<li id="xxgj">'+
						'<a href="#" class="dropdown-toggle">'+
			            '<i class="icon-desktop"></i>'+
			            '<span class="menu-text"> 新写稿件 </span>'+
			            '<b class="arrow icon-angle-down"></b>'+
			        '</a>'+
			         '<ul class="submenu">'+
			            '<li >'+
			               ' <a href="javascript:void(0)" onclick="newArticle(1)">'+
			                    '<i class="icon-double-angle-right"></i>新写文字稿</a>'+
			            '</li>'+
			           ' <li id="npg">'+
			               ' <a href="javascript:void(0)" onclick="newArticle(2)">'+
			                    '<i class="icon-double-angle-right"></i>新写图片稿</a>'+
			            '</li>'+
			           ' <li id="nag">'+
			                '<a href="javascript:void(0)" onclick="newArticle(3)">'+
			                    '<i class="icon-double-angle-right"></i>'+
			                   			' 新写音频稿'+
			                '</a>'+
			           ' </li>'+
			           ' <li id="nvg">'+
			                '<a href="javascript:void(0)" onclick="newArticle(4)">'+
			                    '<i class="icon-double-angle-right"></i>'+
			                  		'  新写视频稿'+
			                '</a>'+
			            '</li>'+
			             '<li id="nzg">'+
			               ' <a href="javascript:void(0)" onclick="newArticle(5)">'+
			                   ' <i class="icon-double-angle-right"></i>'+
			                   		' 新写综合稿'+
			               ' </a>'+
			            '</li>'+
			            '<li id="nxg">'+
			               ' <a href="javascript:void(0)" onclick="newArticle(6)">'+
			                   ' <i class="icon-double-angle-right"></i>'+
			                   		' 新写混编稿'+
			               ' </a>'+
			            '</li>'+
			        '</ul>'+
			   ' </li>'+
			    '<li id="gjk">'+
			      ' <a href="#" class="dropdown-toggle" >'+
			           ' <i class="icon-list"></i>'+
			           ' <span class="menu-text"> 稿件库 </span>'+
			           ' <b class="arrow icon-angle-down"></b>'+
			      '  </a>'+
			       ' <ul class="submenu" id="ugjk">'+
			           ' <li id="yt">'+
			              '  <a target="search" href="javascript:void(0)">'+
			                   ' <i class="icon-double-angle-right"></i>'+
			                  		'  已投稿件'+
			               ' </a>'+
			            '</li>'+
			           ' <li id="wd">'+
			                '<a target="search" href="javascript:void(0)" >'+
			                    '<i class="icon-double-angle-right"></i>'+
			                  		 ' 我的稿件'+
			               ' </a>'+
			           ' </li>'+
			            '<li id="yc">'+
			               ' <a target="search" href="search.jsp?table=1&boxFlag=3&person=1">'+
			                  ' <i class="icon-double-angle-right"></i>'+
			                		  '  已传稿件'+
			               ' </a>'+
			           ' </li>'+
			        '</ul>'+
			    '</li>'+
			    /*' <li id="gltgk">'+
			        '<a href="#" class="dropdown-toggle">'+
			           ' <i class="icon-edit"></i>'+
			           ' <span class="menu-text"> 管理投稿库 </span>'+
			           ' <b class="arrow icon-angle-down"></b>'+
			       ' </a>'+
			       ' <ul class="submenu">'+
			           ' <li id="glyt">'+
			               ' <a href="ytgaogl.html">'+
			                   ' <i class="icon-double-angle-right"></i>'+
			                   		 ' 已投稿件'+
			               ' </a>'+
			            '</li>'+
			       ' </ul>'+
			    '</li>'+
			   ' <li id="gldxk">'+
			      '  <a href="#" class="dropdown-toggle">'+
			           ' <i class="icon-list"></i>'+
			          '  <span class="menu-text"> 管理短信库 </span>'+
			           ' <b class="arrow icon-angle-down"></b>'+
			      '  </a>'+
			        '<ul class="submenu">'+
			            '<li id="ysh">'+
			                '<a href="yshmessage.html">'+
			                   ' <i class="icon-double-angle-right"></i>'+
			             		       '已审核短信'+
			               ' </a>'+
			            '</li>'+
			            '<li id="wsh">'+
			               ' <a href="wshmessage.html">'+
			                   ' <i class="icon-double-angle-right"></i>'+
			                 		   '未审核短信'+
			               ' </a>'+
			           ' </li>'+
			           ' <li id="wtg">'+
			                '<a href="wtgmessage.html">'+
			                    '<i class="icon-double-angle-right"></i>'+
			                 		   '未通过短信'+
			                '</a>'+
			            '</li>'+
			        '</ul>'+
			    '</li>'+*/
			'</ul>'+
			'<div class="sidebar-collapse" id="sidebar-collapse">'+
			    '<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>'+
			'</div>';
				$("#sidebar").append(menusBlock);
				$("#sidebar li").removeClass("active");
				$(li1).addClass("open active");
				$(li2).addClass("active");
}


function menusBlocktougao1(li0,li1,li2){
	var menusBlock =	
					'<ul class="nav nav-list">'+
						'<li id="xxgj">'+
						'<a href="#" class="dropdown-toggle">'+
			            '<i class="icon-desktop"></i>'+
			            '<span class="menu-text"> 新写稿件 </span>'+
			            '<b class="arrow icon-angle-down"></b>'+
			        '</a>'+
			         '<ul class="submenu">'+
				        '<li id="nsjzx">'+
			         		'<a href="javascript:void(0)" onclick="newArticle(8)">'+
			         		'<i class="icon-double-angle-right"></i>新事件为中心</a>'+
			         	'</li>'+
			         	'<li id="sjzx">'+
			         		'<a href="javascript:void(0)" onclick="newArticle(7)">'+
			         		'<i class="icon-double-angle-right"></i>事件为中心</a>'+
			         	'</li>'+
			            '<li >'+
			               ' <a href="javascript:void(0)" onclick="newArticle(1)">'+
			                    '<i class="icon-double-angle-right"></i>新写文字稿</a>'+
			            '</li>'+
			           ' <li id="npg">'+
			               ' <a href="javascript:void(0)" onclick="newArticle(2)">'+
			                    '<i class="icon-double-angle-right"></i>新写图片稿</a>'+
			            '</li>'+
			           ' <li id="nag">'+
			                '<a href="javascript:void(0)" onclick="newArticle(3)">'+
			                    '<i class="icon-double-angle-right"></i>'+
			                   			' 新写音频稿'+
			                '</a>'+
			           ' </li>'+
			           ' <li id="nvg">'+
			                '<a href="javascript:void(0)" onclick="newArticle(4)">'+
			                    '<i class="icon-double-angle-right"></i>'+
			                  		'  新写视频稿'+
			                '</a>'+
			            '</li>'+
			             '<li id="nzg">'+
			               ' <a href="javascript:void(0)" onclick="newArticle(5)">'+
			                   ' <i class="icon-double-angle-right"></i>'+
			                   		' 新写综合稿'+
			               ' </a>'+
			            '</li>'+
			            '<li id="nxg">'+
			               ' <a href="javascript:void(0)" onclick="newArticle(6)">'+
			                   ' <i class="icon-double-angle-right"></i>'+
			                   		' 新写混编稿'+
			               ' </a>'+
			            '</li>'+
			        '</ul>'+
			   ' </li>'+
			    '<li id="gjk">'+
			      ' <a href="#" class="dropdown-toggle" >'+
			           ' <i class="icon-list"></i>'+
			           ' <span class="menu-text"> 稿件库 </span>'+
			           ' <b class="arrow icon-angle-down"></b>'+
			      '  </a>'+
			       ' <ul class="submenu" id="gklx">'+
			           ' <li id="yt" >'+
			              '  <a href="javascript:void(0)" onclick="gosearch(0)">'+
			                   ' <i class="icon-double-angle-right"></i>'+
			                  		'  已投稿件'+
			               ' </a>'+
			            '</li>'+
			           ' <li id="wd">'+
			                '<a href="javascript:void(0)" onclick="gosearch(1)">'+
			                    '<i class="icon-double-angle-right"></i>'+
			                  		 '我的稿件'+
			               ' </a>'+
			           ' </li>'+
			           ' <li id="yc">'+
		                '<a href="javascript:void(0)" onclick="gosearch(3)">'+
		                    '<i class="icon-double-angle-right"></i>'+
		                  		 '已传稿件'+
		               ' </a>'+
		               ' </li>'+
			        '</ul>'+
			    '</li>'+
			    ' <li id="gltgk">'+
		             '<a href="#" class="dropdown-toggle">'+
		                   ' <i class="icon-list"></i>'+
		                  ' <span class="menu-text"> 管理投稿库 </span>'+
		                   ' <b class="arrow icon-angle-down"></b>'+
		               ' </a>'+
		               ' <ul class="submenu">'+
		                    ' <li id="glyt">'+
		                        ' <a href="javascript:void(0)" onclick="gosearch(2)">'+
		                        ' <i class="icon-double-angle-right"></i>'+
		                   		 ' 已投稿件'+
		                      ' </a>'+
		                      '</li>'+
		              ' </ul>'+
		         '</li>'+
			'</ul>'+
			'<div class="sidebar-collapse" id="sidebar-collapse">'+
			'<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>'+
		'</div>'+
		'<script type="text/javascript">'+
			'try {'+
				'ace.settings.check("sidebar", "collapsed")'+
			'} catch (e) {}'+
		'</script>';
				$("#sidebar").append(menusBlock);
				$("#sidebar li").removeClass("active");
				$(li0).addClass("open active");
				$(li1).addClass("open active");
				$(li2).addClass("active");
}

//已投稿件、我的稿件链接
function gosearch(flag){
	if(flag == 0){
		$("#rightdiv").load("page.jsp?table=1&boxFlag=0&person=1&index=0");
		$("#yt").addClass("active");
		$("#wd").removeClass("active");
		$("#yc").removeClass("active");
	}else if(flag == 1){
		$("#rightdiv").load("page.jsp?table=1&boxFlag=1&person=1&index=1");
		$("#wd").addClass("active");
		$("#yt").removeClass("active");
		$("#yc").removeClass("active");
	}
	else if(flag == 3){
		$("#rightdiv").load("pageYC.jsp?table=1&boxFlag=3&person=1&index=2");
		$("#yc").addClass("active");
		$("#wd").removeClass("active");
		$("#yt").removeClass("active");
	}
	else
		{
		$("#glyt").addClass("active");
		$("#wd").removeClass("active");
		$("#yt").removeClass("active");
		$("#yc").removeClass("active");
		$("#rightdiv").load("pageYT.jsp?table=1&boxFlag=0&person=0&index=0");
		}
	
}

//左边分类(稿库)
function classifyBlockgggk(){
	var menusBlock ='<div id="tabs">'+
						'<div class="form-group">'+
							'<div class="col-sm-12" style="padding-left: 0px; padding-right: 0px;">'+
								'<select class="form-control" id="form-field-select-1">'+
									'<option value="all" selected="selected">'+
										'按内容'+
									'</option>'+
									'<option value="1">'+
										'按目标'+
									'</option>'+
									'<option value="2">'+
										'按来源'+
									'</option>'+
									'<option value="3">'+
										'按类型'+
									'</option>'+
									'<option value="4">'+
										'按中文信息分类法'+
									'</option>'+
								'</select>'+
							'</div>'+
						'</div>'+
						'<ul>'+
							'<li>'+
								'<a href="#tabs-2">类别</a>'+
							'</li>'+
							'<li>'+
								'<a href="#tabs-1">时间</a>'+
							'</li>'+
						'</ul>'+
						'<div id="tabs-2">'+
							'<div id="tree1" class="tree"></div>'+
						'</div>'+
						'<div id="tabs-1">'+
							'<div id="tree2" class="tree"></div>'+
						'</div>'+
					'</div>';
	
	$("#sidebar").append(menusBlock);
	
	$( "#tabs" ).tabs();

	$('#tree1').ace_tree({
		dataSource: treeDataSource3,
		multiSelect: true,
		loadingHTML: '<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
		'open-icon': 'icon-minus',
		'close-icon': 'icon-plus',
		'selectable': true,
		'selected-icon': 'icon-ok',
		'unselected-icon': 'icon-remove'
	});
	$('#tree2').ace_tree({
		dataSource: treeDataSource,
		multiSelect: true,
		loadingHTML: '<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
		'open-icon': 'icon-minus',
		'close-icon': 'icon-plus',
		'selectable': true,
		'selected-icon': 'icon-ok',
		'unselected-icon': 'icon-remove'
	});
}

//左边菜单栏~~可传页面名称id(稿库)
function menusBlockgggk(li1,li2){
	var menusBlock ='<div class="navbar-header">'+
					    '<!-- 自适应隐藏导航展开按钮 -->'+
					    '<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">'+
						'<span class="sr-only">Toggle navigation</span>'+
						'<span class="icon-bar"></span>'+
						'<span class="icon-bar"></span>'+
						'<span class="icon-bar"></span>'+
					    '</button>'+
					 '</div>'+
					 '<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">'+
						'<ul class="nav navbar-nav">'+
							'<li id="gk" class="dropdown">'+
							'<a href="index.html" class="dropdown-toggle"><i class="  icon-edit"></i>&nbsp;投稿稿库 <span class="caret"></span></a>'+
							'<ul class="dropdown-menu" role="menu">'+
							'<li id="web"><a href="webgao.html">web稿库</a></li>'+
							'<li id="yd"><a href="yidonggao.html">移动稿库</a></li>'+
							'</ul>'+
							'</li>'+
						    '<li id="cpk" class="dropdown active"><a href="chengpinku.html"><i class=" icon-book"></i>&nbsp;成品库</a></li>'+
						    '<li id="lszl" class="dropdown"><a href="lishiziliao.html"><i class=" icon-bookmark"></i>&nbsp;历史资料</a></li>'+
						    '<li id="sjk" class="dropdown">'+
							/*'<a  href="#" class="dropdown-toggle" data-toggle="dropdown" ><i class="icon-text-width"></i>&nbsp;事件库<span class="caret"></span></a>'+
							'<ul class="dropdown-menu" role="menu">'+
							'<li id="sj1"><a href="shijianku.html">一路一带</a></li>'+
							'<li id="sj2"><a href="shijianku.html">股市行情</a></li>'+
						      '</ul>'+*/
						    '</li>'+
						    '<li id="wgzy" class="dropdown">'+
							'<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-globe"></i>&nbsp;外购资源<span class="caret"></span></a>'+
							'<ul class="dropdown-menu" role="menu">'+
							'<li id="zc"><a href="waigouziyuan.html">自采稿</a></li>'+
							'<li id="xhs"><a href="waigouziyuan.html">新华社稿</a></li>'+
							'<li id="qt"><a href="waigouziyuan.html">其他媒体</a></li>'+
						      '</ul>'+
						    '</li>'+
						    '<li id="gczy" class="dropdown">'+
							'<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-file"></i>&nbsp;工程内其他系统资源<span class="caret"></span></a>'+
							'<ul class="dropdown-menu" role="menu">'+
							'<li id="mtxz"><a href="gczy.html">媒体协作工作系统</a></li>'+
							'<li id="xwxt"><a href="gczy.html">新闻选题内容及评价系统</a></li>'+
							'<li id="xwxt"><a href="gczy.html">全国出版内容交换系统</a></li>'+
						      '</ul>'+
						    '</li>'+
						    '<li id="lspdf" class="dropdown"><a href="shijianlist.html"><i class="icon-th-list"></i>&nbsp;事件库</a></li>'+
						    '<li id="gjtj" class="dropdown"><a href=""><i class=" icon-filter"></i>&nbsp;稿件统计<span class="caret"></span></a>'+
						    '<ul class="dropdown-menu dropdown-info">'+
					        '<li id="lgtj">'+
					            '<a href="tongji.html">'+
					                '来稿统计'+
					            '</a>'+
					        '</li>'+
					        '<li id="djtj">'+
					            '<a href="clicktongji.html">'+
					                '稿件点击量统计'+
					            '</a>'+
					        '</li>'+
					        '<li id="jstj">'+
					            '<a href="searchtongji.html">'+
					                '稿件检索量统计'+
					            '</a>'+
					        '</li>'+
					        '<li id="ltj" class="hidden">'+
					            '<a href="tongji.html">'+
					                '稿件量统计'+
					            '</a>'+
					        '</li>'+
					        '<li id="xztj">'+
					            '<a href="downloadtongji.html">'+
					                '稿件下载统计'+
					            '</a>'+
					        '</li>'+
					        '<li id="tgtj">'+
					            '<a href="tougaotongji.html">'+
					                '记者投稿统计'+
					            '</a>'+
					        '</li>'+
					        '<li id="cytj">'+
					            '<a href="adopttongji.html">'+
					                '稿件采用统计'+
					            '</a>'+
					        '</li>'+
					        '</ul>'+
						    '</li>'+
						'</ul>'+
					 '</div>';
	
	$("#tabbable").append(menusBlock);
	$("#tabbable li").removeClass("active");
  	$("#tabbable li").mouseover(function(){
		$(this).addClass("open");
	});
	$("#tabbable li").mouseout(function(){
		$(this).removeClass("open");
	});
	$(li1).addClass("active");
	$(li2).removeClass("active");
	$(li2).addClass("active");
}

//历史遗留下的js 可以借鉴
function menusBlockgggkOld(li1,li2){
	var menusBlock ='<ul class="nav nav-tabs">'+
						'<li id="gk" class="dropdown">'+
						    '<a data-toggle="dropdown" class="dropdown-toggle" href="#">'+
						        '<i class="icon-text-width">'+
						        '</i>'+
						        '<span class="menu-text">'+
						            '综合稿库'+
						        '</span>'+
						        '&nbsp;'+
						        '<i class="icon-caret-down bigger-110 width-auto">'+
						        '</i>'+
						    '</a>'+
						    '<ul class="dropdown-menu dropdown-info">'+
						        '<li id="zhg">'+
						            '<a href="index.html">'+
						                '<i class="icon-double-angle-right">'+
						                '</i>'+
						                '综合稿'+
						            '</a>'+
						        '</li>'+
						        '<li id="wzg">'+
						            '<a href="wenzigao.html">'+
						                '<i class="icon-double-angle-right">'+
						                '</i>'+
						                '文字稿'+
						            '</a>'+
						        '</li>'+
						        '<li id="tpg">'+
						            '<a href="tupiangao.html">'+
						                '<i class="icon-double-angle-right">'+
						                '</i>'+
						                '图片稿'+
						            '</a>'+
						        '</li>'+
						        '<li id="yspg">'+
						            '<a href="yinshipingao.html">'+
						                '<i class="icon-double-angle-right">'+
						                '</i>'+
						                '音视频稿'+
						            '</a>'+
						        '</li>'+
						        '<li id="dxg">'+
						            '<a href="duanxingao.html">'+
						                '<i class="icon-double-angle-right">'+
						                '</i>'+
						                '短信稿'+
						            '</a>'+
						        '</li>'+
						    '</ul>'+
						'</li>'+
						'<li id="wgzy">'+
						    '<a href="waigouziyuan.html" class="dropdown-toggle">'+
						        '<i class="icon-list-alt">'+
						        '</i>'+
						        '<span class="menu-text">'+
						            '外购资源'+
						        '</span>'+
						    '</a>'+
						'</li>'+
						'<li id="wsxw">'+
						    '<a href="onlinenews.html">'+
						        '<i class="icon-globe">'+
						        '</i>'+
						        '<span class="menu-text">'+
						            '网上新闻'+
						        '</span>'+
						    '</a>'+
						'</li>'+
						'<li id="ztgk" class="dropdown">'+
						    '<a data-toggle="dropdown" class="dropdown-toggle" href="#">'+
							    '<i class="icon-list">'+
						        '</i>'+
						        '<span class="menu-text">'+
						            '事件稿库'+
						        '</span>'+
						        '&nbsp;'+
						        '<i class="icon-caret-down bigger-110 width-auto">'+
						        '</i>'+
						    '</a>'+
						    '<ul class="dropdown-menu dropdown-info">'+
								'<li id="lh">'+
									'<a href="lh.html">'+
									'<i class="icon-double-angle-right"></i>'+
										'两会 </a>'+
								'</li>'+
								'<li id="dzh">'+
									'<a href="dzh.html"> <i class="icon-double-angle-right"></i>'+
										'尼泊尔地震 </a>'+
								'</li>'+
								'<li id="ayh">'+
									'<a href="ayh.html"> <i class="icon-double-angle-right"></i> 奥运会 </a>'+
								'</li>'+
								'<li id="yyh">'+
									'<a href="yyh.html"> <i class="icon-double-angle-right"></i> 亚运会 </a>'+
								'</li>'+
								'<li id="sbh">'+
									'<a href="sbh.html"> <i class="icon-double-angle-right"></i> 世博会 </a>'+
								'</li>'+
								'<li id="bjdyj">'+
									'<a href="bjdyj.html"> <i class="icon-double-angle-right"></i> 北京电影节 </a>'+
								'</li>'+
								'<li id="xndyj">'+
									'<a href="xndyj.html"> <i class="icon-double-angle-right"></i> 夏纳电影节 </a>'+
								'</li>'+
							'</ul>'+
						'</li>'+
						'<li id="lssj">'+
						    '<a href="lishishuju.html" class="dropdown-toggle">'+
						        '<i class="icon-edit">'+
						        '</i>'+
						        '<span class="menu-text">'+
						            '历史数据'+
						        '</span>'+
						    '</a>'+
						'</li>'+
						'<li id="gjtj" class="dropdown">'+
						    '<a data-toggle="dropdown" class="dropdown-toggle" href="#">'+
						        '<i class="icon-list">'+
						        '</i>'+
						        '<span class="menu-text">'+
						            '稿件统计'+
						        '</span>'+
						        '&nbsp;'+
						        '<i class="icon-caret-down bigger-110 width-auto">'+
						        '</i>'+
						    '</a>'+
						    '<ul class="dropdown-menu dropdown-info">'+
						        '<li id="lgtj">'+
						            '<a href="tongji.html">'+
						                '<i class="icon-double-angle-right">'+
						                '</i>'+
						                '来稿统计'+
						            '</a>'+
						        '</li>'+
						        '<li id="djtj">'+
						            '<a href="clicktongji.html">'+
						                '<i class="icon-double-angle-right">'+
						                '</i>'+
						                '稿件点击量统计'+
						            '</a>'+
						        '</li>'+
						        '<li id="jstj">'+
						            '<a href="searchtongji.html">'+
						                '<i class="icon-double-angle-right">'+
						                '</i>'+
						                '稿件检索量统计'+
						            '</a>'+
						        '</li>'+
						        '<li id="ltj">'+
						            '<a href="tongji.html">'+
						                '<i class="icon-double-angle-right">'+
						                '</i>'+
						                '稿件量统计'+
						            '</a>'+
						        '</li>'+
						        '<li id="xztj">'+
						            '<a href="downloadtongji.html">'+
						                '<i class="icon-double-angle-right">'+
						                '</i>'+
						                '稿件下载统计'+
						            '</a>'+
						        '</li>'+
						        '<li id="tgtj">'+
						            '<a href="tougaotongji.html">'+
						                '<i class="icon-double-angle-right">'+
						                '</i>'+
						                '记者投稿统计'+
						            '</a>'+
						        '</li>'+
						        '<li id="cytj">'+
						            '<a href="adopttongji.html">'+
						                '<i class="icon-double-angle-right">'+
						                '</i>'+
						                '稿件采用统计'+
						            '</a>'+
						        '</li>'+
						    '</ul>'+
						'</li>'+
					'</ul>';
	
	$("#tabbable").append(menusBlock);
	$("#tabbable li").removeClass("active");
	$(li1).addClass("active");
	$(li2).removeClass("active");
	$(li2).addClass("active");
}

//改变主题的齿轮 （由于目前没有面包屑，面包屑功能隐藏）
function theme (){
	var theme =	'<div class="ace-settings-container" id="ace-settings-container">'+
					'<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">'+
					'<i class="icon-cog bigger-150"></i>'+
				'</div>'+
				'<div class="ace-settings-box" id="ace-settings-box">'+
					'<div>'+
						'<div class="pull-left">'+
							'<select id="skin-colorpicker" class="hide">'+
								'<option data-skin="default" value="#438EB9">#438EB9</option>'+
								'<option data-skin="skin-1" value="#222A2D">#222A2D</option>'+
								'<option data-skin="skin-2" value="#C6487E">#C6487E</option>'+
								'<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>'+
							'</select>'+
						'</div>'+
						'<span>&nbsp; 选择皮肤</span>'+
					'</div>'+
					'<div>'+
						'<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />'+
						'<label class="lbl" for="ace-settings-navbar"> 固定导航条</label>'+
					'</div>'+
					'<div>'+
						'<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />'+
						'<label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>'+
					'</div>'+
					'<div>'+
						'<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />'+
						'<label class="lbl" for="ace-settings-breadcrumbs"> 固定面包屑</label>'+
					'</div>'+
					'<div>'+
						'<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />'+
						'<label class="lbl" for="ace-settings-rtl"> 切换到左边</label>'+
					'</div>'+
					'<div>'+
						'<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />'+
						'<label class="lbl" for="ace-settings-add-container">'+
							' 切换窄屏'+
							'<b></b>'+
						'</label>'+
					'</div>'+
				'</div>'+
				'</div>';
	$("#menusBlock").append(theme);
}

//面包屑
/*
 * home 	: 首页
 * system 	： 投稿平台、稿库、后台管理
 * control 	： 各个管理块
 */
function breadCrumb(home,system,control){
	var breadCrumb =	'<script type="text/javascript">'+
							'try{ace.settings.check("breadcrumbs" , "fixed")}catch(e){}'+
						'</script>'+
						'<ul class="breadcrumb">'+
							'<li>'+
								'<i class="icon-home home-icon"></i>'+
								'<a href="#">'+home+'</a>'+
							'</li>';
	if(system != 0){
		breadCrumb +=		'<li class="active">'+system+'</li>';
	}
	breadCrumb +=			'<li class="active">'+control+'</li>'+
						'</ul>';
	$("#breadcrumbs").append(breadCrumb);
}

//检索块
function searchBlank(){
	var searchBlank ='<div id="accordion" class="accordion-style1 panel-group">'+
						'<div class="panel panel-default" >'+
							'<div id="searchBtn" class="panel-heading">'+
								'<a id="quick" class="btn btn-xs btn-primary" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" onclick="changeBtnColor(\'#quick\',\'#collapseOne\');">'+
									'<i class="icon-angle-right bigger-110" data-icon-hide="icon-angle-down" data-icon-show="icon-angle-right"></i>&nbsp;快速检索'+
								'</a>&nbsp;'+
								'<a id="expert" class="btn btn-xs btn-primary" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" onclick="changeBtnColor(\'#expert\',\'#collapseTwo\');">'+
									'<i class="icon-angle-right bigger-110" data-icon-hide="icon-angle-down" data-icon-show="icon-angle-right"></i>&nbsp;高级检索'+
								'</a>'+
							'</div>'+
							'<div class="panel-collapse collapse" id="collapseOne">'+
								'<div class="panel-body">'+
									'<div id="home2" class="tab-pane in active">'+
										'<div class="row">'+
											'<form class="form-horizontal" role="form">'+
												'<div class="col-xs-12 col-sm-6 col-md-6">'+
													'<div class="form-group no-padding">'+
														'<label class="col-xs-3 col-md-2 no-padding-right" for="form-field-timetype">稿件时间</label>'+
														'<div class="col-xs-9 col-md-2 no-padding" >'+
															'<select id="form-field-timetype" class="form-control">'+
																'<option value="BG" checked="checked">'+
																	'编稿时间'+
																'</option>'+
																'<option value="TG">'+
																	'投稿时间'+
																'</option>'+
																'<option value="XG">'+
																	'选稿时间'+
																'</option>'+
															'</select>'+
														'</div>'+
														'<label class="col-xs-3 col-md-1 control-label padding-right" for="id-date-picker-1">从</label>'+
														'<div class="col-xs-9 col-md-3 no-padding">'+
															'<div class="input-group no-padding">'+
																'<input class="form-control date-picker " placeholder="开始时间" id="id-date-picker-1" type="text" data-date-format="dd-mm-yyyy" />'+
																'<span class="input-group-addon no-padding">'+
																	'<i class="icon-calendar bigger-110 no-padding"></i>'+
																'</span>'+
															'</div>'+
														'</div>'+
														'<label class="col-xs-3 col-md-1 control-label padding-right" for="id-date-picker-2">到</label>'+
														'<div class="col-xs-9 col-md-3 no-padding">'+
															'<div class="input-group">'+
																'<input class="form-control date-picker" placeholder="结束时间" id="id-date-picker-2" type="text" data-date-format="dd-mm-yyyy" />'+
																'<span class="input-group-addon no-padding">'+
																	'<i class="icon-calendar bigger-110 no-padding"></i>'+
																'</span>'+
															'</div>'+
														'</div>'+
													'</div>'+
													'<div class="form-group">'+																
														'<label class="col-xs-3 col-sm-2 col-md-2 padding-right" > 状态 </label>'+
														'<div class="col-xs-9 col-sm-2 col-md-2 no-padding">'+
															'<select id="form-field-select-1" class="form-control">'+
																'<option value="VA" checked="checked">'+
																	'未采用'+
																'</option>'+
																'<option value="WA">'+
																	'已采用'+
																'</option>'+
															'</select>'+
														'</div>'+
														'<label class="col-xs-3 col-sm-2 control-label col-md-2 padding-right" >检索词 </label>'+
														'<div class="col-xs-9 col-sm-6 col-md-6 no-padding">'+
															'<input type="text" id="form-field-1" placeholder="例：新华社" class="col-xs-12 col-sm-12 col-md-12" />'+
														'</div>'+
													'</div>'+
												'</div>'+
												'<div class="col-xs-12 col-sm-6 col-md-6 ">'+
													'<div class="col-xs-12">'+
														'<div class="form-group">'+
															'<label class="col-xs-3 col-md-2 control-label padding-right" for="form-field-select-3"> 类型   : </label>'+
															'<div class="col-xs-9 col-md-10">'+
																'<div class="control-group no-padding">'+
																	'<div class="checkbox col-xs-4 col-md-2 no-padding">'+
																		'<label>'+
																			'<input name="form-field-checkbox" class="ace ace-checkbox-1" type="checkbox" checked="checked"/>'+
																			'<span class="lbl"> 文字</span>'+
																		'</label>'+
																	'</div>'+
																	'<div class="checkbox col-xs-4 col-md-2 no-padding">'+
																		'<label>'+
																			'<input name="form-field-checkbox" class="ace ace-checkbox-1" type="checkbox" checked="checked"/>'+
																			'<span class="lbl"> 图片</span>'+
																		'</label>'+
																	'</div>'+
																	'<div class="checkbox col-xs-4 col-md-2 no-padding">'+
																		'<label>'+
																			'<input name="form-field-checkbox" class="ace ace-checkbox-1" type="checkbox" />'+
																			'<span class="lbl"> 音频</span>'+
																		'</label>'+
																	'</div>'+
																	'<div class="checkbox col-xs-4 col-md-2 no-padding">'+
																		'<label>'+
																			'<input name="form-field-checkbox" class="ace ace-checkbox-1" type="checkbox" />'+
																			'<span class="lbl"> 视频</span>'+
																		'</label>'+
																	'</div>'+
																	'<div class="checkbox col-xs-4 col-md-2 no-padding">'+
																	'<label>'+
																		'<input name="form-field-checkbox" class="ace ace-checkbox-1" type="checkbox" />'+
																		'<span class="lbl"> 综合</span>'+
																	'</label>'+
																	'</div>'+																		
																'</div>'+
															'</div>'+
														'</div>'+
													'</div>'+
													'<div class="col-xs-12">'+
														'<div class="form-group">'+
															'<label class="col-xs-3 col-md-2 control-label" for="form-field-select-2">排序   :</label>'+
															'<div class="col-xs-9 col-md-10">'+
																'<div class="radio no-padding col-xs-6 col-md-3">'+
																	'<label>'+
																		'<input name="form-field-radio" type="radio" class="ace no-padding" checked="checked"/>'+
																		'<span class="lbl no-padding"> 日期倒序</span>'+
																	'</label>'+
																'</div>'+
																'<div class="radio no-padding col-xs-6 col-md-3">'+
																	'<label>'+
																		'<input name="form-field-radio" type="radio" class="ace no-padding" />'+
																		'<span class="lbl no-padding"> 日期正序</span>'+
																	'</label>'+
																'</div>																						'+
																'<div class="radio no-padding col-xs-6 col-md-3">'+
																	'<label>'+
																		'<input name="form-field-radio" type="radio" class="ace no-padding" />'+
																		'<span class="lbl no-padding"> 相关度</span>'+
																	'</label>'+
																'</div>'+
																'<div class="form-group" >'+
																'<button class="btn btn-purple btn-sm pull-right" type="button" onclick="hidesearch(\'#quick\',\'#collapseOne\');">'+
																	'检索'+
																	'<i class="icon-search icon-on-right bigger-110"></i>'+
																'</button>'+
															'</div>'+
															'</div>'+
														'</div>'+
													'</div>'+
												'</div>'+														
											'</form>'+
										'</div>'+
									'</div>'+
								'</div>'+
							'</div>'+
							'<div class="panel-collapse collapse" id="collapseTwo">'+
								'<div class="panel-body">'+
									'<div id="profile2" class="tab-pane">'+
										'<div class="row">'+
											'<form class="form-horizontal" role="form">'+
												'<div class="col-xs-12 col-sm-9 col-md-8">'+
													'<div class="row">'+
														'<div class="col-xs-12 col-sm-6 col-md-6">'+
															'<div class="form-group">'+
																'<label class="col-xs-3 col-sm-3 col-md-3 control-label no-padding-right" for="form-field-11">检索词 </label>'+
																'<div class="col-xs-9 col-sm-9 col-md-9">'+
																	'<input type="text" id="form-field-11" placeholder="例：新华社" class="col-xs-7 col-sm-7 col-md-8" />'+
																	'<label class="col-xs-5 col-md-4 col-sm-5">'+
																		'<input name="form-field-checkbox" class="ace ace-checkbox-2" type="checkbox" />'+
																		'<span class="lbl"> 按字</span>'+
																	'</label>'+
																'</div>'+
															'</div>'+
															'<div class="form-group">'+
																'<label class="col-xs-3 control-label no-padding-right" for="form-field-2">标题</label>'+
																'<div class="col-xs-9">'+
																	'<input type="text" id="form-field-2" placeholder="xx标题" class="col-xs-12" />'+
																'</div>'+
															'</div>'+
															'<div class="form-group">'+
																'<label class="col-xs-3 control-label no-padding-right" for="form-field-3">正文</label>'+
																'<div class="col-xs-9">'+
																	'<input type="text" id="form-field-3" placeholder="xx正文" class="col-xs-12" />'+
																'</div>'+
															'</div>'+
															'<div class="form-group">'+
																'<label class="col-xs-3 control-label no-padding-right" for="form-field-4">稿号</label>'+
																'<div class="col-xs-9">'+
																	'<input type="text" id="form-field-4" placeholder="1074322" class="col-xs-12" />'+
																'</div>'+
															'</div>'+
															'<div class="form-group">'+
																'<label class="col-xs-3 control-label no-padding-right" for="form-field-select-4"> 状态 </label>'+
																'<div class="col-xs-9">'+
																	'<select id="form-field-select-4" class="form-control">'+
																		'<option value="VA" checked="checked">'+
																			'未采用'+
																		'</option>'+
																		'<option value="WA">'+
																			'已采用'+
																		'</option>'+
																	'</select>'+
																'</div>'+
															'</div>'+
															'<div class="form-group">'+
																'<label class="col-xs-3 col-sm-3 col-md-3 control-label no-padding-right" for="form-field-5">版次</label>'+
																'<div class="col-xs-9 col-sm-8 col-md-9">'+
																	'<input type="text" id="form-field-5" placeholder="版次" class="col-xs-12" />'+
																'</div>'+
															'</div>'+
														'</div>'+
														'<div class="col-xs-12 col-sm-6 col-md-6">'+
															'<div class="form-group">'+
																'<label class="col-xs-3 col-sm-4 col-md-3 control-label no-padding-right" for="id-date-picker-3"> 开始时间 </label>'+
																'<div class="col-xs-9 col-sm-8 col-md-9">'+
																	'<div class="input-group">'+
																		'<input class="form-control date-picker" placeholder="稿件开始时间" id="id-date-picker-3" type="text" data-date-format="dd-mm-yyyy" />'+
																		'<span class="input-group-addon">'+
																			'<i class="icon-calendar bigger-110"></i>'+
																		'</span>'+
																	'</div>'+
																'</div>'+
															'</div>'+
															'<div class="form-group">'+
																'<label class="col-xs-3 col-sm-4 col-md-3 control-label no-padding-right" for="id-date-picker-4"> 结束时间 </label>'+
																'<div class="col-xs-9 col-sm-8 col-md-9">'+
																	'<div class="input-group">'+
																		'<input class="form-control date-picker" placeholder="稿件结束时间" id="id-date-picker-4" type="text" data-date-format="dd-mm-yyyy" />'+
																		'<span class="input-group-addon">'+
																			'<i class="icon-calendar bigger-110"></i>'+
																		'</span>'+
																	'</div>'+
																'</div>'+
															'</div>'+
															'<div class="form-group">'+
																'<label class="col-xs-3 col-sm-4 col-md-3 control-label no-padding-right" for="form-field-6">作者 </label>'+
																'<div class="col-xs-9 col-sm-8 col-md-9">'+
																	'<input type="text" id="form-field-6" placeholder="xx作者" class="col-xs-12" />'+
																'</div>'+
															'</div>'+
															'<div class="form-group">'+
																'<label class="col-xs-3 col-sm-4 col-md-3 control-label no-padding-right" for="form-field-7">字数</label>'+
																'<div class="col-xs-9 col-sm-8 col-md-9">'+
																	'<div class="col-xs-5 col-sm-5 col-md-5 no-padding-left ">'+
																		'<input type="text" id="form-field-7" placeholder="下限" class="col-xs-12" />'+
																	'</div>'+
																	'<label class="col-xs-2 col-sm-2 col-md-2 control-label no-padding-right" for="form-field-8">到</label>'+
																	'<div class="col-xs-5 col-sm-5 col-md-5 no-padding-right">'+
																		'<input type="text" id="form-field-8" placeholder="上限" class="col-xs-12" />'+
																	'</div>'+
																'</div>'+
															'</div>'+
															'<div class="form-group">'+
																'<label class="col-xs-3 col-sm-4 col-md-3 control-label no-padding-right" for="form-field-9">稿源 </label>'+
																'<div class="col-xs-9 col-sm-8 col-md-9">'+
																	'<input type="text" id="form-field-9" placeholder="xx稿源" class="col-xs-12" />'+
																'</div>'+
															'</div>'+
															'<div class="form-group">'+
																'<label class="col-xs-3 col-sm-4 col-md-3 control-label no-padding-right" for="form-field-10">专栏</label>'+
																'<div class="col-xs-9 col-sm-8 col-md-9">'+
																	'<input type="text" id="form-field-10" placeholder="专栏" class="col-xs-12" />'+
																'</div>'+
															'</div>'+
														'</div>'+	
													'</div>'+
												'</div>'+
												'<div class="col-xs-12 col-sm-3 col-md-2">'+
													'<div class="form-group style="">'+
														'<label class="col-xs-3 control-label no-padding-right" for="form-field-select-1"> 类型 </label>'+
														'<div class="col-xs-9">'+
															'<div class="control-group">'+
																'<div class="checkbox">'+
																	'<label>'+
																		'<input name="form-field-checkbox" class="ace ace-checkbox-1" type="checkbox" checked="checked"/>'+
																		'<span class="lbl"> 文字</span>'+
																	'</label>'+
																'</div>'+
																'<div class="checkbox">'+
																	'<label>'+
																		'<input name="form-field-checkbox" class="ace ace-checkbox-1" type="checkbox" checked="checked"/>'+
																		'<span class="lbl"> 图片</span>'+
																	'</label>'+
																'</div>'+
																'<div class="checkbox">'+
																	'<label>'+
																		'<input name="form-field-checkbox" class="ace ace-checkbox-1" type="checkbox" />'+
																		'<span class="lbl"> 音频</span>'+
																	'</label>'+
																'</div>'+
																'<div class="checkbox">'+
																	'<label>'+
																		'<input name="form-field-checkbox" class="ace ace-checkbox-1" type="checkbox" />'+
																		'<span class="lbl"> 视频</span>'+
																	'</label>'+
																'</div>'+
																'<div class="checkbox">'+
																	'<label>'+
																		'<input name="form-field-checkbox" class="ace ace-checkbox-1" type="checkbox" />'+
																		'<span class="lbl"> 综合</span>'+
																	'</label>'+
																'</div>'+
															'</div>'+
														'</div>'+
													'</div>'+
												'</div>'+
												'<div class="col-xs-12 col-sm-3 col-md-2">'+
													'<div class="form-group">'+
														'<label class="col-xs-3 control-label no-padding-right" for="form-field-select-1"> 排序 </label>'+
														'<div class="col-xs-9">'+
															'<div class="radio">'+
																'<label>'+
																	'<input name="form-field-radio" type="radio" class="ace" checked="checked"/>'+
																	'<span class="lbl"> 日期倒序</span>'+
																'</label>'+
															'</div>'+
															'<div class="radio">'+
																'<label>'+
																	'<input name="form-field-radio" type="radio" class="ace" />'+
																	'<span class="lbl"> 日期正序</span>'+
																'</label>'+
															'</div>'+
															'<div class="radio">'+
																'<label>'+
																	'<input name="form-field-radio" type="radio" class="ace" />'+
																	'<span class="lbl"> 相关度</span>'+
																'</label>'+
															'</div>'+
														'</div>'+
													'</div>'+
												'</div>'+	
												'<div class="col-md-1 col-md-offset-3">'+
													'<div class="space-14"></div>'+
													'<div class="form-group">'+
														'<button class="btn btn-purple btn-sm" type="button" onclick="hidesearch(\'#expert\',\'#collapseTwo\');">'+
															'检索'+
															'<i class="icon-search icon-on-right bigger-110"></i>'+
														'</button>'+
													'</div>'+
												'</div>'+
											'</form>'+
										'</div>'+
									'</div>'+
								'</div>'+
							'</div>'+
						'</div>'+
					'</div>';
	$("#searchBlank").append(searchBlank);
}

/*
 * 改变按钮颜色(高级检索、快速检索栏)
 * 
 * aid		为当前按钮 id
 * divid	为当前按钮对应div的id
 */
function changeBtnColor(aid,divid){
	var red = "btn-danger";
	var blue = "btn-primary";
	
	if($(divid).hasClass("in")){
		$(aid).removeClass(red);
		$(aid).addClass(blue);
	} else {
		$(aid).removeClass(blue);
		$(aid).addClass(red);
		$("#searchBtn a").not(aid).removeClass(red);
		$("#searchBtn a").not(aid).addClass(blue);
	}
}

/*
 * 隐藏检索框 
 * @param aid       为当前按钮 id
 * @param divid     为当前按钮对应div的id
 * @return
 */
function hidesearch(aid,divid){	
	var red = "btn-danger";
	var blue = "btn-primary";
	
	if($(divid).hasClass("in")){
		$(aid).removeClass(red);
		$(aid).addClass(blue);		
		$(aid).find("i").removeClass("icon-angle-down");
		$(aid).find("i").addClass("icon-angle-right");
	}
	if($(divid).hasClass("in")){
	$(divid).removeClass("panel-collapse in");
	$(divid).addClass("panel-collapse collapse");
	}	
}
