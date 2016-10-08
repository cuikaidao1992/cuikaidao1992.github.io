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
<title>体检机构配置</title>

<link rel="shortcut icon" href="${ctx}/dep/img/favicon.png"
	type="image/x-icon">

<!--Basic Styles-->
<link href="${ctx}/dep/moban/css/bootstrap.min.css" rel="stylesheet" />
<link id="bootstrap-rtl-link" href="" rel="stylesheet" />
<link href="${ctx}/dep/moban/css/font-awesome.min.css" rel="stylesheet" />
<link href="${ctx}/dep/moban/css/weather-icons.min.css" rel="stylesheet" />

<!--Fonts-->


<!--Beyond styles-->
<link id="beyond-link" href="${ctx}/dep/moban/css/beyond.min.css"
	rel="stylesheet" />

<link href="${ctx}/dep/moban/css/typicons.min.css" rel="stylesheet" />
<link href="${ctx}/dep/moban/css/animate.min.css" rel="stylesheet" />
<link id="skin-link" href="" rel="stylesheet" type="text/css" />

<!--Page Related styles-->
<link href="${ctx}/dep/moban/css/dataTables.bootstrap.css"
	rel="stylesheet" />


<link rel="stylesheet" href="${ctx}/home/common/css.css">
<!--<script src="${ctx}/dep/skins.min.js"></script>-->


</head>

