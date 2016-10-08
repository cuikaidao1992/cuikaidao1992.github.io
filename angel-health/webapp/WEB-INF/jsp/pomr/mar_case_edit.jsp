<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>新增电子病例</title>

<link rel="stylesheet" type="text/css"
	href="${ctx}/dep/datetimepicker/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/dep/css/jquery.bigautocomplete.css" />
<link href="${ctx}/dep/css/fileinput.css" media="all" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="${ctx}/home/member/zj_style.css" />
<link rel="stylesheet" href="${ctx}/dep/dist/css/dropify.css">

</head>

<body>

	<div class="page-content">
		<!-- 面包屑导航 -->
		<div class="page-breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="fa fa-home"></i> <a href="index.html">首页</a></li>
				<li class="active"><a href="###">健康档案管理</a></li>
				<li class="active">电子病例服务</li>

			</ul>
		</div>
		<!-- /面包屑导航-->
		<!--头部按钮-->
		<div class="page-header position-relative">
			<div class="header-title">
				<h1>电子病例服务</h1>

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
				<div class="col-xs-12 col-md-12 col-lg-12">
					<div class="widget">
						<div class="widget-header ">
							<span class="widget-caption"> <c:if test="${isEdit ==1 }">
							编辑电子病历记录
							</c:if> <c:if test="${isEdit !=1 }">
							查看电子病历记录
							</c:if></span>
							<div class="widget-buttons">
								<a href="#" data-toggle="maximize"> <i class="fa fa-expand"></i>
								</a> <a href="#" data-toggle="collapse"> <i class="fa fa-minus"></i>
								</a> <a href="#" data-toggle="dispose"> <i class="fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body" style="overflow: hidden">
							<div class="col-lg-12 col-lg-12 col-xs-12 ">
								<form class="form-horizontal form-bordered" role="form"
									action="${ctx }/cpr/edit" method="post" id="mar_case"
									enctype="multipart/form-data">
									<input type="hidden" name="id" value="${cpr.id }" />
									<div class="widget">
										<div class="bancgud">
											<div class="formfont">基础信息$</div>
											<!--
                                                      form病例名称时间门诊
                                                      -->
											<div class="form-group">
												<label for="inputEmail3"
													class="col-sm-2 control-label no-padding-right">会员名称<span
													class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<input type="text" class="form-control search-box"
														placeholder="会员名称" name="customerNameCheck"
														data-bv-notempty="true" data-bv-notempty-message="用户不能为空"
														value="${cpr.customerName }" id="click_customer"
														${isEdit == 1?'':'readonly' }> <input
														type="hidden" name="customerId" id="customerId"
														value="${cpr.customerId }" />
													<div class="name-options" id="SearcherList"
														style="display: none;">
														<ul>
														</ul>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3"
													class="col-sm-2 control-label no-padding-right">病历名称<span
													class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="inputEmail3"
														placeholder="请输入病例" name="cprName" data-bv-notempty="true"
														${isEdit == '1'?'':'readonly' }
														data-bv-notempty-message="病例名称不能为空"
														value="${cpr.cprName }">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label no-padding-right">就诊时间<span
													class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<div>
														<div class="input-group">
															<input class="form-control date-picker"
																id="id-date-picker-1" type="text"
																data-date-format="yyyy-mm-dd"
																value="${cpr.recordTime.substring(0,19) }"
																name="recordTime" data-bv-notempty="true"
																${isEdit == 1?'':'readonly' }
																data-bv-notempty-message="就诊时间不能为空"> <span
																class="input-group-addon"> <i
																class="fa fa-calendar"></i>
															</span>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label for="endtime"
													class="col-sm-2 control-label no-padding-right">科&nbsp;&nbsp;&nbsp;室<span
													class="help-inline"><font color="red">*</font> </span></label>
												<div class="col-sm-9">
													<input class="form-control" type="text" id="starttime"
														${isEdit == 1?'':'readonly' }
														placeholder="请输入科室" name="department"
														value="${cpr.department }" data-bv-notempty="true"
														data-bv-notempty-message="科室不能为空">
												</div>
											</div>
											<div class="form-group physician">
												<label for="endtime"
													class="col-sm-2 control-label no-padding-right">上传图片</label>
												<div class="col-sm-7">
												<c:if test="${isEdit != 1 }">
													<c:forEach items="${cpr.uploadUrl.split(',') }" var="urls">
													<div class="box pull-left mr">
														<img src="${urls }">
													</div>
													</c:forEach>
												</c:if>
												<!-- 	<div class="box pull-left mr">
														<input type="file" class="dropify" name="file"
															src="http://10.1.1.132/group1/M00/00/01/CgEBhFfk7YSABMnUAAQTWW7pQQs123.jpg">
													</div> -->
													
												</div>
											</div>
											<!--
                                                      form病例名称时间门诊over
                                                      -->
											<!--
                                             	table切换
                          -->
											<div class="row">
												<div class="col-lg-10 col-sm-10 col-xs-10 col-lg-offset-1"
													style="z-index: 1;">
													<div class="tabbable">
														<ul class="nav nav-tabs nav-justified" id="myTab5">
															<li class="active"><a data-toggle="tab"
																href="#home5"> 现病史 </a></li>

															<li class="tab-blue"><a data-toggle="tab"
																href="#profile5"> 临床表现 </a></li>
															<li class="tab-blue"><a data-toggle="tab"
																href="#dropdown5"> 辅助检查 </a></li>
															<li class="tab-blue"><a data-toggle="tab"
																href="#dropdown4"> 特殊检查 </a></li>
															<li class="tab-blue"><a data-toggle="tab"
																href="#dropdown3"> 诊断 </a></li>
															<li class="tab-blue"><a data-toggle="tab"
																href="#dropdown2"> 治疗 </a></li>
															<li class="tab-blue"><a data-toggle="tab"
																href="#dropdown1"> 手术 </a></li>
														</ul>

														<div class="tab-content" style="overflow: hidden;">
															<div id="home5" class="tab-pane in active">
																<textarea class="col-md-12  h_textarea" name="hpi"
																	placeholder="请输入病例史描述"
																	${isEdit == 1?'':'readonly' }>${cpr.hpi }</textarea>
															</div>

															<div id="profile5" class="tab-pane">
																<textarea class="col-md-12 h_textarea" name="clinical"
																	placeholder="请输入临床表现描述"
																	${isEdit == 1?'':'readonly' }>${cpr.clinical }</textarea>
															</div>

															<div id="dropdown5" class="tab-pane">
																<textarea class="col-md-12 h_textarea"
																	name="assistCheck" placeholder="请输入辅助检查描述"
																	${isEdit == 1?'':'readonly' }>${cpr.assistCheck }</textarea>
															</div>

															<div id="dropdown4" class="tab-pane">
																<textarea class="col-md-12 h_textarea"
																	name="specialCheck" placeholder="请输入特殊描述"
																	${isEdit == 1?'':'readonly' }>${cpr.specialCheck }</textarea>
															</div>
															<div id="dropdown3" class="tab-pane">
																<textarea class="col-md-12 h_textarea" name="diagnosis"
																	placeholder="请输入诊断描述"
																	${isEdit == 1?'':'readonly' }>${cpr.diagnosis }</textarea>
															</div>
															<div id="dropdown2" class="tab-pane">
																<textarea class="col-md-12 h_textarea" name="treatment"
																	placeholder="请输入治疗描述"
																	${isEdit == 1?'':'readonly' }>${cpr.treatment }</textarea>
															</div>
															<div id="dropdown1" class="tab-pane">
																<textarea class="col-md-12 h_textarea" name="surgery"
																	placeholder="请输入病例史描述"
																	${isEdit == 1?'':'readonly' }>${cpr.surgery }</textarea>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!--
                                             	table切换
                                             -->
										</div>
										<c:if test="${isEdit == 1 }">
											<div
												class="col-sm-8 col-lg-offset-3 col-xs-offset-1 col-md-offset-2 btn-bottm"
												style="padding-top: 25px">
												<button id="tagIdSubmitAddVip_btn" type="submit"
													class=" btn btn-darkorange  col-sm-2 col-xs-offset-3"
													href="#closeCourse" data-toggle="modal">确认</button>
												<button class=" btn btn-active col-sm-2 col-xs-offset-3"
													type="button" onClick="history.go(-1)">取消</button>
											</div>
										</c:if>
									</div>
								</form>
							</div>
						</div>

					</div>

				</div>
			</div>

			<!-- /右侧内容 -->
		</div>
		<!--<div class="modal fade in" id="closeCourse" aria-hidden="true">
    <div class="modal-dialog" >
        <div class="modal-content"  style="border-radius:50px!important" >
            
            <div class="modal-body form-horizontal" >
              <p class="text-warning">您的病历信息已提交成功</p>
            </div>
        </div>
    </div>
