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

		<title>用户管理</title>

	<link rel="shortcut icon" href="${ctx}/home/img/favicon.png" type="image/x-icon">

	<!--Basic Styles-->
    <link id="bootstrap-rtl-link" href="" rel="stylesheet" />
    <link href="${ctx}/dep/css/font-awesome.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/css/weather-icons.min.css" rel="stylesheet" />
    <!--Beyond styles-->
    <link href="${ctx}/dep/css/beyond.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/css/demo.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/css/typicons.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/css/animate.min.css" rel="stylesheet" />
    
    <link href="${ctx}/dep/css/dataTables.bootstrap.css" rel="stylesheet"/>
    
    <link rel="stylesheet" href="${ctx}/home/common/css.css">
	<link rel="stylesheet" href="${ctx}/home/sysconfig/sysconfig.css" />
		<style>
			#registrationForm input {
				width: 80%;
			}
			
			#registrationForm select,
			textarea {
				width: 80%;
			}
			
			#editUser input {
				width: 80%;
			}
			
			#editUser select,
			textarea {
				width: 80%;
			}
		</style>
		<!-- 导入ztree类库 -->
		<%-- <link rel="stylesheet"
			href="${ctx}/dep/zTree/css/zTreeStyle/zTreeStyle.min.css"
			type="text/css" />
		<script
			src="${ctx}/dep/zTree/js/jquery.ztree.core-3.5.js"
			type="text/javascript"></script> --%>	
		
		<link rel="stylesheet" href="${ctx}/dep/zTreeStyle/zTreeStyle.min.css" />
		<script src="${ctx}/dep/zTreeStyle/jquery.ztree.all.min.js"></script>
	</head>

	<body>

		<!-- 导航 -->
		<!-- /Navbar -->
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
							<div class="pull-left" style="min-width:195px;margin-left: 15px">
								<!-- 组织机构树 -->
								<div class="flat radius-bordered">
									<div class="widget-header bg-sky">
										<span class="widget-caption">组织机构</span>
										<div class="widget-buttons">
											<a href="#" data-toggle="collapse">
												<i class="fa fa-minus"></i>
											</a>
										</div>
									</div>
									<div class="widget-body">
					                  <ul id="tree" class="ztree"></ul>
					                </div>
								</div>
							</div>

							<div class="col-xs-10 col-md-10">

								<div class="tabbable">
									<ul class="nav nav-tabs" id="myTab">
										<li class="active">
											<a id="tab-list" data-toggle="tab" href="#home">
                                                   	 用户列表
                                                </a>
										</li>

										<li class="tab-red">
											<a id="tab-add" data-toggle="tab" href="#profile">
                                                  	 用户添加
                                                </a>
										</li>
										<li class="tab-blue">
											<a id="tab-edit" data-toggle="tab" href="#editUser" style="display: none;">
												用户编辑
											</a>
										</li>
									</ul>

									<div class="tab-content">
										<div id="home" class="tab-pane in active">
											<div class="table-toolbar">

												<a href="" class="btn btn-darkorange col-padd" id="deleteBatch">
													<i class="fa fa-minus"></i>批量删除
												</a>
												<!-- <a href="javascript:newUser()" class="btn btn-blue col-padd">
													<i class="fa fa-plus"></i>新增用户
												</a> -->
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
														<th width="20%">
															操作<span class="fa indicator fa-unsorted"></span>
														</th>
													</tr>
												</thead>

												<tbody>
												<form action="" id="userform" method="post">
												<c:forEach items="${pager.list }" var="list">
													<tr>
														<td>
															<label>
		                                                        <input type="checkbox" name="id"  value="${list.id }">
		                                                        <span class="text"></span>
		                                                    </label>
														</td>
														<td><input type="text" class="six" value="${list.companyName }" disabled="disabled"></td>
														<td><input type="text" class="six" value="${list.officeName }" class="namese" disabled="disabled"></td>
														<td><input type="text" class="six" value="${list.loginName }" disabled="disabled"></td>
														<td>
															<input type="text" value="${list.name }" class="six" disabled="disabled">
														</td>
														<td><input type="text" class="six" value="${list.phone }" disabled="disabled"></td>
														<td><input type="text" class="six" value="${list.mobile }" disabled="disabled"></td>
														<td>
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

									</ul>
								</div>
							</div>
										</div>
										<!-- 新增用户 form -->
										<div id="profile" class="tab-pane">

											<form id="registrationForm" method="post" class="form-horizontal" onsubmit="return userformcheck()">
	
												<div class="form-group">
													<label class="col-lg-4 control-label">归属公司<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<select class="form-control" name="companyId" id="company">
													      <option value="0" selected="selected">请选择</option>
													    </select>
													</div>
												</div>
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
													<label class="col-lg-4 control-label">工号<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input type="text" class="form-control" name="no" data-bv-notempty="true" data-bv-notempty-message="工号不能为空" />

													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">姓名<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input type="text" class="form-control" name="name" data-bv-notempty="true" data-bv-notempty-message="姓名不能为空" />

													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">登录名<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input type="text" class="form-control" name="loginName" data-bv-message="登录名无效" data-bv-notempty="true" data-bv-notempty-message="登录名不能为空" data-bv-regexp="true" data-bv-regexp-regexp="[a-zA-Z0-9_\.]+" data-bv-regexp-message="登录名只能包含字母, 数字, 点和下划线" data-bv-stringlength="true"
															data-bv-stringlength-min="6" data-bv-stringlength-max="30" data-bv-stringlength-message="用户名字符长度要大于6位小于30位" data-bv-different="true" data-bv-different-field="password" data-bv-different-message="用户名和密码不能相同" />

													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">密码<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input type="password" class="form-control" name="password" data-bv-notempty="true" data-bv-notempty-message="密码不能为空" data-bv-identical="true" data-bv-identical-field="confirmPassword" data-bv-identical-message="密码不一致" data-bv-different="true" data-bv-different-field="loginName"
															data-bv-different-message="密码不能和用户名相同" />

													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">确认密码<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input type="password" class="form-control" name="confirmPassword" data-bv-notempty="true" data-bv-notempty-message="确认密码不能为空" data-bv-identical="true" data-bv-identical-field="password" data-bv-identical-message="密码不一致" data-bv-different="true" data-bv-different-field="loginName"
															data-bv-different-message="密码不能与用户名相同" />

													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">邮箱</label>
													<div class="col-lg-8">
														<input class="form-control" name="email" type="email" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">电话</label>
													<div class="col-lg-8">
														<input class="form-control" name="phone" type="text" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">手机</label>
													<div class="col-lg-8">
														<input class="form-control" name="mobile" type="text" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">是否允许登录</label>
													<div class="col-lg-8">
														<input class="checkbox-slider" type="checkbox" checked="checked" value="1" id="logincheckbox">
														<span class="text"></span>
													</div>
													<input name="loginFlag" id="_loginFlag" value="1" type="hidden">
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">用户类型</label>
													<div class="col-lg-8">
														<select class="form-control" name="userType">
													      <option value="0" selected="selected">请选择</option>
													      <option value="1">系统管理</option>
													      <option value="2">部门经理</option>
													      <option value="3">普通用户</option>
													    </select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">用户角色<span class="help-inline"><font color="red">*</font> </span></label>
														<div class="col-lg-8" id="divcontent">
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
														<input class="btn btn-palegreen" type="submit"  value="提交"/>
													</div>
												</div>

											</form>
										</div>

										<div id="editUser" class="tab-pane">

											<form action="" id="editForm" method="post" class="form-horizontal" onsubmit="return userformedit()">
								
												<input type="hidden" name="id" id="id2">
												<div class="form-group">
													<label class="col-lg-4 control-label">归属公司<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<select name="companyId" class="form-control" id="company2">
													      <option value="0">请选择</option>
													    </select>
													</div>
												</div>
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
													<label class="col-lg-4 control-label">工号<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input value="111111111" type="text" class="form-control" name="no" data-bv-notempty="true" data-bv-notempty-message="工号不能为空" id="no2"/>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">姓名<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input value="济南高新区领导" type="text" class="form-control" name="name" data-bv-notempty="true" data-bv-notempty-message="姓名不能为空" id="name2"/>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">登录名<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input value="gaxld_666" type="text" class="form-control" name="loginName" data-bv-message="登录名无效" data-bv-notempty="true" data-bv-notempty-message="登录名不能为空" data-bv-regexp="true" data-bv-regexp-regexp="[a-zA-Z0-9_\.]+" data-bv-regexp-message="登录名只能包含字母, 数字, 点和下划线"
															data-bv-stringlength="true" data-bv-stringlength-min="6" data-bv-stringlength-max="30" data-bv-stringlength-message="用户名字符长度要大于6位小于30位" id="loginName2"/>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">密码<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input type="password" class="form-control" name="password" data-bv-notempty="true" data-bv-notempty-message="密码不能为空" data-bv-identical="true" data-bv-identical-field="confirmPassword" data-bv-identical-message="密码不一致" />

													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">确认密码<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input type="password" class="form-control" name="confirmPassword" data-bv-notempty="true" data-bv-notempty-message="确认密码不能为空" data-bv-identical="true" data-bv-identical-field="password" data-bv-identical-message="密码不一致"/>

													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">邮箱</label>
													<div class="col-lg-8">
														<input value="1111@163.com" class="form-control" name="email" type="email" id="email2"/>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">电话</label>
													<div class="col-lg-8">
														<input value="18999999999" class="form-control" name="phone" type="text" id="phone2"/>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">手机</label>
													<div class="col-lg-8">
														<input value="18999999999" class="form-control" name="mobile" type="text" id="mobile2"/>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">是否允许登录</label>
													<div class="col-lg-8">
														<input class="checkbox-slider" type="checkbox" checked="checked" id="loginFlag2">
														<span class="text"></span>
													</div>
													<input name="loginFlag" id="_loginFlag2" value="1" type="hidden">
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">用户类型</label>
													<div class="col-lg-8">
														<select class="form-control" name="userType" id="userType2">
													      <option value="0" selected="selected">请选择</option>
													      <option value="1">系统管理</option>
													      <option value="2" selected="selected">部门经理</option>
													      <option value="3">普通用户</option>
													    </select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">用户角色<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8" id="divcontent2">
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
							</div>
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
		<script src="${ctx}/dep/skins.min.js"></script>
		<script src="${ctx}/dep/bootstrap.min.js"></script>
		
		<script src="${ctx}/dep/beyond.min.js"></script>
		
		<script src="${ctx}/dep/validation/bootstrapValidator.js"></script>
		
		<!-- 组织机构树 -->
		<script type="text/javascript">
		var setting = {data:{simpleData:{enable:true,idKey:"id",pIdKey:"pId",rootPId:'0'}},
	        callback:{onClick:function(event, treeId, treeNode){
	        	location.href="index?officeId="+treeNode.id;
	        }
	        }
	      };
		
	      function expandNode(e) {
	        var zTree = $.fn.zTree.getZTreeObj("tree"),
	            type = e.data.type,
	            nodes = zTree.getSelectedNodes();
	        if (type.indexOf("All")<0 && nodes.length == 0) {
	          alert("请先选择一个父节点");
	        }

	        if (type == "expandAll") {
	          zTree.expandAll(true);
	        } else if (type == "collapseAll") {
	          zTree.expandAll(false);
	        } else {
	          var callbackFlag = $("#callbackTrigger").attr("checked");
	          for (var i=0, l=nodes.length; i<l; i++) {
	            zTree.setting.view.fontCss = {};
	            if (type == "expand") {
	              zTree.expandNode(nodes[i], true, null, null, callbackFlag);
	            } else if (type == "collapse") {
	              zTree.expandNode(nodes[i], false, null, null, callbackFlag);
	            } else if (type == "toggle") {
	              zTree.expandNode(nodes[i], null, null, null, callbackFlag);
	            } else if (type == "expandSon") {
	              zTree.expandNode(nodes[i], true, true, null, callbackFlag);
	            } else if (type == "collapseSon") {
	              zTree.expandNode(nodes[i], false, true, null, callbackFlag);
	            }
	          }
	        }
	      }
	      
	      $(function(){
				$.ajax({
					url : '${ctx}/manager/depart/findAllDepart',
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
			})
			$('.menuBtn').click(function(){
				index = $(this).index('.menuBtn');
			
				var cityObj = $(this).siblings('.higher');
				var cityOffset = $(this).siblings('.higher').offset();
				$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

				$("body").bind("mousedown", onBodyDown);
			})
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
		</script>
		
		<script>
			$(function() {
				loadCompany();
				loadRole();
				$("#registrationForm").bootstrapValidator();
				$("#editForm").bootstrapValidator();
				//UITree.init();
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
			function newUser() {
				$('#tab-add').click();
			}

			function deleteBatch() {
				$('input[name="myHoverTreechk"]').each(function() {
					if ($(this).is(':checked'))
						$(this).parent().parent().parent().remove();
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
						url : "${ctx}/manager/user/delete",
						type : "POST",
						data : {"ids":ids},
						dataType : "json",
						success : function(data) {
							if (data.code > 0) {
								alert("删除成功！")
								window.location.href = "${ctx}/manager/user/index?officeId="+data.msg;
							} else {
								alert(data.msg);
								return false;
							}
						}
					});
	    		}
	    	})
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
						url : "${ctx}/manager/user/deleteById",
						type : "POST",
						data : {"id":id},
						dataType : "json",
						success : function(data) {
							if (data.code > 0) {
								alert("删除成功！")
								window.location.href = "${ctx}/manager/user/index?officeId="+data.msg;
							} else {
								alert(data.msg);
								return false;
							}
						}
					});
	    		}
			}
			function edit(id){
	    		 $.ajax({
	                 url: "${ctx}/manager/user/edit",
	                 type: "POST",
	                 data: {id:id},
	                 dataType : "json",
	         		success : function(data) {
	         			$("#id2").val(data.id);
	         			$("#company2").val(data.companyId);
	         			$("#officeId2").val(data.officeName);
	         			$("#belongoffice2").val(data.officeId);
	         			$("#no2").val(data.no);
	         			$("#name2").val(data.name);
	         			$("#loginName2").val(data.loginName);
	         			$("#email2").val(data.email);
	         			$("#phone2").val(data.phone);
	         			$("#mobile2").val(data.mobile);
	         			$("#userType2").val(data.userType);
	         			$("#remarks2").val(data.remarks);
	         			if(data.loginFlag == "0"){
	         				$("#loginFlag2").removeAttr("checked");
	         			}
	         			var role = data.roleId;
	         			if(role){
	         				loadRole(role);
	         			}
	         		}
	             });
			}
			function loadCompany(){
				$.ajax({
	                 url: "${ctx}/company/findAllCompany",
	                 type: "POST",
	                 dataType : "json",
	         		success : function(data) {
	         			var html = "<option value=''>请选择</option>";
	    				$(data).each(function(i){
	    					html +="<option value="+data[i].id+">"+data[i].name+"</option>";
	    				});
	    				$("#company").html(html);
	    				$("#company2").html(html);
	         		}
				})
			}
			function loadRole(ids){
				$.ajax({
	                 url: "${ctx}/manager/role/findAllRole",
	                 type: "POST",
	                 dataType : "json",
	         		success : function(data) {
	         			var htmltj = "";
	         			var htmlxg = "";
	         			$(data).each(function(i){
	         				var roleId = data[i].id;
	         				var roleName = data[i].name;
	         				htmltj +="<div class='checkbox' style='display: inline-block;'><label><input value="+roleId+" name='role' type='checkbox' class='colored-blue' ><span class='text'>"+roleName+"</span></label></div>";
	         				if(ids){
	         					var id = ids.split(",");
	         					var j = 0;
	         					$(id).each(function(i){
	         						if(roleId == id[i]){
	         							j = 1;
	         						}
	         					});
	         					if(j == 1){
	         						htmlxg +="<div class='checkbox' style='display: inline-block;'><label><input value="+roleId+" checked='checked' name='role' type='checkbox' class='colored-blue' ><span class='text'>"+roleName+"</span></label></div>";
	     						}else{
	     							htmlxg +="<div class='checkbox' style='display: inline-block;'><label><input value="+roleId+" name='role' type='checkbox' class='colored-blue' ><span class='text'>"+roleName+"</span></label></div>";
	     						} 
	         				}
	    				});
	         			$("#divcontent").html(htmltj);
	         			if(htmlxg == ""){
	         				$("#divcontent2").html(htmltj);
	         			}else{
	         				$("#divcontent2").html(htmlxg);
	         			}
	         		}
				})
			}
			function userformcheck(){
				$('#registrationForm').data('bootstrapValidator').validate();
				if($('#registrationForm').data('bootstrapValidator').isValid()) {
					$.ajax({
						url : "${ctx}/manager/user/save",
						type : "POST",
						data : $("#registrationForm").serialize(),
						dataType : "json",
						success : function(data) {
							if($(data)[0]["code"]=="1"){
								alert($(data)[0]["msg"]);
								window.location.href = "${ctx}/manager/user/index";
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
						url : "${ctx}/manager/user/update",
						type : "POST",
						data : $("#editForm").serialize(),
						dataType : "json",
						success : function(data) {
							if($(data)[0]["code"]=="1"){
								alert($(data)[0]["msg"]);
								window.location.href = "${ctx}/manager/user/index";
							}else{
								alert($(data)[0]["msg"]);
							}
						}
					});
				}
			}
			
			function newDepart() {
				$('#tab-add').click();
			}
			
		</script>

	</body>

</html>