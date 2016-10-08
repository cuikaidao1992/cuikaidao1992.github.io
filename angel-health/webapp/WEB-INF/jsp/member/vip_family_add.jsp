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
<title>会员信息服务</title>
<link id="bootstrap-rtl-link" href="" rel="stylesheet" />

<link href="${ctx }/dep/moban/css/typicons.min.css" rel="stylesheet" />
<link href="${ctx }/dep/moban/css/animate.min.css" rel="stylesheet" />
<link id="skin-link" href="" rel="stylesheet" type="text/css" />

<!---->
<link href="${ctx }/dep/moban/css/dataTables.bootstrap.css"
	rel="stylesheet" />
<link rel="stylesheet" href="${ctx }/home/common/css.css">

<link rel="stylesheet" href="${ctx }/home/service/service.css" />
<link rel="stylesheet" href="${ctx }/home/service/family.css">




</head>

<body>

	<div class="page-content">
		<!-- 面包屑导航 -->
		<div class="page-breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="fa fa-home"></i> <a href="index.html">首页</a></li>
				<li class="active"><a href="###">会员信息管理</a></li>
				<li class="active">会员家庭服务</li>

			</ul>
		</div>
		<!-- /面包屑导航-->
		<!--头部按钮-->
		<div class="page-header position-relative">
			<div class="header-title">
				<h1>会员家庭服务</h1>

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
							<span class="widget-caption">新增家庭内容</span>
							<div class="widget-buttons">
								<a href="#" data-toggle="maximize"> <i class="fa fa-expand"></i>
								</a> <a href="#" data-toggle="collapse"> <i class="fa fa-minus"></i>
								</a> <a href="#" data-toggle="dispose"> <i class="fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body" style="overflow: hidden">
							<div class="col-lg-12 col-sm-12 col-xs-12 ">
								<div class="widget">
									<div class=" bancgud">

										<div class="formfont">基础信息</div>
										<form action="${ctx }/family/save" method="post"
											class="form-horizontal form-bordered" id="memberForm">
											<input id="familyPeople" hidden name="familyPeople" />
											<div class="form-group formbdcenb">
												<label for="inputPassword3"
													class="col-sm-2 control-label no-padding-right">家庭名称<span
													class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-8">
													<input type="text" class="form-control fl"
														placeholder="请输入家庭名称" name="name" data-bv-notempty="true"
														data-bv-notempty-message="家庭名称不能为空">
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label">会员名称<span
													class="help-inline"><font color="red">*</font></span></label>
												<div class="col-lg-8">
													<input id="masterId" name="masterId" hidden /> <input
														type="text" id="masterName"
														class="form-control search-box" placeholder="输入会员名称/手机号检索"
														name="masterName" data-bv-notempty="true"
														data-bv-notempty-message="会员名称不能为空">
													<div class="name-options" id="SearcherList"
														style="display: none;">
														<ul id="searchul">

														</ul>
													</div>
												</div>
											</div>
											<div class="form-group formbdcenb">
												<label class="col-sm-2 control-label no-padding-right">家庭成员</label>
												<div class="col-sm-6 add_family">

													<div class="adress sc_1  aaa">
														<i class="fa fa-plus idd cunt_1 family_i"></i> <span>添加家庭成员</span>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label for="inputPassword3"
													class="col-sm-2 control-label no-padding-right">家庭联系电话<span
													class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-8">
													<input type="text" class="form-control fl"
														placeholder="请输入家庭联系电话" name="phone"
														data-bv-notempty="true"
														data-bv-notempty-message="家庭联系电话为必填项，不能为空">

												</div>
											</div>
											<div class="form-group">
												<label for="inputPassword3"
													class="col-sm-2 control-label no-padding-right">家庭描述</label>
												<div class="col-sm-8">
													<textarea namme="memo" class="dc_text"></textarea>
												</div>
											</div>


											<div class="col-sm-8  col-xs-offset-2 btn-bottm"
												style="padding-top: 25px">
												<button id="tagIdSubmitAddVip_btn"  type="button" onclick="submitclick()" 
													class=" btn btn-darkorange  col-sm-2 col-xs-offset-3"
													href="#closeCourse" >保存</button>
												<button id="sb"  type="submit" style="display: none;"
													class=" btn btn-darkorange  col-sm-2 col-xs-offset-3"
													href="#closeCourse" ></button>
												<button class=" btn btn-active col-sm-2" type="button"
													onClick="window.history.back(-1)">取消</button>
											</div>
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
	<!-- /右侧内容 -->
	</div>
	</div>

	<script src="${ctx}/dep/jquery.bigautocomplete.js"></script>
	<script src="${ctx}/dep/moban/js/select2/select2.js"></script>
	<script src="${ctx}/dep/validation/bootstrapValidator.js"></script>
	<!-- Private -->
	<script src="${ctx}/home/member/vip_family_add.js"></script>
</body>

</html>
