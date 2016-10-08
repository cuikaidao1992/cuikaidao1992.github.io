<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ include file="/commons/taglibs.jsp"%>

<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<title>体检套餐</title>
		
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
								<a href="index.html">业务配置管理</a>
							</li>
							<li class="">
								<a href="#">套餐模板配置</a>
							</li>
							<li class="active">
								<a href="#">体检套餐</a>
							</li>
						</ul>
					</div>
					<!-- /面包屑导航-->
					<!--头部按钮-->
					<div class="page-header position-relative">
						<div class="header-title">
							<h1>体检套餐</h1>
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
								<div class="widget">
									<div class="widget-header ">
										<span class="widget-caption">体检套餐列表列表</span>
										<div class="widget-buttons">
											<a href="#" data-toggle="maximize">
												<i class="fa fa-expand"></i>
											</a>
											<a href="#" data-toggle="collapse">
												<i class="fa fa-minus"></i>
											</a>
											<a href="#" data-toggle="dispose">
												<i class="fa fa-times"></i>
											</a>
										</div>
									</div>
									<div class="widget-body">
										<div id="home" class="tab-pane in active">
											<div class="table-toolbar">
												<a href="" class="btn btn-darkorange col-padd">
													<i class="fa fa-minus"></i>批量删除
												</a>
												<a class="btn btn-blue col-padd" href="${ctx}/packages/toAddHealthPackage">
													<i class="fa fa-plus"></i>新增体检套餐
												</a>
												
												<form action="" method="post" id="hiddens">
													<div class="col-sm-2 col-padd">
						                                    <span class="input-icon">
						                                        <input type="text" class="form-control input-sm borderrdu "  placeholder="套餐名称/体检项目" style="border-radius:30px!important;">
						                                        <i class="glyphicon glyphicon-search blue"></i>
						                                    </span>
						                             </div>
					                             </form>
					                             
											</div>
											<table class="table table-striped table-hover table-bordered" id="bodyHtml">
												<thead>
													<tr>
														<th width="5%">
															<label> 
																<input type="checkbox" id="hvtck"> 
																<span class="text" id="dohovertree"> </span>
															</label>
														</th>
														<th>
															体检套餐编号 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															体检套餐名称 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															体检套餐价格 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															体检套餐描述 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th width="20%">
															操作<span class="fa indicator fa-unsorted"></span>
														</th>
													</tr>
												</thead>

												<tbody>
												
												<c:forEach items="${pager.list}" var="fr">
													<tr>
														<td>
															<label> 
																<input type="checkbox" name="myHoverTreechk" value="${fr.id}"> 
																<span class="text"></span>
															</label>
														</td>
														<td>${fr.id}</td>
														<td>${fr.name}</td>
														<td>${fr.price}</td>
														<td>${fr.descrpiton}</td>
														<td>
															<a href="${ctx}/exception/toAddException?from=check&id=${fr.id}" class="btn btn-ck btn-xs edit"><i class="fa fa-folder-open-o"></i> 查看</a>
															<a href="${ctx}/exception/toAddException?from=edit&id=${fr.id}" class="btn btn-info btn-xs editClass"></i> 修改</a>
															<a href="javascript:deletePackage(${fr.id})" class="btn btn-danger btn-xs re	moveClass"><i class="fa fa-trash-o"></i> 删除</a>
														</td>
													</tr>
												</c:forEach>
													
												</tbody>
											</table>
											
											<%@ include file="../def/common_pagebar.jsp" %>
											
										</div>
										<!-- 新增体检库指标项 form -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /右侧内容 -->
		</div>

	</body>

</html>