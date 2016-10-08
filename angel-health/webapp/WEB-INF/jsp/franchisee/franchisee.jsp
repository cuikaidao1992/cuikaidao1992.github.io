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
    <title>加盟商信息</title>

</head>

<body  class="gray-bg">
         <div class="page-content">
                <div class="page-breadcrumbs">
                    <ul class="breadcrumb">
                        <li>
                            <i class="fa fa-home"></i>
                            <a href="index.html">首页</a>
                        </li>
                        <li class="active">加盟商信息管理</li>
                    </ul>
                </div>
                <!-- /Page Breadcrumb -->
                <!-- Page Header -->
                <div class="page-header position-relative">
                    <div class="header-title">
                        <h1> 加盟商信息服务</h1>
                    </div>
                    <!--展开收缩-->
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
                    <!--展开收缩-->
                </div>
    <div class="page-body">
          <div class="row">
            <div class="col-xs-12 col-md-12 col-lg-12">
                <div class="widget">
                    <div class="widget-header">
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
                    <div class="widget-body">
                        <div class="table-toolbar">
                             <a href="${ctx}/franchisee/toFranchiseeAdd" class="btn btn-blue col-padd"  >
                               <i class="fa fa-plus"></i>新增加盟商
                            </a>
                            <a href="${ctx}/franchisee/toFranchiseeAdd?from=approval" class="btn btn-azure col-padd">
                                <i class="fa fa-check-square-o"></i>审核
                            </a>
                             <div class="col-sm-2 col-padd">
                                    <span class="input-icon">
                                        <input type="text" class="form-control input-sm borderrdu "  placeholder="加盟商/姓名/手机号" style="border-radius:30px!important;">
                                        <i class="glyphicon glyphicon-search blue"></i>
                                    </span>
                              </div>
                        </div>
                       <table class="table table-striped table-hover table-bordered"  id="bodyHtml" >
                            <thead>
                                <tr role="row">
                                	<th width="5%"></th>
                                    <th width="10%">
                                       加盟商编号 <span class="fa indicator fa-unsorted"></span>
                                    </th>
                                    <th width="20%">
                                        加盟商名称 <span class="fa indicator fa-unsorted"></span>
                                    </th>
                                    <th width="10%">
                                        负责人姓名 <span class="fa indicator fa-unsorted"></span>
                                    </th>
                                    <th width="10%">
                                        负责人电话 <span class="fa indicator fa-unsorted"></span>
                                    </th>
                                    
                                      <th width="10%">
                                       状态 <span class="fa indicator fa-unsorted"></span>
                                    </th>                                                                                                                                                                                                                                                             
                                    <th width="10%">
                                       操作 <span class="fa indicator fa-unsorted"></span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                               
                               
                               <c:forEach items="${pager.list}" var="fr">
									<tr>
										<td width="5%">
                                   			<label>
                                        		<input type="checkbox" name="myHoverTreechk">
                                        		<span class="text"></span>
                                    		</label>
                                		</td>
										<td width="10%">${fr.id}</td>
	                                    <td width="20%">${fr.name}</td>
	                                    <td width="10%">${fr.headName}</td>
	                                    <td width="10%">${fr.headPhone}</td>
	                                    <td width="10%">
	                                    	<c:choose>
	                                    		<c:when test="${fr.status==0}">
	                                    			<span class="label label-default">未审核</span>
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			<span class="label label-success">已审核</span>
	                                    		</c:otherwise>
	                                    	</c:choose>
	                                       	
	                                    </td>
	                                    <td width="10%">
	                                        <a href="${ctx}/franchisee/toFranchiseeAdd?from=check&id=${fr.id}" class="btn btn-ck btn-xs edit"><i class="fa fa-folder-open-o"></i> 查看</a>
	                                     </td>
									</tr>
								</c:forEach>
                            </tbody>
                         </table>
                         
                         <%@ include file="../def/common_pagebar.jsp" %>
                         
                    </div>
                </div>
               
            </div>
           
        </div>
                    
     </div>
</div>

</body>

</html>

