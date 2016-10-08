<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<title>体检库指标项配置</title>
		
		<link rel="stylesheet" href="${ctx}/dep/treeTable/css/jquery.treetable.css" />
		<link rel="stylesheet" href="${ctx}/dep/treeTable/css/jquery.treetable.theme.default.css" />
		
		<link href="${ctx}/dep/moban/css/beyond.min.css" rel="stylesheet" />

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
							<li class="active">
								<a href="#">体检库指标项配置</a>
							</li>
						</ul>
					</div>
					<!-- /面包屑导航-->
					<!--头部按钮-->
					<div class="page-header position-relative">
						<div class="header-title">
							<h1>体检库指标项配置</h1>
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
										<span class="widget-caption">体检库列表</span>
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
										<div class="table-toolbar">
											<div style="display: inline-block;margin-left: 10px;">
												<label class="control-label">体检库：</label>
												<select class="form-control" style="width: 200px;display: inline-block;vertical-align: middle;" id="medical">
													<option value="0">请选择</option>
												</select>
											</div>

											<div style="display: inline-block;margin-left: 10px">
												<label class="control-label">项目名称：</label>
												<select class="form-control" style="width: 200px;display: inline-block;vertical-align: middle;" id="subjects">
													<option value="0">请选择</option>
												</select>
											</div>

											<div style="display: inline-block;margin-left: 10px;">
												<a class="btn btn-blue" href="javascript:searchByParam()"><i class="glyphicon glyphicon-search"></i>搜索</a>
											</div>
											<a href="${ctx}/medicalContent/toAddMedicalContent" class="btn btn-blue">
												<i class="fa fa-plus"></i>新增体检指标
											</a>
										</div>
										<table class="table table-striped table-hover table-bordered" id="bodyHtml">
											<thead>
											<tr>
												<th>
													项目名称 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>
													适宜年龄 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>
													男性参考范围 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>
													女性参考范围 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>
													数据单位 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>
													是否重要 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>
													是否对比 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>
													描述 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th width="20%">
													操作 <span class="fa indicator fa-unsorted"></span>
												</th>
											</tr>
											</thead>

											<tbody>
												
												<c:forEach items="${data}" var="subject">
												
													<tr data-tt-id="${subject.id}">
														<td>${subject.name}</td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td>
															<a href="#" class="btn btn-info btn-xs "><i class="fa fa-edit"></i> 修改</a>
															<a href="#" class="btn btn-danger btn-xs "><i class="fa fa-trash-o"></i> 删除</a>
														</td>
													</tr>
													
													<c:forEach items="${subject.childs}" var="content" varStatus="status">
														<tr data-tt-id="${subject.id}-${content.id}" data-tt-parent-id="${subject.id}">
															<td>${content.name}</td>
															<td>${content.useAgeMin}~${content.useAgeMax}</td>
															<td>${content.scopeManMin}~${content.scopeManMax}</td>
															<td>${content.scopeWomenMin}~${content.scopeWomenMax}</td>
															<td>${content.unit}</td>
															<td>${content.isImportant}</td>
															<td>${content.isCompare}</td>
															<td>${content.descrpiton}</td>
															<td>
																<a href="#" class="btn btn-info btn-xs ">
																	<i class="fa fa-edit"></i> 修改</a>
																<a href="#" class="btn btn-danger btn-xs "><i class="fa fa-trash-o"></i> 删除</a>
															</td>
														</tr>
													</c:forEach>
													
												</c:forEach>
											
											</tbody>
										</table>
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

		
		<script src="${ctx}/dep/treeTable/jquery.treetable.js"></script>
		
		<script src="${ctx}/home/institutions/medical_content.js"></script>

	</body>

</html>