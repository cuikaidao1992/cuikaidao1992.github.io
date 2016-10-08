<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<title>区域管理</title>

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

		<style>
			#registrationForm input {
				width: 80%;
			}
			
			#registrationForm select,
			textarea {
				width: 80%;
			}
			
			#editDepart input {
				width: 80%;
			}
			
			#editDepart select,
			textarea {
				width: 80%;
			}
		</style>
		<link rel="stylesheet" href="${ctx}/dep/zTreeStyle/zTreeStyle.min.css" />
		<script src="${ctx}/dep/zTreeStyle/jquery.ztree.all.min.js"></script>
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
								<a href="###">区域管理</a>
							</li>
						</ul>
					</div>
					<!-- /面包屑导航-->
					<!--头部按钮-->
					<div class="page-header position-relative">
						<div class="header-title">
							<h1>
                            	区域管理
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
												区域列表
											</a>
										</li>

										<li class="tab-red">
											<a id="tab-add" data-toggle="tab" href="#profile">
												区域添加
											</a>
										</li>
										<li class="tab-blue">
											<a id="tab-edit" data-toggle="tab" href="#editDepart" style="display: none;">
												区域编辑
											</a>
										</li>
									</ul>

									<div class="tab-content">
										<div id="home" class="tab-pane in active">
											<div class="table-toolbar">

												<a href="" class="btn btn-darkorange col-padd" id="deleteBatch">
													<i class="fa fa-minus"></i>批量删除
												</a>
												<a href="javascript:newDepart()" class="btn btn-blue col-padd">
													<i class="fa fa-plus"></i>新增区域
												</a>
										<form action="" method="post" id="hiddens"></form>
											</div>
											<table class="table table-striped table-hover table-bordered" id="bodyHtml">
												<thead>
													<tr role="row">
														<th width="5%">
															<label>
                                                        <input type="checkbox" name="id"  id="hvtck">
                                                        <span class="text" id="dohovertree"></span>
                                                        
                                                    </label>
														</th>
														<th>
															区域名称 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															区域编码 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															区域类型 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															备注 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th width="20%">
															<span class="fa indicator fa-unsorted"></span>
														</th>
													</tr>
												</thead>

												<tbody>
												<form action="" id="userform" method="post">
												<c:forEach items="${pager.list }" var="list">
													<tr>
														<td>
															<label>
                                                        <input type="checkbox" name="id" value="${list.id }">
                                                        <span class="text"></span>
                                                    </label>
														</td>
														<td><input type="text" class="six" value="${list.name }" disabled="disabled"></td>
														<td><input type="text" class="six" value="${list.code }" disabled="disabled"></td>
														<td>
															<input type="text" value="${list.type=='1'?'国家':list.type=='2'?'省份':list.type=='3'?'城市':'区县' }" class="six" disabled="disabled">
														</td>
														<td><input type="text" class="six" value="${list.remarks }" disabled="disabled"></td>
														<td>
															<a href="#" class="btn btn-info btn-xs editClass" onclick="edit(${list.id})">
																</i> 修改</a>
															<a href="#" class="btn btn-danger btn-xs removeClass" onclick="deleteSingle(${list.id})"><i class="fa fa-trash-o"></i> 删除</a>
														</td>
													</tr>
													</c:forEach>
													</form>
												</tbody>
											</table>
											<div class="btn-font dw_page" currentPage="${pager.currentPage}"
								total="${pager.total}" totalPages="${pager.totalPages}"
								pageSize="${pager.pageSize}">
								<div class="zjtm">共${pager.totalPages }页${pager.total }条</div>
								<div class="zjrightb">
									<ul class="pagination pull-right">
										<c:if test="${pager.totalPages == 1 || pager.totalPages == 0}">
											<li class="footable-page-arrow disabled"><a
												data-page="prev" href="javascript:void(0)">上一页</a></li>
											<li class="footable-page active"><a data-page="0"
												href="#">1</a></li>
											<li class="footable-page-arrow disabled"><a
												data-page="next" href="javascript:void(0)">下一页</a></li>
										</c:if>
										<c:if test="${pager.totalPages != 1 && pager.totalPages != 0}">
											<c:if test="${pager.currentPage == 1}">
												<li class="footable-page-arrow disabled"><a
													data-page="prev" href="javascript:void(0)">上一页</a></li>
												<li class="footable-page active"><a data-page="0"
													href="#">1</a></li>
												<li class="footable-page"><a data-page="1"
													href="javascript:_go(2);">2</a></li>
												<li class="footable-page-arrow"><a data-page="next"
													href="javascript:_next();">下一页</a></li>
											</c:if>
											<c:if
												test="${pager.currentPage != 1 && pager.currentPage != pager.totalPages}">
												<li class="footable-page-arrow"><a data-page="prev"
													href="javascript:_back();">上一页</a></li>
												<li class="footable-page"><a
													data-page="${pager.currentPage-2}"
													href="javascript:_go('${pager.currentPage-1}');">${pager.currentPage-1}</a></li>
												<li class="footable-page active"><a
													data-page="${pager.currentPage-1}" href="#">${pager.currentPage}</a></li>
												<li class="footable-page"><a
													data-page="${pager.currentPage}"
													href="javascript:_go('${pager.currentPage+1}')">${pager.currentPage+1}</a></li>
												<li class="footable-page-arrow"><a data-page="next"
													href="javascript:_next();">下一页</a></li>
											</c:if>
											<c:if test="${ pager.currentPage == pager.totalPages}">
												<li class="footable-page-arrow"><a data-page="prev"
													href="javascript:_back();">上一页</a></li>
												<li class="footable-page"><a
													data-page="${pager.currentPage-2}"
													href="javascript:_go('${pager.currentPage-1}');">${pager.currentPage-1}</a></li>
												<li class="footable-page active"><a
													data-page="${pager.currentPage-1}" href="#">${pager.currentPage}</a></li>
												<li class="footable-page-arrow disabled"><a data-page="next"
													href="javascript:void(0)">下一页</a></li>
											</c:if>
										</c:if>



										<!-- <li class="footable-page-arrow disabled"><a
											data-page="prev" href="javascript:_back();">上一页</a></li>
										<li class="footable-page active"><a data-page="0"
											href="#">1</a></li>
										<li class="footable-page"><a data-page="1" href="#">2</a></li>
										<li class="footable-page-arrow"><a data-page="next"
											href="javascript:_next();">下一页</a></li> -->
									</ul>
								</div>
							</div>
										</div>
										<!-- 新增区域 form -->
										<div id="profile" class="tab-pane">

											<form id="registrationForm" method="post" class="form-horizontal" onsubmit="return userformcheck()">

												<div class="form-group">
													<label class="col-lg-4 control-label">上级区域</label>
													<div class="col-lg-8">
														<div class="input-group" style="width:80%">
															<input type="hidden" name="parentId" class="form-control" id="belongarea" style="width:100%">
															<input type="text" class="form-control" id="areaId" style="width:100%">
															<span class="input-group-btn" id="chose">
																<a href="#" class="btn btn-default shiny" type="button" style="line-height: 20px">选择</a>
															</span>
														</div>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">区域名称<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input type="text" class="form-control" name="name" data-bv-notempty="true" data-bv-notempty-message="区域名称不能为空" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">区域编码</label>
													<div class="col-lg-8">
														<input type="text" class="form-control" name="code" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">区域类型</label>
													<div class="col-lg-8">
														<select name="type" class="form-control">
															<option value="0" selected="selected">请选择</option>
															<option value="1">国家</option>
															<option value="2">省份</option>
															<option value="3">城市</option>
															<option value="4">区县</option>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">备注</label>
													<div class="col-lg-8">
														<textarea rows="3" name="remarks"></textarea>
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

											<form id="editForm" method="post" class="form-horizontal" onsubmit="return userformedit()">

												<input type="hidden" name="id" id="id2">
												<div class="form-group">
													<label class="col-lg-4 control-label">上级区域</label>
													<div class="col-lg-8">
														<div class="input-group" style="width:80%">
															<input type="hidden" name="parentId" class="form-control" id="belongarea2" style="width:100%">
															<input type="text" class="form-control" id="areaId2" style="width:100%">
															<span class="input-group-btn" id="chose1">
																<a href="#" data-toggle="modal" class="btn btn-default shiny" type="button" style="line-height: 20px">选择</a>
															</span>
														</div>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">区域名称<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input value="济南市" type="text" class="form-control" name="name" id="name2" data-bv-notempty="true" data-bv-notempty-message="区域名称不能为空" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">区域编码</label>
													<div class="col-lg-8">
														<input value="1111111" type="text" class="form-control" name="code" id="code2" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">区域类型</label>
													<div class="col-lg-8">
														<select name="type" id="type2" class="form-control">
															<option value="0">请选择</option>
															<option value="1">国家</option>
															<option value="2">省份</option>
															<option value="3">城市</option>
															<option value="4">区县</option>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">备注</label>
													<div class="col-lg-8">
														<textarea rows="3" name="remarks" id="remarks2"></textarea>
													</div>
												</div>

												<div class="form-group">
													<div class="col-lg-offset-4 col-lg-8">
														<input class="btn btn-palegreen" type="submit" value="修改" />
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

			<!-- /右侧内容 -->
				</div>

			</div>
			</div>
		<!-- 上级机构 -->
		
		<div class="modal fade in" aria-hidden="false" id="areaxxx">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" type="button" data-dismiss="modal">×</button>
						<h4 class="modal-title">选择区域</h4>
					</div>
					<div class="modal-body form-horizontal">
						<form action="${ctx}/manager/area/findAllArea" id="searchForm">
							<div id="search" class="form-search">
								<label class="control-label col-lg-4">关键词：</label>
								<input id="keyword" name="name" type="text" style="width: 200px;display: inline-block;">
								<div style="display: inline-block;margin-left: 10px;">
									<a class="btn btn-primary" id="areasearch"><i class="glyphicon glyphicon-search"></i>搜索</a>
								</div>
							</div>
							<div class="area-select" style="margin-top: 20px">
								<ul id="tree" class="ztree col-lg-offset-4"></ul>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-10 col-sm-offset-2">
									<span class="btn btn-darkorange col-sm-3" id="queren">确定</span>
									<span class="btn btn-active col-sm-3 col-xs-offset-3" data-dismiss="modal" aria-hidden="true">取消</span>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script src="${ctx}/dep/bootstrap.min.js"></script>
		<script src="${ctx}/dep/validation/bootstrapValidator.js"></script>
		<script src="${ctx}/dep/fuelux/treeview/tree-custom.min.js"></script>
		<script src="${ctx}/home/sysconfig/treeview-init.js"></script>

		<!-- 区域 -->
		<script type="text/javascript">
			var setting = {
					check: {
						enable: false
					},
					data: {
						simpleData: {
							enable: true
						}
					},
					callback: {
						onClick: onClick
					}
				};
		
				$(document).ready(function(){
					$.ajax({
						url : '${ctx}/manager/area/findAllArea',
						type : 'POST',
						dataType : 'text',
						success : function(data) {
							var zNodes = eval("(" + data + ")");
							$.fn.zTree.init($("#tree"), setting, zNodes);
						},
						error : function(msg) {
							alert('树加载异常!');
						}
					});
				});
				
				function onClick(event, treeId, treeNode, clickFlag) {
					$('#areaxxx').modal('hide');
					$("#belongarea").val(treeNode.id);
					$("#areaId").val(treeNode.name);
					$("#belongarea2").val(treeNode.id);
					$("#areaId2").val(treeNode.name);
				}
				$("#chose").click(function(){
					$('#areaxxx').modal('show')
					$.ajax({
						url : '${ctx}/manager/area/findAllArea',
						type : 'POST',
						dataType : 'text',
						success : function(data) {
							var zNodes = eval("(" + data + ")");
							$.fn.zTree.init($("#tree"), setting, zNodes);
						},
						error : function(msg) {
							alert('树加载异常!');
						}
					});
				});
		      $("#chose1").click(function(){
					$('#areaxxx').modal('show')
					$.ajax({
						url : '${ctx}/manager/area/findAllArea',
						type : 'POST',
						dataType : 'text',
						success : function(data) {
							var zNodes = eval("(" + data + ")");
							$.fn.zTree.init($("#tree"), setting, zNodes);
						},
						error : function(msg) {
							alert('树加载异常!');
						}
					});
				});
			      $("#queren").click(function(){
			    	  $('#areaxxx').modal('hide');
			      })
			      $("#areasearch").click(function(){
			    	  $.ajax({
							url : "${ctx}/manager/area/findAllArea",
							type : "POST",
							data : $("#searchForm").serialize(),
							dataType : "json",
							success : function(data) {
								$("#keyword").val("");
								$.fn.zTree.init($("#tree"), setting, data);
							}
						});
			      })
			</script>



		<script>
			$(function() {
				loadArea();
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

			function newDepart() {
				$('#tab-add').click();
			}

			function loadArea(){
				$.ajax({
	                 url: "${ctx}/manager/area/findAllArea",
	                 type: "POST",
	                 dataType : "json",
	         		success : function(data) {
	         			var html = "<option value=''>请选择</option>";
	    				$(data).each(function(i){
	    					html +="<option value="+data[i].id+">"+data[i].name+"</option>";
	    				});
	    				$("#area").html(html);
	    				$("#area2").html(html);
	         		}
				})
			}
			$("#hvtck").click(function(){
	    		var eles = document.getElementsByName("id");
	    		for (var i = 1; i < eles.length; i++) {
					eles[i].checked = eles[0].checked;
				}
	    	})
	    	$("#deleteBatch").click(function(){
	    		var ids = $("#userform").serialize();
	    		if(!ids){
	    			alert("请选择要删除的内容");
	    			return false;
	    		}
	    		ids = ids.replace(/id=/g,"");
	    		if(confirm("是否确定删除")){
					$.ajax({
						url : "${ctx}/manager/area/delete",
						type : "POST",
						data : {"ids":ids},
						dataType : "json",
						success : function(data) {
							if (data > 0) {
								alert("删除成功！")
								window.location.href = "${ctx}/manager/area/index";
							} else {
								alert("删除失败！");
								return false;
							}
						}
					});
	    		}
	    	})
	    	function deleteSingle(id){
				if(confirm("是否确定删除")){
					$.ajax({
						url : "${ctx}/manager/area/deleteById",
						type : "POST",
						data : {"id":id},
						dataType : "json",
						success : function(data) {
							if (data > 0) {
								alert("删除成功！")
								window.location.href = "${ctx}/manager/area/index";
							} else {
								alert("删除失败！");
								return false;
							}
						}
					});
	    		}
			}
			function edit(id){
	    		 $.ajax({
	                 url: "${ctx}/manager/area/edit",
	                 type: "POST",
	                 data: {id:id},
	                 dataType : "json",
	         		success : function(data) {
	         			$("#id2").val(data.id);
	         			$("#belongarea2").val(data.parentId);
	         			$("#areaId2").val(data.areaName);
	         			$("#name2").val(data.name);
	         			$("#code2").val(data.code);
	         			$("#type2").val(data.type);
	         			$("#remarks2").val(data.remarks);
	         		}
	             });
			}
			function userformcheck(){
				$('#registrationForm').data('bootstrapValidator').validate();
				if($('#registrationForm').data('bootstrapValidator').isValid()) {
					$.ajax({
						url : "${ctx}/manager/area/save",
						type : "POST",
						data : $("#registrationForm").serialize(),
						dataType : "json",
						success : function(data) {
							if($(data)[0]["code"]=="1"){
								alert($(data)[0]["msg"]);
								window.location.href = "${ctx}/manager/area/index";
							}else{
								alert($(data)[0]["msg"]);
							}
						}
					});
				}
			}
			function userformedit(){
				$('#editForm').data('bootstrapValidator').validate();
				if($('#editForm').data('bootstrapValidator').isValid()) {
					$.ajax({
						url : "${ctx}/manager/area/update",
						type : "POST",
						data : $("#editForm").serialize(),
						dataType : "json",
						success : function(data) {
							if($(data)[0]["code"]=="1"){
								alert($(data)[0]["msg"]);
								window.location.href = "${ctx}/manager/area/index";
							}else{
								alert($(data)[0]["msg"]);
							}
						}
					});
				}
			}
		</script>

	</body>

</html>