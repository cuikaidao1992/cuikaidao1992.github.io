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
		<title>新增体检库</title>
		
		<link rel="shortcut icon" href="${ctx}/dep/img/favicon.png" type="image/x-icon">
	
	    <!--Basic Styles-->
	    <link href="${ctx}/dep/moban/css/bootstrap.min.css" rel="stylesheet" />
	    <link id="bootstrap-rtl-link" href="" rel="stylesheet" />
	    <link href="${ctx}/dep/moban/css/font-awesome.min.css" rel="stylesheet" />
	    <link href="${ctx}/dep/moban/css/weather-icons.min.css" rel="stylesheet" />

	    <!--Beyond styles-->
	    <link id="beyond-link" href="${ctx}/dep/moban/css/beyond.min.css" rel="stylesheet" />
	
	    <link href="${ctx}/dep/moban/css/typicons.min.css" rel="stylesheet" />
	    <link href="${ctx}/dep/moban/css/animate.min.css" rel="stylesheet" />
	    <link id="skin-link" href="" rel="stylesheet" type="text/css" />
	
	    <!--Page Related styles-->
	    <link href="${ctx}/dep/moban/css/dataTables.bootstrap.css" rel="stylesheet" />
	    <link rel="stylesheet" type="text/css" href="${ctx}/dep/css/easydropdown.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/dep/datetimepicker/css/bootstrap-datetimepicker.css" />
		
	    <link rel="stylesheet" href="${ctx}/home/common/css.css">
	   <%-- 	<script src="${ctx}/dep/moban/js/skins.min.js"></script> --%>
	</head>
	<body>
		<!-- Main Container -->
		<div class="main-container container-fluid">
			<!-- Page Container -->
			<div class="page-container">
				<!-- Page Sidebar -->
				<!-- /右侧内容 -->
				<div class="page-content">
					<!-- 面包屑导航 -->
					<div class="page-breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="fa fa-home"></i>
								<a href="index.html">首页</a>
							</li>
							<li class="active">
								<a href="#">业务配置管理</a>
							</li>
							<li class="active">
								体检库配置
							</li>

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
										<span class="widget-caption">新增体检库</span>
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

									<div class="widget-body" style="overflow:hidden">
										<div class="col-lg-12 col-sm-12 col-xs-12 ">
											<div class="widget">
											
											<input id="from" value="${from}"  style="display: none"/>
											
											<form class="form-horizontal form-bordered required-validate" id="organizationAddForm"  role="form" onsubmit="return validateOrganizationAddForm(this)">
												<div class="bancgud">
													<div class="formfont">基础信息</div>
														
														<input value="${data.id}" type="text" name="id" style="display: none"/>
														
														<div class="form-group">
															<label class="col-sm-2 control-label no-padding-right">体检库名称<span class="help-inline"><font color="red">*</font> </span></label>
															<div class="col-sm-8">
																<input value="${data.name}" type="text" class="form-control" name="name" placeholder="请输入体检库名称" data-bv-notempty="true"
																	data-bv-notempty-message="体检库名称不能为空！">
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label no-padding-right">体检机构名称<span class="help-inline"><font color="red">*</font> </span></label>
															<div class="col-sm-8">
																<input value="${data.institutionsName}" type="text" class="form-control" name=institutionsName placeholder="请输入体检机构名称" data-bv-notempty="true"
																	data-bv-notempty-message="体检机构名称不能为空！">
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label no-padding-right">加盟商所在区域</label>
															<div class="col-sm-2">
																<select class="form-control" id="s_province" name="sProvince" style="width: 180px;	" >
																	<option value="${sProvince}" selected="selected">${sProvince}</option>		
																</select>
															</div>
															<div class="col-sm-2">
																<select class="form-control" id="s_city" name="sCity" style="width: 180px;">
																	<option value="${sCity}" selected="selected">${sCity}</option>
																</select>
															</div>&nbsp;
															<div class="col-sm-2">
																<select id="s_county" class="colsm form-control" name="sCounty" style="width: 180px;">
																	<option value="${sCounty}" selected="selected">${sCounty}</option>
																</select>
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-8 col-sm-offset-2">
																<input value="${detail}" type="text" class="form-control fl" name="detail" placeholder="请输入具体地址">
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label no-padding-right">体检库描述</label>
															<div class="col-sm-8">
																<textarea name="descrpiton">${data.descrpiton}</textarea>
															</div>
														</div>
												
												</div>

												<div class="col-sm-8  col-xs-offset-3 btn-bottm" style="padding-top:25px">
													<input type="submit" class=" btn btn-darkorange  col-sm-2" value="确认">
													<a class=" btn btn-active col-sm-2 col-xs-offset-3" href="${ctx}/medical/organization">取消</a>
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
		
		    <script src="${ctx}/dep/moban/js/jquery-2.0.3.min.js"></script>
   			<script src="${ctx}/dep/moban/js/bootstrap.min.js"></script>
   			

    		<script src="${ctx}/dep/moban/js/beyond.min.js"></script>
    		
    		<script src="${ctx}/dep/moban/js/validation/bootstrapValidator.js"></script>

			<script type="text/javascript" src="${ctx}/dep/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
			<script type="text/javascript" src="${ctx}/dep/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
			
			<script src="${ctx}/dep/area.js"></script>
			<script type="text/javascript">
				_init_area();
				/* $('#s_province').append('<option value="${sProvince}" selected="selected">${sProvince}</option>');
				$('#s_city').append('<option value="${sProvince}" selected="selected">${sProvince}</option>');
				$('#s_county').append('<option value="${sCounty}" selected="selected">${sCounty}</option>'); */
			</script>
			
			<script type="text/javascript" src="${ctx}/home/institutions/institution.js"></script>
			
	</body>

</html>