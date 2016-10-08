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

		<title>菜单管理</title>

	<link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
	<!--Basic Styles-->
    <link href="${ctx}/dep/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/css/font-awesome.min.css" rel="stylesheet" />
    <!--Beyond styles-->
    <link id="beyond-link" href="${ctx}/dep/css/beyond.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/css/demo.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/css/typicons.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/css/animate.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${ctx}/home/common/css.css">
	<link rel="stylesheet" href="${ctx}/dep/treeTable/css/jquery.treetable.css" />

		<style>
			#registrationForm input {
				width: 80%;
			}
			
			#registrationForm select,
			textarea {
				width: 80%;
			}
			
			#editMenu input {
				width: 80%;
			}
			
			#editMenu select,
			textarea {
				width: 80%;
			}
		</style>
		<link rel="stylesheet" href="${ctx}/dep/zTreeStyle/zTreeStyle.min.css" />
		<script src="${ctx}/dep/zTreeStyle/jquery.ztree.all.min.js"></script>
	</head>

	<body>

		<!-- Main Container -->
		<div class="main-container container-fluid">
			<!-- Page Container -->
			<div class="page-container page-content">

					<!-- 面包屑导航 -->
					<div class="page-breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="fa fa-home"></i>
								<a href="index.html">系统配置管理</a>
							</li>
							<li class="active">
								<a href="###">用户管理</a>
							</li>
						</ul>
					</div>
					<!-- /面包屑导航-->
					<!--头部按钮-->
					<div class="page-header position-relative">
						<div class="header-title">
							<h1>
                            	用户管理
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
                                                   	 菜单列表
                                                </a>
										</li>

										<li class="tab-red">
											<a id="tab-add" data-toggle="tab" href="#profile">
                                                  	 菜单添加
                                                </a>
										</li>
										<li class="tab-blue">
											<a id="tab-edit" data-toggle="tab" href="#editMenu" style="display: none;">
												菜单编辑
											</a>
										</li>
									</ul>

									<div class="tab-content">
										<div id="home" class="tab-pane in active">
											<table class="table table-striped table-hover table-bordered" id="bodyHtml">
												<thead>
													<tr role="row">
														<th>
															名称 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															链接<span class="fa indicator fa-unsorted"></span>
														</th>
														<th width="8%">
															排序<span class="fa indicator fa-unsorted"></span>
														</th>
														<th width="8%">
															可见 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															权限标识 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															操作<span class="fa indicator fa-unsorted"></span>
														</th>
													</tr>
												</thead>

												<tbody>
												<c:forEach items="${list }" var="list">
													<tr data-tt-id="1">
														<td>${list.name }</td>
														<td>${list.href }</td>
														<td>${list.sort }</td>
														<td>${list.isShow=="1"?"可见":"不可见"}</td>
														<td>${list.permission }</td>
														<td>
															<a href="#" class="btn btn-info btn-xs editClass" onclick="edit(${list.id})"></i> 修改</a>
															<a href="#" class="btn btn-danger btn-xs removeClass" onclick="deleteSingle(${list.id})"><i class="fa fa-trash-o"></i> 删除</a>
															<a href="#" class="btn btn-default btn-xs addClass"><i class="fa fa-child"></i> 添加下级菜单</a>
														</td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- 新增用户 form -->
										<div id="profile" class="tab-pane">

											<form id="registrationForm" method="post" class="form-horizontal" onsubmit="return userformcheck()">

												<div class="form-group">
													<label class="col-lg-4 control-label">上级菜单</label>
													<div class="col-lg-8">
														<div class="input-group" style="width:80%">
															<input type="hidden" name="parentId" class="form-control" id="belongoffice" style="width:100%">
															<input type="text" class="form-control" id="officeId" style="width:100%">
															<span class="input-group-btn" id="chose">
																<a href="#" data-toggle="modal" class="btn btn-default shiny" type="button" style="line-height: 20px">选择</a>
															</span>
														</div>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">名称<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input type="text" class="form-control" name="name" data-bv-notempty="true" data-bv-notempty-message="工号不能为空" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">链接</label>
													<div class="col-lg-8">
														<input type="text" class="form-control" name="href" data-bv-notempty="true" data-bv-notempty-message="姓名不能为空" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">图标</label>
													<div class="col-lg-8">
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">排序</label>
													<div class="col-lg-8">
														<input class="form-control" name="sort" type="text" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">是否可见</label>
													<div class="col-lg-8">
														<input class="checkbox-slider" type="checkbox" checked="checked" value="1" id="logincheckbox">
														<span class="text"></span>
													</div>
													<input name="isShow" id="_loginFlag" value="1" type="hidden">
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">权限标识</label>
													<div class="col-lg-8">
														<input class="form-control" name="permission" type="text" />
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

										<div id="editMenu" class="tab-pane">

											<form id="editForm" method="post" class="form-horizontal" onsubmit="return userformedit()">
	
												<input type="hidden" name="id" id="id2">
												<div class="form-group">
													<label class="col-lg-4 control-label">上级菜单</label>
													<div class="col-lg-8">
														<div class="input-group" style="width:80%">
															<input type="hidden" name="parentId" class="form-control" id="belongoffice2" style="width:100%">
															<input type="text" class="form-control" id="officeId2" style="width:100%">
															<span class="input-group-btn" id="chose2">
																<a href="#" data-toggle="modal" class="btn btn-default shiny" type="button" style="line-height: 20px">选择</a>
															</span>
														</div>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">名称<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input vaule="系统配置管理" type="text" class="form-control" name="name" id="name2" data-bv-notempty="true" data-bv-notempty-message="工号不能为空" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">链接</label>
													<div class="col-lg-8">
														<input type="text" class="form-control" name="href" id="href2" data-bv-notempty="true" data-bv-notempty-message="姓名不能为空" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">图标</label>
													<div class="col-lg-8">
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">排序</label>
													<div class="col-lg-8">
														<input value="100" class="form-control" name="sort" id="sort2" type="text" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">是否可见</label>
													<div class="col-lg-8">
														<input class="checkbox-slider" type="checkbox" checked="checked" id="loginFlag2">
														<span class="text"></span>
													</div>
													<input name="isShow" id="_loginFlag2" value="1" type="hidden">
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">权限标识</label>
													<div class="col-lg-8">
														<input class="form-control" name="permission" id="permission2" type="text" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">备注</label>
													<div class="col-lg-8">
														<textarea rows="3" name="remarks" id="remarks2">顶级菜单</textarea>
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


					<P class="bottomfont">© 2016 Angel Health Management Ltd. : 天使健康管理有限公司</P>

				</div>
				<!-- /右侧内容 -->
			</div>

		</div>
		<div class="modal fade in" aria-hidden="false" id="deparment">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" type="button" data-dismiss="modal">×</button>
						<h4 class="modal-title">选择菜单</h4>
					</div>
					<div class="modal-body form-horizontal">
						<form action="${ctx }/manager/menu/findMenus" id="searchForm">
							<div id="search" class="form-search">
								<label class="control-label col-lg-4">关键词：</label>
								<input id="keyword" name="name" type="text" style="width: 200px;display: inline-block;">
								<div style="display: inline-block;margin-left: 10px;">
									<a class="btn btn-primary" id="officesearch"><i class="glyphicon glyphicon-search"></i>搜索</a>
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
		<script src="${ctx}/dep/treeTable/jquery.treetable.js"></script>
		<script src="${ctx}/dep/bootstrap.min.js"></script>
		<script src="${ctx}/dep/validation/bootstrapValidator.js"></script>

		
		<!-- 归属部门树 -->
		<script type="text/javascript">
			 /*上级菜单*/
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
					url : '${ctx}/manager/menu/findMenus',
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
				$('#deparment').modal('hide');
				$("#belongoffice").val(treeNode.id);
				$("#officeId").val(treeNode.name);
				$("#belongoffice2").val(treeNode.id);
				$("#officeId2").val(treeNode.name);
			}
			$("#chose").click(function(){
				$('#deparment').modal('show')
				$.ajax({
					url : '${ctx}/manager/menu/findMenus',
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
	      $("#chose2").click(function(){
				$('#deparment').modal('show')
				$.ajax({
					url : '${ctx}/manager/menu/findMenus',
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
		    	  $('#deparment').modal('hide');
		      })
		      $("#officesearch").click(function(){
		    	  $.ajax({
						url : "${ctx}/manager/menu/findMenus",
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
		
			$("#bodyHtml").treetable();
		
			$(function() {
				//$("#bodyHtml").treetable({expandable: true});
				
				
				$("#registrationForm").bootstrapValidator();
				$("#editForm").bootstrapValidator();
				
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
				$('.addClass').on('click', function() {
					addClass(this);
				})

				function addClass(_this) {
					$('#tab-add').click();
				}
				$('#tab-add,#tab-list').click(function() {
					$('#tab-edit').hide();
				})
			});
			$("#logincheckbox").change(function(){
	    		var e = document.getElementById("logincheckbox");
	    		if(e.checked){
	    			$("#_loginFlag").val(1);
	    		}else{
	    			$("#_loginFlag").val(0);
	    		}
	    	})
	    	$("#loginFlag2").change(function(){
	    		var e = document.getElementById("loginFlag2");
	    		if(e.checked){
	    			$("#_loginFlag2").val(1);
	    		}else{
	    			$("#_loginFlag2").val(0);
	    		}
	    	})
			function deleteSingle(id){
				if(confirm("是否确定删除")){
					$.ajax({
						url : "${ctx}/manager/menu/deleteById",
						type : "POST",
						data : {"id":id},
						dataType : "json",
						success : function(data) {
							if (data > 0) {
								alert("删除成功！")
								window.location.href = "${ctx}/manager/menu/index";
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
	                 url: "${ctx}/manager/menu/edit",
	                 type: "POST",
	                 data: {id:id},
	                 dataType : "json",
	         		success : function(data) {
	         			$("#id2").val(data.id);
	         			$("#parentId2").val(data.parentId);
	         			$("#name2").val(data.name);
	         			$("#href2").val(data.href);
	         			$("#sort2").val(data.sort);
	         			$("#permission2").val(data.permission);
	         			$("#remarks2").val(data.remarks);
	         			$("#belongoffice2").val(data.parentId);
	         			$("#officeId2").val(data.parentMenuName);
	         			if(data.isShow == "0"){
	         				$("#loginFlag2").removeAttr("checked");
	         			}
	         		}
	             });
			}
			function userformcheck(){
				$('#registrationForm').data('bootstrapValidator').validate();
				if($('#registrationForm').data('bootstrapValidator').isValid()) {
					$.ajax({
						url : "${ctx}/manager/menu/save",
						type : "POST",
						data : $("#registrationForm").serialize(),
						dataType : "json",
						success : function(data) {
							if($(data)[0]["code"]=="1"){
								alert($(data)[0]["msg"]);
								window.location.href = "${ctx}/manager/menu/index";
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
						url : "${ctx}/manager/menu/update",
						type : "POST",
						data : $("#editForm").serialize(),
						dataType : "json",
						success : function(data) {
							if($(data)[0]["code"]=="1"){
								alert($(data)[0]["msg"]);
								window.location.href = "${ctx}/manager/menu/index";
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