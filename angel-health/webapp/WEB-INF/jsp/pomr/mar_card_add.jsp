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
<title>新增用药记录服务</title>
<link rel="shortcut icon" href="${ctx}/dep/moban/img/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="${ctx}/dep/datetimepicker/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="${ctx}/home/card/card.css">
<link rel="stylesheet" href="${ctx}/home/member/server.css">

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
									<span class="widget-caption">新增用药记录列表</span>
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
												<form class="form-horizontal" role="form" method="post"
													action="${ctx }/medicineRecord/save" id="marForm">
													<div class="content">
														<div class="form-group">
															<label for="inputEmail3" class="col-sm-1 control-label ">会员名称<span
																class="help-inline"><font color="red">*</font> </span></label>
															<div class="col-sm-3">
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
														<!--<i class="fa fa-minus idd cunt  minus"></i>-->
															<div class="form-group">
																<label class="col-md-1 col-sm-1 control-label label_pd">药&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品</label>
																<div class="col-md-3">
																	<input class="form-control" type="text"
																		data-bv-notempty="true"
																		data-bv-notempty-message="药品名称不能为空"
																		name="mrList[0].medicineName" placeholder="请输入药品名称">
																</div>
																<label class="col-md-2 control-label label_pd">用药时间</label>
																<label class="col-lg-5 col-md-5">
																	<div>
																		<div class="input-group">
																			<input class="form-control date-picker"
																				id="id-date-picker-1" type="text"
																				data-date-format="yyyy-mm-dd" value=""
																				placeholder="请选择用药时间" name="mrList[0].useTime"
																				readonly="readonly"> <span
																				class="input-group-addon"> <i
																				class="fa fa-calendar"></i>
																			</span>
																		</div>
																	</div>
																</label>
															</div>

															<div class="form-group">
																<label class="col-lg-1 col-md-1 control-label label_pd">用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;法</label>
																<div class="col-md-3 col-sm-12 col-xs-12">
																	<select class="col-md-5 col-xs-5" name="mrList[0].useMethod">
																		<option>口服</option>
																		<option>外用</option>
																		<option>吸入</option>
																		<option>肌肉注射</option>
																		<option>静脉点滴</option>
																	</select> <select class="col-md-5 col-xs-5" style="float: right"
																		name="mrList[0].useTimeType">
																		<option>饭前</option>
																		<option>饭后</option>
																		<option>饭时</option>
																		<option>晨起</option>
																		<option>睡前</option>
																	</select>
																</div>

																<div class='clearfix'>
																	<label for="endtime"
																		class="col-md-2 control-label label_pd">用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量</label>
																	<div class="col-md-6 select_special">
																		<select name="mrList[0].dosageMethod">
																			<option>每日</option>
																			<option>每2小时</option>
																			<option>每4小时</option>
																			<option>每晨</option>
																			<option>每晚</option>
																		</select> <select name="mrList[0].dosageNumber">
																			<option>1</option>
																			<option>2</option>
																			<option>3</option>
																			<option>4</option>
																			<option>5</option>
																			<option>6</option>
																			<option>7</option>
																			<option>8</option>
																			<option>9</option>
																			<option>10</option>
																		</select> <span style="width: 5%; display: inline-block"><label>次</label></span>
																		<span style="display: inline-block; text-align: right"><label>每次</label></span>

																		<label class="label_input"><input type="text"
																			class="form-control col-md-2" name="mrList[0].onceDosage"></label>
																		<select name="mrList[0].unit">
																			<option>毫克</option>
																			<option>毫升</option>
																			<option>克</option>
																		</select>
																	</div>
																</div>

															</div>
															<div class="form-title"></div>
													</div>
													<div class="adress sc">
														<i class="fa fa-plus idd add_special"></i>
													</div>
													<div
														class="col-sm-8 col-lg-offset-3 col-xs-offset-1 col-md-offset-2 btn-bottm ">
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
	</div>

	<!-- /右侧内容 -->
	</div>
	<!--Beyond Scripts-->
	<script src="${ctx}/dep/moban/js/toastr/toastr.js"></script>
	<!---->

	<script src="${ctx}/dep/jquery.selectlist.js"></script>
	<script src="${ctx}/dep/jquery.bigautocomplete.js"></script>

	<script type="text/javascript"
		src="${ctx}/dep/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/dep/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

	<script type="text/javascript">
		/* function submitform1() {
			$('#marForm').data('bootstrapValidator').validate();
			if ($('#marForm').data('bootstrapValidator').isValid()) {
				Notify('您的信息已提交成功！', 'top-right', '2000', 'success',
						'fa-check', true);
			}
			//return false;
		} */
	</script>
	<script>
		function liclick(id, name) {
			$("#click_customer").val(name);
			$("#SearcherList").hide();
			$("#customerId").val(id);
		}
		$(function() {

			$('.search-box').bind('input propertychange', function() {
				if ($(this).val() != "") {
					$("#SearcherList").show().css({
						width : $(this).width() + 26
					});

				}
			});

			$("#click_customer")
					.keyup(
							function() {
								var user = $(this).val();
								if (user) {
									$
											.ajax({
												url : '${ctx}/customer/findCustomerByUser',
												type : "POST",
												data : {
													user : user
												},
												success : function(data) {
													var html = ""
													$(data)
															.each(
																	function(i) {
																		html += '<li onclick="liclick(\''
																				+ data[i]["id"]
																				+ '\',\''
																				+ data[i]["name"]
																				+ '\')" ><span>姓名：  '
																				+ data[i]["name"]
																				+ '   手机号：'
																				+ data[i]["memPhone"]
																				+ '</span></li>';
																	});
													$("#SearcherList").find(
															"ul").html(html);
												}
											});
								} else {
									$("#SearcherList").hide();
								}
							});

			$("#SearcherList li").click(function() {
				$(".search-box").val($(this).find("span").text());
				$("#SearcherList").hide();
			});

			$('.abcselect').selectlist({
				zIndex : 1000,
				width : 190,
				height : 34

			});
		})

		$(function() {

			$("#marForm").bootstrapValidator();
			$("body").on("focus.page", ".date-picker", function() {
				$(this).datetimepicker({
					format : "yyyy-mm-dd",
					minView : 2,
					autoclose : true,
					language : "zh-CN"
				})
			});

			/* 新增 */
			$('#tagIdSubmitAddVip_btn').on('click', function() {
				setTimeout(function() {
					$('#closeCourse').click();
				}, 1000);
			});
			$("#city").click(function(e) {
				SelCity(this, e);
			});
		});
	</script>


	<script type="text/javascript" src="${ctx }/dep/Calendar.js"></script>
	<script type="text/javascript">
	var i = 1;
		$(".add_special").click(function() {
			var add_content = '<i class="fa fa-minus minus_1 min_sepcial"></i>'
					+ '<div class="form-group"> '
					+ '<label for="starttime" class="col-md-1 col-sm-1 control-label label_pd">药&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品</label> '
					+ '<div class="col-md-3">'
					+ '<input class="form-control" type="text" placeholder="请输入药品名称" name="mrList['+i+'].medicineName" data-bv-notempty="true" data-bv-notempty-message="药品名称不能为空">'
					+ '</div> '
					+ '<label for="endtime" class="col-md-2 control-label label_pd">用药时间</label> '
					+ ' <label class="col-lg-5 col-md-5"> '
					+ '<div>'
					+ '<div class="input-group">'
					+ '<input class="form-control date-picker" id="id-date-picker-1" type="text" data-date-format="yyyy-mm-dd" value="" placeholder="请选择用药时间" name="mrList['+i+'].useTime" readonly="readonly">'
					+ '<span class="input-group-addon">'
					+ '<i class="fa fa-calendar"></i>'
					+ '</span>'
					+ '</div>'
					+ '</div>'
					+ '</label> '
					+ ' </div>'
					+ '<div class="form-group"> '
					+ '<label for="starttime" class="col-lg-1 col-md-1 control-label label_pd">用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;法</label> '
					+ '<div class="col-md-3 col-sm-12 col-xs-12"> '
					+ '<select class="col-md-5 col-xs-5" name="mrList['+i+'].useMethod">'
					+ '<option>口服</option>'
					+ '<option>外用</option>'
					+ '<option>吸入</option>'
					+ '<option>肌肉注射</option>'
					+ '<option>静脉点滴</option>'
					+ '</select>'
					+ '<select class="col-md-5 col-xs-5" style="float:right" name="mrList['+i+'].useTimeType">'
					+ '<option>饭前</option>'
					+ '<option>饭后</option>'
					+ '<option>饭时</option>'
					+ '<option>晨起</option>'
					+ '<option>睡前</option>'
					+ '</select>'
					+ ' </div> '
					+ '<div class="clearfix">'
					+ '<label for="endtime" class="col-md-2 control-label label_pd">用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量</label> '
					+ '<div class="col-md-6 select_special"> '
					+ ' <select name="mrList['+i+'].dosageMethod">'
					+ ' <option>每日</option>'
					+ ' <option>每2小时</option>'
					+ ' <option>每4小时</option>'
					+ ' <option>每晨</option>'
					+ ' <option>每晚</option>'
					+ '</select>'
					+ ' <select name="mrList['+i+'].dosageNumber">'
					+ ' <option>1</option>'
					+ ' <option>2</option>'
					+ ' <option>3</option>'
					+ ' <option>4</option>'
					+ ' <option>5</option>'
					+ ' <option>6</option>'
					+ ' <option>7</option>'
					+ ' <option>8</option>'
					+ ' <option>9</option>'
					+ ' <option>10</option>'
					+ ' </select>'
					+ ' <span  style="width:5%;display:inline-block"><label>次</label></span>'
					+ '<span  style="display:inline-block;text-align:right"><label>每次</label></span>'
					+ '<label class="label_input"><input type="text" class="form-control col-md-2"  name="mrList['+i+'].onceDosage"></label>'
					+ ' <select name="mrList['+i+'].unit">'
					+ ' <option>毫克</option>'
					+ '<option>毫升</option>'
					+ '<option>克</option>'
					+ '</select>'
					+ '</div> '
					+ '</div>'
					+ ' </div>'
					+ ' <div class="form-title"></div>';
			$(this).parents().find(".content").append(
					add_content);
			$(".minus_1").click(function() {
						$(this).next().remove().end().next()
								.remove().end().next().remove()
								.end();
						$(this).remove();
					});
			i++;
		})
	</script>

</body>

</html>

