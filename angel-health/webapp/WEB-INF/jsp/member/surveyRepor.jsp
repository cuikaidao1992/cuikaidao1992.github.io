<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>会员信息服务</title>
	<link rel="shortcut icon" href="${ctx }/home/common/img/favicon.png" type="image/x-icon">
	<!--Basic Styles-->
	<link href="${ctx }/dep/moban/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${ctx }/dep/moban/css/font-awesome.min.css" rel="stylesheet" />
	<link href="${ctx }/home/common/css.css" rel="stylesheet" />
	<!--Beyond styles-->
	<link href="${ctx }/dep/moban/css/beyond.min.css" rel="stylesheet" />
	<link href="${ctx }/dep/moban/css/demo.min.css" rel="stylesheet" />
	<link href="${ctx }/dep/moban/css/typicons.min.css" rel="stylesheet" />
	<link href="${ctx }/dep/moban/css/animate.min.css" rel="stylesheet" />
    

</head>

<body>
		<div class="report">
			<div class="widget">
				<div class="widget-header">
					<h2>调查问卷</h2>
				</div>
				<div class="widget-body" style="overflow:hidden">
				<form id="form" action="${ctx }/customer/saveSurveyRepor" class="form-horizontal form-bordered" method="post" role="form">
					<div class="col-lg-12 col-sm-12 col-xs-12 ">
						<div class="widget">
							<input type="button" onclick="upData()" />
							
							<section id="sec1" name="section1" style="display: block;">
								
									<input id="customerId" value="${id }" hidden name="customerId"  />
									<input id="content" hidden  name="content"  />
									<div class="bancgud row">
										<div class="formfont wjdc_top col-lg-12"><img src="../dep/img/wenjuan.png">
											<span class="No">NO.1</span>
											<span class="inform">个人基础信息</span></div>

										<div class="col-lg-6">
											<div class="form-group hypading">
												<label class="col-sm-3 control-label no-padding-right">姓名<span class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="group_1_name_text" name="group_1_name_1_text" name="height" placeholder="请输入会员姓名" data-bv-notempty="true" data-bv-notempty-message="会员姓名不能为空" data-bv-field="name">
													<small data-bv-validator="notEmpty" data-bv-validator-for="name" class="help-block" style="display: none;">会员姓名不能为空</small>
												</div>
											</div>
											<div class="form-group hypading">
												<label class="col-sm-3 control-label no-padding-right">性别<span class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9 collabe">
													<label class="labletab ">
                                                <input type="radio" id="group_1_six1_radio" name="group_1_six_radio" value="1" checked="" data-bv-field="d">
                                                <span class="text">男</span>
                                            </label>
													<label class="labletab">
                                                <input type="radio" id="group_1_six2_radio" name="group_1_six_radio" value="2" data-bv-field="d">
                                                <span class="text">女</span>
                                            </label>
													<label class="labletab">
                                                <input type="radio" id="group_1_six0_radio" name="group_1_six_radio" value="0" data-bv-field="d">
                                                <span class="text">其他</span>
                                            </label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right">证件号码<span class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<input type="text" name="group_1_cardNum_text" id="group_1_cardNum_text" class="form-control" placeholder="请输入您的证件号码" name="Certificates" data-bv-notempty="true" data-bv-notempty-message="证件号码不能为空" data-bv-field="Certificates">
													<small data-bv-validator="notEmpty" data-bv-validator-for="Certificates" class="help-block" style="display: none;">证件号码不能为空</small>
												</div>
											</div>
											<div class="form-group hypading">
												<label class="col-sm-3 control-label no-padding-right">文化程度<span class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<select tabindex="10" class="form-control" name="group_1_culture_select" id="group_1_culture_select" data-bv-notempty="true" data-bv-notempty-message="文化程度不能为空" data-bv-field="culture">
														<option value="1">研究生以上</option>
														<option value="2">大学本科</option>
														<option value="3">大学专科</option>
														<option value="4">普通高中</option>
														<option value="5">中等职业</option>
														<option value="6">初级中学</option>
														<option value="7">小学</option>
														<option value="8">其他</option>
													</select>
													<small data-bv-validator="notEmpty" data-bv-validator-for="culture" class="help-block" style="display: none;">文化程度不能为空</small>
												</div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group hypading">
												<label for="inputEmail3" class="col-sm-3 control-label no-padding-right">年龄<span class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<input type="text" name="group_1_age" id="group_1_age_text" class="form-control" placeholder="请输入您的年龄"  data-bv-notempty="true" data-bv-field="tel">
													<small data-bv-validator="notEmpty" data-bv-validator-for="tel" class="help-block" style="display: none;">手机号不能为空</small>
												</div>
											</div>

											<div class="form-group hypading">
												<label for="inputEmail3" class="col-sm-3 control-label no-padding-right">手机号<span class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<input type="text" class="form-control" placeholder="请输入您的手机号" name="group_1_tel_text" id="group_1_tel_text" data-bv-notempty="true" data-bv-field="tel">
													<small data-bv-validator="notEmpty" data-bv-validator-for="tel" class="help-block" style="display: none;">手机号不能为空</small>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right">婚姻状况<span class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<select tabindex="10" class="col-sm-12 form-control" id="group_1_marry_select" name="group_1_marry" data-bv-notempty="true" data-bv-notempty-message="婚姻状况不能为空" data-bv-field="Marriage">
														<option value="1">已婚</option>
														<option value="2">未婚</option>
														<option value="3">离异</option>
														<option value="4">丧偶</option>
														<option value="5">其他</option>
													</select>
													<small data-bv-validator="notEmpty" data-bv-validator-for="Marriage" class="help-block" style="display: none;">婚姻状况不能为空</small>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right">职业<span class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<select tabindex="10" class="col-sm-12 form-control" id="group_1_abbr_select" name="group_1_abbr" data-bv-notempty="true" data-bv-notempty-message="婚姻状况不能为空" data-bv-field="Marriage">
														<option value="1">企事业单位人员</option>
														<option value="2">农/林/牧/渔/水利业生产人员</option>
														<option value="3">生产、运输设备操作人员及有关人员</option>
														<option value="4">专业技术人员</option>
														<option value="4">办事人员和有关人员</option>
														<option value="4">商业、服务业人员</option>
														<option value="4">军人</option>
														<option value="4">婴幼儿、学龄前儿童</option>
														<option value="4">学生</option>
														<option value="4">失业及下岗人员</option>
														<option value="4">离退休人员</option>
														<option value="5">其他</option>
													</select>
													<small data-bv-validator="notEmpty" data-bv-validator-for="Marriage" class="help-block" style="display: none;">婚姻状况不能为空</small>
												</div>
											</div>
										</div>
										<div class="col-sm-8  col-xs-offset-4 btn-bottm" style="padding-top:125px">

											<button type="button" onclick="next(2)" class=" btn btn-active col-sm-2 col-xs-offset-3">下一步</button>
										</div>
									</div>
									
								
							</section>
							<section name="section1" id="sec2" style="display: none;">
									<div class="bancgud row">
										<div class="formfont wjdc_top col-lg-12"><img src="${ctx }/dep/img/wenjuan.png">
											<span class="No">NO.2</span>
											<span class="inform">个人体检信息</span></div>
										<!--<div class="formfont col-lg-12">二  个人体检信息</div>-->
										<h4 class="block col-lg-12">1.一般检查（1尺=33.3厘米）</h4>
										<div class="col-lg-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right">身高<span class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<div class="input-group">
														<input type="text" id="group_2_height_text" name="group_2_height_text" class="form-control">
														<span class="input-group-addon">cm</span>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right">体重<span class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<div class="input-group">
														<input type="text" id="group_2_weight_text" name="group_2_weight_text" class="form-control">
														<span class="input-group-addon">kg</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right">臀围<span class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<div class="input-group">
														<input type="text" id="group_2_hip_text" class="form-control">
														<span class="input-group-addon">cm</span>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right">腰围<span class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<div class="input-group">
														<input type="text" id="group_2_waistline_text" class="form-control">
														<span class="input-group-addon">cm</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right">收缩压<span class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<div class="input-group">
														<input type="text" id="group_2_sbp_text" class="form-control">
														<span class="input-group-addon">mmHg</span>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right">舒张压<span class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<div class="input-group">
														<input type="text" id="group_2_dbp_text" class="form-control">
														<span class="input-group-addon">mmHg</span>
													</div>
												</div>
											</div>
										</div>
										<h4 class="block col-lg-12">2.心电图检查（每项单选）</h4>
										<table class="table table-striped table-hover table-bordered">
											<tbody>
												<tr>
													<td width="25%">早搏</td>
													<td>
														<div class="collabe">
															<label class="labletab col-sm-2">
                                                    <input type="radio" id="group_2_vpb1_radio" value="1" name="group_2_vpb_radio" checked="" data-bv-field="d">
                                                    <span class="text">无</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" id="group_2_vpb2_radio" value="2" name="group_2_vpb_radio" data-bv-field="d">
                                                    <span class="text">有</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" id="group_2_vpb3_radio" value="3" name="group_2_vpb_radio" data-bv-field="d">
                                                    <span class="text">不清楚</span>
                                                </label>
														</div>
													</td>
												</tr>
												<tr>
													<td width="25%">ST-T改变</td>
													<td>
														<div class="collabe">
															<label class="labletab col-sm-2">
                                                    <input type="radio" id="group_2_st1_radio" value="1" name="group_2_st_radio" checked="" data-bv-field="d">
                                                    <span class="text">无</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" id="group_2_st2_radio" value="2" name="group_2_st_radio" data-bv-field="d">
                                                    <span class="text">有</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" id="group_2_st3_radio" value="3" name="group_2_st_radio" data-bv-field="d">
                                                    <span class="text">不清楚</span>
                                                </label>
														</div>
													</td>
												</tr>
												<tr>
													<td width="25%">房颤</td>
													<td>
														<div class="collabe">
															<label class="labletab col-sm-2">
                                                    <input type="radio" id="group_2_eee1_radio" value="1" name="group_2_eee_radio" checked="" data-bv-field="d">
                                                    <span class="text">无</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" id="group_2_eee2_radio" value="2" name="group_2_eee_radio" data-bv-field="d">
                                                    <span class="text">有</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" id="group_2_eee3_radio" value="3" name="group_2_eee_radio" data-bv-field="d">
                                                    <span class="text">不清楚</span>
                                                </label>
														</div>
													</td>
												</tr>
												<tr>
													<td width="25%">左心房肥大</td>
													<td>
														<div class="collabe">
															<label class="labletab col-sm-2">
                                                    <input type="radio" id="group_2_lha1_radio" value="1" name="group_2_lha_radio" checked="" data-bv-field="d">
                                                    <span class="text">无</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" id="group_2_lha2_radio" value="2" name="group_2_lha_radio" data-bv-field="d">
                                                    <span class="text">有</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" id="group_2_lha3_radio" value="3" name="group_2_lha_radio" data-bv-field="d">
                                                    <span class="text">不清楚</span>
                                                </label>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
										<h4 class="block col-lg-12">3.X线和B超检查（每项单选）</h4>
										<table class="table table-striped table-hover table-bordered">
											<tbody>
												<tr>
													<td width="25%">肝脂肪</td>
													<td>
														<div class="collabe">
															<label class="labletab col-sm-2">
                                                    <input type="radio" name="group_2_axunge_radio" id="group_2_axunge1_radio" value="1" checked="" data-bv-field="d">
                                                    <span class="text">无</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" name="group_2_axunge_radio" id="group_2_axunge2_radio" value="2"  data-bv-field="d">
                                                    <span class="text">有</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" name="group_2_axunge_radio" id="group_2_axunge3_radio" value="3"  data-bv-field="d">
                                                    <span class="text">不清楚</span>
                                                </label>
														</div>
													</td>
												</tr>
												<tr>
													<td width="25%">胆结石</td>
													<td>
														<div class="collabe">
															<label class="labletab col-sm-2">
                                                    <input type="radio" name="group_2_gallStone_radio"  id="group_2_gallStone1_radio" value="1" checked="" data-bv-field="d">
                                                    <span class="text">无</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" name="group_2_gallStone_radio" id="group_2_gallStone2_radio" value="2" data-bv-field="d">
                                                    <span class="text">有</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" name="group_2_gallStone_radio" id="group_2_gallStone3_radio" value="3" data-bv-field="d">
                                                    <span class="text">不清楚</span>
                                                </label>
														</div>
													</td>
												</tr>
												<tr>
													<td width="25%">肾结石</td>
													<td>
														<div class="collabe">
															<label class="labletab col-sm-2">
                                                    <input type="radio" name="group_2_kidneyStone_radio" id="group_2_kidneyStone1_radio" value="1" checked="" data-bv-field="d">
                                                    <span class="text">无</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" name="group_2_kidneyStone_radio" id="group_2_kidneyStone2_radio" value="2" data-bv-field="d">
                                                    <span class="text">有</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" name="group_2_kidneyStone_radio" id="group_2_kidneyStone3_radio" value="3" data-bv-field="d">
                                                    <span class="text">不清楚</span>
                                                </label>
														</div>
													</td>
												</tr>
												<tr>
													<td width="25%">乳房良性结节或肿块</td>
													<td>
														<div class="collabe">
															<label class="labletab col-sm-2">
                                                    <input type="radio" name="group_2_knur_radio" id="group_2_knur1_radio" value="1" checked="" data-bv-field="d">
                                                    <span class="text">无</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" name="group_2_knur_radio" id="group_2_knur2_radio" value="2" data-bv-field="d">
                                                    <span class="text">有</span>
                                                </label>
															<label class="labletab col-sm-2">
                                                    <input type="radio" name="group_2_knur_radio" id="group_2_knur3_radio" value="3" data-bv-field="d">
                                                    <span class="text">不清楚</span>
                                                </label>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
										<h4 class="block col-lg-12">4.实验室检查</h4>
										<table class="table table-striped table-hover table-bordered">
											<thead>
												<tr>
													<th width="20%">体检项目</th>
													<th width="10%">体查值</th>
													<th width="10%">单位</th>
													<th width="20%">体检项目</th>
													<th width="10%">检查值</th>
													<th width="10%">单位</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>胆固醇(TC)</td>
													<td>
														<input type="text" id="group_2_tc_select" class="form-control" value="2.00">
													</td>
													<td>
														<select id="group_2_tcTag_select">
															<option value="1">mmol1/L</option>
															<option value="2">mmol2/L</option>
															<option value="3">mmol3/L</option>
														</select>
													</td>
													<td>高密度脂蛋白胆固醇</td>
													<td><input type="text" id="group_2_htc_select" class="form-control" value="2.00"></td>
													<td>
														<select id="group_2_htcTag_select">
															<option value="1">mmol1/L</option>
															<option value="2">mmol2/L</option>
															<option value="3">mmol3/L</option>
														</select>
													</td>
												</tr>
												<tr>
													<td>甘油三脂(TG)</td>
													<td>
														<input type="text" id="group_2_tg_select" class="form-control" value="2.00">
													</td>
													<td>
														<select id="group_2_tgTag_select">
															<option value="1">mmol1/L</option>
															<option value="2">mmol2/L</option>
															<option value="3">mmol3/L</option>
														</select>
													</td>
													<td>低密度脂蛋白胆固醇</td>
													<td><input type="text" id="group_2_ldl_select" class="form-control" value="2.00"></td>
													<td>
														<select id="group_2_ldlTag_select">
															<option value="1">mmol1/L</option>
															<option value="2">mmol2/L</option>
															<option value="3">mmol3/L</option>
														</select>
													</td>
												</tr>
												<tr>
													<td>空腹血糖(GLU)</td>
													<td>
														<input type="text" id="group_2_glu_select" class="form-control" value="2.00">
													</td>
													<td>
														<select id="group_2_gluTag_select">
															<option value="1">mmol1/L</option>
															<option value="2">mmol2/L</option>
															<option value="3">mmol3/L</option>
														</select>
													</td>
													<td>餐后2小时血糖</td>
													<td><input type="text" id="group_2_eat2_select" class="form-control"></td>
													<td>
														<select id="group_2_eat2Tag_select">
															<option value="1">mmol1/L</option>
															<option value="2">mmol2/L</option>
															<option value="3">mmol3/L</option>
														</select>
													</td>
												</tr>
												<tr>
													<td>血红蛋白(HGB)</td>
													<td>
														<input type="text" id="group_2_hgb_text" class="form-control" value="">
													</td>
													<td>g/l</td>
													<td>血尿酸(UA)</td>
													<td><input type="text" id="group_2_uc_text" class="form-control"></td>
													<td>umol/L</td>
												</tr>
												<tr>
													<td>谷丙转氨酶(HGB)</td>
													<td>
														<input type="text" id="group_2_alt_text" class="form-control" value="">
													</td>
													<td>IU/L</td>
													<td>乙肝表面抗原(HBsAg)</td>
													<td colspan="2">
														<label class="col-sm-6">
                                                <input type="checkbox" id="group_2_hasag1_checkbox" value="1" name="group_2_hasag_checkbox">
                                                <span class="text">阳性</span>
                                            </label>
														<label class="col-sm-6">
                                                <input type="checkbox" id="group_2_hasag2_checkbox" value="2" name="group_2_hasag_checkbox">
                                                <span class="text">阴性</span>
                                            </label>
													</td>
												</tr>
												<tr>
													<td>谷草转氨酶(AST)</td>
													<td>
														<input type="text" id="group_2_ast_text" class="form-control" value="">
													</td>
													<td>IU/L</td>
													<td>丙型肝炎抗体(HCV)</td>
													<td colspan="2">
														<label class="col-sm-6">
                                                <input type="checkbox" id="group_2_hcv1_checkbox" value="1" name="group_2_hcv_checkbox">
                                                <span class="text">阳性</span>
                                            </label>
														<label class="col-sm-6">
                                                <input type="checkbox" id="group_2_hcv2_checkbox"  value="2" name="group_2_hcv_checkbox">
                                                <span class="text">阴性</span>
                                            </label>
													</td>
												</tr>
												<tr>
													<td>尿蛋白(PRO)</td>
													<td colspan="2">
														<label class="col-sm-6">
                                                <input type="checkbox" id="group_2_pro1_checkbox" value="1" name="group_2_pro_checkbox">
                                                <span class="text">阳性</span>
                                            </label>
														<label class="col-sm-6">
                                                <input type="checkbox" id="group_2_pro2_checkbox" value="2" name="group_2_pro_checkbox">
                                                <span class="text">阴性</span>
                                            </label>
													</td>
													<td>大便隐血(HCV)</td>
													<td colspan="2">
														<label class="col-sm-6">
                                                <input type="checkbox"  id="group_2_so1_checkbox" value="1" name="group_2_so_checkbox">
                                                <span class="text">阳性</span>
                                            </label>
														<label class="col-sm-6">
                                                <input type="checkbox"  id="group_2_so2_checkbox" value="2" name="group_2_so_checkbox">
                                                <span class="text">阴性</span>
                                            </label>
													</td>
												</tr>
												<tr>
													<td>甲胎蛋白(AFP)</td>
													<td>
														<input type="text" id="group_2_afp1_text" class="form-control" value="">
													</td>
													<td>IU/L</td>
													<td>癌胚抗原(CEA)</td>
													<td>
														<input type="text" id="group_2_cea_text" class="form-control" value="">
													</td>
													<td>ug/l</td>
												</tr>
												<tr>
													<td>C反应蛋白(CRP)</td>
													<td>
														<input type="text" id="group_2_crp_text" class="form-control" value="">
													</td>
													<td>mg/L</td>
													<td>前列腺特异抗原(PSA)</td>
													<td>
														<input type="text" id="group_2_psa_text" class="form-control" value="">
													</td>
													<td>ug/l</td>
												</tr>
												<tr>
													<td>血肌肝(Cr)</td>
													<td>
														<input type="text" id="group_2_cr_text" class="form-control" value="">
													</td>
													<td>umol/L</td>
													<td>骨密度检测指标-T值</td>
													<td>
														<input type="text" id="group_2_bmd_text" class="form-control" value="">
													</td>
													<td></td>
												</tr>
											</tbody>
										</table>
										<div class="col-sm-8  col-xs-offset-3 btn-bottm" style="padding-top:25px">
											<button type="button" onclick="next(1)" class=" btn btn-darkorange col-sm-2">上一步</button>
											<button type="button" onclick="next(3)" class=" btn btn-active col-sm-2 col-xs-offset-3">下一步</button>
										</div>
									</div>
							</section>
							<section id="sec3" name="section1" style="display:none;">
								
									<div class="bancgud row">
										<div class="formfont wjdc_top col-lg-12"><img src="../dep/img/wenjuan.png">
											<span class="No">NO.3</span>
											<span class="inform">个人膳食信息</span></div>
										<!--<div class="formfont col-lg-12">三 个人膳食信息</div>-->
										<h4 class="block col-lg-12">5.您过去一周内所吃的食物</h4>
										<div class="wenjuan-food">
											<div class="wenjuan-food-cell">
												<div class="wenjuan-food-pic">
													<img src="../dep/img/nice.png">
												</div>
												<div class="wenjuan-food-name">
													<h2 class="ellipsis">大米、面粉类、杂粮类</h2> [ 1碗米饭≈2两 ]
												</div>
												<div class="wenjuan-food-select">
													<div class="d-food-rate-show d-food-week">
														<em id="cr_w_i">每周</em>
														<table>
															<tbody>
																<tr>
																	<td width="150px"><label class="labletab"><input id="group_3_foodWeek1_radio" value="1" type="radio" name="group_3_foodWeek_radio" data-bv-field="d"><span class="text">5-7天</span></label></td>
																	<td width="150px"><label class="labletab"><input id="group_3_foodWeek2_radio" value="2" type="radio" name="group_3_foodWeek_radio" data-bv-field="d"><span class="text">3-4天</span></label></td>
																	<td width="150px"><label class="labletab"><input id="group_3_foodWeek3_radio" value="3" type="radio" name="group_3_foodWeek_radio" data-bv-field="d"><span class="text">1-2天</span></label></td>
																	<td width="150px"><label class="labletab"><input id="group_3_foodWeek4_radio" value="4" type="radio" name="group_3_foodWeek_radio" data-bv-field="d"><span class="text">1天或不吃</span></label></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="d-food-rate-show d-food-day">
														<em id="cr_d_i">每天</em>
														<table>
															<tbody>
																<tr>
																	<td width="150px"><label class="labletab"><input id="group_3_foodDay1_radio" value="1" type="radio" name="group_3_foodDay_radio" data-bv-field="d"><span class="text">8两</span></label></td>
																	<td width="150px"><label class="labletab"><input id="group_3_foodDay2_radio" value="2" type="radio" name="group_3_foodDay_radio" data-bv-field="d"><span class="text">5-8两</span></label></td>
																	<td width="150px"><label class="labletab"><input id="group_3_foodDay3_radio" value="3" type="radio" name="group_3_foodDay_radio" data-bv-field="d"><span class="text">2-4两</span></label></td>
																	<td width="150px"><label class="labletab"><input id="group_3_foodDay4_radio" value="4" type="radio" name="group_3_foodDay_radio" data-bv-field="d"><span class="text">≤1两</span></label></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
											<div class="wenjuan-food-cell">
												<div class="wenjuan-food-pic" style="background:#58c0db;">
													<img src="../dep/img/meat.png">
												</div>
												<div class="wenjuan-food-name">
													<h2 class="ellipsis">肉类（猪，牛，羊，禽）</h2> [ 1副扑克牌大小≈2两 ]
												</div>
												<div class="wenjuan-food-select">
													<div class="d-food-rate-show d-food-week">
														<em id="meat_w_i">每周</em>
														<table>
															<tbody>
																<tr>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_meetWeek1_radio" value="1" name="group_3_meetWeek_radio" data-bv-field="d"><span class="text">5-7天</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_meetWeek2_radio" value="2" name="group_3_meetWeek_radio" data-bv-field="d"><span class="text">3-4天</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_meetWeek3_radio" value="3" name="group_3_meetWeek_radio" data-bv-field="d"><span class="text">1-2天</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_meetWeek4_radio" value="4" name="group_3_meetWeek_radio" data-bv-field="d"><span class="text">1天或不吃</span></label></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="d-food-rate-show d-food-day">
														<em id="meat_d_i">每天</em>
														<table>
															<tbody>
																<tr>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_meetDay1_radio" value="1" name="group_3_meetDay_radio" data-bv-field="d"><span class="text">8两</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_meetDay2_radio" value="2" name="group_3_meetDay_radio" data-bv-field="d"><span class="text">5-8两</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_meetDay3_radio" value="3" name="group_3_meetDay_radio" data-bv-field="d"><span class="text">2-4两</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_meetDay4_radio" value="4" name="group_3_meetDay_radio" data-bv-field="d"><span class="text">≤1两</span></label></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
											<div class="wenjuan-food-cell">
												<div class="wenjuan-food-pic" style="background:#e4774c;">
													<img src="../dep/img/fash.png">
												</div>
												<div class="wenjuan-food-name">
													<h2 class="ellipsis">鱼类或其他水产品：虾、蟹</h2> [ 1副扑克牌大小≈2两 ]
												</div>
												<div class="wenjuan-food-select">
													<div class="d-food-rate-show d-food-week">
														<em id="fish_w_i">每周</em>
														<table>
															<tbody>
																<tr>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_apWeek1_radio" value="1" name="group_3_apWeek_radio" data-bv-field="d"><span class="text">5-7天</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_apWeek2_radio" value="2" name="group_3_apWeek_radio" data-bv-field="d"><span class="text">3-4天</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_apWeek3_radio" value="3" name="group_3_apWeek_radio" data-bv-field="d"><span class="text">1-2天</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_apWeek4_radio" value="4" name="group_3_apWeek_radio" data-bv-field="d"><span class="text">1天或不吃</span></label></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="d-food-rate-show d-food-day">
														<em id="fish_d_i">每天</em>
														<table>
															<tbody>
																<tr>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_apDay1_radio" value="1" name="group_3_apDay_radio" data-bv-field="d"><span class="text">8两</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_apDay2_radio" value="2" name="group_3_apDay_radio" data-bv-field="d"><span class="text">5-8两</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_apDay3_radio" value="3" name="group_3_apDay_radio" data-bv-field="d"><span class="text">2-4两</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_apDay4_radio" value="4" name="group_3_apDay_radio" data-bv-field="d"><span class="text">≤1两</span></label></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
											<div class="wenjuan-food-cell">
												<div class="wenjuan-food-pic" style="background:#31ad77;">
													<img src="../dep/img/egg.png">
												</div>
												<div class="wenjuan-food-name">
													<h2 class="ellipsis">蛋类及其制品</h2> [ 1个鸡蛋≈1两 ]
												</div>
												<div class="wenjuan-food-select">
													<div class="d-food-rate-show d-food-week">
														<em id="egg_w_i">每周</em>
														<table>
															<tbody>
																<tr>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_eggWeek1_radio" value="1" name="group_3_eggWeek_radio" data-bv-field="d"><span class="text">5-7天</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_eggWeek2_radio" value="2" name="group_3_eggWeek_radio" data-bv-field="d"><span class="text">3-4天</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_eggWeek3_radio" value="3" name="group_3_eggWeek_radio" data-bv-field="d"><span class="text">1-2天</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_eggWeek4_radio" value="4" name="group_3_eggWeek_radio" data-bv-field="d"><span class="text">1天或不吃</span></label></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="d-food-rate-show d-food-day">
														<em id="egg_d_i">每天</em>
														<table>
															<tbody>
																<tr>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_eggDay1_radio" value="1" name="group_3_eggDay_radio" data-bv-field="d"><span class="text">8两</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_eggDay2_radio" value="2" name="group_3_eggDay_radio" data-bv-field="d"><span class="text">5-8两</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_eggDay3_radio" value="3" name="group_3_eggDay_radio" data-bv-field="d"><span class="text">2-4两</span></label></td>
																	<td width="150px"><label class="labletab"><input type="radio" id="group_3_eggDay4_radio" value="4" name="group_3_eggDay_radio" data-bv-field="d"><span class="text">≤1两</span></label></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<div class="col-sm-8  col-xs-offset-3 btn-bottm" style="padding-top:25px">
											<button type="button" onclick="next(2)" class=" btn btn-darkorange col-sm-2">上一步</button>
											<button type="button" onclick="next(4)" class=" btn btn-active col-sm-2 col-xs-offset-3">下一步</button>
										</div>
									</div>
								
							</section>
							<section name="section" id="sec4" style="display: none;">
								
									<div class="bancgud row">
										<div class="formfont wjdc_top col-lg-12"><img src="../dep/img/wenjuan.png">
											<span class="No">NO.4</span>
											<span class="inform">个人生活信息</span></div>
										<!--<div class="formfont col-lg-12">四  个人生活信息</div>-->
										<h4 class="block col-lg-12">12.您现在吸烟吗？</h4>
										<div class="col-lg-12">
											<div class="checkbox">
												<label class="col-lg-2"> <input id="group_4_smork1_radio" value="1" onclick="sendHead('13,14,15,16,17,18,19,20,21')" name="group_4_smork_radio" type="radio"  data-bv-field="form-field-checkbox"> <span class="text" checked="">从不吸烟</span>
											</label>
												<label class="col-lg-3"> <input id="group_4_smork2_radio" value="2" onclick="sendHead('13,14,15,16,17,18')" name="group_4_smork_radio" type="radio" class="" data-bv-field="form-field-checkbox"> <span class="text">以前吸，但现在已经戒烟</span>
											</label>
												<label class="col-lg-2"> <input id="group_4_smork3_radio" value="3" onclick="sendHead('')" name="group_4_smork_radio" type="radio" class="" data-bv-field="form-field-checkbox"> <span class="text">吸烟</span>
													</label>
											</div>
										</div>
										<div id="group13">
											<h4 class="block col-lg-12">
	                                    <div  class="">
											13.您开始吸烟的年龄为&nbsp;<span title="" class="tooltip-f">
												<input id="group_4_smorkAge_text" type="text" class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width:50px;text-align:center">
												</span>&nbsp;岁。</span>
										</div>
	                                    </h4>
										</div>
										<div id="group14">
											<h4 class="block col-lg-12">
                                    <div  class="wenjuan-question-tit" >
										14.您开始吸烟离现在有&nbsp;<span title="" class="tooltip-f">
											<input type="text" id="group_4_smorkTime_text" class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width:50px;text-align:center">
											</span>&nbsp;年。</span>
									</div>
                                    </h4>
										</div>
										<div id="group15">
											<h4 class="block col-lg-12">15.您吸烟的频率是</h4>
											<div class="col-lg-12">
												<div class="radio  form-group">
													<label class="col-lg-2"> <input id="group_4_smorkhz1_radio" value="1" name="group_4_smorkhz_radio" type="radio" checked="checked" > <span class="text" checked="">每天吸</span></label>
													<label class="col-lg-2"> <input id="group_4_smorkhz2_radio" value="2" name="group_4_smorkhz_radio" type="radio" class="" > <span class="text">经常吸</span></label>
													<label class="col-lg-2"> <input id="group_4_smorkhz3_radio" value="3" name="group_4_smorkhz_radio" type="radio" class=""> <span class="text">偶尔吸</span></label>
												</div>
											</div>
										</div>
										<div id="group16">
											<h4 class="block col-lg-12">16.当目前为止，您是否已经吸了100支烟？</h4>
											<div class="col-lg-12">
												<div class="radio  form-group">
													<label class="col-lg-2"> <input id="group_4_smorkOneHundred1_radio" value="1" name="group_4_smorkOneHundred_radio" type="radio" checked="checked" > <span class="text" checked="">是</span></label>
													<label class="col-lg-2"> <input id="group_4_smorkOneHundred2_radio" value="2" name="group_4_smorkOneHundred_radio" type="radio" class="" > <span class="text">否</span></label>
												</div>
											</div>
										</div>
										<div id="group17">
											<h4 class="block col-lg-12">17.下列烟草，您通常吸多少？</h4>
											<div class="col-lg-12">
												<table class="table table-striped table-hover table-bordered" id="bodyHtml">
													<thead>
														<tr role="row">
															<th width="10%">
																<label>
                                                      <span><b>烟草类型</b></span>
                                                </label>
															</th>
															<th width="10%">
																<label>
                                                      <span><b>吸烟频率（选择一项）</b></span><br>
                                                </label>
															</th>
															<th width="10%">
																<label>
                                                      <span><b>吸入（支）</b></span><br>
                                                </label>
															</th>
															<th width="10%">
																<label>
                                                      <span><b>烟草类型</b></span>
                                                </label>
															</th>
															<th width="10%">
																<label>
                                                      <span><b>吸烟频率（选择一项）</b></span><br>
                                                </label>
															</th>
															<th width="10%">
																<label>
                                                      <span><b>吸入（支）</b></span><br>
                                                </label>
															</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td width="10%">
																<label>机制卷烟</label>
															</td>
															<td width="15%">
																<div class="radio">
																	<label class="col-lg-6"> <input id="group_4_jyan1_radio" value="1" name="group_4_jyan_radio" type="radio"  > <span class="text" checked="">每天</span></label>
																	<label class="col-lg-6"> <input id="group_4_jyan2_radio" value="2" name="group_4_jyan_radio" type="radio" class="" > <span class="text">每周</span></label>
																</div>
															</td>
															<td width="15%">
																<div class="form-group">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-8"><input type="text" id="group_4_jyanNum_text" class="form-control"></div>
																	<div class="col-lg-2"></div>
																</div>
															</td>
															<td width="5%">
																<label>雪茄</label>
															</td>
															<td width="15%">
																<div class="radio">
																	<label class="col-lg-6"> <input id="group_4_cigar1_radio" value="1" name="group_4_cigar_radio" type="radio"  > <span class="text" checked="">每天</span></label>
																	<label class="col-lg-6"> <input id="group_4_cigar2_radio" value="2" name="group_4_cigar_radio" type="radio" class="" > <span class="text">每周</span></label>
																</div>
															</td>
															<td width="15%">
																<div class="form-group">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-8"><input type="text" id="group_4_cigarNum_text" class="form-control"></div>
																	<div class="col-lg-2"></div>
																</div>
															</td>
														</tr>

														<tr>
															<td width="10%">
																<label>手卷烟</label>
															</td>
															<td width="15%">
																<div class="radio">
																	<label class="col-lg-6"> <input id="group_4_selfCigar1_radio" value="1" name="group_4_selfCigar_radio" type="radio" > <span class="text" checked="">每天</span></label>
																	<label class="col-lg-6"> <input id="group_4_selfCigar2_radio" value="2" name="group_4_selfCigar_radio" type="radio" class="" > <span class="text">每周</span></label>
																</div>
															</td>
															<td width="15%">
																<div class="form-group">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-8"><input id="group_4_selfCigarNum_text" type="text" class="form-control"></div>
																	<div class="col-lg-2"></div>
																</div>
															</td>
															<td width="5%">
																<label>电子烟</label>
															</td>
															<td width="15%">
																<div class="radio">
																	<label class="col-lg-6"> <input id="group_4_eCigar1_radio" value="1" name="group_4_eCigar_radio" type="radio"  > <span class="text" checked="">每天</span></label>
																	<label class="col-lg-6"> <input id="group_4_eCigar2_radio" value="2" name="group_4_eCigar_radio" type="radio" class="" > <span class="text">每周</span></label>
																</div>
															</td>
															<td width="15%">
																<div class="form-group">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-8"><input id="group_4_eCigar_text" type="text" class="form-control"></div>
																	<div class="col-lg-2"></div>
																</div>
															</td>
														</tr>
														<tr>
															<td width="10%">
																<label>旱烟/烟斗</label>
															</td>
															<td width="15%">
																<div class="radio">
																	<label class="col-lg-6"> <input id="group_4_tobacco1_radio" value="1" name="group_4_tobacco_radio" type="radio"  > <span class="text" checked="">每天</span></label>
																	<label class="col-lg-6"> <input id="group_4_tobacco2_radio" value="2" name="group_4_tobacco_radio" type="radio" class="" > <span class="text">每周</span></label>
																</div>
															</td>
															<td width="15%">
																<div class="form-group">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-8"><input id="group_4_tobacco2_text" type="text" class="form-control"></div>
																	<div class="col-lg-2"></div>
																</div>
															</td>
															<td width="5%">
																<label>其它</label>
															</td>
															<td width="15%">
																<div class="radio">
																	<label class="col-lg-6"> <input id="group_4_smorkOther1_radio"  value="1" name="group_4_smorkOther_radio" type="radio" > <span class="text" checked="">每天</span></label>
																	<label class="col-lg-6"> <input id="group_4_smorkOther2_radio"  value="2" name="group_4_smorkOther_radio" type="radio" class="" > <span class="text">每周</span></label>
																</div>
															</td>
															<td width="15%">
																<div class="form-group">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-8"><input id="group_4_smorkOther_text" type="text" class="form-control"></div>
																	<div class="col-lg-2"></div>
																</div>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div id="group18">
											<h4 class="block col-lg-12">
                                <div  class="">
										18.您平均每天吸&nbsp;<span title="" class="tooltip-f">
											<input id="group_4_smorkOneDay_text" type="text" class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width:50px;text-align:center">
											
											</span>&nbsp;支烟（戒烟者填写成功戒烟前的平均吸烟支数）。</span>
									</div>
							</div>
							<div id="group19">
									<h4 class="block col-lg-12">
                                    <div   class="">
										19.您开始戒烟的年龄为&nbsp;<span title="" class="tooltip-f">
											<input id="group_4_smorkQuitAge_text" type="text" class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width:50px;text-align:center">
											</span>&nbsp;岁。</span>
									</div>
							</div>
							<div id="group20">
                                    <h4 class="block col-lg-12">20.您是否有过反复戒烟经历？</h4>
											<div class="col-lg-12">
												<div class="checkbox  form-group">
													<label class="col-lg-2"> <input id="group_4_smorkOverQuit1_radio" value="1" name="group_4_smorkOverQuit_radio" type="radio" class="" > <span class="text">否</span></label>
													<label class="col-lg-2"> <input id="group_4_smorkOverQuit2_radio" value="2" name="group_4_smorkOverQuit_radio" type="radio" class="" > <span class="text">是</span></label>
												</div>
											</div>
										</div>
										<div id="group21">
											<h4 class="block col-lg-12">21.您戒烟的最主要原因是？</h4>
											<div class="col-lg-12">
												<div class="radio  form-group">
													<label class="col-lg-2"> <input id="group_4_smorkQuitMain1_radio" value="1" name="group_4_smorkQuitMain_radio" type="radio"  > <span class="text">身有疾患</span></label>
													<label class="col-lg-2"> <input id="group_4_smorkQuitMain2_radio" value="2" name="group_4_smorkQuitMain_radio" type="radio" class="" > <span class="text">未来健康考虑</span></label>
													<label class="col-lg-2"> <input id="group_4_smorkQuitMain3_radio" value="3" name="group_4_smorkQuitMain_radio" type="radio" class="" > <span class="text">家人反对</span></label>
													<label class="col-lg-2"> <input id="group_4_smorkQuitMain4_radio" value="4" name="group_4_smorkQuitMain_radio" type="radio" class="" > <span class="text">医生建议</span></label>
													<label class="col-lg-2"> <input id="group_4_smorkQuitMain5_radio" value="5" name="group_4_smorkQuitMain_radio" type="radio" class="" > <span class="text">其它</span></label>

												</div>
											</div> </div>
											<h4 class="block col-lg-12">22.和您一起生活或工作的人中是否有人吸烟？</h4>
											<div class="col-lg-6">
												<div class="radio  form-group">
													<label> <input id="group_4_drink1_radio" value="1" name="group_4_drink_radio" type="radio"  > <span class="text">是</span></label>
													<label class=""> <input id="group_4_drink2_radio" value="2" name="group_4_drink_radio" type="radio" class="" > <span class="text">否</span></label>
												</div>
											</div>
											<h4 class="block col-lg-12">23.您是否经常吸入吸烟者呼出的烟雾(被动吸烟)超过15分钟/天？</h4>
											<div class="col-lg-10">
												<div class="radio  form-group">
													<label> <input value="1" id="group_4_drinkDay1_radio" name="group_4_drinkDay_radio" type="radio"  > <span class="text">几乎每天</span></label>
													<label> <input value="2" id="group_4_drinkDay2_radio" name="group_4_drinkDay_radio" type="radio" class="" > <span class="text">平均每周4~5天</span></label>
													<label> <input value="3" id="group_4_drinkDay3_radio" name="group_4_drinkDay_radio" type="radio"  > <span class="text">平均每周1~3天</span></label>
													<label> <input value="4" id="group_4_drinkDay4_radio" name="group_4_drinkDay_radio" type="radio" class="" > <span class="text">否</span></label>
													<label> <input value="5" id="group_4_drinkDay5_radio" name="group_4_drinkDay_radio" type="radio"  > <span class="text">是（继续回答第24题）</span></label>
												</div>
											</div>
											
												<h4 class="block col-lg-12">24.您喝过酒吗？</h4>
												<div class="col-lg-10">
													<div class="radio  form-group">
														<label> <input onclick="showdrink43()" value="1" id="group_4_beforeDrink1_radio" name="group_4_beforeDrink_radio" type="radio"  > <span class="text">喝过酒</span></label>
														<label class=""> <input onclick="drink43()"  value="2" id="group_4_beforeDrink2_radio" name="group_4_beforeDrink_radio" type="radio" class="" > <span class="text">从来不喝（跳到35题）</span></label>
													</div>
												</div>
										<div class="que_end_43">	
												<h4 class="block col-lg-12">25.近1个月是否喝酒？</h4>
												<div class="col-lg-10">
													<div class="radio  form-group">
														<label> <input value="1" id="group_4_beforeMonthDrink1_radio" name="group_4_beforeMonthDrink_radio" type="radio"  > <span class="text">是</span></label>
														<label> <input value="2" id="group_4_beforeMonthDrink2_radio" name="group_4_beforeMonthDrink_radio" type="radio" class="" > <span class="text">否</span></label>
													</div>
												</div>
												<h4 class="block col-lg-12">26.在过去的1年，您一般多长时间喝一次酒？</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input value="1" id="group_4_beforeYearDrink1_radio" name="group_4_beforeYearDrink_radio" type="radio"  > <span class="text">几乎每天2次</span></label>
														<label class="col-lg-2"> <input value="2" id="group_4_beforeYearDrink2_radio" name="group_4_beforeYearDrink_radio" type="radio" class="" > <span class="text">几乎每天1次</span></label>
														<label class="col-lg-2"> <input value="3" id="group_4_beforeYearDrink3_radio" name="group_4_beforeYearDrink_radio" type="radio"  > <span class="text">每周3-4次</span></label>
														<label class="col-lg-2"> <input value="4" id="group_4_beforeYearDrink4_radio" name="group_4_beforeYearDrink_radio" type="radio" class="" > <span class="text">每周1-2次</span></label>
														<label class="col-lg-3"> <input value="5" id="group_4_beforeYearDrink5_radio" name="group_4_beforeYearDrink_radio" type="radio"  > <span class="text">每周至少一次（跳至第46题）</span></label>
														<label class="col-lg-1"> <input value="6" id="group_4_beforeYearDrink6_radio" name="group_4_beforeYearDrink_radio" type="radio" class="" > <span class="text">否</span></label>
													</div>
												</div>
												<h4 class="block col-lg-12">
                                    <div class="">
										27.您从&nbsp;<span title="" class="tooltip-f">
											<input id="group_4_startDrink_text" type="text" class="textbox-text validatebox-text textbox-prompt" autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width:50px;text-align:center">
											</span>&nbsp;岁开始，每周都饮酒。</span>
									</div>
									<h4 class="block col-lg-12">28.您饮酒时的饮酒种类和次饮酒量是？</h4>
												<div class="col-lg-12">
													<table class="table table-striped table-hover table-bordered" id="bodyHtml">
														<thead>
															<tr role="row">
																<th width="5%">
																	<label>
                                                      <span><b>类型</b></span>
                                                </label>
																</th>
																<th width="10%">
																	<label>
                                                      <span><b>通常情况</b></span><br>
                                                       <span style="color:#aaa">（仅选择一种）</span>
                                                </label>
																</th>
																<th width="10%">
																	<label>
                                                      <span><b>特殊日子</b></span><br>
                                                     <span style="color:#aaa">（如宴请、聚会、需大量饮酒）</span>
                                                </label>
																</th>
																<th width="16%">
																	<label>
                                                      <span><b>最近一次</b></span>
                                                </label>
																</th>

															</tr>
														</thead>
														<tbody>
															<tr>
																<td width="15%">
																	<label>
                                                  <span> 啤酒（1大瓶=2小瓶） </span>
                                               </label>
																</td>
																<td width="15%">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-7"><input type="text" id="group_4_beerDrink_text" class="form-control"></div>
																	<label style="line-height:30px">大瓶</label>
																</td>
																<td width="15%">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-7"><input type="text" id="group_4_beerSpecialDrink_text" class="form-control"></div>
																	<label style="line-height:30px">大瓶</label>
																</td>
																<td width="15%">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-7"><input type="text" id="group_4_beerlastDrink_text" class="form-control"></div>
																	<label style="line-height:30px">大瓶</label>
																</td>

															</tr>
															<tr>
																<td width="15%">
																	<label>
                                                        <span class="text">米酒或黄酒</span>
                                                    </label>
																</td>
																<td width="15%">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-7"><input type="text" id="group_4_riceWineDrink_text" class="form-control"></div>
																	<label style="line-height:30px">两</label>
																</td>
																<td width="15%">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-7"><input type="text" id="group_4_riceWineSpecialDrink_text" class="form-control"></div>
																	<label style="line-height:30px">两</label>
																</td>
																<td width="15%">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-7"><input type="text" id="group_4_riceWinelastDrink_text" class="form-control"></div>
																	<label style="line-height:30px">两</label>
																</td>

															</tr>
															<tr>
																<td width="15%">
																	<label style="line-height:30px">葡萄酒</label>
																</td>
																<td width="15%">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-7"><input id="group_4_grapeDrink_text" type="text" class="form-control"></div>
																	<label style="line-height:30px">两</label>
																</td>
																<td width="15%">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-7"><input id="group_4_grapeSpecialDrink_text" type="text" class="form-control"></div>
																	<label style="line-height:30px">两</label>
																</td>
																<td width="15%">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-7"><input id="group_4_grapelastDrink_text" type="text" class="form-control"></div>
																	<label style="line-height:30px">两</label>
																</td>
															</tr>
															<tr>
																<td width="5%">
																	<label>
                                                        <span class="text">白酒（>=50度）</span>
                                                    </label>
																</td>
																<td width="15%">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-7"><input id="group_4_whiteDrink_text" type="text" class="form-control"></div>
																	<label style="line-height:30px">两</label>
																</td>
																<td width="15%">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-7"><input id="group_4_whiteSpecialDrink_text" type="text" class="form-control"></div>
																	<label style="line-height:30px">两</label>
																</td>
																<td width="15%">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-7"><input id="group_4_whitelastDrink_text" type="text" class="form-control"></div>
																	<label style="line-height:30px">两</label>
																</td>

															</tr>
															<tr>
																<td width="5%">
																	<label>
                                                       <span class="text">白酒（<50度）</span>
                                                    </label>
																</td>
																<td width="10%">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-7"><input id="group_4_hwhiteDrink_text" type="text" class="form-control"></div>
																	<label style="line-height:30px">两</label>
																</td>
																<td width="10%">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-7"><input id="group_4_hwhiteSpecialDrink_text" type="text" class="form-control"></div>
																	<label style="line-height:30px">两</label>
																</td>
																<td width="8%">
																	<div class="col-lg-2"></div>
																	<div class="col-lg-7"><input id="group_4_hwhitelastDrink_text" type="text" class="form-control"></div>
																	<label style="line-height:30px">两</label>
																</td>

															</tr>

														</tbody>
													</table>
												</div>
												<h4 class="block col-lg-12">29.通常您的饮酒方式是？</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input id="group_4_drinkStyle1_radio" value="1" name="group_4_drinkStyle_radio" type="radio"  > <span class="text">吃饭时饮酒</span></label>
														<label class="col-lg-2"> <input id="group_4_drinkStyle2_radio" value="2" name="group_4_drinkStyle_radio" type="radio" class="" > <span class="text">饭间或饭后饮酒</span></label>
														<label class="col-lg-2"> <input id="group_4_drinkStyle3_radio" value="3" name="group_4_drinkStyle_radio" type="radio"  > <span class="text">没有规律</span></label>
													</div>
												</div>
												<h4 class="block col-lg-12">30.您饮酒后是否感觉浑身发热或头晕？</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input value="1" id="group_4_drinkReaction1_radio" name="group_4_drinkReaction_radio" type="radio"  > <span class="text">是，喝第一口就开始</span></label>
														<label class="col-lg-2"> <input value="2" id="group_4_drinkReaction2_radio" name="group_4_drinkReaction_radio" type="radio" class="" > <span class="text">是，喝少量酒后开始</span></label>
														<label class="col-lg-2"> <input value="3" id="group_4_drinkReaction3_radio" name="group_4_drinkReaction_radio" type="radio"  > <span class="text">是，喝大量酒才开始</span></label>
														<label class="col-lg-2"> <input value="4" id="group_4_drinkReaction4_radio" name="group_4_drinkReaction_radio" type="radio"  > <span class="text">否</span></label>

													</div>
												</div>
												<h4 class="block col-lg-12">31.近1个月，您在早晨饮酒的频率是：</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input value="1" id="group_4_drinkMonthMorning1_radio" name="group_4_drinkMonthMorning_radio" type="radio"  > <span class="text">从不</span></label>
														<label cclass="col-lg-2"> <input value="2" id="group_4_drinkMonthMorning2_radio" name="group_4_drinkMonthMorning_radio" type="radio" class="" > <span class="text">每周至少1天</span></label>
														<label class="col-lg-2"> <input value="3" id="group_4_drinkMonthMorning3_radio" name="group_4_drinkMonthMorning_radio" type="radio"  > <span class="text">每周有几天</span></label>
														<label class="col-lg-2"> <input value="4" id="group_4_drinkMonthMorning4_radio" name="group_4_drinkMonthMorning_radio" type="radio"  > <span class="text">每天或者几乎每天</span></label>
													</div>
												</div>
												<h4 class="block col-lg-12">32.近1个月，您是否有以下经历：</h4>
												<div class="col-lg-12">
													<div class="radio  ">
														<div class="form-group">
															<label class="col-lg-4"><span class="text">a.因为饮酒无法工作，或无法做任何事情？</span></label>
															<label class="col-lg-2"> <input value="1" id="group_4_drinkForNoWork1_radio" name="group_4_drinkForNoWork_radio" type="radio"  > <span class="text">是</span></label>
															<label class="col-lg-2"> <input value="2" id="group_4_drinkForNoWork2_radio" name="group_4_drinkForNoWork_radio" type="radio"  > <span class="text">否</span></label>
														</div>
														<div class="form-group">
															<label class="col-lg-4"><span class="text">b.饮酒后感觉沮丧、愤怒而无法控制自己？</span></label>
															<label class="col-lg-2"> <input value="1" id="group_4_drinkForFree1_radio" name="group_4_drinkForFree_radio" type="radio"  > <span class="text">是</span></label>
															<label class="col-lg-2"> <input value="2" id="group_4_drinkForFree2_radio" name="group_4_drinkForFree_radio" type="radio"  > <span class="text">否</span></label>
														</div>
														<div class="form-group">
															<label class="col-lg-4"><span class="text">c.无法停止饮酒？</span></label>
															<label class="col-lg-2"> <input value="1" id="group_4_drinkNoStop1_radio" name="group_4_drinkNoStop_radio" type="radio"  > <span class="text">是</span></label>
															<label class="col-lg-2"><input  value="2" id="group_4_drinkNoStop2_radio" name="group_4_drinkNoStop_radio" type="radio"  > <span class="text">否</span></label>
														</div>
														<div class='form-group'>
															<label class="col-lg-4"><span class="text">d.停止饮酒后震颤？</span></label>
															<label class="col-lg-2"> <input value="1" id="group_4_drinkTremble1_radio" name="group_4_drinkTremble_radio" type="radio"  > <span class="text">是</span></label>
															<label class="col-lg-2"> <input value="2" id="group_4_drinkTremble2_radio" name="group_4_drinkTremble_radio" type="radio"  > <span class="text">否</span></label>
														</div>
													</div>
												</div>
												<h4 class="block col-lg-12">33.您经常喝醉吗？ </h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input value="1" id="group_4_liquor1_radio" name="group_4_liquor_radio" type="radio"  > <span class="text">几乎每天1次</span></label>
														<label class="col-lg-2"> <input value="2" id="group_4_liquor2_radio" name="group_4_liquor_radio" type="radio" class="" > <span class="text">每周1次</span></label>
														<label class="col-lg-2"> <input value="3" id="group_4_liquor3_radio" name="group_4_liquor_radio" type="radio"  > <span class="text">每周有几天</span></label>
														<label class="col-lg-2"> <input value="4" id="group_4_liquor4_radio" name="group_4_liquor_radio" type="radio"  > <span class="text">每天或者几乎每天</span></label>
													</div>
												</div>
												<h4 class="block col-lg-12">34.与几年前比，您的饮酒量的变化？</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input value="1" id="group_4_capacityUp1_radio" name="group_4_capacityUp_radio" type="radio"  > <span class="text">几乎没有变化</span></label>
														<label class="col-lg-2"> <input value="2" id="group_4_capacityUp2_radio" name="group_4_capacityUp_radio" type="radio" class="" > <span class="text">大大增加</span></label>
														<label class="col-lg-2"> <input value="3" id="group_4_capacityUp3_radio" name="group_4_capacityUp_radio" type="radio"  > <span class="text">大大减少</span></label>
													</div>
												</div>
										</div>
												<h4 class="block col-lg-12">35.过去一个月，您的总体睡眠质量如何？</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input value="1" id="group_4_sleepMain1_radio" name="group_4_sleepMain_radio" type="radio"  > <span class="text">非常好</span></label>
														<label class="col-lg-2"> <input value="2" id="group_4_sleepMain2_radio" name="group_4_sleepMain_radio" type="radio" class="" > <span class="text">尚好</span></label>
														<label class="col-lg-2"> <input value="3" id="group_4_sleepMain3_radio" name="group_4_sleepMain_radio" type="radio"  > <span class="text">不好</span></label>
														<label class="col-lg-2"> <input value="4" id="group_4_sleepMain4_radio" name="group_4_sleepMain_radio" type="radio"  > <span class="text">非常差</span></label>
													</div>
												</div>
												<h4 class="block col-lg-12">36.过去一个月您每天平均的实际睡眠时间有
				                                    <select id="group_4_sleepEven_select" style="padding:0 12px">
				                                    	<option value="1">1</option>
				                                    	<option value="2">2</option>
				                                    	<option value="3">3</option>
				                                    	<option value="4">4</option>
				                                    	<option value="5">5</option>
				                                    	<option value="6">6</option>
				                                    	<option value="7">7</option>
				                                    	<option value="8">8</option>
				                                    	<option value="9">9</option>
				                                    	<option value="10">10</option>
				                                    </select>
				                                   		 小时
				                                 </h4>

												<h4 class="block col-lg-12">37.过去一个月，您是否要服药（包括医生开的处方和自购药物）才能入睡？</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input value="1" id="group_4_sleepMonthByDrug1_radio" name="group_4_sleepMonthByDrug_radio" type="radio"  > <span class="text">不用服用</span></label>
														<label class="col-lg-2"> <input value="2" id="group_4_sleepMonthByDrug2_radio" name="group_4_sleepMonthByDrug_radio" type="radio" class="" > <span class="text">平均每周不足1次</span></label>
														<label class="col-lg-2"> <input value="3" id="group_4_sleepMonthByDrug3_radio" name="group_4_sleepMonthByDrug_radio" type="radio"  > <span class="text">平均每周1或2次</span></label>
														<label class="col-lg-2"> <input value="4" id="group_4_sleepMonthByDrug4_radio" name="group_4_sleepMonthByDrug_radio" type="radio"  > <span class="text">平均每周3次或更多</span></label>
													</div>
												</div>
												<h4 class="block col-lg-12">38.过去一个月，您是否有过多梦或易惊醒？ </h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input value="1" id="group_4_sleepLightly1_radio" name="group_4_sleepLightly_radio" type="radio"  > <span class="text">是</span></label>
														<label class="col-lg-2"> <input value="2" id="group_4_sleepLightly2_radio" name="group_4_sleepLightly_radio" type="radio" class="" > <span class="text">否</span></label>
													</div>
												</div>
												<h4 class="block col-lg-12">39.我很快乐</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input value="1" id="group_4_IFreeHappy1_radio" name="group_4_IFreeHappy_radio" type="radio"  > <span class="text">完全不符合</span></label>
														<label class="col-lg-2"> <input value="2" id="group_4_IFreeHappy2_radio" name="group_4_IFreeHappy_radio" type="radio" class="" > <span class="text">比较不符合</span></label>
														<label class="col-lg-2"> <input value="3" id="group_4_IFreeHappy3_radio" name="group_4_IFreeHappy_radio" type="radio"  > <span class="text">一般</span></label>
														<label class="col-lg-2"> <input value="4" id="group_4_IFreeHappy4_radio" name="group_4_IFreeHappy_radio" type="radio"  > <span class="text">比较符合</span></label>
														<label class="col-lg-2"> <input value="5" id="group_4_IFreeHappy5_radio" name="group_4_IFreeHappy_radio" type="radio"  > <span class="text">完全符合</span></label>
													</div>
												</div>
												<h4 class="block col-lg-12">40.我对未来充满希望</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input value="1" id="group_4_IForHope1_radio" name="group_4_IForHope_radio" type="radio"  > <span class="text">完全不符合</span></label>
														<label class="col-lg-2"> <input value="2" id="group_4_IForHope2_radio" name="group_4_IForHope_radio" type="radio" class="" > <span class="text">比较不符合</span></label>
														<label class="col-lg-2"> <input value="3" id="group_4_IForHope3_radio" name="group_4_IForHope_radio" type="radio"  > <span class="text">一般</span></label>
														<label class="col-lg-2"> <input value="4" id="group_4_IForHope4_radio" name="group_4_IForHope_radio" type="radio"  > <span class="text">比较符合</span></label>
														<label class="col-lg-2"> <input value="5" id="group_4_IForHope5_radio" name="group_4_IForHope_radio" type="radio"  > <span class="text">完全符合</span></label>
													</div>
												</div>
												<h4 class="block col-lg-12">41.即使家人或朋友帮助，我也不能摆脱忧伤</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input value="1" id="group_4_distressed1_radio" name="group_4_distressed_radio" type="radio"  > <span class="text">完全不符合</span></label>
														<label class="col-lg-2"> <input value="2" id="group_4_distressed2_radio" name="group_4_distressed_radio" type="radio" class="" > <span class="text">比较不符合</span></label>
														<label class="col-lg-2"> <input value="3" id="group_4_distressed3_radio" name="group_4_distressed_radio" type="radio"  > <span class="text">一般</span></label>
														<label class="col-lg-2"> <input value="4" id="group_4_distressed4_radio" name="group_4_distressed_radio" type="radio"  > <span class="text">比较符合</span></label>
														<label class="col-lg-2"> <input value="5" id="group_4_distressed5_radio" name="group_4_distressed_radio" type="radio"  > <span class="text">完全符合</span></label>
													</div>
												</div>
												<h4 class="block col-lg-12">42.我感觉孤独</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input value="1" id="group_4_lonely1_radio" name="group_4_lonely_radio" type="radio"  > <span class="text">完全不符合</span></label>
														<label class="col-lg-2"> <input value="2" id="group_4_lonely2_radio" name="group_4_lonely_radio" type="radio"  > <span class="text">比较不符合</span></label>
														<label class="col-lg-2"> <input value="3" id="group_4_lonely3_radio" name="group_4_lonely_radio" type="radio"  > <span class="text">一般</span></label>
														<label class="col-lg-2"> <input value="4" id="group_4_lonely4_radio" name="group_4_lonely_radio" type="radio"  > <span class="text">比较符合</span></label>
														<label class="col-lg-2"> <input value="5" id="group_4_lonely5_radio" name="group_4_lonely_radio" type="radio"  > <span class="text">完全符合</span></label>
													</div>
												</div>
												
												<div class="question_43">
													<h4 class="block col-lg-12">43.我经常感觉压抑或沮丧</h4>
													<div class="col-lg-12">
														<div class="radio  form-group">
															<label class="col-lg-2"> <input value="1" id="group_4_depress1_radio" name="group_4_depress_radio" type="radio"  > <span class="text">完全不符合</span></label>
															<label class="col-lg-2"> <input value="2" id="group_4_depress2_radio" name="group_4_depress_radio" type="radio" class="" > <span class="text">比较不符合</span></label>
															<label class="col-lg-2"> <input value="3" id="group_4_depress3_radio" name="group_4_depress_radio" type="radio"  > <span class="text">一般</span></label>
															<label class="col-lg-2"> <input value="4" id="group_4_depress4_radio" name="group_4_depress_radio" type="radio"  > <span class="text">比较符合</span></label>
															<label class="col-lg-2"> <input value="5" id="group_4_depress5_radio" name="group_4_depress_radio" type="radio"  > <span class="text">完全符合</span></label>
														</div>
													</div>
										</div>
										
										
										<div id="neverDrink">
													<h4 class="block col-lg-12">44.我容易情绪激动</h4>
													<div class="col-lg-12">
														<div class="radio  form-group">
															<label class="col-lg-2"> <input value="1" id="group_4_rage1_radio" name="group_4_rage_radio" type="radio"  > <span class="text">完全不符合</span></label>
															<label class="col-lg-2"> <input value="2" id="group_4_rage2_radio" name="group_4_rage_radio" type="radio"  > <span class="text">比较不符合</span></label>
															<label class="col-lg-2"> <input value="3" id="group_4_rage3_radio" name="group_4_rage_radio" type="radio"  > <span class="text">一般</span></label>
															<label class="col-lg-2"> <input value="4" id="group_4_rage4_radio" name="group_4_rage_radio" type="radio"  > <span class="text">比较符合</span></label>
															<label class="col-lg-2"> <input value="5" id="group_4_rage5_radio" name="group_4_rage_radio" type="radio"  > <span class="text">完全符合</span></label>
														</div>
													</div>
													<h4 class="block col-lg-12">45.我生活很紧张</h4>
													<div class="col-lg-12">
														<div class="radio  form-group">
															<label class="col-lg-2"> <input value="1" id="group_4_strain1_radio" name="group_4_strain_radio" type="radio"  > <span class="text">完全不符合</span></label>
															<label class="col-lg-2"> <input value="2" id="group_4_strain2_radio" name="group_4_strain_radio" type="radio" class="" > <span class="text">比较不符合</span></label>
															<label class="col-lg-2"> <input value="3" id="group_4_strain3_radio" name="group_4_strain_radio" type="radio"  > <span class="text">一般</span></label>
															<label class="col-lg-2"> <input value="4" id="group_4_strain4_radio" name="group_4_strain_radio" type="radio"  > <span class="text">比较符合</span></label>
															<label class="col-lg-2"> <input value="5" id="group_4_strain5_radio" name="group_4_strain_radio" type="radio"  > <span class="text">完全符合</span></label>
														</div>
													</div>
													<div class="question_46">
														<h4 class="block col-lg-12">46.最近一年，您感觉压力对健康的影响程度有多大？</h4>
														<div class="col-lg-12">
															<div class="radio  form-group">
																<label class="col-lg-2"> <input value="1" id="group_4_stressForWell1_radio" name="group_4_stressForWell_radio" type="radio"  > <span class="text">很大</span></label>
																<label class="col-lg-2"> <input value="2" id="group_4_stressForWell2_radio" name="group_4_stressForWell_radio" type="radio" class="" > <span class="text">有些</span></label>
																<label class="col-lg-2"> <input value="3" id="group_4_stressForWell3_radio" name="group_4_stressForWell_radio" type="radio"  > <span class="text">几乎没有</span></label>
																<label class="col-lg-2"> <input value="4" id="group_4_stressForWell4_radio" name="group_4_stressForWell_radio" type="radio"  > <span class="text">没有</span></label>
															</div>
														</div>

														<h4 class="block col-lg-12">47.与同龄人相比，您认为您整体的身体健康状况如何？</h4>
														<div class="col-lg-12">
															<div class="radio  form-group">
																<label class="col-lg-2"> <input value="1" id="group_4_wellHealthForPeer1_radio" name="group_4_wellHealthForPeer_radio" type="radio"  > <span class="text">非常好</span></label>
																<label class="col-lg-2"> <input value="2" id="group_4_wellHealthForPeer2_radio" name="group_4_wellHealthForPeer_radio" type="radio" class="" > <span class="text">很好</span></label>
																<label class="col-lg-2"> <input value="3" id="group_4_wellHealthForPeer3_radio" name="group_4_wellHealthForPeer_radio" type="radio"  > <span class="text">好</span></label>
																<label class="col-lg-2"> <input value="4" id="group_4_wellHealthForPeer4_radio" name="group_4_wellHealthForPeer_radio" type="radio"  > <span class="text">一般</span></label>
																<label class="col-lg-2"> <input value="5" id="group_4_wellHealthForPeer5_radio" name="group_4_wellHealthForPeer_radio" type="radio"  > <span class="text">差</span></label>
															</div>
														</div>
														<h4 class="block col-lg-12">48.在过去的一年中，您认为您工作和生活中的精神压力大吗？ </h4>
														<div class="col-lg-12">
															<div class="radio  form-group">
																<label class="col-lg-2"> <input value="1" id="group_4_mentalStressYear1_radio" name="group_4_mentalStressYear_radio" type="radio"  > <span class="text">没有压力</span></label>
																<label class="col-lg-2"> <input value="2" id="group_4_mentalStressYear2_radio" name="group_4_mentalStressYear_radio" type="radio" class="" > <span class="text">压力较少</span></label>
																<label class="col-lg-2"> <input value="3" id="group_4_mentalStressYear3_radio" name="group_4_mentalStressYear_radio" type="radio"  > <span class="text">一般</span></label>
																<label class="col-lg-2"> <input value="4" id="group_4_mentalStressYear4_radio" name="group_4_mentalStressYear_radio" type="radio"  > <span class="text">压力较大</span></label>
																<label class="col-lg-2"> <input value="5" id="group_4_mentalStressYear5_radio" name="group_4_mentalStressYear_radio" type="radio"  > <span class="text">压力极大</span></label>
															</div>
														</div>
														<h4 class="block col-lg-12">49.您目前是否从事以下职业1年或以上？ </h4>
														<div class="col-lg-12">
															<div class="radio  form-group">
																<label> <input value="1" id="group_4_professionYear1_radio" name="group_4_professionYear_radio" type="radio"  > <span class="text">金属冶炼</span></label>
																<label> <input value="2" id="group_4_professionYear2_radio" name="group_4_professionYear_radio" type="radio" class="" > <span class="text">煤矿开采</span></label>
																<label> <input value="3" id="group_4_professionYear3_radio" name="group_4_professionYear_radio" type="radio"  > <span class="text">隧道开挖</span></label>
																<label> <input value="4" id="group_4_professionYear4_radio" name="group_4_professionYear_radio" type="radio"  > <span class="text">石化</span></label>
																<label> <input value="5" id="group_4_professionYear5_radio" name="group_4_professionYear_radio" type="radio"  > <span class="text">石棉生产</span></label>
																<label> <input value="6" id="group_4_professionYear6_radio" name="group_4_professionYear_radio" type="radio"  > <span class="text">中餐厨师</span></label>
																<label> <input value="7" id="group_4_professionYear7_radio" name="group_4_professionYear_radio" type="radio"  > <span class="text">无</span></label>
															</div>
														</div>
													</div>
												</div>
											</div>
											
											<div class="col-sm-8  col-xs-offset-3 btn-bottm" style="padding-top:25px">
												<button onclick="next(3)" type="button" class=" btn btn-darkorange col-sm-2">上一步</button>
												<button type="button" class=" btn btn-active col-sm-2 col-xs-offset-3">下一步</button>
											</div>
										</div>
									</section>
									<section name="section" id="sec5" style="display:block;">
										<div class="bancgud row">
											<div class="formfont wjdc_top col-lg-12"><img src="../dep/img/wenjuan.png">
												<span class="No">NO.5</span>
												<span class="inform">个人运动信息</span></div>
											<div>
												<h4 class="block col-lg-12">50.在您的工作、农活及家务活动中，有没有高强度活动，并且活动时间持续10分钟以上？（运重物、挖掘等需要付出较大体力，或引起呼吸、心跳显著增加的活动）</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input onclick=es('1') name="work" type="radio"  > <span class="text">有</span></label>
														<label class="col-lg-2"> <input onclick=es('51,52,53,54,55,56') name="work" type="radio" class="" > <span class="text">没有（跳到第56题）</span></label>
													</div>
												</div>
											</div>
											<div id="part51">
												<h4 class="block col-lg-12">51.在您的工作、农活及家务活动中，通常一周内您进行高强度活动的情况是？</h4>
												<div class="col-lg-12 ">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tbody class="form-group">
															<tr>
																<td width="15"></td>
																<td width="180" title="" class="tooltip-f">每周&nbsp;
																	<select autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">
																		<option>1</option>
																		<option>2</option>
																		<option>3</option>
																		<option>4</option>
																		<option>5</option>
																		<option>6</option>
																		<option>7</option>
																	</select>
																	</span>&nbsp;天</td>
																<td width="360" title="" class="tooltip-f">每天&nbsp;
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;小时
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;分钟
																</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div id="part52">
												<h4 class="block col-lg-12">52.其中进行高强度家务活动有几天？每天累计有多长时间？</h4>
												<div class="col-lg-12">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td width="15"></td>
																<td width="180" title="" class="tooltip-f">每周&nbsp;
																	<select autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">
																		<option>1</option>
																		<option>2</option>
																		<option>3</option>
																		<option>4</option>
																		<option>5</option>
																		<option>6</option>
																		<option>7</option>
																	</select>
																	</span>&nbsp;天</td>
																<td width="360" title="" class="tooltip-f">每天&nbsp;
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;小时
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;分钟
																</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div id="part53">
												<h4 class="block col-lg-12">53.在您的工作、农活及家务活动中，有没有中等强度活动，并且活动时间持续10分钟以上？</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input name="jw" type="radio"  > <span class="text">有</span></label>
														<label class="col-lg-2"> <input name="jw" type="radio" class="" > <span class="text">没有（跳到第59题）</span></label>
													</div>
												</div>
											</div>
											<div id="part54">
												<h4 class="block col-lg-12">54.在您的工作、农活及家务活动中，通常一周内您进行中等强度活动的情况是？</h4>
												<div class="col-lg-12">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td width="15"></td>
																<td width="180" title="" class="tooltip-f">每周&nbsp;
																	<select autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">
																		<option>1</option>
																		<option>2</option>
																		<option>3</option>
																		<option>4</option>
																		<option>5</option>
																		<option>6</option>
																		<option>7</option>
																	</select>
																	</span>&nbsp;天</td>
																<td width="360" title="" class="tooltip-f">每天&nbsp;
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;小时
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;分钟
																</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div id="part55">
												<h4 class="block col-lg-12">55.其中进行中等强度家务活动有几天？每天累计有多长时间？</h4>
												<div class="col-lg-12">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td width="15"></td>
																<td width="180" title="" class="tooltip-f">每周&nbsp;
																	<select autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">
																		<option>1</option>
																		<option>2</option>
																		<option>3</option>
																		<option>4</option>
																		<option>5</option>
																		<option>6</option>
																		<option>7</option>
																	</select>
																	</span>&nbsp;天</td>
																<td width="360" title="" class="tooltip-f">每天&nbsp;
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;小时
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;分钟
																</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div>
												<h4 class="block col-lg-12">56.您在外出时，有没有步行或骑自行车(至少持续10分钟)的情况？</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input onclick=ea('1') name="ywu" type="radio" class="" > <span class="text">有</span></label>
														<label class="col-lg-2"> <input onclick=ea('57') name="ywu" type="radio"  > <span class="text">没有</span></label>
													</div>
												</div>
											</div>
											<div id="ea57">
												<h4 class="block col-lg-12">57.通常一周内，您外出时步行或骑自行车(至少持续10分钟)的情况是？</h4>
												<div class="col-lg-12">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td width="15"></td>
																<td width="180" title="" class="tooltip-f">每周&nbsp;
																	<select autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">
																		<option>1</option>
																		<option>2</option>
																		<option>3</option>
																		<option>4</option>
																		<option>5</option>
																		<option>6</option>
																		<option>7</option>
																	</select>
																	</span>&nbsp;天</td>
																<td width="360" title="" class="tooltip-f">每天&nbsp;
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;小时
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;分钟
																</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div>
												<h4 class="block col-lg-12">58.您是否进行高强度锻炼或娱乐活动（如长跑、游泳、踢足球等）？</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input onclick=eb('1') name="ball" type="radio"  > <span class="text">有</span></label>
														<label class="col-lg-2"> <input onclick=eb('58,59') name="ball" type="radio" class="" > <span class="text">没有</span></label>
													</div>
												</div>
			
											</div>
											<div id="eb59">
												<h4 class="block col-lg-12">59.通常一周内，您进行上述高强度的锻炼或娱乐活动是？</h4>
												<div class="col-lg-12">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td width="15"></td>
																<td width="180" title="" class="tooltip-f">每周&nbsp;
																	<select autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">
																		<option>1</option>
																		<option>2</option>
																		<option>3</option>
																		<option>4</option>
																		<option>5</option>
																		<option>6</option>
																		<option>7</option>
																	</select>
																	</span>&nbsp;天</td>
																<td width="360" title="" class="tooltip-f">每天&nbsp;
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;小时
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;分钟
																</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div id="eb60">
												<h4 class="block col-lg-12">60.您是否进行持续至少10分钟，引起呼吸、心跳轻度增加的中等强度锻炼或娱乐活动吗？</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input onclick=ec('1') name="ball" type="radio"  > <span class="text">有</span></label>
														<label class="col-lg-2"> <input onclick=ec('61') name="ball" type="radio" class="" > <span class="text">没有</span></label>
													</div>
												</div>
											</div>
											<div id="ec61">
												<h4 class="block col-lg-12">61.通常一周内，您进行上述中等强度的锻炼或娱乐活动是？</h4>
												<div class="col-lg-12">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td width="15"></td>
																<td width="180" title="" class="tooltip-f">每周&nbsp;
																	<select autocomplete="off" placeholder="" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">
																		<option>1</option>
																		<option>2</option>
																		<option>3</option>
																		<option>4</option>
																		<option>5</option>
																		<option>6</option>
																		<option>7</option>
																	</select>
																	</span>&nbsp;天</td>
																<td width="360" title="" class="tooltip-f">每天&nbsp;
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;小时
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;分钟
																</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div>
												<h4 class="block col-lg-12">62.通常一天内，您累计有多少时间坐着、靠着或躺着？</h4>
												<div class="col-lg-12">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td width="15"></td>
																<td width="360" title="" class="tooltip-f">每天&nbsp;
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;小时
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;分钟
																</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div>
												<h4 class="block col-lg-12">63.您在业余时间里，平均每天看电视的时间为多少？</h4>
												<div class="col-lg-12">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td width="15"></td>
																<td width="360" title="" class="tooltip-f">每天&nbsp;
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;小时
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;分钟
																</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
			
											<div>
												<h4 class="block col-lg-12">64.您在业余时间里，平均每天使用电脑的时间为多少？</h4>
												<div class="col-lg-12">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td width="15"></td>
																<td width="360" title="" class="tooltip-f">每天&nbsp;
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;小时
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;分钟
																</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
			
											<div>
												<h4 class="block col-lg-12">65.您在业余时间里，平均每天使用手机的时间为多少？</h4>
												<div class="col-lg-12">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td width="15"></td>
																<td width="360" title="" class="tooltip-f">每天&nbsp;
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;小时
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;分钟
																</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
			
											<div>
												<h4 class="block col-lg-12">66.您在业余时间里，平均每天用于阅读（纸质读物）的时间为多少？</h4>
												<div class="col-lg-12">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td width="15"></td>
																<td width="360" title="" class="tooltip-f">每天&nbsp;
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;小时
																	<input type="text" autocomplete="off" style="margin-left: 0px; margin-right: 0px; padding-top: 2px; padding-bottom: 2px; width: 80px;">&nbsp;分钟
																</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div>
												<h4 class="block col-lg-12">67.近年来，您平均每周进行专门的体育锻炼多少次？</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input name="dl" type="radio"  > <span class="text">3次或以上</span></label>
														<label class="col-lg-2"> <input name="dl" type="radio" class="" > <span class="text">1-2次</span></label>
														<label class="col-lg-2"> <input name="dl" type="radio" class="" > <span class="text"><1次</span></label>
			
													</div>
												</div>
											</div>
											<div>
												<h4 class="block col-lg-12">68.您平均每次持续锻炼的时间是多少分钟？</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input name="dl_time" type="radio"  > <span class="text">>60分钟</span></label>
														<label class="col-lg-2"> <input name="dl_time" type="radio" class="" > <span class="text">30-60分钟 </span></label>
														<label class="col-lg-2"> <input name="dl_time" type="radio" class="" > <span class="text">30-60分钟 </span></label>
			
													</div>
												</div>
											</div>
											<div>
												<h4 class="block col-lg-12">69.您平均每次持续锻炼的时间是多少分钟？</h4>
												<div class="col-lg-12">
													<div class="radio  form-group">
														<label class="col-lg-2"> <input name="ball" type="radio"  > <span class="text">有（继续第62题）</span></label>
														<label class="col-lg-2"> <input name="ball" type="radio" class="" > <span class="text">没有（跳到第63题）</span></label>
													</div>
												</div>
											</div>
											<div>
												<h4 class="block col-lg-12">70.您常用的体育锻炼方式是什么？(多选题)</h4>
												<div class="col-lg-12">
													<div class="checkbox  form-group">
														<label class="col-lg-2"> <input name="cy" type="checkbox"> <span class="text">散步/快走</span></label>
														<label class="col-lg-2"> <input name="cy" type="checkbox" class=""> <span class="text">跑步</span></label>
														<label class="col-lg-2"> <input name="cy" type="checkbox"> <span class="text">游泳</span></label>
														<label class="col-lg-2"> <input name="cy" type="checkbox"> <span class="text">球类</span></label>
														<label class="col-lg-2"> <input name="cy" type="checkbox"> <span class="text">室内健身</span></label>
														<label class="col-lg-2"> <input name="yl" type="checkbox"> <span class="text">其它</span></label>
													</div>
												</div>
											</div>
											<div class="col-sm-8  col-xs-offset-3 btn-bottm" style="padding-top:25px">
												<button type="button" onclick="next(4)" class=" btn btn-darkorange col-sm-2">上一步</button>
												<button type="button" onclick="next(6)" class=" btn btn-active col-sm-2 col-xs-offset-3">下一步</button>
											</div>
			
										</div>
			
								
								</section>
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--Beyond Scripts-->
			<script src="${ctx }/dep/moban/js/skins.min.js"></script>
			<script src="${ctx }/dep/charts/sparkline/jquery.sparkline.js"></script>
			<script src="${ctx }/dep/charts/sparkline/sparkline-init.js"></script>
			<script src="${ctx}/home/member/surveyRepor.js"></script>
			<script type="text/javascript">
				var json = '${result}';
			</script>
	</body>
	<!--  /Body -->

</html>