<body>

	<!-- 导航 -->

	<!-- /Navbar -->
	<!-- Main Container -->
	<div class="main-container container-fluid">
		<!-- Page Container -->
		<div class="page-container">

			<!-- /右侧内容 -->

			<div class="page-content">
				<!-- 面包屑导航 -->
				<div class="page-breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="fa fa-home"></i> <a href="index.html">首页</a></li>
						<li class="active"><a href="###">业务配置管理</a></li>
						<li class="active">体检库配置</li>
					</ul>
				</div>
				<!-- /面包屑导航-->
				<!--头部按钮-->
				<div class="page-header position-relative">
					<div class="header-title">
						<h1>体检库配置</h1>

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
								<div class="widget-header ">
									<span class="widget-caption">体检库列表</span>
									<div class="widget-buttons">
										<a href="#" data-toggle="maximize"> <i
											class="fa fa-expand"></i>
										</a> <a href="#" data-toggle="collapse"> <i
											class="fa fa-minus"></i>
										</a> <a href="#" data-toggle="dispose"> <i class="fa fa-times"></i>
										</a>
									</div>
								</div>
								<div class="widget-body">
									<div class="table-toolbar">

										<a href="${ctx}/medical/toAddMedical"
											class="btn btn-blue col-padd"> <i class="fa fa-plus"></i>新增体检库
										</a>
										
										<a href="${ctx}/subjects/toAddSubjects" class="btn btn-blue col-padd"  >
                                            <i class="fa fa-plus"></i>新增体检项
                                        </a>
										
										<form action="" method="post" id="hiddens">
											<div class="col-sm-2 col-padd">
                                                <span class="input-icon">
                                                    <input name="searchVal" placeholder="体检库名称/体检机构名称" name="params"  type="text" class="form-control input-sm borderrdu "  style="border-radius:30px!important;">
                                                    <i class="glyphicon glyphicon-search blue"></i>
                                                </span>
                                          </div>
										</form>

									</div>
									<table class="table table-striped table-hover table-bordered"
										id="bodyHtml">
										<thead>
											<tr role="row">
												<th width="8%">体检库名称 <span
													class="fa indicator fa-unsorted"></span>
												</th>
												<th width="14%">体检机构名称 <span
													class="fa indicator fa-unsorted"></span>
												</th>
												<th width="14%">体检库描述 <span
													class="fa indicator fa-unsorted"></span>
												</th>
												<th width="23%">操作 <span
													class="fa indicator fa-unsorted"></span>
												</th>
											</tr>
										</thead>

										<tbody>

											<c:forEach items="${pager.list}" var="fr">
												<tr>
													<td width="10%">${fr.name}</td>
													<td width="20%">${fr.institutionsName}</td>
													<td width="10%">${fr.descrpiton}</td>

													<td width="25%"><a href="${ctx}/medical/toAddMedical?from=check&id=${fr.id}"
														class="btn btn-ck btn-xs edit"><i
															class="fa fa-folder-open-o"></i> 查看</a> 
														<a href="${ctx}/medical/toAddMedical?from=edit&id=${fr.id}" class="btn btn-info btn-xs edit">
														<i class="fa fa-pencil"></i> 修改</a> 
													</td>
												</tr>

											</c:forEach>

										</tbody>
									</table>
									
									 <%@ include file="../def/common_pagebar.jsp" %>

									<%-- <div class="btn-font">
										<div class="zjtm">共${data.total}个条目</div>
										<div class="zjrightb">
											<ul class="pagination pull-right">
												<li class="footable-page-arrow <c:if test="${data.currentPage==1}">disabled</c:if>"><a
													data-page="first" href="${ctx}/medical/organization?currentPage=1&searchParam=${searchParam}">«</a></li>
												<li class="footable-page-arrow  <c:if test="${data.currentPage==1}">disabled</c:if>">
												<a data-page="prev" href="${ctx}/medical/organization?currentPage=${data.currentPage-1}&searchParam=${searchParam}">上一页</a></li>
												<c:forEach begin="1" end="${data.totalPages}" step="1"
													var="page" varStatus="status">
													<li
														class="footable-page <c:if test="${status.last}">active</c:if>"><a
														data-page="${page-1}" href="#">${page}</a></li>
												</c:forEach>
												<li class="footable-page-arrow <c:if test="${data.currentPage==data.totalPages}">disabled</c:if>">
												<a data-page="next" href="${ctx}/medical/organization?currentPage=${data.currentPage+1}&searchParam=${searchParam}">下一页</a></li>
												<li class="footable-page-arrow <c:if test="${data.currentPage==data.totalPages}">disabled</c:if>"><a data-page="last"
													href="${ctx}/medical/organization?currentPage=${data.totalPages}&searchParam=${searchParam}">»</a></li>
											</ul>
										</div>
									</div> --%>

								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
			<!-- /右侧内容 -->
		</div>

	</div>


	<script src="${ctx}/dep/moban/js/jquery-2.0.3.min.js"></script>
	<script src="${ctx}/dep/moban/js/bootstrap.min.js"></script>

	<script src="${ctx}/dep/moban/js/beyond.min.js"></script>

	<!--<script src="${ctx}/dep/datatable/jquery.dataTables.min.js"></script>-->



	<script>
		$(function() {
			//编辑
			function editClass(_this) {
				if ($(_this).html() == "编辑") {
					$(_this).parent().parent().find(".time-input").hide();
					$(_this).parent().parent().find(".time-select").show();
					$(_this).html("完成");
					$(_this).parent().parent().find("input").removeAttr(
							"disabled");
				} else {
					$(_this).parent().parent().find(".time-input").show();
					$(_this).parent().parent().find(".time-select").hide();
					$(_this).html("编辑");
					$(_this).parent().parent().find("input").attr("disabled",
							true);
				}
			}
			// 删除
			function removeClass(_this) {
				$(_this).parent().parent().remove();
			}

			$(".editClass").on('click', function() {
				editClass(this)
			});

			$(".removeClass").on('click', function() {
				removeClass(this)
			});

		});
		window.onload = function() {
			var checkboxs = document.getElementsByName("myHove" + "rTreechk");
			var hvtck = document.getElementById("hvtck");
			cklen = checkboxs.length;
			hvtck.onclick = function() {
				if (this.checked == true) {
					for (var i = 0; i < cklen; i++) {
						checkboxs[i].checked = true;
					}
					document.getElementById("dohovert" + "ree").innerHTML = ""
				} else {
					for (var i = 0; i < cklen; i++) {
						checkboxs[i].checked = false;
					}
					document.getElementById("dohovertree").innerHTML = ""
				}
			}
		}
	</script>


</body>

</html>
