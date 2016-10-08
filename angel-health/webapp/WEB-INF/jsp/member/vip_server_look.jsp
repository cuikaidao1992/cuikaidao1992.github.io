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


<title>新增会员预约服务</title>
<!--Basic Styles-->

<link id="bootstrap-rtl-link" href="" rel="stylesheet" />

<link rel="stylesheet" type="text/css"
	href="${ctx}/dep/datetimepicker/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/dep/css/jquery.bigautocomplete.css" />
<link rel="stylesheet" href="${ctx}/home/common/css.css">



</head>

<body>

	<!-- 导航 -->

	<div class="page-content">
		<!-- 面包屑导航 -->
		<div class="page-breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="fa fa-home"></i> <a href="index.html">首页</a></li>
				<li class="active"><a href="###">会员信息挂你</a></li>
				<li class="active">会员预约服务</li>

			</ul>
		</div>
		<!-- /面包屑导航-->
		<!--头部按钮-->
		<div class="page-header position-relative">
			<div class="header-title">
				<h1>会员预约服务</h1>

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
							<span class="widget-caption">会员预约服务列表</span>
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
										<form action="${ctx }/reserve/editReserve" method="post"
											class="form-horizontal form-bordered " role="form"
											id="memberForm">
											<input id="id" name="id" value="${re.id }" hidden />
											<input id="reserveTime" name="reserveTime" value="${re.id }" hidden />
											<input id="packageId" name="packageId" value="${re.packageId }" hidden />
											<input id="servicePackageId" name="servicePackageId" value="${re.servicePackageId }" hidden />
											<div class="form-group">
												<label class="col-sm-2 control-label">会员名称<span
													class="help-inline"><font color="red">*</font></span></label>
												<div class="col-lg-8">
													<input id="masterId" ${re.customerId } name="customerId" hidden /> <input
														type="text" id="masterName"
														class="form-control search-box" ${ck } placeholder="输入会员名称/手机号检索"
														name="masterName" data-bv-notempty="true" value="${re.customerName }"
														data-bv-notempty-message="会员名称不能为空">
													<div class="name-options" id="SearcherList"
														style="display: none;">
														<ul id="searchul">

														</ul>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label no-padding-right">手&nbsp;&nbsp;机&nbsp;&nbsp;号<span
													class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-8">
													<input type="text" class="form-control fl "
														placeholder="请输入手机号" name="memPhone"
														data-bv-notempty="true" ${ck } value="${re.memPhone }"
														data-bv-notempty-message="手机号为必填项，不能为空">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">预约医师<span
													class="help-inline"><font color="red">*</font></span></label>
												<div class="col-lg-8">
													<input id="doctorId" name="doctorId" value="${re.doctorId }" hidden /> <input
														type="text" id="doctorName"
														class="form-control search-box" placeholder="输入医师名称/手机号检索"
														name="doctorName" data-bv-notempty="true" ${ck } value="${re.doctorName }"
														data-bv-notempty-message="医师名称不能为空">
													<div class="name-options" id="docList"
														style="display: none;">
														<ul id="docul">

														</ul>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label no-padding-right">预约时间</label>
												<label class="col-sm-4"> <input type="text" ${ck }
													class="form-control date-picker col-sm-4" id="inputEmail3"
													value="${fn:substring(re.reserveTime, 0, 10)}">
													
												</label> <label class="input-group col-sm-3 col-xs-offset-1">
													<input value="${fn:substring(re.reserveTime, 10, re.reserveTime.length())}" ${ck } class="form-control" id="timepicker1" type="text">
													<span class="input-group-addon"> <i
														class="fa fa-clock-o"></i>
												</span>
												</label>

											</div>
											
											<div class="form-group">
												<label class="col-sm-2 control-label no-padding-right">当前套餐</label>
												<label class="col-sm-8">
                                                       <table class="table table-hover">
                                                       	<thead class="bordered-darkorange">
					                                        <tr>
					                                            <th>套餐名称
					                                            </th>
					                                            <th>套餐金额
					                                            </th>
					                                            <th>套餐內容
					                                            </th>
					                                            <th>套餐項目
					                                            </th>
					                                        </tr>
					                                    </thead>
					                                    <tbody>
				                                        <tr>
				                                            <td>${re.packageName }${re.serviceName }
				                                            </td>
				                                            <td>${re.reservePirce }${re.servicePackagePrice }
				                                            </td>
				                                            <td>${re.reserveContent }${re.pcontent }
				                                            </td>
				                                            <td>${re.reserveRow }${re.prow }
				                                            </td>
				                                        </tr>
				                                        </tbody>
                                                       </table>
												</label> 
												
											</div>
											
											
											
											<div class="form-group radioyes">
												<label class="col-sm-2 control-label no-padding-right">预约套餐</label>
												<div class="radio">
												<c:if test="${re.packageType eq '1' }">
												
													<label class="labletab" style="padding-top: 0px"> <input ${ck }
														name="packageType" value="1" checked type="radio" class="radio_1">
														<span class="text" value="1" >服务套餐</span>
													</label> <label class="col-xs-offset-1 labletab"
														style="padding-top: 0px"> <input ${ck }
														name="packageType" type="radio" value="2" class="radio_2"><span
														class="text">体检套餐</span>
													</label>
												</c:if>
												<c:if test="${re.packageType eq '2' }">
													<label class="labletab" style="padding-top: 0px"> <input ${ck }
														name="packageType" value="1" type="radio" class="radio_1">
														<span class="text" value="1" >服务套餐</span>
													</label> <label class="col-xs-offset-1 labletab"
														style="padding-top: 0px"> <input ${ck } checked
														name="packageType" type="radio" value="2" class="radio_2"><span
														class="text" >体检套餐</span>
													</label>
												</c:if>
												</div>
											</div>

											<div class=" radioa">
												<div
													class=" col-sm-8 formleftb yesradio yesradionoa server server_1">

													<table id="table1"
														class="table table-striped table-bordered table-hover">
														<thead>
															<tr role="row">
																<th></th>
																<th>代码名称 <span class="fa indicator fa-unsorted"></span>
																</th>
																<th>套餐名称 <span class="fa indicator fa-unsorted"></span>
																</th>
																<th>套餐价格 <span class="fa indicator fa-unsorted"></span>
																</th>
																<th >服务内容 <span
																	class="fa indicator fa-unsorted"></span>
																</th>

																<th >体检项目 <span
																	class="fa indicator fa-unsorted"></span>
																</th>
															</tr>
														</thead>
													</table>

												</div>
												<div
													class="col-sm-8  formleftb yesradio nihigth project  server_2">

													<table id="table2"
														class="table table-striped table-bordered table-hover">
														<thead>
															<tr role="row">
																<th width="5%"><label> <input
																		type="checkbox" name="myHoverTreechk"> <span
																		class="text"></span>
																</label></th>
																<th width="10%">代码名称 <span
																	class="fa indicator fa-unsorted"></span>
																</th>
																<th width="200px">套餐名称 <span
																	class="fa indicator fa-unsorted"></span>
																</th>
																<th width="40%" colspan="2">体检项目 <span
																	class="fa indicator fa-unsorted"></span>
																</th>
															</tr>
														</thead>
													</table>

												</div>
											</div>

											<div class="form-group">
												<label for="inputPassword3"
													class="col-sm-2 control-label no-padding-right">支付状态</label>
												<c:if test="${re.payStatus eq '1' }">
													<div class="radio">
													<label> <input name="payStatus" value="1" ${ck }
														type="radio" checked="checked"> <span class="text"
														checked>已支付 &nbsp;&nbsp;</span>
													</label> <label class=""> <input name="payStatus" value="2" ${ck }
														type="radio" class=""> <span class="text">未支付</span>
													</label>
													</div>
												</c:if>
												<c:if test="${re.payStatus eq '2' }">
													<div class="radio">
													<label> <input name="payStatus" value="1" ${ck }
														type="radio" checked="checked"> <span class="text"
														>已支付 &nbsp;&nbsp;</span>
													</label> <label class=""> <input name="payStatus" value="2" ${ck }
														type="radio" checked class=""> <span class="text">未支付</span>
													</label>
													</div>
												</c:if>
												
											</div>
											<div class="form-group pad-butom">
												<label for="inputPassword3"
													class="col-sm-2 control-label no-padding-right">支付渠道</label>

												<div class="radio">
													<c:if test="${re.reserveFrom eq '1' }">
														<label> <input  type="radio" ${ck }
															name="reserveFrom" value="2" > <span
															class="text">线下录入</span>
														</label> <label> <input  ${ck }
															type="radio" value="1" name="reserveFrom" checked class="">
															<span class="text">APP</span>
														</label> <label> <input  ${ck }
															type="radio" value="3" name="reserveFrom" class="">
															<span class="text">网站</span>
														</label>
													</c:if>
													<c:if test="${re.reserveFrom eq '2' }">
														<label> <input  type="radio" ${ck }
														 checked name="reserveFrom" value="2" > <span
															class="text">线下录入</span>
														</label> <label> <input  ${ck }
															type="radio" value="1" name="reserveFrom" class="">
															<span class="text">APP</span>
														</label> <label> <input  ${ck }
															type="radio" value="3" name="reserveFrom" class="">
															<span class="text">网站</span>
														</label>
													</c:if>
													<c:if test="${re.reserveFrom eq '3' }">
														<label> <input  type="radio" ${ck }
															name="reserveFrom" value="2" > <span
															class="text">线下录入</span>
														</label> <label> <input  ${ck }
															type="radio" value="1" name="reserveFrom" class="">
															<span class="text">APP</span>
														</label> <label> <input  ${ck }
															type="radio" value="3" checked name="reserveFrom" class="">
															<span class="text">网站</span>
														</label>
													</c:if>
													
												</div>
											</div>

											<div class="col-sm-8  col-xs-offset-2 btn-bottm" style="padding-top:25px">
												<c:if test="${k ne '1' }">
													<button id="tagIdSubmitAddVip_btn" onclick="submitClick()" type="button" class=" btn btn-darkorange  col-sm-2 col-xs-offset-3" href="#closeCourse" >保存</button>
													<input type="submit" hidden id="sb" >
													<button class=" btn btn-active col-sm-2" type="button" onClick="window.history.back(-1)">取消</button>
												</c:if>
												<c:if test="${k eq '1' }">
													<button id="tagIdSubmitAddVip_btn" type="submit" class=" btn btn-darkorange  col-sm-2 col-xs-offset-3" href="#closeCourse" onClick="window.history.back(-1)" data-toggle="modal">返回</button>
												</c:if>
											</div>
									</div>

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

	</div>

	<!-- /右侧内容 -->
	</div>


	<script src="${ctx }/dep/assets/js/jquery-2.0.3.min.js"></script>
	<script
		src="${ctx }/dep/assets/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="${ctx }/dep/assets/js/bootstrap.min.js"></script>
	<script src="${ctx }/dep/assets/js/bootstrapValidator.min.js"></script>
	<script src="${ctx }/dep/assets/js/jquery.dataTables.min.js"></script>
	<script src="${ctx }/dep/assets/js/jquery.dataTables.bootstrap.js"></script>

	<script src="${ctx }/dep/moban/js/datetime/bootstrap-datepicker.js"></script>
	<script src="${ctx }/dep/moban/js/datetime/bootstrap-timepicker.js"></script>
	<script src="${ctx }/dep/jquery.selectlist.js"></script>
	<script src="${ctx }/home/member/vip_server_look.js"></script>
</body>

</html>
