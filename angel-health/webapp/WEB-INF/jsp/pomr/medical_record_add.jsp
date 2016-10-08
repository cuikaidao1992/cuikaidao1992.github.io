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

<title>体检报告服务</title>

<link rel="shortcut icon" href="${ctx}/dep/moban/img/favicon.png"
	type="image/x-icon">

<link href="${ctx}/dep/moban/css/demo.min.css" rel="stylesheet" />
<link href="../../dep/moban/css/typicons.min.css" rel="stylesheet" />
<link href="../../dep/moban/css/animate.min.css" rel="stylesheet" />

<!---->
<link href="${ctx}/dep/moban/css/dataTables.bootstrap.css"
	rel="stylesheet" />
<link rel="stylesheet" href="${ctx}/home/common/css.css">
<link rel="stylesheet"
	href="${ctx}/dep/zTree/css/zTreeStyle/zTreeStyle.css" />
<link rel="stylesheet" href="${ctx}/home/service/service.css" />

<style>
#registrationForm .input-box {
	float: left;
	margin-right: 15px;
}

#registrationForm .file {
	width: 85px;
	height: 80px;
	position: relative;
	display: inline-block;
	background-image: url(${ctx}/dep/img/upload.png);
	overflow: hidden;
	text-decoration: none;
	text-indent: 0;
	line-height: 20px;
	cursor: pointer;
	-webkit-box-shadow: 1px 0 4px 1px rgba(0, 0, 0, .3);
	-moz-box-shadow: 1px 0 4px 1px rgba(0, 0, 0, .3);
	box-shadow: 1px 0 4px 1px rgba(0, 0, 0, .3);
}

#registrationForm  .upload-img {
	background-image: url(${ctx}/dep/img/upload-img.png);
}

#registrationForm .file input {
	width: 85px;
	height: 80px;
	position: absolute;
	font-size: 100px;
	right: 0;
	top: 0;
	opacity: 0;
	cursor: pointer;
}
</style>

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
					<li><i class="fa fa-home"></i> <a href="index.html">首页</a></li>
					<li class="active"><a href="###">健康档案管理</a></li>
					<li class="active">体检报告服务</li>
				</ul>
			</div>
			<!-- /面包屑导航-->
			<!--头部按钮-->
			<div class="page-header position-relative">
				<div class="header-title">
					<h1>体检报告服务</h1>
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
							<div class="widget-header bordered-bottom bordered-lightgray">
								<span class="widget-caption">体检报告上传</span>
								<div class="widget-buttons">
									<a href="#" data-toggle="maximize"> <i class="fa fa-expand"></i>
									</a> <a href="#" data-toggle="collapse"> <i class="fa fa-minus"></i>
									</a> <a href="#" data-toggle="dispose"> <i class="fa fa-times"></i>
									</a>
								</div>
							</div>
							<div class="widget-body" style="overflow: hidden">
								<div class="col-lg-12 col-sm-12 col-xs-12">
									<div class="widget">
										<div class=" bancgud">
											<div id="horizontal-form">
												<div class="formfont">基础信息</div>
												<form class="form-horizontal" role="form" method="post" action="${ctx }/examination/save"
													id="registrationForm"  enctype="multipart/form-data">
													<div class="form-group">
														<label class="col-sm-2 control-label">会员名称<span
															class="help-inline"><font color="red">*</font> </span></label>
														<div class="col-lg-8">
															<input type="text" class="form-control search-box"
																placeholder="会员名称" name="customerNameCheck"
																data-bv-notempty="true"
																data-bv-notempty-message="用户不能为空" value=""
																id="click_customer"> <input type="hidden"
																name="customerId" id="customerId" value="" />
															<div class="name-options" id="SearcherList"
																style="display: none;">
																<ul>
																	<!-- <li><span>张三</span></li>
																	<li><span>张三</span></li>
																	<li><span>张三</span></li>
																	<li><span>张三</span></li>
																	<li><span>张三</span></li>
																	<li><span>张三</span></li> -->
																</ul>
															</div>
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-2 control-label">体检报告上传</label>
														<div class="col-lg-8 upload-file">
															<div class="input-box">
																<a href="javascript:;" class="file"> <input
																	type="file" name="file">
																</a>
															</div>
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-2 control-label">体检报告名称<span
															class="help-inline"><font color="red">*</font> </span></label>
														<div class="col-lg-8">
															<input type="text" class="form-control" name="name"
																data-bv-notempty="true" placeholder="请输入报告名称"
																data-bv-notempty-message="体检报告名称不能为空" />
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-2 control-label">体检报告描述</label>
														<div class="col-lg-8">
															<textarea class="form-control" name="remark" placeholder="请输入描述"></textarea>
														</div>
													</div>


<div
											class="col-sm-8 col-lg-offset-3 col-xs-offset-1 col-md-offset-2 btn-bottm"
											style="padding-top: 25px">
											<button id="tagIdSubmitAddVip_btn" type="submit"
												class=" btn btn-darkorange  col-sm-2 col-xs-offset-3"
												href="#closeCourse" data-toggle="modal">确认</button>
											<button class=" btn btn-active col-sm-2 col-xs-offset-3"
												type="button" onClick="history.go(-1)">取消</button>
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

		</div>

	</div>

	<P class="bottomfont">© 2016 Angel Health Management Ltd. :
		天使健康管理有限公司</P>

	<!-- /右侧内容 -->
	</div>

	</div>

	<!---->
	<script src="${ctx}/dep/moban/js/validation/bootstrapValidator.js"></script>

	<script type="text/javascript">
		$(function() {
			$('.search-box').bind('input propertychange', function() {
				if ($(this).val() != "") {
					$("#SearcherList").show().css({
						width : $(this).width() + 26
					});

				}
			});
			
			$("#click_customer").keyup(function(){
				var user = $(this).val();
				if(user){
				$.ajax({
					url:'${ctx}/customer/findCustomerByUser',
					type:"POST",
					data:{
						user:user
					},
					success : function(data) {
						var html = ""
						$(data).each(function(i){
							html += '<li onclick="liclick(\''+data[i]["id"]+'\',\''+data[i]["name"]+'\')" ><span>姓名：  '+data[i]["name"]+'   手机号：'+data[i]["memPhone"]+'</span></li>';
						}); 
						$("#SearcherList").find("ul").html(html);
					}
				});
				}else{
					$("#SearcherList").hide();
				}
			});
			
			$("#SearcherList li").click(function() {
				$(".search-box").val($(this).find("span").text());
				$("#SearcherList").hide();
			});
			

			$("#registrationForm").bootstrapValidator();
			var str = '<div class="input-box">'
					+ '<a href="javascript:;" class="file">'
					+ '<input type="file" name="">' + '</a> </div>';
			$(".upload-file").on("change", "input[type='file']", function() {
				$(this).parent().addClass("upload-img");
				if ($(".upload-file .upload-img").length >= 3) {
					$(".upload-file").append(str);
				}
			})
		});
		function liclick(id,name){
		 	$("#click_customer").val(name);
			$("#SearcherList").hide();
			$("#customerId").val(id); 
		}
	</script>

</body>

</html>