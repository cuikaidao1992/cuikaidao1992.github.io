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

<link href="${ctx }/dep/css/cropper.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${ctx }/dep/datetimepicker/css/bootstrap-datetimepicker.css" />
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
										<c:if test="${k=='1' }">
											<c:set var="ck" value="disabled"></c:set> 
										</c:if>
										<div class="formfont">基础信息</div>

										<form action="${ctx }/customer/update" class="form-horizontal form-bordered" method="post"
											id="registrationForm">
											<input type="text" hidden name="id"  value="${re.id }"/>
											<input type="text" hidden name="appendAddress" id="appendAddress" />
											<div class="row">
												<div class="col-lg-8 col-sm-8 col-xs-8">

													<div class="widget">
														<div class="row">
															<div class="col-lg-6 col-sm-6 col-xs-6 ">
																<div class="form-group hypading">
																	<label for="inputPassword3"
																		class="col-sm-3 control-label no-padding-right">会员姓名<span
																		class="help-inline"><font color="red">*</font>
																	</span></label>
																	<div class="col-sm-9">
																		<input type="text" class="form-control"
																			id="inputEmail3" name="name" placeholder="张娇"
																		value="${re.name }"	${ck }>
																	</div>
																</div>
															</div>
														</div>
														<!--row-->
														<div class="row">

															<div class="col-lg-6 col-sm-6 col-xs-6  ">
																<div class="form-group hypading">
																<label class="col-sm-3 control-label no-padding-right">性别<span class="help-inline"><font color="red">*</font> </span></label>
																<div class="col-sm-9 collabe">
																<c:if test="${re.sex=='1' }">
																	 
																	<label class="labletab "> <input type="radio" name="sex" value="1" ${ck } checked><span class="text"> 男</span>
																	</label> <label class="labletab"> <input type="radio" name="sex" value="2" ${ck }> <span
																		class="text"> 女</span>
																	</label> <label class="labletab"> <input
																		type="radio" name="sex" value="0" ${ck }> <span
																		class="text">其他</span>
																	</label>
																	
																	
																</c:if>
																<c:if test="${re.sex=='2' }">
																	 <label
																		class="labletab "> <input
																		type="radio" value="1" name="sex" ${ck } >
																		<span class="text"> 男</span>
																	</label> <label class="labletab "> <input
																		type="radio" value="2" name="sex" ${ck } checked> <span
																		class="text"> 女</span>
																	</label> <label class="labletab "> <input
																		type="radio" value="0" name="sex" ${ck }> <span
																		class="text">其他</span>
																	</label>
																</c:if>	
																<c:if test="${re.sex=='0' }">
																	 <label
																		class="labletab "> <input
																		type="radio"  value="1" name="sex" ${ck } >
																		<span class="text"> 男</span>
																	</label> <label class="labletab "> <input
																		type="radio" value="2" name="sex" ${ck }> <span
																		class="text"> 女</span>
																	</label> <label class="labletab "> <input
																		type="radio" name="sex" value="0" ${ck } checked> <span
																		class="text">其他</span>
																	</label>
																</c:if>
																</div>
																</div>
															</div>
															<div class="col-lg-6 col-sm-6 col-xs-6 ">
																<div class="form-group hypading">
																<label class="col-sm-3 control-label no-padding-right">婚姻状况<span
																	class="help-inline"><font color="red">*</font> </span></label>
																<div class="col-sm-9">
																<c:if test="${re.marry eq '1' }">
																		<c:set var="m1" value="checked"></c:set> 
																</c:if>
																<c:if test="${re.marry eq '2' }">
																		<c:set var="m2" value="checked"></c:set> 
																</c:if>
																<c:if test="${re.marry eq '3' }">
																		<c:set var="m3" value="checked"></c:set> 
																</c:if>
																<c:if test="${re.marry eq '4' }">
																		<c:set var="m4" value="checked"></c:set> 
																</c:if>
																<c:if test="${re.marry eq '5' }">
																		<c:set var="m5" value="checked"></c:set> 
																</c:if>
																<c:if test="${re.marry eq '6' }">
																		<c:set var="m6" value="checked"></c:set> 
																</c:if>
																<label class="labletab ">
				                                                         		<input type="radio" ${ck } name="marry" ${m1 } value="1">
				                                                            	<span class="text" >已婚</span>
						                                                  	</label>
																			<label class="labletab">
							                                                    <input type="radio" ${ck } name="marry" ${m2 } value="2">
							                                                    <span class="text">未婚</span>
							                                                </label>
																			<label class="labletab">
							                                                    <input type="radio" ${ck } name="marry" ${m3 } value="3">
							                                                    <span class="text">离异</span>
							                                                </label>
							                                                <label class="labletab">
							                                                    <input type="radio" ${ck } name="marry" ${m4 } value="4">
							                                                    <span class="text">丧偶</span>
							                                                </label>
							                                                <label class="labletab">
							                                                    <input type="radio" ${ck } name="marry" ${m5 } value="5">
							                                                    <span class="text">其他</span>
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
																	<div class="col-sm-9">
																		<input type="text"
																			class="date-picker form-control from fl" name="birthday"
																			value="${re.birthday }" ${ck }> <i
																			class="fa fa-calendar fl"
																			style="margin-left: -26px; color: #999; margin-top: 10px;"></i>
																	</div>
																</div>
															</div>
															<div class="col-lg-6 col-sm-6 col-xs-6 ">
																<div class="form-group hypading">
																	<label for="inputEmail3"
																		class="col-sm-3 control-label no-padding-right">手机号<span
																		class="help-inline"><font color="red">*</font>
																	</span></label>
																	<div class="col-sm-9">
																		<input type="text" class="form-control" value="${re.memPhone }" name="memPhone"
																			id="inputEmail3" placeholder=""
																			${ck }>
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
																		<input type="text" class="form-control"
																			id="inputEmail3" placeholder="河北"  value="${re.place}" ${ck }>
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
																		<select ${ck } tabindex="10" class="form-control" name="highestDegree" data-bv-notempty="true" data-bv-notempty-message="文化程度不能为空">
																				<c:if test="${re.highestDegree eq '1' }">
																					<c:set var="s1" value="selected"></c:set> 
																				</c:if>
																				<c:if test="${re.highestDegree eq '2' }">
																					<c:set var="s2" value="selected"></c:set> 
																				</c:if>
																				<c:if test="${re.highestDegree eq '3' }">
																					<c:set var="s3" value="selected"></c:set> 
																				</c:if>
																				<c:if test="${re.highestDegree eq '4' }">
																					<c:set var="s4" value="selected"></c:set> 
																				</c:if>
																				<c:if test="${re.highestDegree eq '5' }">
																					<c:set var="s5" value="selected"></c:set> 
																				</c:if>
																				<c:if test="${re.highestDegree eq '6' }">
																					<c:set var="s6" value="selected"></c:set> 
																				</c:if>
																				<c:if test="${re.highestDegree eq '7' }">
																					<c:set var="s7" value="selected"></c:set> 
																				</c:if>
																				<c:if test="${re.highestDegree eq '8' }">
																					<c:set var="s8" value="selected"></c:set> 
																				</c:if>
																				<option ${s8 } value="8">博士</option>
																				<option ${s7 } value="7">研究生以上</option>
																				<option ${s6 } value="6">大学本科</option>
																				<option ${s5 } value="5">大学专科</option>
																				<option ${s4 }  value="4">普通高中</option>
																				<option ${s3 } value="3">中等职业</option>
																				<option ${s2 } value="2">初级中学</option>
																				<option ${s1 } value="1">小学</option>
																				<option ${s9 } value="9">其他</option>
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
																	<c:if test="${re.certificateType eq '1' }">
																					<c:set var="z1" value="selected"></c:set> 
																	</c:if>
																	<c:if test="${re.certificateType eq '2' }">
																					<c:set var="z2" value="selected"></c:set> 
																	</c:if>
																	<c:if test="${re.certificateType eq '3' }">
																					<c:set var="z3" value="selected"></c:set> 
																	</c:if>
																	<c:if test="${re.certificateType eq '4' }">
																					<c:set var="z4" value="selected"></c:set> 
																	</c:if>
																	<c:if test="${re.certificateType eq '5' }">
																					<c:set var="z5" value="selected"></c:set> 
																	</c:if>
																	<select tabindex="10" class="col-sm-12 form-control" ${ck } name="certificateType" data-bv-notempty="true" data-bv-notempty-message="证件类型不能为空">
																		<option ${z1 } value="1">身份证</option>
																		<option ${z2 } value="2">护照</option>
																		<option ${z3 } value="3">港澳通行证</option>
																		<option ${z4 } value="4">回乡证</option>
																		<option ${z5 } value="5">港澳身份证</option>
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
																<input type="text" class="form-control" name="cardNumber" id="inputEmail3" value="${re.cardNumber }"
																	placeholder="130485249813051145" ${ck }>
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4">
														
													</div>
												</div>
												<!--证件类型婚姻状况over-->

												<div class="row">
													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right">发证机关</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="inputEmail3" name="lssuedOffice" value="${re.lssuedOffice }"
																	placeholder="北京市公安局朝阳分局" ${ck }>
															</div>
														</div>
													</div>
													

													<div class="col-lg-4 col-sm-4 col-xs-4">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right">IC卡号</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" name="icCardNumber" id="inputEmail3" value="${re.icCardNumber }"
																	 ${ck }>
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right">IC卡标识符</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="inputEmail3" name="icIdentifier" value="${re.icIdentifier }"
																	placeholder="" ${ck }>
															</div>
														</div>
													</div>
													
												</div>
												<!--发证机关ic卡号over-->

												<div class="row">
														<div class="col-xs-12 col-marginl">
															<div class="form-group hypading" style="margin-left: 0;">
																	<label class="col-sm-1" style="text-align:right;padding-top:10px">地<span class="fro-padd">址</span></label>
																	<div class="col-sm-2" style="padding:0px">
																		<select class="form-control" id="s_province" ${ck }
																			name="province" style="width: 180px;">
																		</select>
																	</div>
																	<div class="col-sm-2">
																		<select  class="form-control" id="s_city" name="city" ${ck }
																			style="width: 180px;">
																		</select>
																	</div>
																	<div class="col-sm-2">
																		<select id="s_county" class="colsm form-control" ${ck }
																		name="county" style="width: 180px;"></select>
																	</div>
																	 <div class="col-xs-4">
																		<input type="text" value="${re.detailAddress }"  name="detailAddress" class="formstyle form-control " id="inputEmail3" placeholder="新苑小区二区六号楼二单元"  ${ck} />
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
																<c:if test="${re.memberForm=='1' }">
																	<label class="labletab ">
			                                                         	<input type="radio" name="memberForm" value="0" ${ck } >
			                                                            <span class="text" > 线下录入</span>
					                                                  </label>
																	<label class="labletab">
				                                                        <input checked type="radio" value="1" ${ck } name="memberForm" >
				                                                        <span class="text">APP</span>
							                                         </label>
																	<label class="labletab">
				                                                        <input type="radio" value="2" ${ck } name="memberForm" >
				                                                        <span class="text">网站</span>
							                                         </label>
																</c:if>
																
																<c:if test="${re.memberForm=='2' }">
																	<label class="labletab ">
			                                                         	<input type="radio" name="memberForm" value="0" ${ck } >
			                                                            <span class="text" > 线下录入</span>
					                                                  </label>
																	<label class="labletab">
							                                                        <input type="radio" value="1" ${ck } name="memberForm" >
							                                                        <span class="text">APP</span>
							                                               </label>
																	<label class="labletab">
							                                                        <input checked type="radio" value="2" ${ck } name="memberForm" >
							                                                        <span class="text">网站</span>
							                                         </label>
																</c:if>
																
																<c:if test="${re.memberForm=='0' }">
																	<label class="labletab ">
			                                                         	<input checked type="radio" name="memberForm" value="0" ${ck } >
			                                                            <span class="text" > 线下录入</span>
					                                                  </label>
																	<label class="labletab">
							                                                        <input type="radio" value="1" ${ck } name="memberForm" >
							                                                        <span class="text">APP</span>
							                                               </label>
																	<label class="labletab">
							                                                        <input type="radio" value="2" ${ck } name="memberForm" >
							                                                        <span class="text">网站</span>
							                                         </label>
																</c:if>
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
																<input type="text" class="form-control"  name="memberCardNumber" value="${re.memberCardNumber }"
																	id="inputEmail3" placeholder="1583648445582"
																	${ck }>
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4">
														<div class="form-group hypading">
															<label class="col-sm-4 control-label no-padding-right">社保编号</label>
															<div class="col-sm-8">
																<input type="text" class="form-control" name="socialSecurityId" value="${re.socialSecurityId }"
																	id="inputEmail3" placeholder="135864879916463325"
																	${ck }>
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
																<input type="text" class="form-control" id="inputEmail3" name="urgentContacts" value="${re.urgentContacts }"
																	placeholder="张娇" ${ck }>
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4">
														<div class="form-group hypading">
															<label class="col-sm-4 control-label no-padding-right">紧急联系人电话</label>
															<div class="col-sm-8">
																<input type="text" class="form-control" id="inputEmail3" name="srgentTel" value="${re.srgentTel }"
																	placeholder="15135482265" ${ck }>
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading"></div>
													</div>
												</div>
												<!--紧急联系人over-->
												<div class="form-group formbdcenb">
                                                        <label class="col-sm-1 control-label no-padding-right">补充地址</label>
                                                        <div class="col-sm-6 add_family">
                                                        <c:forEach items="${appendAddress }" var="ap" varStatus="i">
                                                        	<div class="form-group" style="overflow:hidden;padding-top:0px">
          														<div class="col-sm-8">
          														<input type="text" id="LookAddress${i.index }" value="${ap.value }" class="form-control">
          														</div>
          														<div class="com-sm-1 ">
																<i class="fa fa-minus address_min" >
																</i>
																</div>
          													</div>
                                                        </c:forEach>
          													<div class="sc_1  aa">
          														<i class="fa fa-plus address"></i>
          														<span>补充新地址</span>
          													</div>
          												</div>
                                               </div>
												<!--补充地址over-->
												<%-- <div class="row">
													<div class="col-lg-4 col-sm-4 col-md-4">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right">血<span
																class="fro-padd"></span>型
															</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="inputEmail3"
																	placeholder="A型" ${ck }>
															</div>

														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading"></div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading"></div>
													</div>

												</div> --%>
												<!--血型over-->
												<div class="row">
													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right">村委会名称</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="inputEmail3" name="villageName" value="${re.villageName }"
																	placeholder="北京市开阳桥居委会" ${ck }>
															</div>
														</div>
													</div>
													<div class="col-lg-4 col-sm-4 col-xs-4">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right">村委会地址</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="inputEmail3" name="villageAddress" value="${re.villageAddress }"
																	placeholder="北京市西城区开阳桥" ${ck }>
															</div>
														</div>
													</div>

													<div class="col-lg-4 col-sm-4 col-xs-4  ">
														<div class="form-group hypading">
															<label class="col-sm-3 control-label no-padding-right">村委会电话</label>
															<div class="col-sm-9">
																<input type="text" class="form-control" id="inputEmail3" name="villageTel" value="${re.villageTel }"
																	placeholder="0105624823" ${ck }>
															</div>
														</div>
													</div>
												</div>
												<!--村委会over-->
											</div>
									</div>
									<!--widget-->

									<div class="col-sm-8  col-xs-offset-2 btn-bottm" style="padding-top:25px">

										<c:if test="${k ne '1' }">
											<button id="tagIdSubmitAddVip_btn" type="button" onclick="submitclick()"  class=" btn btn-darkorange  col-sm-2 col-xs-offset-3" href="#closeCourse" data-toggle="modal">保存</button>
											<a href="${ctx }/customer/index"  class=" btn btn-active col-sm-2" type="button" >取消</a>
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
</body>
<script src="${ctx }/dep/moban/js/toastr/toastr.js"></script>
<script src="${ctx }/dep/moban/js/validation/bootstrapValidator.js"></script>
<script src="${ctx }/dep/moban/js/datetime/bootstrap-datepicker.js"></script>
<script src="${ctx }/dep/moban/js/datetime/bootstrap-timepicker.js"></script>
<script src="${ctx}/home/member/memberinformation_look.js"></script>
<script>
var pr = '${re.province}';
var ci = '${re.city}';
var co = '${re.county}';
</script>
</html>
