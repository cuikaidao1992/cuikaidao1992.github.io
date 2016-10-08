<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<title>短信管理</title>

		<link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
		<!--Basic Styles-->
		<link href="${ctx}/dep/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${ctx}/dep/css/font-awesome.min.css" rel="stylesheet" />
		<!--Beyond styles-->
		<link href="${ctx}/dep/css/beyond.min.css" rel="stylesheet" />
		<link href="${ctx}/dep/css/demo.min.css" rel="stylesheet" />
		<link href="${ctx}/dep/css/typicons.min.css" rel="stylesheet" />
		<link href="${ctx}/dep/css/animate.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ctx}/home/common/css.css">
		<link rel="stylesheet" href="${ctx}/dep/datetimepicker/css/bootstrap-datetimepicker.min.css" />

	</head>

	<body>

		<!-- /Navbar -->
		<!-- Main Container -->
		<div class="main-container container-fluid">
			<!-- Page Container -->
			<!-- Page Sidebar -->
			<!-- /右侧内容 -->
			<div class="page-content">
				<div class="page-container">
					<!-- 面包屑导航 -->
					<div class="page-breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="fa fa-home"></i>
								<a href="index.html">系统配置管理</a>
							</li>
							<li class="active">
								<a href="###">短信管理</a>
							</li>
						</ul>
					</div>
					<!-- /面包屑导航-->
					<!--头部按钮-->
					<div class="page-header position-relative">
						<div class="header-title">
							<h1>
                            	短信管理
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

								<div class="tabbable">
									<ul class="nav nav-tabs" id="myTab">
										<li class="active">
											<a id="tab-list" data-toggle="tab" href="#home">
												短信列表
											</a>
										</li>

										<li class="tab-red">
											<a id="tab-add" data-toggle="tab" href="#profile">
												短信添加
											</a>
										</li>
										<li class="tab-blue">
											<a id="tab-edit" data-toggle="tab" href="#editDepart" style="display: none;">
												短信编辑
											</a>
										</li>
									</ul>

									<div class="tab-content">
										<div id="home" class="tab-pane in active">
											<div class="table-toolbar">

												<a href="javascript:deleteBatch()" class="btn btn-darkorange col-padd">
													<i class="fa fa-minus"></i>批量删除
												</a>
												<a href="javascript:newDepart()" class="btn btn-blue col-padd">
													<i class="fa fa-plus"></i>新增短信
												</a>

											</div>
											<table class="table table-striped table-hover table-bordered" id="bodyHtml">
												<thead>
													<tr role="row">
														<th width="5%">
															<label>
                                                        <input type="checkbox"  id="hvtck">
                                                        <span class="text" id="dohovertree"></span>
                                                        
                                                    </label>
														</th>
														<th>
															短信标题 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															短信类型 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															发送时间 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															发送状态 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th width="20%">
															<span class="fa indicator fa-unsorted"></span>
														</th>
													</tr>
												</thead>

												<tbody>
													<tr>
														<td>
															<label>
	                                                        	<input type="checkbox" name="myHoverTreechk">
	                                                        	<span class="text"></span>
	                                                    	</label>
														</td>
														<td><input type="text" class="six" value="节日快乐" disabled="disabled"></td>
														<td><input type="text" class="six" value="祝福短信" disabled="disabled"></td>
														<td>
															<input type="text" class="six" value="2016年9月1日 11点26分50秒"  disabled="disabled">
														</td>
														<td><input type="text" class="six" value="已发送" disabled="disabled"></td>
														<td>
															<a href="#" class="btn btn-info btn-xs editClass">
																</i> 修改</a>
															<a href="#" class="btn btn-danger btn-xs removeClass"><i class="fa fa-trash-o"></i> 删除</a>
														</td>
													</tr>
													<tr>
														<td>
															<label>
	                                                        	<input type="checkbox" name="myHoverTreechk">
	                                                        	<span class="text"></span>
	                                                    	</label>
														</td>
														<td><input type="text" class="six" value="节日快乐" disabled="disabled"></td>
														<td><input type="text" class="six" value="祝福短信" disabled="disabled"></td>
														<td>
															<input type="text" class="six" value="2016年9月1日 11点26分50秒"  disabled="disabled">
														</td>
														<td><input type="text" class="six" value="已发送" disabled="disabled"></td>
														<td>
															<a href="#" class="btn btn-info btn-xs editClass">
																</i> 修改</a>
															<a href="#" class="btn btn-danger btn-xs removeClass"><i class="fa fa-trash-o"></i> 删除</a>
														</td>
													</tr>
													<tr>
														<td>
															<label>
	                                                        	<input type="checkbox" name="myHoverTreechk">
	                                                        	<span class="text"></span>
	                                                    	</label>
														</td>
														<td><input type="text" class="six" value="节日快乐" disabled="disabled"></td>
														<td><input type="text" class="six" value="祝福短信" disabled="disabled"></td>
														<td>
															<input type="text" class="six" value="2016年9月1日 11点26分50秒"  disabled="disabled">
														</td>
														<td><input type="text" class="six" value="已发送" disabled="disabled"></td>
														<td>
															<a href="#" class="btn btn-info btn-xs editClass">
																</i> 修改</a>
															<a href="#" class="btn btn-danger btn-xs removeClass"><i class="fa fa-trash-o"></i> 删除</a>
														</td>
													</tr>
												</tbody>
											</table>
											<div class="btn-font">
												<div class="zjtm">
													显示1到7共7个条目
												</div>
												<div class="zjrightb">
													<ul class="pagination pull-right">
														<li class="footable-page-arrow disabled">
															<a data-page="first" href="#first">«</a>
														</li>
														<li class="footable-page-arrow disabled">
															<a data-page="prev" href="#prev">上一页</a>
														</li>
														<li class="footable-page active">
															<a data-page="0" href="#">1</a>
														</li>
														<li class="footable-page">
															<a data-page="1" href="#">2</a>
														</li>
														<li class="footable-page-arrow">
															<a data-page="next" href="#next">下一页</a>
														</li>
														<li class="footable-page-arrow">
															<a data-page="last" href="#last">»</a>
														</li>
													</ul>
												</div>
											</div>
										</div>
										<!-- 新增短信 form -->
										<div id="profile" class="tab-pane">

											<form id="registrationForm" method="post" class="form-horizontal">

												<div class="form-group">
													<label class="col-lg-4 control-label">短信标题<span class="help-inline"><font color="red">*</font></span></label>
													<div class="col-lg-8">
														<input type="text" class="form-control" name="msgName" data-bv-notempty="true" data-bv-notempty-message="短信标题不能为空" />
													</div>
												</div>
												
												<div class="form-group">
													<label class="col-lg-4 control-label">短信类型</label>
													<div class="col-lg-8">
														<select class="form-control" name="msgType">
															<option value="1" selected="selected">祝福短信</option>
															<option value="2">注册短信</option>
															<option value="3">找回密码短信</option>
														</select>
													</div>
												</div>

												<div class="form-group" id="sendType">
													<label class="col-lg-4 control-label">发送类型</label>
													<div class="col-lg-8">
														<select type="text" class="form-control" name="sendType">
															<option value="1" selected="selected">手动</option>
															<option value="2">自动</option>
														</select>	
													</div>
												</div>
												
												<div class="form-group" id="sendTime" style="display: none;">
													<label class="col-lg-4 control-label">发送时间</label>
													<div class="col-lg-8">
														<div class="input-group" style="width: 80%;">
			                                                <input style="width: 100%;" class="form-control date-picker" id="id-date-picker-1" type="text" data-date-format="dd-mm-yyyy">
			                                                <span class="input-group-addon">
			                                                    <i class="fa fa-calendar"></i>
			                                                </span>
			                                            </div>
													</div>
												</div>
												
												<div class="form-group">
													<label class="col-lg-4 control-label">短信内容</label>
													<div class="col-lg-8">
														<textarea class="form-control" name="msgContent" rows="3"></textarea>
													</div>
												</div>
												
												<div class="form-group">
													<div class="col-lg-offset-4 col-lg-8">
														<input class="btn btn-palegreen" type="submit" value="提交" />
													</div>
												</div>

											</form>
										</div>

										<div id="editDepart" class="tab-pane">

											<form id="editForm" method="post" class="form-horizontal">
												<div class="form-group">
													<label class="col-lg-4 control-label">短信标题<span class="help-inline"><font color="red">*</font></span></label>
													<div class="col-lg-8">
														<input type="text" value="生日快乐" class="form-control" name="msgName" data-bv-notempty="true" data-bv-notempty-message="短信标题不能为空" />
													</div>
												</div>
												
												<div class="form-group">
													<label class="col-lg-4 control-label">短信类型</label>
													<div class="col-lg-8">
														<select class="form-control" name="msgType" disabled="true">
															<option value="1" selected="selected">祝福短信</option>
															<option value="2">注册短信</option>
															<option value="3">找回密码短信</option>
														</select>
													</div>
												</div>

												<div class="form-group" id="sendType">
													<label class="col-lg-4 control-label">发送类型</label>
													<div class="col-lg-8">
														<select type="text" class="form-control" name="sendType">
															<option value="1" >手动</option>
															<option value="2" selected="selected">自动</option>
														</select>	
													</div>
												</div>
												
												<div class="form-group" id="sendTime" style="">
													<label class="col-lg-4 control-label">发送时间</label>
													<div class="col-lg-8">
														<div class="input-group" style="width: 80%;">
			                                                <input style="width: 100%;" value="2016-09-01 15:30:22" class="form-control date-picker" id="id-date-picker-1" type="text" data-date-format="dd-mm-yyyy">
			                                                <span class="input-group-addon">
			                                                    <i class="fa fa-calendar"></i>
			                                                </span>
			                                            </div>
													</div>
												</div>
												
												<div class="form-group">
													<label class="col-lg-4 control-label">短信内容</label>
													<div class="col-lg-8">
														<textarea class="form-control" name="msgContent" rows="3">祝你生日快乐</textarea>
													</div>
												</div>
												
												<div class="form-group">
													<div class="col-lg-offset-4 col-lg-8">
														<input class="btn btn-palegreen" type="submit" value="提交" />
													</div>
												</div>
											</form>

										</div>

									</div>
								</div>
							</div>

						</div>

					</div>

					<P class="bottomfont">© 2016 Angel Health Management Ltd. : 天使健康管理有限公司</P>

				</div>

			</div>
			<!-- /右侧内容 -->

		</div>

		<script src="${ctx}/dep/jquery-2.0.3.min.js"></script>
		
		<script src="${ctx}/dep/bootstrap.min.js"></script>
		<script src="${ctx}/dep/validation/bootstrapValidator.js"></script>
		
		<script src="${ctx}/dep/datetime/bootstrap-datepicker.js"></script>
		<script src="${ctx}/dep/datetime/bootstrap-timepicker.js"></script>
		
		<script src="${ctx}/dep/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
		<script src="${ctx}/dep/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		
		<script src="${ctx}/dep/fuelux/treeview/tree-custom.min.js"></script>
		<script src="${ctx}/home/sysconfig/treeview-init.js"></script>


		<script>
		
			$('select[name="msgType"]').change(function(){
				if($(this).val() != 1){
					$('#sendType').hide();
					$('#sendTime').hide();
				}else{
					$('#sendType').show();
					$('#sendTime').show();
				}
			})
			
			$('select[name="sendType"]').change(function(){
				if($(this).val() == 1){
					$('#sendTime').hide();
				}
				if($(this).val() == 2){
					$('#sendTime').show();
				}
			})
		
		
			$('.date-picker').datetimepicker({
				format: 'yyyy-mm-dd hh:ii:ss',
				language: 'zh-CN',
                autoclose: true,
                todayHighlight: true
			});
		
			$(function() {
				$("#registrationForm").bootstrapValidator();
				$("#editForm").bootstrapValidator();
				UITree.init();
				$(".editClass").on('click', function() {
					editClass(this)
				});
				//编辑
				function editClass(_this) {
					$('#tab-edit').show();
					$('#tab-edit').click();
				}
				$(".removeClass").on('click', function() {
					removeClass(this)
				});
				// 删除
				function removeClass(_this) {
					$(_this).parent().parent().remove();
				}
				$('#tab-add,#tab-list').click(function() {
					$('#tab-edit').hide();
				})
			});
			window.onload = function() {
				var checkboxs = document.getElementsByName("myHove" + "rTreechk");
				var hvtck = document.getElementById("hvtck");
				cklen = checkboxs.length;
				hvtck.onclick = function() {
					if(this.checked == true) {
						for(var i = 0; i < cklen; i++) {
							checkboxs[i].checked = true;
						}
						document.getElementById("dohovert" + "ree").innerHTML = ""
					} else {
						for(var i = 0; i < cklen; i++) {
							checkboxs[i].checked = false;
						}
						document.getElementById("dohovertree").innerHTML = ""
					}
				}
			}

			function newDepart() {
				$('#tab-add').click();
			}

			function deleteBatch() {
				$('input[name="myHoverTreechk"]').each(function() {
					if($(this).is(':checked'))
						$(this).parent().parent().parent().remove();
				})
			}
		</script>

	</body>

</html>