</div>-->



		<script src="${ctx}/dep/jquery.bigautocomplete.js"></script>
		<script src="${ctx}/dep/fileinput.js" type="text/javascript"></script>
		<script src="${ctx}/dep/fileinput_locale_zh.js" type="text/javascript"></script>
		<script src="${ctx}/dep/dist/js/dropify.js"></script>
		<script src="${ctx}/dep/moban/js/datetime/moment.js"></script>
		<script src="${ctx}/dep/moban/js/datetime/bootstrap-datepicker.js"></script>
		<script src="${ctx}/dep/moban/js/datetime/bootstrap-timepicker.js"></script>

		<script>
			$(function() {
				$('.dropify').dropify({
					messages : {
						'default' : '点击或拖拽文件到这里',
						'replace' : '点击或拖拽文件到这里来替换文件',
						'remove' : '移除文件',
						'error' : '对不起，你上传的文件太大了'
					}
				});

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
																		function(
																				i) {
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
														$("#SearcherList")
																.find("ul")
																.html(html);
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
				$("#mar_case").bootstrapValidator();

				$("body").on("focus.page", ".date-picker", function() {
					$(this).datetimepicker({
						format : "yyyy-mm-dd",
						minView : 2,
						autoclose : true,
						language : "zh-CN"
					})
				});
				$('.date-picker').datepicker();
				/* 新增 */
				$('#tagIdSubmitAddVip_btn').on('click', function() {
					setTimeout(function() {
						$('#closeCourse').click();
					}, 1000);
				});

			});

			function liclick(id, name) {
				$("#click_customer").val(name);
				$("#SearcherList").hide();
				$("#customerId").val(id);
			}
		</script>
</body>

</html>

