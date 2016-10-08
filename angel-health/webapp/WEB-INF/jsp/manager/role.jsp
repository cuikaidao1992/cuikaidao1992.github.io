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

		<title>角色管理</title>


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
		<!-- Main Container -->
		<div class="main-container container-fluid">
			<!-- Page Container -->
			<div class="page-container page-content">
				<!-- Page Sidebar -->
					<!-- 面包屑导航 -->
					<div class="page-breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="fa fa-home"></i>
								<a href="index.html">系统配置管理</a>
							</li>
							<li class="active">
								<a href="###">角色管理</a>
							</li>
						</ul>
					</div>
					<!-- /面包屑导航-->
					<!--头部按钮-->
					<div class="page-header position-relative">
						<div class="header-title">
							<h1>
                            	角色管理
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
                                                   	 角色列表
                                                </a>
										</li>

										<li class="tab-red">
											<a id="tab-add" data-toggle="tab" href="#profile">
                                                  	 角色添加
                                                </a>
										</li>
										<li class="tab-blue">
											<a id="tab-edit" data-toggle="tab" href="#editDepart" style="display: none;">
												角色编辑
											</a>
										</li>
										<li class="tab-red">
											<a id="tab-allocate" data-toggle="tab" href="#allocateDepart" style="display: none;">
												角色分配
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
													<i class="fa fa-plus"></i>新增角色
												</a>
											<form action="" method="post" id="hiddens"></form>
											</div>
											<table class="table table-striped table-hover table-bordered" id="bodyHtml">
												<thead>
													<tr role="row">
														<th width="5%">
															<label>
                                                        <input type="checkbox"  id="hvtck" name="id">
                                                        <span class="text" id="dohovertree"></span>
                                                        
                                                    </label>
														</th>
														<th>
															角色名称 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															英文名称 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															归属机构 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															数据范围 <span class="fa indicator fa-unsorted"></span>
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
														<td><input type="text" class="six" value="${list.enname }" disabled="disabled"></td>
														<td>
															<input type="text" value="${list.officeId }" class="six" disabled="disabled">
														</td>
														<td><input type="text" class="six" value="${list.dataScope == 1 ? '所在公司数据':'所在部门数据'}" disabled="disabled"></td>
														<td>
															<a href="#" class="btn btn-default btn-xs distributionClass" onclick="showRoleUsers(${list.id})"><i class="fa fa-bookmark-o"></i> 分配</a>
															<a href="#" class="btn btn-info btn-xs editClass" onclick="edit(${list.id})"></i> 修改</a>
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
										<c:if test="${pager.totalPages != 1 && pager.totalPages != 0 }">
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
										<!-- 新增角色 form -->
										<div id="profile" class="tab-pane">

											<form id="registrationForm" method="post" class="form-horizontal" onsubmit="return userformcheck()">

												<div class="form-group">
													<label class="col-lg-4 control-label">归属机构<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<div class="input-group" style="width:80%">
															<input type="hidden" name="officeId" class="form-control" id="belongoffice" style="width:100%">
															<input type="text" class="form-control" id="officeId" style="width:100%">
															<span class="input-group-btn" id="chose">
																<a href="#" data-toggle="modal" class="btn btn-default shiny" type="button" style="line-height: 20px">选择</a>
															</span>
														</div>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">角色名称<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input type="text" class="form-control" name="name" data-bv-notempty="true" data-bv-notempty-message="角色名称不能为空" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">英文名称</label>
													<div class="col-lg-8">
														<input type="text" class="form-control" name="enname" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">角色类型</label>
													<div class="col-lg-8">
														<select name="departType" class="form-control">
													      <option value="0" selected="selected" name="roleType">请选择</option>
													      <option value="1">任务分配</option>
													      <option value="2">管理角色</option>
													      <option value="3">普通角色</option>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">是否系统数据</label>
													<div class="col-lg-8">
														<input class="checkbox-slider" type="checkbox" checked="checked" value="1" id="syscheckbox">
														<span class="text"></span>
													</div>
													<input name="isSys" id="isSysdata" value="1" type="hidden">
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">是否可用</label>
													<div class="col-lg-8">
														<input class="checkbox-slider" type="checkbox" checked="checked" value="1" id="usecheckbox">
														<span class="text"></span>
													</div>
													<input name="useable" id="isuseable" value="1" type="hidden">
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">数据范围</label>
													<div class="col-lg-8">
														<select name="dataScope" class="form-control">
													      <option value="0" selected="selected">请选择</option>
													      <option value="1">所在公司数据</option>
													      <option value="2">所在部门数据</option>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">角色授权</label>
													<div class="col-lg-8">
														<input type="hidden" name="menu" id="rolemenus">
														<ul id="tree" class="ztree" style="height:200px;overflow:auto"></ul>
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
													<label class="col-lg-4 control-label">归属机构<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<div class="input-group" style="width:80%">
															<input type="hidden" name="officeId" class="form-control" id="belongoffice2" style="width:100%">
															<input type="text" class="form-control" id="officeId2" style="width:100%">
															<span class="input-group-btn" id="chose2">
																<a href="#" data-toggle="modal" class="btn btn-default shiny" type="button" style="line-height: 20px">选择</a>
															</span>
														</div>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">角色名称<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input value="很角色" type="text" class="form-control" name="name" id="name2" data-bv-notempty="true" data-bv-notempty-message="角色名称不能为空" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">英文名称</label>
													<div class="col-lg-8">
														<input value="js" type="text" class="form-control" name="enname" id="enname2" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">角色类型</label>
													<div class="col-lg-8">
														<select name="roleType" class="form-control" id="roleType2">
													      <option value="0" >请选择</option>
													      <option value="1" selected="selected">任务分配</option>
													      <option value="2">管理角色</option>
													      <option value="3">普通角色</option>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">是否系统数据</label>
													<div class="col-lg-8">
														<input class="checkbox-slider" type="checkbox" checked="checked" id="isSys2">
														<span class="text"></span>
													</div>
													<input name="isSys" id="isSysdata2" value="1" type="hidden">
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">是否可用</label>
													<div class="col-lg-8">
														<input class="checkbox-slider" type="checkbox" checked="checked" id="useable2">
														<span class="text"></span>
													</div>
													<input name="useable" id="isuseable2" value="1" type="hidden">
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">数据范围</label>
													<div class="col-lg-8">
														<select name="dataScope" class="form-control" id="dataScope2">
													      <option value="0" >请选择</option>
													      <option value="1" selected="selected">所在公司数据</option>
													      <option value="2">所在部门数据</option>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">角色授权</label>
													<div class="col-lg-8">
														<input type="hidden" name="menu" id="rolemenus2">
														<ul id="tree3" class="ztree" style="height:200px;overflow:auto"></ul>
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

										<div id="allocateDepart" class="tab-pane">
											<div class="well bg-palegreen bordered-right bordered-success">
												<div class="row">
													<div class="col-xs-4">
														角色名称：本公司管理员
													</div>
													<div class="col-xs-4">
														归属机构：销售部
													</div>
													<div class="col-xs-4">
														英文名称：js
													</div>
												</div>
												<div class="row">
													<div class="col-xs-4">
														角色类型：assignment
													</div>
													<div class="col-xs-4">
														数据范围：所在公司数据
													</div>
												</div>
											</div>

											<div id="home" class="tab-pane in active">
												<div class="table-toolbar">

													<!--<a href="javascript:allocateRole()" class="btn btn-blue col-padd">
													<i class="fa fa-bookmark-o"></i>分配角色
												</a>-->

												</div>
												<table class="table table-striped table-hover table-bordered" id="bodyHtml">
													<thead>
														<tr role="row">
															<th>
																归属公司 <span class="fa indicator fa-unsorted"></span>
															</th>
															<th>
																归属部门 <span class="fa indicator fa-unsorted"></span>
															</th>
															<th>
																登录名 <span class="fa indicator fa-unsorted"></span>
															</th>
															<th>
																姓名 <span class="fa indicator fa-unsorted"></span>
															</th>
															<th>
																电话 <span class="fa indicator fa-unsorted"></span>
															</th>
															<th>
																手机 <span class="fa indicator fa-unsorted"></span>
															</th>
															<th>
																<span class="fa indicator fa-unsorted"></span>
															</th>
														</tr>
													</thead>

													<tbody id="showRoleUser">
														
													</tbody>
												</table>
											</div>

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
		<div class="modal fade in" aria-hidden="false" id="deparment">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" type="button" data-dismiss="modal">×</button>
						<h4 class="modal-title">选择机构</h4>
					</div>
					<div class="modal-body form-horizontal">
						<form action="${ctx }/manager/depart/findAllDepart" id="searchForm">
							<div id="search" class="form-search">
								<label class="control-label col-lg-4">关键词：</label>
								<input id="keyword" name="name" type="text" style="width: 200px;display: inline-block;">
								<div style="display: inline-block;margin-left: 10px;">
									<a class="btn btn-primary" id="officesearch"><i class="glyphicon glyphicon-search"></i>搜索</a>
								</div>
							</div>
							<div class="area-select" style="margin-top: 20px">
								<ul id="tree2" class="ztree col-lg-offset-4"></ul>
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
		
		<!-- 归属部门树 -->
		<script type="text/javascript">
			 /*上级机构*/
			var setting2 = {
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
	
			var zNodes2 ;
			var code2;
			function setCheck() {
	
				var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
						py = $("#py").attr("checked")? "p":"",
						sy = $("#sy").attr("checked")? "s":"",
						pn = $("#pn").attr("checked")? "p":"",
						sn = $("#sn").attr("checked")? "s":"",
						type = { "Y":py + sy, "N":pn + sn};
				zTree.setting.check.chkboxType = type;
				showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
			}
			function showCode(str) {
				if (!code2) code2 = $("#code");
				code2.empty();
				code2.append("<li>"+str+"</li>");
			}
			function fuzhi(data){
				zNodes2=eval("("+data+")");
				$.fn.zTree.init($("#treeDemo"), setting2, zNodes2);
	
				setCheck();
				$("#py").bind("change", setCheck);
				$("#sy").bind("change", setCheck);
				$("#pn").bind("change", setCheck);
				$("#sn").bind("change", setCheck);
	
			}
	
			$(document).ready(function(){
				$.ajax({
					url : '${ctx}/manager/depart/findAllDepart',
					type : 'POST',
					dataType : 'text',
					success : function(data) {
						var zNodes = eval("(" + data + ")");
						$.fn.zTree.init($("#tree2"), setting2, zNodes);
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
					url : '${ctx}/manager/depart/findAllDepart',
					type : 'POST',
					dataType : 'text',
					success : function(data) {
						var zNodes = eval("(" + data + ")");
						$.fn.zTree.init($("#tree2"), setting2, zNodes);
					},
					error : function(msg) {
						alert('树加载异常!');
					}
				});
			});
	      $("#chose2").click(function(){
				$('#deparment').modal('show')
				$.ajax({
					url : '${ctx}/manager/depart/findAllDepart',
					type : 'POST',
					dataType : 'text',
					success : function(data) {
						var zNodes = eval("(" + data + ")");
						$.fn.zTree.init($("#tree2"), setting2, zNodes);
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
						url : "${ctx}/manager/depart/findAllDepart",
						type : "POST",
						data : $("#searchForm").serialize(),
						dataType : "json",
						success : function(data) {
							$("#keyword").val("");
							$.fn.zTree.init($("#tree2"), setting2, data);
						}
					});
		      })
		</script>
		<!-- 权限树 -->
		<script type="text/javascript">
			var setting = {
					check: {
						enable: true
					},
					data: {
						simpleData: {
							enable: true
						}
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
		
		</script>
		
		<!-- 权限树 -->
		<script type="text/javascript">
			var setting = {
					check: {
						enable: true
					},
					data: {
						simpleData: {
							enable: true
						}
					}
			};
			$(document).ready(function(){
				$.ajax({
					url : '${ctx}/manager/menu/findMenus',
					type : 'POST',
					dataType : 'text',
					success : function(data) {
						var zNodes = eval("(" + data + ")");
						$.fn.zTree.init($("#tree3"), setting, zNodes);
					},
					error : function(msg) {
						alert('树加载异常!');
					}
				});
			});
		
		</script>
		<script>
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
					$('#tab-edit,#tab-allocate').hide();
				})
				$('.distributionClass').click(function() {
						allocateClass(this);
					})
					//分配
				function allocateClass(_this) {
					$('#tab-allocate').show();
					$('#tab-allocate').click();
				}
			});

			function newDepart() {
				$('#tab-add').click();
			}

			function deleteBatch() {
				$('input[name="myHoverTreechk"]').each(function() {
					if ($(this).is(':checked'))
						$(this).parent().parent().parent().remove();
				})
			}
			$('input.checkedAll').change(function() {
				if ($(this).is(':checked')) {
					$(this).parent('label').parent('.checkbox').siblings('.row').find('input').prop("checked", 'checked');
				} else {
					$(this).parent('label').parent('.checkbox').siblings('.row').find('input').prop('checked', '');
				}
			})
			$('input.checkedSingle').change(function() {
				if ($(this).is(':checked')) {
					var isAllChecked = 'checked';
					$(this).closest('.row').find('.checkedSingle').each(function() {
						if (!$(this).is(':checked'))
							isAllChecked = '';
					})
					$(this).closest('.row').siblings('.checkbox').find('.checkedAll').prop('checked', isAllChecked);
				} else {
					$(this).closest('.row').siblings('.checkbox').find('.checkedAll').prop('checked', '');
				}
			})
			
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
						url : "${ctx}/manager/role/delete",
						type : "POST",
						data : {"ids":ids},
						dataType : "json",
						success : function(data) {
							if (data > 0) {
								alert("删除成功！")
								window.location.href = "${ctx}/manager/role/index";
							} else {
								alert("删除失败！");
								return false;
							}
						}
					});
	    		}
	    	})
			$("#syscheckbox").change(function(){
	    		var e = document.getElementById("syscheckbox");
	    		if(e.checked){
	    			$("#isSysdata").val(1);
	    		}else{
	    			$("#isSysdata").val(0);
	    		}
	    	})
	    	$("#isSys2").change(function(){
	    		var e = document.getElementById("isSys2");
	    		if(e.checked){
	    			$("#isSysdata2").val(1);
	    		}else{
	    			$("#isSysdata2").val(0);
	    		}
	    	})
	    	$("#usecheckbox").change(function(){
	    		var e = document.getElementById("usecheckbox");
	    		if(e.checked){
	    			$("#isuseable").val(1);
	    		}else{
	    			$("#isuseable").val(0);
	    		}
	    	})
	    	$("#useable2").change(function(){
	    		var e = document.getElementById("useable2");
	    		if(e.checked){
	    			$("#isuseable2").val(1);
	    		}else{
	    			$("#isuseable2").val(0);
	    		}
	    	})
			function deleteSingle(id){
				if(confirm("是否确定删除")){
					$.ajax({
						url : "${ctx}/manager/role/deleteById",
						type : "POST",
						data : {"id":id},
						dataType : "json",
						success : function(data) {
							if (data > 0) {
								alert("删除成功！")
								window.location.href = "${ctx}/manager/role/index";
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
	                 url: "${ctx}/manager/role/edit",
	                 type: "POST",
	                 data: {id:id},
	                 dataType : "json",
	         		success : function(data) {
	         			$("#id2").val(data.id);
	         			$("#belongoffice2").val(data.officeId);
	         			$("#name2").val(data.name);
	         			$("#enname2").val(data.enname);
	         			$("#roleType2").val(data.roleType);
	         			$("#dataScope2").val(data.dataScope);
	         			$("#remarks2").val(data.remarks);
	         			$("#officeId2").val(data.officeName);
	         			if(data.isSys == "0"){
	         				$("#isSys2").removeAttr("checked");
	         			}
	         			if(data.useable == "0"){
	         				$("#useable2").removeAttr("checked");
	         			}
	         			$.ajax({
	    					url : '${ctx}/manager/menu/findMenus',
	    					type : 'POST',
	    					dataType : 'text',
	    					success : function(data) {
	    						var zNodes = eval("(" + data + ")");
	    						zTreeObj = $.fn.zTree.init($("#tree3"), setting, zNodes);
	    						zTreeObj.expandAll(true);
	    						var nodes = zTreeObj.getNodes();
	    						var array = zTreeObj.transformToArray(nodes);
	    						$.ajax({
	    							url : "${ctx}/manager/role/findMenuByRole",//查询角色对应菜单
	    							type : "POST",
	    							data : {"id":id},
	    							dataType : "json",
	    							success : function(treeJson) {
	    								for(var i in array){
	    									for (var j in treeJson){
	    										if(!array[i].isParent){
	    											if(array[i].id==treeJson[j].id){
	    												zTreeObj.checkNode(array[i],true,true);
	    											}
	    										}
	    									}
	    								}
	    							}
	    						});
	    					},
	    					error : function(msg) {
	    						alert('树加载异常!');
	    					}
	    				});
	         			
	         		}
	             });
			}
			function userformcheck(){
				var treeObj = $.fn.zTree.getZTreeObj("tree");
				var nodes = treeObj.getCheckedNodes(true);
				var menu = "";
				for(var i=0;i<nodes.length;i++){
					menu += nodes[i]["id"]+",";
				}
				$("#rolemenus").val(menu);
				$('#registrationForm').data('bootstrapValidator').validate();
				if($('#registrationForm').data('bootstrapValidator').isValid()) {
					$.ajax({
						url : "${ctx}/manager/role/save",
						type : "POST",
						data : $("#registrationForm").serialize(),
						dataType : "json",
						success : function(data) {
							if($(data)[0]["code"]=="1"){
								alert($(data)[0]["msg"]);
								window.location.href = "${ctx}/manager/role/index";
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
						url : "${ctx}/manager/role/update",
						type : "POST",
						data : $("#editForm").serialize(),
						dataType : "json",
						success : function(data) {
							if($(data)[0]["code"]=="1"){
								alert($(data)[0]["msg"]);
								window.location.href = "${ctx}/manager/role/index";
							}else{
								alert($(data)[0]["msg"]);
							}
						}
					});
				}
			}
			function showRoleUsers(id){
				$.ajax({
					url : "${ctx}/manager/role/showRoleUsers",
					type : "POST",
					data : {id:id},
					dataType : "json",
					success : function(data) {
						var obj = eval(data);
						var html = "";
						for(var i = 0; i < obj.length; i++){
							var id = obj[i]["id"];
							var roleId = obj[i]["roleId"];
							var companyName = obj[i]["companyName"];
							if(!companyName) companyName = "";
							var officeName = obj[i]["officeName"];
							if(!officeName) officeName = "";
							var loginName = obj[i]["loginName"];
							if(!loginName) loginName = "";
							var name = obj[i]["name"];
							if(!name) name = "";
							var phone = obj[i]["phone"];
							if(!phone) phone = "";
							var mobile = obj[i]["mobile"];
							if(!mobile) mobile = "";
							html += "<tr><td><input type='text' class='six' value='"+companyName+"' disabled='disabled'></td><td><input type='text' class='six' value='"+officeName+"' disabled='disabled'></td>"+
							"<td><input type='text' value='"+loginName+"' class='six' disabled='disabled'></td><td><input type='text' class='six' value='"+name+"' disabled='disabled'></td>"+
							"<td><input type='text' class='six' value='"+phone+"' disabled='disabled'></td><td><input type='text' class='six' value='"+mobile+"' disabled='disabled'></td>"+
							"<td><a href='${ctx}/manager/role/deleteUserRole?id="+id+"' class='btn btn-danger btn-xs removeClass' onclick='deleteUserRole("+id+","+roleId+")'><i class='fa fa-trash-o'></i> 移除</a></td></tr>";				
						}
						$("#showRoleUser").html(html);
					}
				});
			}
		</script>

	</body>

</html>