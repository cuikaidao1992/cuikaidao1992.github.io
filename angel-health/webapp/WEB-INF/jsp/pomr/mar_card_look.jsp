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
<title>新增用药记录服务-查看</title>


<link rel="shortcut icon" href="${ctx }/dep/moban/img/favicon.png"
	type="image/x-icon">

<link rel="stylesheet" type="text/css"
	href="${ctx }/dep/datetimepicker/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="${ctx }/home/card/card.css">

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
						<li class="active"><a href="###">健康档案管理</a></li>
						<li class="active">用药记录服务</li>
					</ul>
				</div>
				<!-- /面包屑导航-->
				<!--头部按钮-->
				<div class="page-header position-relative">
					<div class="header-title">
						<h1>用药记录服务</h1>

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
									<span class="widget-caption">查看用药记录列表</span>
									<div class="widget-buttons">
										<a href="#" data-toggle="maximize"> <i
											class="fa fa-expand"></i>
										</a> <a href="#" data-toggle="collapse"> <i
											class="fa fa-minus"></i>
										</a> <a href="#" data-toggle="dispose"> <i class="fa fa-times"></i>
										</a>
									</div>
								</div>

								<div class="widget-body" style="overflow: hidden">
									<div class="col-lg-12 col-sm-12 col-xs-12">
										<div class="widget">
											<div class=" bancgud">

												<div class="formfont">基础信息</div>
												<form class="form-horizontal" role="form">
													<div class="content">
														<div class="form-group">
															<label for="inputEmail3" class="col-sm-1 control-label ">会员名称<span
																class="help-inline"><font color="red">*</font> </span></label>
															<div class="col-sm-3">
																<input type="text" class="form-control search-box"
																	placeholder="会员名称" name="customerNameCheck" readonly="readonly"
																	value="${list.get(0).get("customerName") }"
																	id="click_customer"> 
															</div>
														</div>
														<c:forEach items="${list }" var="list">
														<div class="form-group">
															<label class="col-md-1 col-sm-1 control-label label_pd">药&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品</label>
															<div class="col-md-3">
																<input class="form-control" type="text" value="${list.get('medicineName') }"
																	disabled="disabled">
															</div>
															<label for="endtime"
																class="col-md-2 control-label label_pd">用药时间</label>
															<div class="col-md-5">
																<input type="text"
																	class="form-control date-picker col-sm-4"
																	value="<fmt:formatDate value="${list.useTime }" type='both'/>" disabled="disabled">
															</div>
														</div>

														<div class="form-group">
															<label class="col-lg-1 col-md-1 control-label label_pd">用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;法</label>
															<div class="col-md-3 col-sm-12 col-xs-12">
																<select class="col-md-5 col-xs-5" disabled="disabled">
																	<option>${list.useMethod }</option>

																</select> <select class="col-md-5 col-xs-5" style="float: right"
																	disabled="disabled">
																	<option>${list.useTimeType }</option>
																</select>
															</div>

															<div class='clearfix'>
																<label class="col-md-2 control-label label_pd">用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量</label>
																<div class="col-md-6 select_special" disabled="disabled">
																	<select disabled="disabled">
																		<option>${list.dosageMethod }</option>
																	</select> <select disabled="disabled">
																		<option>${list.dosageNumber }</option>
																	</select> <span style="width: 5%; display: inline-block"><label>次</label></span>
																	<span style="display: inline-block; text-align: right"><label>每次</label></span>
																	<label class="label_input"><input type="text"
																		class="form-control col-md-2" value="${list.onceDosage }"
																		disabled="disabled"></label> <select
																		disabled="disabled">
																		<option>${list.unit }</option>
																	</select>

																</div>
															</div>


														</div>
														<div class="form-title"></div>
														</c:forEach>


													</div>
											</div>

										</div>

										<div
											class="col-sm-10 col-lg-offset-4 col-xs-offset-2 col-md-offset-2 btn-bottm ">
											<button id="tagIdSubmitAddVip_btn" type="button"
												class=" btn btn-darkorange  col-sm-2 col-xs-offset-3"
												href="#closeCourse" data-toggle="modal"
												onClick="history.go(-1)">返回</button>

										</div>
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
	</div>

	<!-- /右侧内容 -->
	</div>



	<!--Basic Scripts-->
	<script src="../../dep/moban/js/jquery-2.0.3.min.js"></script>
	<script src="../../dep/moban/js/bootstrap.min.js"></script>

	<!--Beyond Scripts-->
	<script src="../../dep/moban/js/beyond.min.js"></script>

	<!---->
	<script src="../../dep/jquery.selectlist.js"></script>
	<script src="../../dep/jquery.bigautocomplete.js"></script>
	<script type="text/javascript"
		src="../../dep/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript"
		src="../../dep/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

	<script>
		$(function() {
			$('.abcselect').selectlist({
				zIndex : 1000,
				width : 190,
				height : 34

			});
		})

		$(function() {

			$("body").on("focus.page", ".date-picker", function() {
				$(this).datetimepicker({
					format : "yyyy-mm-dd",
					minView : 2,
					autoclose : true,
					language : "zh-CN"
				})
			});

			$("#city").click(function(e) {
				SelCity(this, e);
			});
		});
	</script>


	<script type="text/javascript" src="${ctx }/dep/Calendar.js"></script>

</body>

</html>

