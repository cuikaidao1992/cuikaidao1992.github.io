<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<title>日志管理</title>

		<link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
		<!--Basic Styles-->
		<link href="${ctx}/dep/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${ctx}/dep/css/font-awesome.min.css" rel="stylesheet" />
		<!--Beyond styles-->
		<link href="${ctx}/dep/css/beyond.min.css" rel="stylesheet" />
		<link href="${ctx}/dep/css/demo.min.css" rel="stylesheet" />
		<link href="${ctx}/dep/css/typicons.min.css" rel="stylesheet" />
		<link href="${ctx}/dep/css/animate.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ctx}/home/common/css.css">
		<script type="text/javascript" src="${ctx}/dep/pagings.js"></script>
	</head>

	<body>

		<!-- /Navbar -->
		<!-- Main Container -->
		<div class="main-container container-fluid">
			<!-- Page Container -->
			<!-- Page Sidebar -->
			<!-- /右侧内容 -->
			<div class="page-content">
				<div class="page-container">
					<!-- 面包屑导航 -->
					<div class="page-breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="fa fa-home"></i>
								<a href="index.html">系统配置管理</a>
							</li>
							<li class="active">
								<a href="###">日志管理</a>
							</li>
						</ul>
					</div>
					<!-- /面包屑导航-->
					<!--头部按钮-->
					<div class="page-header position-relative">
						<div class="header-title">
							<h1>
                            	日志管理
                        	</h1>
						</div>
						<!--Header Buttons-->
						<div class="header-buttons">
							<a class="sidebar-toggler" href="#">
								<i class="fa fa-arrows-h"></i>
							</a>
							<a class="refresh" id="refresh-toggler" href="">
								<i class="glyphicon glyphicon-refresh"></i>
							</a>
							<a class="fullscreen" id="fullscreen-toggler" href="#">
								<i class="glyphicon glyphicon-fullscreen"></i>
							</a>
						</div>
						<!--头部按钮end-->
					</div>
					<div class="page-body">
						<div class="row">

							<div class="col-xs-12 col-md-12">

								<div class="tabbable">
									<ul class="nav nav-tabs" id="myTab">
										<li class="active">
											<a id="tab-list" data-toggle="tab" href="#home">
												日志列表
											</a>
										</li>
									</ul>

									<div class="tab-content">
										<div id="home" class="tab-pane in active">
											<div class="table-toolbar">

												<a href="" class="btn btn-darkorange col-padd" id="deleteBatch">
													<i class="fa fa-minus"></i>批量删除
												</a>
											<form action="" method="post" id="hiddens"></form>
											</div>
											<table class="table table-striped table-hover table-bordered" id="bodyHtml">
												<thead>
													<tr role="row">
														<th width="5%">
															<label>
                                                        <input type="checkbox"  id="hvtck" name="id">
                                                        <span class="text" id="dohovertree"></span>
                                                        
                                                    </label>
														</th>
														<th>
															编号 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															IP地址 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															主机名 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															主题<span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															时间<span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															请求方式<span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															请求路径<span class="fa indicator fa-unsorted"></span>
														</th>
														<th width="20%">
															<span class="fa indicator fa-unsorted"></span>
														</th>
													</tr>
												</thead>

												<tbody>
												<form action="" id="userform" method="post">
												<c:forEach items="${pager.list }" var="list">
													<tr>
														<td>
														<label>
                                                        	<input type="checkbox" name="id" value="${list.id }" >
                                                        	<span class="text"></span>
                                                    	</label>
														</td>
														<td><input type="text" class="six" value="${list.id }" disabled="disabled"></td>
														<td><input type="text" class="six" value="${list.remoteAddr }" disabled="disabled"></td>
														<td>
															<input type="text" value="${list.hostName }" class="six" disabled="disabled">
														</td>
														<td><input type="text" class="six" value="${list.createBy }" disabled="disabled"></td>
														<td><input type="text" class="six" value="${list.createTime }" pattern="yyyy-MM-dd" disabled="disabled"></td>
														<td><input type="text" class="six" value="${list.method }" disabled="disabled"></td>
														<td><input type="text" class="six" value="${list.requestUri }" disabled="disabled"></td>
														<td>
															<a href="#" class="btn btn-danger btn-xs removeClass" onclick="deleteSingle(${list.id})"><i class="fa fa-trash-o"></i> 删除</a>
														</td>
													</tr>
												</c:forEach>
												</form>
												</tbody>
											</table>
												<div class="btn-font dw_page" currentPage="${pager.currentPage}"
								total="${pager.total}" totalPages="${pager.totalPages}"
								pageSize="${pager.pageSize}">
								<div class="zjtm">共${pager.totalPages }页${pager.total }条</div>
								<div class="zjrightb">
									<ul class="pagination pull-right">
										<c:if test="${pager.totalPages == 1 || pager.totalPages == 0}">
											<li class="footable-page-arrow disabled"><a
												data-page="prev" href="javascript:void(0)">上一页</a></li>
											<li class="footable-page active"><a data-page="0"
												href="#">1</a></li>
											<li class="footable-page-arrow disabled"><a
												data-page="next" href="javascript:void(0)">下一页</a></li>
										</c:if>
										<c:if test="${pager.totalPages != 1 && pager.totalPages != 0 }">
											<c:if test="${pager.currentPage == 1}">
												<li class="footable-page-arrow disabled"><a
													data-page="prev" href="javascript:void(0)">上一页</a></li>
												<li class="footable-page active"><a data-page="0"
													href="#">1</a></li>
												<li class="footable-page"><a data-page="1"
													href="javascript:_go(2);">2</a></li>
												<li class="footable-page-arrow"><a data-page="next"
													href="javascript:_next();">下一页</a></li>
											</c:if>
											<c:if
												test="${pager.currentPage != 1 && pager.currentPage != pager.totalPages}">
												<li class="footable-page-arrow"><a data-page="prev"
													href="javascript:_back();">上一页</a></li>
												<li class="footable-page"><a
													data-page="${pager.currentPage-2}"
													href="javascript:_go('${pager.currentPage-1}');">${pager.currentPage-1}</a></li>
												<li class="footable-page active"><a
													data-page="${pager.currentPage-1}" href="#">${pager.currentPage}</a></li>
												<li class="footable-page"><a
													data-page="${pager.currentPage}"
													href="javascript:_go('${pager.currentPage+1}')">${pager.currentPage+1}</a></li>
												<li class="footable-page-arrow"><a data-page="next"
													href="javascript:_next();">下一页</a></li>
											</c:if>
											<c:if test="${ pager.currentPage == pager.totalPages}">
												<li class="footable-page-arrow"><a data-page="prev"
													href="javascript:_back();">上一页</a></li>
												<li class="footable-page"><a
													data-page="${pager.currentPage-2}"
													href="javascript:_go('${pager.currentPage-1}');">${pager.currentPage-1}</a></li>
												<li class="footable-page active"><a
													data-page="${pager.currentPage-1}" href="#">${pager.currentPage}</a></li>
												<li class="footable-page-arrow disabled"><a data-page="next"
													href="javascript:void(0)">下一页</a></li>
											</c:if>
										</c:if>



										<!-- <li class="footable-page-arrow disabled"><a
											data-page="prev" href="javascript:_back();">上一页</a></li>
										<li class="footable-page active"><a data-page="0"
											href="#">1</a></li>
										<li class="footable-page"><a data-page="1" href="#">2</a></li>
										<li class="footable-page-arrow"><a data-page="next"
											href="javascript:_next();">下一页</a></li> -->
									</ul>
								</div>
							</div>
										</div>
										<!-- 新增区域 form -->

									</div>
								</div>
							</div>

						</div>

					</div>

					<P class="bottomfont">© 2016 Angel Health Management Ltd. : 天使健康管理有限公司</P>

				</div>

			</div>
			<!-- /右侧内容 -->

		</div>

		<script src="${ctx}/dep/jquery-2.0.3.min.js"></script>
		<script src="${ctx}/dep/bootstrap.min.js"></script>
		<script src="${ctx}/dep/validation/bootstrapValidator.js"></script>
		<script src="${ctx}/dep/fuelux/treeview/tree-custom.min.js"></script>
		<script src="${ctx}/home/sysconfig/treeview-init.js"></script>

		<script>
			$(function() {
				$("#registrationForm").bootstrapValidator();
				$("#editForm").bootstrapValidator();
				UITree.init();
				$(".editClass").on('click', function() {
					editClass(this)
				});
				//编辑
				function editClass(_this) {
					$('#tab-edit').show();
					$('#tab-edit').click();
				}
				$(".removeClass").on('click', function() {
					removeClass(this)
				});
				// 删除
				function removeClass(_this) {
					$(_this).parent().parent().remove();
				}
				$('#tab-add,#tab-list').click(function() {
					$('#tab-edit').hide();
				})
			});
			

			function newDepart() {
				$('#tab-add').click();
			}

			$("#hvtck").click(function(){
	    		var eles = document.getElementsByName("id");
	    		for (var i = 1; i < eles.length; i++) {
					eles[i].checked = eles[0].checked;
				}
	    	})
	    	$("#deleteBatch").click(function(){
	    		var ids = $("#userform").serialize();
	    		if(!ids){
	    			alert("请选择要删除的内容");
	    			return false;
	    		}
	    		ids = ids.replace(/id=/g,"");
	    		if(confirm("是否确定删除")){
					$.ajax({
						url : "${ctx}/manager/log/delete",
						type : "POST",
						data : {"ids":ids},
						dataType : "json",
						success : function(data) {
							if (data > 0) {
								alert("删除成功！")
								window.location.href = "${ctx}/manager/log/index";
							} else {
								alert("删除失败！");
								return false;
							}
						}
					});
	    		}
	    	})
	    	function deleteSingle(id){
				if(confirm("是否确定删除")){
					$.ajax({
						url : "${ctx}/manager/log/deleteById",
						type : "POST",
						data : {"id":id},
						dataType : "json",
						success : function(data) {
							if (data > 0) {
								alert("删除成功！")
								window.location.href = "${ctx}/manager/log/index";
							} else {
								alert("删除失败！");
								return false;
							}
						}
					});
	    		}
			}
		</script>

	</body>

</html>