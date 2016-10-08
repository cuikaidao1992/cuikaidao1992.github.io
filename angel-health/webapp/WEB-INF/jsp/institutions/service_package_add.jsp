<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ include file="/commons/taglibs.jsp"%>

<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<title>服务套餐</title>

		<link rel="stylesheet" href="${ctx}/dep/zTreeStyle/zTreeStyle.min.css" />
		
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
								<a href="#">服务套餐</a>
							</li>
						</ul>
					</div>
					<!-- /面包屑导航-->
					<!--头部按钮-->
					<div class="page-header position-relative">
						<div class="header-title">
							<h1>
                            	服务套餐
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
								<div class="widget">
									<div class="widget-header ">
										<span class="widget-caption">服务套餐列表</span>
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
										<div id="profile" class="tab-pane">
										
										<input id="from" value="${from}"  style="display: none"/>
										
											<form id="registrationForm" method="post" class="form-horizontal clearfix" onsubmit="return validateForm()">
											
											<input value="${data.id}" type="text" name="id" style="display: none"/>
											
													<div class="bancgud">
														<div class="form-group">
															<label class="col-lg-2 control-label">服务套餐名称<span class="help-inline"><font color="red">*</font></span></label>
															<div class="col-lg-8">
																<input type="text" name="name" value="${data.name}" class="form-control" data-bv-notempty="true" data-bv-notempty-message="套餐名称不能为空" />
															</div>
														</div>
														
														<div class="form-group">
															<label class="col-lg-2 control-label">体检库</label>
															<div class="col-lg-8">
																<select name="institutionsId" class="form-control" style="width: 200px;display: inline-block;vertical-align: middle;" id="medical">
																	<option value="0">请选择</option>
																</select>
															</div>
														</div>

														<div class="form-group">
															<label class="col-lg-2 control-label">服务套餐体检项目</label>

															<div class=" col-lg-8">
																<ul id="treeDemo" style="height: 300px;width: 80%;border: 1px dashed #d5d5d5;" class="ztree"></ul>
															</div>

														</div>
														
														<div class="form-group">
															<label class="col-lg-2 control-label">服务套餐内容</label>
															<div class="col-lg-8">
																<textarea class="form-control" name="serviceContent" rows="3">${data.serviceContent}</textarea>
															</div>
														</div>

														<div class="form-group">
															<label class="col-lg-2 control-label">服务套餐周期(月)<span class="help-inline"><font color="red">*</font></span></label>
															<div class="col-lg-8">
																<input name="cycle" value="${data.cycle}" type="number" class="form-control" />
															</div>
														</div>

														<div class="form-group">
															<label class="col-lg-2 control-label">服务套餐价格<span class="help-inline"><font color="red">*</font></span></label>
															<div class="col-lg-8">
																<input type="text" name="price" value="${data.price}" class="form-control" data-bv-notempty="true" data-bv-notempty-message="套餐价格不能为空" />
															</div>
														</div>

														<div class="form-group">
															<label class="col-lg-2 control-label">服务套餐描述</label>
															<div class="col-lg-8">
																<textarea class="form-control" name="description" rows="3">${data.description}</textarea>
															</div>
														</div>
													</div>
													<div class="col-sm-8  col-xs-offset-4 btn-bottm" style="padding-top: 25px">
														<input type="submit" class=" btn btn-darkorange col-sm-2" value="确认"/>
														<a class=" btn btn-active col-sm-2 col-xs-offset-2" type="button" href="${ctx}/servicePackages/servicePackage">取消</a>
													</div>
												</form>
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>

				</div>

			</div>
			<!-- /右侧内容 -->

		</div>

		<script src="${ctx}/dep/zTreeStyle/jquery.ztree.all.min.js"></script>
		
		<script src="${ctx}/home/institutions/service_package_add.js"></script>
		
	</body>

</html>