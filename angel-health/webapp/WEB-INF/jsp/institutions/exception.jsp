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

<title>异常库配置</title>

<link rel="stylesheet" href="${ctx}/home/service/service.css" />

</head>

<body>
	<!-- Main Container -->
	<div class="main-container container-fluid">
		<!-- Page Container -->
		<div class="page-container page-content">
			<!-- Page Sidebar -->
			<!-- 面包屑导航 -->
			<div class="page-breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="fa fa-home"></i> <a href="index.html">业务配置管理</a>
					</li>
					<li class="active"><a href="###">异常库配置</a></li>
				</ul>
			</div>
			<!-- /面包屑导航-->
			<!--头部按钮-->
			<div class="page-header position-relative">
				<div class="header-title">
					<h1>异常库配置</h1>
				</div>
				<!--Header Buttons-->
				<div class="header-buttons">
					<a class="sidebar-toggler" href="#"> <i class="fa fa-arrows-h"></i>
					</a> <a class="refresh" id="refresh-toggler" href=""> <i
						class="glyphicon glyphicon-refresh"></i>
					</a> <a class="fullscreen" id="fullscreen-toggler" href="#"> <i
						class="glyphicon glyphicon-fullscreen"></i>
					</a>
				</div>
				<!--头部按钮end-->
			</div>
			<div class="page-body">
				<div class="row">

					<div class="col-xs-12 col-md-12">

						<div class="widget">
							<div class="widget-header">
								<span class="widget-caption">异常库列表</span>
								<div class="widget-buttons">
									<a href="#" data-toggle="maximize"> <i class="fa fa-expand"></i>
									</a> <a href="#" data-toggle="collapse"> <i class="fa fa-minus"></i>
									</a> <a href="#" data-toggle="dispose"> <i class="fa fa-times"></i>
									</a>
								</div>
								<!--Widget Buttons-->
							</div>
							<!--Widget Header-->
							<div class="widget-body">
							
								<div id="home" class="tab-pane in active">
									
									<div class="table-toolbar">
										<a href="javascript:deleteBatch()" class="btn btn-darkorange col-padd"> <i class="fa fa-minus"></i>批量删除 </a> 
										<a href="${ctx}/exception/toAddException" class="btn btn-blue col-padd"> <i class="fa fa-plus"></i>新增异常库</a>
										
										<form action="" method="post" id="hiddens">
											<div class="col-sm-2 col-padd">
                                                <span class="input-icon">
                                                    <input name="searchVal" placeholder="异常库名称" name="params"  type="text" class="form-control input-sm borderrdu "  style="border-radius:30px!important;">
                                                    <i class="glyphicon glyphicon-search blue"></i>
                                                </span>
                                          </div>
										</form>
									
									</div>
									
									<table class="table table-striped table-hover table-bordered" >
										<thead>
											<tr role="row">
												<th width="5%"><label> <input type="checkbox"
														id="hvtck"> <span class="text" id="dohovertree"></span>

												</label></th>
												<th>异常名称 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>显示类型 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>重要性 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>推荐科室 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>建议时间 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>推荐项目 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>所属系统 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>性别 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th width="20%">操作<span class="fa indicator fa-unsorted"></span>
												</th>
											</tr>
										</thead>

										<tbody>
										
										<c:forEach items="${pager.list}" var="fr">
											<tr>
												<td><label> <input type="checkbox"
														name="myHoverTreechk" value="${fr.id}"> <span class="text"></span>
												</label></td>
												<td>${fr.name}</td>
												<td></td>
												<td>
													<c:choose>
														<c:when test="${fr.importance==0}">
															不重要
														</c:when>
														<c:when test="${fr.importance==1}">
															一般
														</c:when>
														<c:when test="${fr.importance==2}">
															重要
														</c:when>
													</c:choose>
												</td>
												<td>${fr.departmentName}</td>
												<td> <fmt:formatDate value="${fr.adviceTime}" pattern="yyyy年MM月dd日 "/>  </td>
												<td>${fr.adviceProjectName}</td>
												<td>${fr.belongSysName}</td>
												<td>
													<c:choose>
														<c:when test="${fr.sex==0}">
															不限
														</c:when>
														<c:when test="${fr.sex==1}">
															男
														</c:when>
														<c:when test="${fr.sex==2}">
															女
														</c:when>
													</c:choose>
												</td>
												<td>
													<a href="${ctx}/packages/toAddHealthPackage?from=check&id=${fr.id}" class="btn btn-ck btn-xs edit"><i class="fa fa-folder-open-o"></i> 查看</a>
													<a href="${ctx}/packages/toAddHealthPackage?from=edit&id=${fr.id}" class="btn btn-info btn-xs">修改</a> 
													<a href="javascript:deleteException(${fr.id})" class="btn btn-danger btn-xs removeClass"><i class="fa fa-trash-o"></i> 删除</a>
												</td>
											</tr>
										</c:forEach>

										</tbody>
									</table>
									
									<%@ include file="../def/common_pagebar.jsp" %>

								</div>

							</div>
							<!--Widget Body-->
						</div>

					</div>

				</div>

			</div>

			<P class="bottomfont">© 2016 Angel Health Management Ltd. : 天使健康管理有限公司</P>
		</div>

	</div>
	<script type="text/javascript" src="${ctx}/home/institutions/exception_list.js"></script>

</body>

</html>