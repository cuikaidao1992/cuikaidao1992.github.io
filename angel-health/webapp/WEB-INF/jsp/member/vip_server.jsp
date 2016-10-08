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
 
    <link href="${ctx}/dep/moban/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" href="" rel="stylesheet" />
    <link href="${ctx}/dep/moban/css/font-awesome.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/moban/css/weather-icons.min.css" rel="stylesheet" />

    <link id="beyond-link" href="${ctx}/dep/css/beyond.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/moban/css/demo.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/moban/css/typicons.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/moban/css/animate.min.css" rel="stylesheet" />
    <link id="skin-link" href="" rel="stylesheet" type="text/css" />

    <link href="${ctx}/dep/moban/css/dataTables.bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="${ctx}/home/common/css.css">
   
    

</head>

<body>
    
    <div class="page-content">
                <!-- 面包屑导航 -->
                <div class="page-breadcrumbs">
                    <ul class="breadcrumb">
                        <li>
                            <i class="fa fa-home"></i>
                            <a href="index.html">首页</a>
                        </li>
                        <li class="active">
                          <a href="###">会员信息管理</a>
                        </li>
                        <li class="active">
                          会员预约服务列表
                        </li>
                    </ul>
                </div>
                <!-- /面包屑导航-->
                <!--头部按钮-->
                <div class="page-header position-relative">
                    <div class="header-title">
                        <h1>
                            会员预约服务
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
                            <div class="widget">
                                <div class="widget-header ">
                                    <span class="widget-caption">会员预约服务列表</span>
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
                                       
                                        <a href="javascript:void(0);" onclick="delAll()" class="btn btn-darkorange col-padd"   >
                                           <i class="fa fa-minus"></i>批量删除
                                        </a>
                                         <a href="${ctx }/reserve/toAdd" class="btn btn-blue col-padd"  >
                                           <i class="fa fa-plus"></i>新增预约
                                        </a>
                                        <form id="hiddens"  action="${ctx }/reserve/index" method="post">
                                         <div class="col-sm-2 col-padd">
                                                <span class="input-icon">
                                                    <input name="searchVal" placeholder="会员名称/医师 /手机号/套餐类型"  onkeydown="checkForm()" value="${re }" type="text" class="form-control input-sm borderrdu "  style="border-radius:30px!important;">
                                                    <i class="glyphicon glyphicon-search blue"></i>
                                                </span>
                                          </div>
                                        </form>
                                    </div>
                                   <table class="table table-striped table-hover table-bordered"  id="bodyHtml" >
                                        <thead>
                                            <tr role="row">
                                                <th width="5%" >
                                                   <label>
                                                        <input id="hvtck" type="checkbox" >
                                                        <span class="text" id="dohovertree"></span>
                                                    </label>
                                                </th>
                                                <th width="8%">
                                                   预约编号 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                <th width="8%">
                                                    会员名称 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                <th width="8%">
                                                    手机号 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                <th width="8%">
                                                    预约医师 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                 <th width="10%">
                                                    套餐类型 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                 <th width="10%">
                                                    预约时间 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                <th width="10%">
                                                   支付状态 <span class="fa indicator fa-unsorted"></span>
                                                </th>                                                                                                                                                                                                                                                             
                                                <th width="25%">
                                                   操作 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                           <c:forEach items="${data.list  }" var="item">
                                            <tr>
                                           <td width="5%">
                                                    <label>
                                                        <input id="${item.id }" type="checkbox" name="myHoverTreechk">
                                                        <span class="text"></span>
                                                    </label>
                                            </td>
                                                <td width="12%"><input type="text"class="six"   value="${item.id }"  disabled="disabled"></td>
                                                <td width="10%"><input type="text" class="six"  value="${item.name }" class="namese" disabled="disabled"></td>
                                                <td width="8%"><input type="text" class="six"   value="${item.mem_phone }"  disabled="disabled"></td>
                                                <td width="5%">
                                                  <input type="text" class="six"   value="${item.doctorName }"  disabled="disabled">
                                                </td>
                                                <td  width="15%">
                                                	
                                                	<c:if test="${item.package_type eq '1' }">
                                                		<input type="text" value="预约套餐" class="six"  disabled="disabled">
                                                	</c:if>
                                                  	<c:if test="${item.package_type eq '2' }">
                                                		<input type="text" value="体检套餐" class="six"  disabled="disabled">
                                                	</c:if>
                                                </td>
                                                <td  width="15%">${item.reserveTime }</td>
                                                <td  width="15%">
                                                	<c:if test="${item.pay_status eq '1' }">
                                                		<input type="text" value="已支付" class="six"  disabled="disabled">
                                                	</c:if>
                                                  	<c:if test="${item.pay_status eq '2' }">
                                                		<input type="text" value="未支付" class="six"  disabled="disabled">
                                                	</c:if>
                                             
                                                </td>
                                                <td  width="25%">
                                                    <a href="${ctx }/reserve/toLook/${item.id}/1" class="btn btn-ck btn-xs edit"><i class="fa fa-folder-open-o"></i> 查看</a>
                                                    
                                                    <a href="${ctx }/reserve/toLook/${item.id}/2" class="btn btn-info btn-xs edit"><i class="fa fa-pencil"></i> 修改</a>
                                                    <a onclick="del('${item.id}')" href="javascript:void(0);" class="btn btn-danger btn-xs removeClass"><i class="fa fa-trash-o"></i> 删除</a>
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
               
            </div>
            <!-- /右侧内容 -->
        </div>
  </div>
    
    <!--Basic Scripts-->
    <script src="${ctx}/dep/moban/js/jquery-2.0.3.min.js"></script>
    <script src="${ctx}/dep/moban/js/bootstrap.min.js"></script>
	<!--Beyond Scripts-->
    <script src="${ctx}/dep/moban/js/beyond.js"></script>
    <!-- Private -->
	<script src="${ctx}/home/member/vip_server_look.js"></script>
</body>

</html>
