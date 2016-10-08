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
    <title>新增加盟商</title>
  

    <link rel="stylesheet" type="text/css" href="${ctx}/dep/css/jquery.selectlist.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/dep/datetimepicker/css/bootstrap-datetimepicker.css"/>
    <link href="${ctx}/dep/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />	
    <link rel="stylesheet" type="text/css" href="${ctx}/home/member/zj_style.css"/>
	<link rel="stylesheet" href="${ctx}/dep/dist/css/dropify.css">

</head>

<body class="gray-bg">
      
   <div class="page-content">
                <div class="page-breadcrumbs">
                    <ul class="breadcrumb">
                        <li>
                            <i class="fa fa-home"></i>
                            <a href="index.html">首页</a>
                        </li>
                        <li class="active">
                          <a href="###">加盟商信息管理</a>
                        </li>
                        <li class="active">
                            加盟商信息服务 
                        </li>
                         
                    </ul>
                </div>
                <!-- /面包屑导航-->
                <!--头部按钮-->
                <div class="page-header position-relative">
                    <div class="header-title">
                        <h1>
                            加盟商信息服务
                        </h1>
                       
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
                                    <span class="widget-caption">加盟商信息列表</span>
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
                                
                                <div class="widget-body " style="overflow:hidden">
									<div class="col-lg-12 col-sm-12 col-xs-12">
									
									<input id="from" value="${from}"  style="display: none"/>
									
									<form class="form-horizontal form-bordered" role="form" id="registrationForm" onsubmit="return validateForm(this)">
                                          <div class="widget">
											    <div class="bancgud js">
													 <div class="formfont">基础信息</div>
													 
														<input value="${data.id}" type="text" name="id" style="display: none"/>
														
														<div class="form-group">
															<label for="inputEmail3" class="col-sm-2 control-label no-padding-right">加盟商名称<span class="help-inline"><font color="red">*</font> </span></label>
															<div class="col-sm-9">
																<input type="text" value="${data.name}" class="form-control" id="inputEmail3" placeholder="请输入加盟商名称" name="name" data-bv-notempty="true" data-bv-notempty-message="加盟商姓名不能为空">
															</div>
														</div>
														<div class="form-group">
															<label  class="col-sm-2 control-label no-padding-right">加盟商联系电话<span class="help-inline"><font color="red">*</font> </span></label>
															<div class="col-sm-2">
																 <input type="text" value="${data.phoneArea}" class="form-control fl " maxlength="4"  placeholder="" name="phoneArea" data-bv-notempty="true" data-bv-notempty-message="联系电话不嫩为空">
															</div>
															 <span class="fl">-</span>
															 <div  class="col-sm-6">
																<input type="text" value="${data.phone}" class="form-control fl " maxlength="8" placeholder="" name="phone" >
															</div>
														</div>


														<div class="form-group">
															<label class="col-sm-2 control-label no-padding-right">加盟商所在区域</label>
															 <div  class="col-sm-2">
																 <select id="s_province" class="col-lg-12" name="provinces"></select> 
															 </div>
															 <div  class="col-sm-2">
																 <select id="s_city" class="col-lg-12" name="city"></select> 
															 </div> 
															 <div  class="col-sm-2">
																 <select id="s_county" class="col-lg-12" name="county"></select>
																 <div id="show"></div>
															 </div>
															  <div  class="col-sm-3">
																  <input type="text" class="form-control fl "  name="address" value="${data.address}" placeholder="请输入具体地址"/>
															 </div>
														</div>

														 <div class="formfont">附属信息</div>

														<div class="form-group">
															<label for="inputEmail3" class="col-sm-2 control-label no-padding-right">负责人姓名<span class="help-inline"><font color="red">*</font> </span></label>
															<div class="col-sm-9">
																<input type="text" class="form-control" placeholder="请输入负责人姓名" name="headName" value="${data.headName}" data-bv-notempty="true" data-bv-notempty-message="负责人姓名不能为空">
															</div>
														</div>
														<div class="form-group">
															<label  class="col-sm-2 control-label no-padding-right">负责人电话<span class="help-inline"><font color="red">*</font> </span></label>
															<div class="col-sm-9">
																 <input type="text" class="form-control fl " maxlength="11" placeholder="请输入负责人电话" name="headPhone" value="${data.headPhone}" data-bv-notempty="true" data-bv-notempty-message="负责人电话不能为空">
															</div>

														</div>
														<div class="form-group">
															<label  class="col-sm-2 control-label no-padding-right">法人姓名<span class="help-inline"><font color="red">*</font> </span></label>
															<div class="col-sm-9">
																 <input type="text" class="form-control fl "  placeholder="请输入法人姓名" name="legalName" value="${data.legalName}" data-bv-notempty="true" data-bv-notempty-message="法人姓名不能为空">
															</div>
														</div>
														<div class="form-group">
															<label  class="col-sm-2 control-label no-padding-right">法人身份证</label>
															<div class="col-sm-6">
																<div class="box pull-left mr" >
																	<input type="file" class="dropify" data-default-file="" extra="cardImg"  accept=".gif,.jpg,.jpeg,.png">
																</div>
																<div class="box pull-left mr">
																	<input type="file" class="dropify" data-default-file="" extra="cardImg"  accept=".gif,.jpg,.jpeg,.png">
																</div>
															</div>
														</div>
														
														<input type="text" name="cardImg" style="display: none">
														
														<div class="form-group">
															<label  class="col-sm-2 control-label no-padding-right">开&nbsp;&nbsp;户&nbsp;行</label>
															<div class="col-sm-9">
																 <input type="text" value="${data.bank}" name="bank" class="form-control fl "  placeholder="">
															</div>
														</div>
														<div class="form-group">
															<label  class="col-sm-2 control-label no-padding-right">开户行账号</label>
															<div class="col-sm-9">
																 <input type="text" value="${data.bankAccount}" name="bankAccount" class="form-control fl "  placeholder="">
															</div>
														</div>
														<div class="form-group  radioyes">
															<label  class="col-sm-2 control-label no-padding-right">是否三证合一</label>
															<div class="col-sm-10" style="margin-top:3px">
																<label class="radio_btn">
																	<input class="checkbox-slider" type="checkbox" <c:if test="${data.isOne==null || data.isOne==1}">checked=""</c:if>  value="${data.isOne}" name="isOne">
																	<span class="text"></span>
																</label>
															</div>
														</div>
														<div class="form-group radioa ">
															 <div class=" col-sm-8 formleftb yesradio yesradionoa server server_1" style="display: block">
																 <div class="form-group">
																	 <label  class="col-sm-2 control-label no-padding-right">上传证书</label>
																	 <div class="col-sm-6">
																		 <div class="box pull-left mr" >
																			 <input type="file" class="dropify" extra="certificateImg" data-default-file="" accept=".gif,.jpg,.jpeg,.png">
																		 </div>
																		 <div class="box pull-left mr">
																			 <input type="file" class="dropify" extra="certificateImg" data-default-file="" accept=".gif,.jpg,.jpeg,.png">
																		 </div>
																	 </div>
																 </div>
															 </div>
															 
															 <input type="text" style="display: none" name="certificateImg"/>
															 
															 <div class="col-sm-8  formleftb yesradio nihigth project  server_2">
																 <div class="form-group">
																	<label  class="col-sm-2 control-label no-padding-right">营业执照编码 </label>
																	<div class="col-sm-6">
																		 <input type="text" class="form-control fl " name="license" value="${data.license}" placeholder="">
																	</div>
																 </div>
																 <div class="form-group">
																		<label  class="col-sm-2 control-label no-padding-right">营业执照图片</label>
																		<div class="col-sm-6">
																			<div class="box pull-left mr" >
																				<input type="file" class="dropify" extra="licenseImg" data-default-file="" accept=".gif,.jpg,.jpeg,.png">
																			</div>
																			<div class="box pull-left mr">
																				<input type="file" class="dropify" extra="licenseImg" data-default-file="" accept=".gif,.jpg,.jpeg,.png">
																			</div>
																		</div>
																  </div>
																  
																  <input type="text" style="display: none" name="licenseImg"/>
																  
																 <div class="form-group">
																	<label  class="col-sm-2 control-label no-padding-right">税务登记证编号</label>
																	<div class="col-sm-6">
																		 <input type="text" class="form-control fl "  placeholder="" name="tax" value="${data.tax}">
																	</div>
																</div>
																 <div class="form-group">
																		<label  class="col-sm-2 control-label no-padding-right">税务登记证书图片</label>
																		<div class="col-sm-6">
																			<div class="box pull-left mr" >
																				<input type="file" class="dropify" extra="taxImg" data-default-file="" accept=".gif,.jpg,.jpeg,.png">
																			</div>
																			<div class="box pull-left mr">
																				<input type="file" class="dropify" extra="taxImg" data-default-file="" accept=".gif,.jpg,.jpeg,.png">
																			</div>
																		</div>
																  </div>
																  
																  <input type="text" style="display: none" name="taxImg"/>
																  
																 <div class="form-group">
																	<label  class="col-sm-2 control-label no-padding-right">组织机构代码证编号</label>
																	<div class="col-sm-6">
																		 <input type="text" class="form-control fl "  placeholder="" value="${data.organization}" name="organization">
																	</div>
																</div>
																 <div class="form-group">
																		<label  class="col-sm-2 control-label no-padding-right">组织机构代码证图片</label>
																		<div class="col-sm-6">
																			<div class="box pull-left mr" >
																				<input type="file" class="dropify" extra="organizationImg"  data-default-file="" accept=".gif,.jpg,.jpeg,.png">
																			</div>
																			<div class="box pull-left mr">
																				<input type="file" class="dropify" extra="organizationImg" data-default-file="" accept=".gif,.jpg,.jpeg,.png">
																			</div>
																		</div>
																  </div>
																  
																  <input type="text" style="display: none" name="organizationImg"/>
																  
																 <div class="form-group">
																	<label  class="col-sm-2 control-label no-padding-right">信用代码证编号</label>
																	<div class="col-sm-6">
																		 <input type="text" class="form-control fl "  placeholder="" name="credit" value="${data.credit}">
																	</div>
																</div>
																 <div class="form-group">
																		<label  class="col-sm-2 control-label no-padding-right">信用代码证图片</label>
																		<div class="col-sm-6">
																			<div class="box pull-left mr" >
																				<input type="file" class="dropify" extra="creditImg" data-default-file="" accept=".gif,.jpg,.jpeg,.png">
																			</div>
																			<div class="box pull-left mr">
																				<input type="file" class="dropify" extra="creditImg" data-default-file="" accept=".gif,.jpg,.jpeg,.png">
																			</div>
																		</div>
																  </div>
																  
																   <input type="text" style="display: none" name="creditImg"/>
																  
																 <div class="form-group">
																		<label  class="col-sm-2 control-label no-padding-right">加盟申请书图片</label>
																		<div class="col-sm-6">
																			<div class="box pull-left mr" >
																				<input type="file" class="dropify" extra="applyImg" data-default-file="" accept=".gif,.jpg,.jpeg,.png">
																			</div>
																			<div class="box pull-left mr">
																				<input type="file" class="dropify" extra="applyImg" data-default-file="" accept=".gif,.jpg,.jpeg,.png">
																			</div>
																		</div>
																  </div>
																  
																  <input type="text" style="display: none" name="applyImg"/>
																  
															 </div>
														  </div>

													
											    </div>
												<div class="col-sm-8  col-xs-offset-4 btn-bottm" style="padding-top:25px">
													<input  type="submit" class=" btn btn-darkorange  col-sm-2 " value="保存"/>
													<a class=" btn btn-active col-sm-2 col-xs-offset-3" type="button" href="${ctx}/franchisee/franchisee">取消</a>
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
               
		<script class="resources library" src="${ctx}/dep/area.js" type="text/javascript"></script>
		<script type="text/javascript">_init_area();</script>
		<script src="${ctx}/dep/jquery.selectlist.js"></script>
		<script src="${ctx}/dep/fileinput.js" type="text/javascript"></script>
		<script src="${ctx}/dep/fileinput_locale_zh.js" type="text/javascript"></script>
		<script src="${ctx}/dep/dist/js/dropify.js"></script>
		
		<script type="text/javascript" src="${ctx}/home/franchisee/franchisee_add.js"></script>

</body>

</html>



	
  


