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
<title>新增会员</title>

<link href="${ctx }/dep/css/cropper.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/dep/datetimepicker/css/bootstrap-datetimepicker.css" />

<link rel="stylesheet" href="${ctx }/home/common/css.css">
<link rel="stylesheet" type="text/css"
	href="${ctx }/home/member/zj_style.css" />

</head>

<body>

	<div class="page-content">
		<!-- 面包屑导航 -->
		<div class="page-breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="fa fa-home"></i> <a href="index.html">首页</a></li>
				<li class="active"><a href="###">会员信息管理</a></li>
				<li class="active">会员信息服务</li>
			</ul>
		</div>
		<!-- /面包屑导航-->
		<!--头部按钮-->
		<div class="page-header position-relative">
			<div class="header-title">
				<h1>会员信息服务</h1>
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
							<span class="widget-caption">新增会员信表单</span>
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
									<div class="bancgud">
										<div class="formfont">基础信息</div>
										<form action="${ctx }/customer/addCustomer" class="form-horizontal form-bordered" method="post" id="registrationForm">
											<input type="text" hidden name="appendAddress" id="appendAddress" />
											<div class="row">
												<div class="col-lg-8 col-sm-8 col-xs-8">
													<div class="widget">
														<!--row-->
														<div class="row">
															<div class="col-lg-6 col-sm-6 col-xs-6 ">
																<div class="form-group hypading">
																	<label for="inputPassword3"
																		class="col-sm-3 control-label no-padding-right">会员姓名<span
																		class="help-inline"><font color="red">*</font>
																	</span></label>
																	<div class="col-sm-9">
																		<input type="text" class="form-control"
																			id="inputEmail3" name="name" placeholder="请输入会员姓名"
																			data-bv-notempty="true"
																			data-bv-notempty-message="会员姓名不能为空">
																	</div>
																</div>
															</div>
															<div class="col-lg-6 col-sm-6 col-xs-6 "></div>

														</div>
														<div class="row">
															<div class="col-lg-6 col-sm-6 col-xs-6 ">
																<div class="form-group hypading">
																	<label class="col-sm-3 control-label no-padding-right">性别<span
																		class="help-inline"><font color="red">*</font>
																	</span></label>
																	<div class="col-sm-9 collabe">
																		<label class="labletab "> <input type="radio"
																			name="sex" value="1" checked> <span
																			class="text"> 男</span>
																		</label> <label class="labletab"> <input type="radio"
																			name="sex" value="2"> <span class="text">女</span>
																		</label> <label class="labletab"> <input type="radio"
																			name="sex" value="0"> <span class="text">其他</span>
																		</label>
																	</div>
																</div>
															</div>
															<div class="col-lg-6 col-sm-6 col-xs-6 ">
																<div class="form-group hypading">
																	<label class="col-sm-3 control-label no-padding-right">婚姻状况<span
																		class="help-inline"><font color="red">*</font>
																	</span></label>
																	<div class="col-sm-9 collabe">
																		<label class="labletab "> <input type="radio"
																			name="marry" checked value="1"> <span
																			class="text">已婚</span>
																		</label> <label class="labletab"> <input type="radio"
																			name="marry" value="2"> <span class="text">未婚</span>
																		</label> <label class="labletab"> <input type="radio"
																			name="marry" value="3"> <span class="text">离异</span>
																		</label> <label class="labletab"> <input type="radio"
																			name="marry" value="4"> <span class="text">丧偶</span>
																		</label> <label class="labletab"> <input type="radio"
																			name="marry" value="5"> <span class="text">其他</span>
																		</label>
																	</div>
																</div>
															</div>
														</div>
														<div class="row">

															<div class="col-lg-6 col-sm-6 col-xs-6">
																<div class="form-group hypading">
																	<label for="inputPassword3"
																		class="col-sm-3 control-label no-padding-right">出生日期</label>
																	<label class="col-sm-9">
																		<div>
																			<div class="input-group">
																				<input class="form-control date-picker"
																					name="birthday" id="id-date-picker-1" type="text"
																					data-date-format="yyyy-mm-dd" value="2016-5-30">
																				<span class="input-group-addon"> <i
																					class="fa fa-calendar"></i>
																				</span>
																			</div>
																		</div>
																	</label>
																</div>
															</div>
															<div class="col-lg-6 col-sm-6 col-xs-6 ">
																<div class="form-group hypading">
																	<label for="inputEmail3"
																		class="col-sm-3 control-label no-padding-right">手机号<span
																		class="help-inline"><font color="red">*</font>
																	</span></label>
																	<div class="col-sm-9">
																		<span class="input-icon icon-right"> <input
																			type="text" class="form-control" name="memPhone">
																			<i class="glyphicon glyphicon-earphone darkpink"></i>
																		</span>
																		<!--<input type="text" class="form-control" id="inputEmail3" placeholder="请输入您的手机号" name="tel" data-bv-notempty="true" data-bv-notempty-message="手机号不能为空">-->
																	</div>
																</div>
															</div>
														</div>

														<div class="row">
															<div class="col-lg-6 col-sm-6 col-xs-6">
																<div class="form-group hypading">
																	<label for="inputPassword3"
																		class="col-sm-3 control-label no-padding-right">籍<span
																		class="fro-padd">贯</span></label>
																	<div class="col-sm-9">
																		<input type="text" class="form-control" placeholder=""
																			name="place">
																	</div>
																</div>
															</div>
															<div class="col-lg-6 col-sm-6 col-xs-6">
																<div class="form-group hypading">
																	<label for="inputPassword3"
																		class="col-sm-3 control-label no-padding-right">文化程度<span
																		class="help-inline"><font color="red">*</font>
																	</span></label>
																	<div class="col-sm-9">

																		<select tabindex="10" class="form-control"
																			name="highestDegree" data-bv-notempty="true"
																			data-bv-notempty-message="文化程度不能为空">
																			<option value="8">博士</option>
																			<option value="7">研究生以上</option>
																			<option value="6">大学本科</option>
																			<option value="5">大学专科</option>
																			<option value="4">普通高中</option>
																			<option value="3">中等职业</option>
																			<option value="2">初级中学</option>
																			<option value="1">小学</option>
																			<option value="9">其他</option>
																		</select>
																	</div>
																</div>
															</div>
														</div>
														<!--row-->
													</div>
												</div>

												<div
													class="col-lg-2 col-sm-4 col-xs-2 col-lg-offset-1 col-xs-offset-1 col-sm-offset-1">
													<div class="widget">
														<img
															src="${ctx }/home/common/img/avatars/Stephanie-Walter.jpg"
															alt="" class="col-sm-12">
													</div>
												</div>

											</div>
											<!--row over-->
											<div class="widget">
												<!--证件类型-->
												<div class="row">
													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right">证件类型<span
																class="help-inline"><font color="red">*</font> </span></label>
															<div class="col-sm-9">

																<select tabindex="10" class="col-sm-12 form-control"
																	name="certificateType" data-bv-notempty="true"
																	data-bv-notempty-message="证件类型不能为空">
																	<option value="1">身份证</option>
																	<option value="2">护照</option>
																	<option value="3">港澳通行证</option>
																	<option value="4">回乡证</option>
																	<option value="5">港澳身份证</option>
																	<!-- <option value="5">其他</option> -->
																</select>
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4">
														<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right">证件号码<span
																class="help-inline"><font color="red">*</font> </span></label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="inputEmail3"
																	placeholder="请输入您的证件号码" name="cardNumber"
																	data-bv-notempty="true"
																	data-bv-notempty-message="证件号码不能为空">
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4"></div>
												</div>
												<!--证件类型婚姻状况over-->

												<div class="row">
													<div class="col-lg-4 col-sm-4 col-xs-4">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right">IC卡号</label>
															<div class="col-sm-9">
																<input type="text" name="icCardNumber"
																	class="form-control" id="inputEmail3"
																	placeholder="请输入IC卡号">
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right">IC卡标识符</label>
															<div class="col-sm-9">
																<input type="text" name="icIdentifier"
																	class="form-control" id="inputEmail3" placeholder="">
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right">发证机关</label>
															<div class="col-sm-9">
																<input type="text" name="lssuedOffice"
																	class="form-control" id="inputEmail3"
																	placeholder="请输入机关名称">
															</div>
														</div>
													</div>
												</div>
												<!--发证机关ic卡号over-->

												<div class="row">
													<div class="col-xs-12 c-addrss">
														<div class="form-group hypading" style="margin-left: 0;">
															<label class="col-sm-1 no-padding-right d-address">地<span
																class="fro-padd">址</span></label>
															<div class="col-sm-2">
																<select class="form-control" id="s_province"
																	name="province" style="width: 180px;">
																</select>
															</div>
															<div class="col-sm-2">
																<select class="form-control" id="s_city" name="city"
																	style="width: 180px;">
																</select>
															</div>
															<div class="col-sm-2">
																<select id="s_county" class="colsm form-control"
																	name="county" style="width: 180px;"></select>
															</div>
															<div class="col-xs-4">
																<input type="text" class="formstyle form-control "
																 name="detailAddress"	id="inputEmail3" placeholder="请输入具体地址" />
															</div>
														</div>
													</div>

												</div>
												<!--城市地址-->
												<div class="row">
													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right">来源渠道</label>
															<div class="col-sm-9 collabe">
																<label class="labletab "> <input type="radio"
																	name="memberForm" value="0" checked> <span
																	class="text"> 线下录入</span>
																</label> <label class="labletab"> <input type="radio"
																	value="1" name="memberForm"> <span
																	class="text">APP</span>
																</label> <label class="labletab"> <input type="radio"
																	value="2" name="memberForm"> <span
																	class="text">网站</span>
																</label>
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4">
														<div class="form-group"></div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4">
														<div class="form-group"></div>
													</div>
												</div>
												<!--地址over-->

												<div class="formfont hypading">附加信息</div>
												<div class="row">

													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right">会员卡号</label>
															<div class="col-sm-9">
																<input type="input" name="memberCardNumber"
																	class="form-control" placeholder="请输入您的会员卡号">
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4">
														<div class="form-group hypading">
															<label class="col-sm-4 control-label no-padding-right">社保编号</label>
															<div class="col-sm-8">
																<input type="input" name="socialSecurityId"
																	class="form-control" placeholder="请输入您的社保编号">
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading"></div>
													</div>
												</div>

												<!--各种编号-->
												<div class="row">

													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right">紧急联系人</label>
															<div class="col-sm-9">
																<input type="text" name="urgentContacts"
																	class="form-control" id="inputEmail3"
																	placeholder="请输入紧急联系人">
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4">
														<div class="form-group hypading">
															<label class="col-sm-4 control-label no-padding-right">紧急联系人电话</label>
															<div class="col-sm-8">
																<input type="text" name="srgentTel" class="form-control"
																	id="inputEmail3" placeholder="请输入紧急联系人电话">
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading "></div>
													</div>
												</div>
												<!--紧急联系人over-->
												

													
												<div class="form-group  formbdcenb ">
													<label class="col-sm-1 control-label no-padding-right">补充地址</label>
													<div class="col-sm-6 add_family">
														
														<div class="sc_1  aa">
          														<i class="fa fa-plus address"></i>
          														<span>补充新地址</span>
          												</div>
													</div>
												</div>
												<!--血型over-->
												<div class="row">
													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right">村委会名称</label>
															<div class="col-sm-9">
																<input type="text" name="villageName"
																	class="form-control" id="inputEmail3"
																	placeholder="请输入村委会名称">
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right">村委会地址</label>
															<div class="col-sm-9">
																<input type="text" name="villageAddress"
																	class="form-control" id="inputEmail3"
																	placeholder="请输入村委会地址">
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right"
																class="">村委会电话</label>
															<div class="col-sm-9">
																<input type="text" name="villageTel"
																	class="form-control" id="inputEmail3"
																	placeholder="请输入村委会电话">
															</div>
														</div>
													</div>
												</div>
												<!--村委会over-->
											</div>
											<div class="col-sm-8  col-xs-offset-4  btn-bottmb " style="">

												<button onclick="submitclick()" id="" type="button"
													class=" btn btn-darkorange  col-sm-2 ">确认</button>
												
												<button  id="sb" type="submit" style="display: none;"
													class=" btn btn-darkorange  col-sm-2 "></button>
												<button
													class=" btn btn-active col-sm-2 col-xs-offset-2 btn-bottm"
													type="button" onClick="history.go(-1)">取消</button>
											</div>
									</div>
									<!--widget-->


								</div>



							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<script src="${ctx}/home/member/memberinformation_add.js"></script>
	<!--Beyond Scripts-->
	<script src="${ctx }/dep/area.js"></script>


	<script src="${ctx }/dep/moban/js/validation/bootstrapValidator.js"></script>
	<script src="${ctx }/dep/moban/js/datetime/bootstrap-datepicker.js"></script>
	<script src="${ctx }/dep/moban/js/datetime/bootstrap-timepicker.js"></script>
</body>