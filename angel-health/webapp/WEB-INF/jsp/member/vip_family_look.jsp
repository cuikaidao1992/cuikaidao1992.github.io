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
<title>新增家庭</title>
<link id="bootstrap-rtl-link" href="" rel="stylesheet" />

<link rel="stylesheet" type="text/css"
	href="${ctx }/dep/datetimepicker/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/dep/css/jquery.bigautocomplete.css" />
<link rel="stylesheet" href="${ctx }/home/common/css.css">
<link rel="stylesheet" type="text/css" href="${ctx }/home/member/zj_style.css"/>
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
							<span class="widget-caption">查看家庭内容</span>
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
										<c:if test="${k=='1' }">
											<c:set var="ck" value="disabled"></c:set> 
										</c:if>
										<div class="formfont">基础信息</div>
										<form action="${ctx }/family/update" method="post" class="form-horizontal form-bordered" role="form"
											id="memberForm">
											<input name="id" value="${re.id }" hidden />
											<input id="familyPeople" hidden name="familyPeople" />
											<div class="form-group formbdcenb">
												<label for="inputPassword3"
													class="col-sm-2 control-label no-padding-right">家庭名称<span
													class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-8">
													<input type="text" class="form-control fl"
														${ck } placeholder="请输入家庭名称" name="name" value="${re.name }">
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label">会员名称<span
													class="help-inline"><font color="red">*</font></span></label>
												<div class="col-lg-8">
													<input id="masterId" name="masterId" value="${re.masterId }" hidden /> <input
														type="text" id="masterName"
														class="form-control search-box" placeholder="输入会员名称/手机号检索"
														name="masterName" data-bv-notempty="true" value="${re.masterName }" ${ck }
														data-bv-notempty-message="会员名称不能为空">
													<div class="name-options" id="SearcherList"
														style="display: none;">
														<ul id="searchul">
															
														</ul>
													</div>
												</div>
											</div>
											
	
											<div class="form-group formbdcenb">
													<label for="inputPassword3" class="col-sm-2 control-label no-padding-right">家庭成员</label>
													<div class="col-sm-6 add_family">
													<c:forEach items="${familyPeople }" var="bean" varStatus="i">
														
													
          												<div class="form-group" style="overflow:hidden;padding-top:0px">
          													<div class="col-sm-3"><input id="key${i.index }" type="text" class="form-control" value="${bean.key}" ${ck }></div>
          													<div class="col-sm-8"><input id="val${i.index }" type="text" class="form-control" value="${bean.value}" ${ck }></div>
          												</div>
          												</c:forEach>
          											</div>
											</div>
											<div class="form-group">
												<label for="inputPassword3"
													class="col-sm-2 control-label no-padding-right">联系电话<span
													class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-8">
													<input type="text" name="phone" class="form-control fl"
														${ck } placeholder="请输入联系电话"
														value="${re.phone }">

												</div>
											</div>
											<div class="form-group">
												<label for="inputPassword3"
													class="col-sm-2 control-label no-padding-right">家庭描述</label>
												<div class="col-sm-8">
													<textarea ${ck } name="memo" class="dc_text">${re.memo }</textarea>
												</div>
											</div>
									</div>

									<div class="col-sm-8  col-xs-offset-2 btn-bottm" style="padding-top:25px">
										<c:if test="${k ne '1' }">
											<button id="tagIdSubmitAddVip_btn" type="button" onclick="submitclick()"  class=" btn btn-darkorange  col-sm-2 col-xs-offset-3" href="#closeCourse" data-toggle="modal">保存</button>
											<a style="margin-left: 10px;" class=" btn btn-active col-sm-2" type="button" href="${ctx }/family/index">取消</a>
											<button id="sb"  type="submit" style="display: none;"
													class=" btn btn-darkorange  col-sm-2 col-xs-offset-3"
													href="#closeCourse" ></button>
										</c:if>
										<c:if test="${k eq '1' }">
											<button id="tagIdSubmitAddVip_btn" type="submit" class=" btn btn-darkorange  col-sm-2 col-xs-offset-3" href="#closeCourse" onClick="window.history.back(-1)" data-toggle="modal">返回</button>
										</c:if>
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


	<!--
 	作者：821516815@qq.com
 	时间：2016-09-21
 	描述：通用
     -->

	<script src="${ctx }/dep/jquery.bigautocomplete.js"></script>
	<script src="${ctx }/dep/moban/js/select2/select2.js"></script>
	<script src="${ctx }/dep/validation/bootstrapValidator.js"></script>
	<script type="text/javascript"
		src="${ctx }/dep/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript"
		src="${ctx }/dep/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="${ctx}/home/member/vip_family_look.js"></script>
	<script src="${ctx }/dep/moban/js/toastr/toastr.js"></script>

</body>
</html>

