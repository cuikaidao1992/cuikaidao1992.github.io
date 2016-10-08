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

		<title>机构管理</title>

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
								<a href="###">机构管理</a>
							</li>
						</ul>
					</div>
					<!-- /面包屑导航-->
					<!--头部按钮-->
					<div class="page-header position-relative">
						<div class="header-title">
							<h1>
                            	机构管理
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
							<div class="col-xs-2 col-md-2">
								<!-- 组织机构树 -->
								<div class="widget flat radius-bordered">
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
                                                   	 机构列表
                                                </a>
										</li>

										<li class="tab-red">
											<a id="tab-add" data-toggle="tab" href="#profile">
                                                  	 机构添加
                                                </a>
										</li>
										<li class="tab-blue">
											<a id="tab-edit" data-toggle="tab" href="#editDepart" style="display: none;">
												机构编辑
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
													<i class="fa fa-plus"></i>新增机构
												</a>
										<form action="" method="post" id="hiddens">
										</form>
											</div>
											<table class="table table-striped table-hover table-bordered" id="bodyHtml">
												<thead>
													<tr role="row">
														<th width="5%">
															<label>
                                                        <input type="checkbox" name="id" id="hvtck">
                                                        <span class="text" id="dohovertree"></span>
                                                        
                                                    </label>
														</th>
														<th>
															机构名称 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															归属区域 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															机构编码 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															机构类型 <span class="fa indicator fa-unsorted"></span>
														</th>
														<th>
															备注 <span class="fa indicator fa-unsorted"></span>
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
														<td><input type="text" class="six" value="${list.name}" disabled="disabled"></td>
														<td><input type="text" class="six" value="${list.areaName }" class="namese" disabled="disabled"></td>
														<td><input type="text" class="six" value="${list.code }" disabled="disabled"></td>
														<td>
															<input type="text" value="${list.type=='1'?'公司':list.type=='2'?'部门':list.type=='3'?'小组':'其他'}" class="six" disabled="disabled">
														</td>
														<td><input type="text" class="six" value="${list.remarks }" disabled="disabled"></td>
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
										<!-- 新增机构 form -->
										<div id="profile" class="tab-pane">

											<form id="registrationForm" method="post" class="form-horizontal" onsubmit="return userformcheck()">

												<div class="form-group">
													<label class="col-lg-4 control-label">上级机构</label>
													<div class="col-lg-8">
														<div class="input-group" style="width:80%">
															<input type="hidden" name="parentId" class="form-control" id="parentoffice" style="width:100%">
															<input type="text" class="form-control" id="officeId" style="width:100%">
															<span class="input-group-btn" id="chose">
																<a href="#" data-toggle="modal" class="btn btn-default shiny" type="button" style="line-height: 20px">选择</a>
															</span>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-4 control-label">归属区域</label>
													<div class="col-lg-8">
														<div class="input-group" style="width:80%">
															<input type="hidden" name="areaId" class="form-control" id="belongarea" style="width:100%">
															<input type="text" class="form-control" id="areaId" style="width:100%">
															<span class="input-group-btn" id="chose1">
																<a href="#" class="btn btn-default shiny" type="button" style="line-height: 20px">选择</a>
															</span>
														</div>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">机构名称<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input type="text" class="form-control" name="name" data-bv-notempty="true" data-bv-notempty-message="机构名称不能为空" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">机构编码</label>
													<div class="col-lg-8">
														<input type="text" class="form-control" name="code" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">机构类型</label>
													<div class="col-lg-8">
														<select name="type" class="form-control">
													      <option value="0" selected="selected">请选择</option>
													      <option value="1">公司</option>
													      <option value="2">部门</option>
													      <option value="3">小组</option>
													      <option value="4">其他</option>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">机构级别</label>
													<div class="col-lg-8">
														<select name="grade" class="form-control">
													      <option value="0" selected="selected">请选择</option>
													      <option value="1">一级</option>
													      <option value="2">二级</option>
													      <option value="3">三级</option>
													      <option value="4">四级</option>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">是否可用</label>
													<div class="col-lg-8">
														<input class="checkbox-slider" type="checkbox" checked="checked" value="1" id="logincheckbox">
														<span class="text"></span>
													</div>
													<input name="enable" id="_loginFlag" value="1" type="hidden">
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">主负责人</label>
													<div class="col-lg-8">
														<select name="primaryPerson" class="form-control" id="_primaryPerson">
													      <option value="0" selected="selected">请选择</option>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">副负责人</label>
													<div class="col-lg-8">
														<select name="deputyPerson" class="form-control" id="_deputyPerson">
													      <option value="0" selected="selected">请选择</option>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">联系地址</label>
													<div class="col-lg-8">
														<input class="form-control" name="address" type="text" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">邮政编码</label>
													<div class="col-lg-8">
														<input class="form-control" name="zipCode" type="text" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">负责人</label>
													<div class="col-lg-8">
														<input class="form-control" name="master" type="text" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">电话</label>
													<div class="col-lg-8">
														<input class="form-control" name="phone" type="text" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">传真</label>
													<div class="col-lg-8">
														<input class="form-control" name="fax" type="text" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">邮箱</label>
													<div class="col-lg-8">
														<input class="form-control" name="email" type="email" />
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
													<label class="col-lg-4 control-label">上级机构</label>
													<div class="col-lg-8">
														<div class="input-group" style="width:80%">
															<input type="hidden" name="parentId" class="form-control" id="parentoffice2" style="width:100%">
															<input type="text" class="form-control" id="officeId2" style="width:100%">
															<span class="input-group-btn" id="chose3">
																<a href="#" data-toggle="modal" class="btn btn-default shiny" type="button" style="line-height: 20px">选择</a>
															</span>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-4 control-label">归属区域</label>
													<div class="col-lg-8">
														<div class="input-group" style="width:80%">
															<input type="hidden" name="areaId" class="form-control" id="belongarea2" style="width:100%">
															<input type="text" class="form-control" id="areaId2" style="width:100%">
															<span class="input-group-btn" id="chose4">
																<a href="#" data-toggle="modal" class="btn btn-default shiny" type="button" style="line-height: 20px">选择</a>
															</span>
														</div>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">机构名称<span class="help-inline"><font color="red">*</font> </span></label>
													<div class="col-lg-8">
														<input value="一个机构" type="text" class="form-control" name="name" id="name2" data-bv-notempty="true" data-bv-notempty-message="机构名称不能为空" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">机构编码</label>
													<div class="col-lg-8">
														<input value="xxxxxx" type="text" class="form-control" name="code" id="code2" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">机构类型</label>
													<div class="col-lg-8">
														<select name="type" class="form-control" id="type2">
													      <option value="0" >请选择</option>
													      <option value="1">公司</option>
													      <option value="2">部门</option>
													      <option value="3">小组</option>
													      <option value="4">其他</option>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">机构级别</label>
													<div class="col-lg-8">
														<select name="grade" class="form-control" id="grade2">
													      <option value="0">请选择</option>
													      <option value="1">一级</option>
													      <option value="2">二级</option>
													      <option value="3">三级</option>
													      <option value="4">四级</option>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">是否可用</label>
													<div class="col-lg-8">
														<input class="checkbox-slider" type="checkbox" checked="checked" id="loginFlag2">
														<span class="text"></span>
													</div>
													<input name="enable" id="_loginFlag2" value="1" type="hidden">
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">主负责人</label>
													<div class="col-lg-8">
														<select name="primaryPerson" class="form-control" id="primaryPerson2">
													      <option value="0" >请选择</option>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">副负责人</label>
													<div class="col-lg-8">
														<select name="deputyPerson" class="form-control" id="deputyPerson2">
													      <option value="0" >请选择</option>
														</select>
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">联系地址</label>
													<div class="col-lg-8">
														<input value="山东济南历下区" class="form-control" name="address" id="address2" type="text" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">邮政编码</label>
													<div class="col-lg-8">
														<input value="272100" class="form-control" name="zipCode" id="zipCode2" type="text" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">负责人</label>
													<div class="col-lg-8">
														<input value="小强" class="form-control" name="master" id="master2" type="text" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">电话</label>
													<div class="col-lg-8">
														<input value="15955555555" class="form-control" name="phone" id="phone2" type="text" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">传真</label>
													<div class="col-lg-8">
														<input value="2226666" class="form-control" name="fax" id="fax2" type="text" />
													</div>
												</div>

												<div class="form-group">
													<label class="col-lg-4 control-label">邮箱</label>
													<div class="col-lg-8">
														<input value="111@163.com" class="form-control" name="email" id="email2" type="email" />
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
		<!-- 上级机构 -->
		<div class="modal fade in" aria-hidden="false" id="deparment">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" type="button" data-dismiss="modal">×</button>
						<h4 class="modal-title">选择机构</h4>
					</div>
					<div class="modal-body form-horizontal">
						<form action="${ctx}/manager/depart/findAllDepart" id="searchForm">
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
		</div>
		<!-- 区域 -->
		<div class="modal fade in" aria-hidden="false" id="area">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" type="button" data-dismiss="modal">×</button>
						<h4 class="modal-title">选择区域</h4>
					</div>
					<div class="modal-body form-horizontal">
						<form action="${ctx}/manager/area/findAllArea" id="searchForm2">
							<div id="search2" class="form-search">
								<label class="control-label col-lg-4">关键词：</label>
								<input id="keyword2" name="name" type="text" style="width: 200px;display: inline-block;">
								<div style="display: inline-block;margin-left: 10px;">
									<a class="btn btn-primary" id="areasearch"><i class="glyphicon glyphicon-search"></i>搜索</a>
								</div>
							</div>
							<div class="area-select" style="margin-top: 20px">
								<ul id="tree3" class="ztree col-lg-offset-4"></ul>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-10 col-sm-offset-2">
									<span class="btn btn-darkorange col-sm-3" id="queren2">确定</span>
									<span class="btn btn-active col-sm-3 col-xs-offset-3" data-dismiss="modal" aria-hidden="true">取消</span>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		
		
		<!-- <div class="modal fade in" id="publish" aria-hidden="true" style="display: block;">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button class="close" type="button" data-dismiss="modal">×</button>
            <h4 class="modal-title">选择机构</h4>
          </div>
          <div class="modal-body form-horizontal">
            <form action="">
              <div id="search" class="form-search">
                <label class="control-label col-lg-4">关键词：</label>
                <input class="form-control" type="text" style="width: 200px;display: inline-block;">
                <div style="display: inline-block;margin-left: 10px;">
                  <a class="btn btn-primary"><i class="glyphicon glyphicon-search"></i>搜索</a>
                </div>
              </div>
              <div class="area-select" style="margin-top: 20px">
                <ul id="tree1" class="ztree col-lg-offset-4"></ul>
              </div>
              <div class="hr-line-dashed"></div>
              <div class="form-group">
                <div class="col-sm-10 col-sm-offset-2">
                  <button class="btn btn-darkorange col-sm-3" type="submit">确定</button>
                  <button class="btn btn-active col-sm-3 col-xs-offset-3" data-dismiss="modal" aria-hidden="true">取消</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div> -->
		<script src="${ctx}/dep/bootstrap.min.js"></script>
		<script src="${ctx}/dep/validation/bootstrapValidator.js"></script>
		<script src="${ctx}/dep/fuelux/treeview/tree-custom.min.js"></script>
		<script src="${ctx}/home/sysconfig/treeview-init.js"></script>
		<script src="${ctx}/dep/zTreeStyle/jquery.ztree.all.min.js"></script>

		<!-- 部门 -->
		<script type="text/javascript">
		var setting1 = {data:{simpleData:{enable:true,idKey:"id",pIdKey:"pId",rootPId:'0'}},
	        callback:{onClick:function(event, treeId, treeNode){
	        	location.href="index?parentIds="+treeNode.id;
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
						$.fn.zTree.init($("#tree"), setting1, zNodes);
					},
					error : function(msg) {
						alert('树加载异常!');
					}
				});
			}) 
			 
		</script>
		<!-- 上级机构 -->
	<script type="text/javascript">
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
				$("#parentoffice").val(treeNode.id);
				$("#officeId").val(treeNode.name);
				$("#parentoffice2").val(treeNode.id);
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
	      $("#chose3").click(function(){
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
		
		<!-- 区域 -->
		<script type="text/javascript">
			var setting3 = {
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
							$.fn.zTree.init($("#tree3"), setting3, zNodes);
						},
						error : function(msg) {
							alert('树加载异常!');
						}
					});
				});
				
				function onClick(event, treeId, treeNode, clickFlag) {
					$('#area').modal('hide');
					$("#belongarea").val(treeNode.id);
					$("#areaId").val(treeNode.name);
					$("#belongarea2").val(treeNode.id);
					$("#areaId2").val(treeNode.name);
				}
				$("#chose1").click(function(){
					$('#area').modal('show')
					$.ajax({
						url : '${ctx}/manager/area/findAllArea',
						type : 'POST',
						dataType : 'text',
						success : function(data) {
							var zNodes = eval("(" + data + ")");
							$.fn.zTree.init($("#tree3"), setting3, zNodes);
						},
						error : function(msg) {
							alert('树加载异常!');
						}
					});
				});
		      $("#chose4").click(function(){
					$('#area').modal('show')
					$.ajax({
						url : '${ctx}/manager/area/findAllArea',
						type : 'POST',
						dataType : 'text',
						success : function(data) {
							var zNodes = eval("(" + data + ")");
							$.fn.zTree.init($("#tree3"), setting3, zNodes);
						},
						error : function(msg) {
							alert('树加载异常!');
						}
					});
				});
			      $("#queren2").click(function(){
			    	  $('#area').modal('hide');
			      })
			      $("#areasearch").click(function(){
			    	  $.ajax({
							url : "${ctx}/manager/area/findAllArea",
							type : "POST",
							data : $("#searchForm").serialize(),
							dataType : "json",
							success : function(data) {
								$("#keyword").val("");
								$.fn.zTree.init($("#tree3"), setting3, data);
							}
						});
			      })
			</script>
		
		<script>
			$(function() {
				loadUser();
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
						url : "${ctx}/manager/depart/delete",
						type : "POST",
						data : {"ids":ids},
						dataType : "json",
						success : function(data) {
							if (data.code > 0) {
								alert("删除成功！")
								window.location.href = "${ctx}/manager/depart/index?officeId="+data.msg;
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
			
			function newDepart() {
				$('#tab-add').click();
			}

			function deleteSingle(id){
				if(confirm("是否确定删除")){
					$.ajax({
						url : "${ctx}/manager/depart/deleteById",
						type : "POST",
						data : {"id":id},
						dataType : "json",
						success : function(data) {
							if (data.code > 0) {
								alert("删除成功！")
								window.location.href = "${ctx}/manager/depart/index?officeId="+data.msg;
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
	                 url: "${ctx}/manager/depart/edit",
	                 type: "POST",
	                 data: {id:id},
	                 dataType : "json",
	         		success : function(data) {
	         			$("#id2").val(data.id);
	         			$("#parentoffice2").val(data.parentId);
	         			$("#officeId2").val(data.officeName);
	         			$("#belongarea2").val(data.areaId);
	         			$("#areaId2").val(data.areaName);
	         			$("#name2").val(data.name);
	         			$("#code2").val(data.code);
	         			$("#type2").val(data.type);
	         			$("#grade2").val(data.grade);
	         			$("#primaryPerson2").val(data.primaryPerson);
	         			$("#deputyPerson2").val(data.deputyPerson);
	         			$("#address2").val(data.address);
	         			$("#zipCode2").val(data.zipCode);
	         			$("#master2").val(data.master);
	         			$("#phone2").val(data.phone);
	         			$("#fax2").val(data.fax);
	         			$("#email2").val(data.email);
	         			$("#remarks2").val(data.remarks);
	         			if(data.enable == "0"){
	         				$("#loginFlag2").removeAttr("checked");
	         			}
	         		}
	             });
			}
			function userformcheck(){
				$('#registrationForm').data('bootstrapValidator').validate();
				if($('#registrationForm').data('bootstrapValidator').isValid()) {
					$.ajax({
						url : "${ctx}/manager/depart/save",
						type : "POST",
						data : $("#registrationForm").serialize(),
						dataType : "json",
						success : function(data) {
							if($(data)[0]["code"]=="1"){
								alert($(data)[0]["msg"]);
								window.location.href = "${ctx}/manager/depart/index";
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
						url : "${ctx}/manager/depart/update",
						type : "POST",
						data : $("#editForm").serialize(),
						dataType : "json",
						success : function(data) {
							if($(data)[0]["code"]=="1"){
								alert($(data)[0]["msg"]);
								window.location.href = "${ctx}/manager/depart/index";
							}else{
								alert($(data)[0]["msg"]);
							}
						}
					});
				}
			}
			function loadUser(){
				$.ajax({
	                 url: "${ctx}/manager/user/findAllUser",
	                 type: "POST",
	                 dataType : "json",
	         		success : function(data) {
	         			var html = "<option value=''>请选择</option>";
	    				$(data).each(function(i){
	    					html +="<option value="+data[i].id+">"+data[i].name+"</option>";
	    				});
	    				$("#_primaryPerson").html(html);
	    				$("#_deputyPerson").html(html);
	    				$("#primaryPerson2").html(html);
	    				$("#deputyPerson2").html(html);
	         		}
				})
			}
		</script>

	</body>

</html>