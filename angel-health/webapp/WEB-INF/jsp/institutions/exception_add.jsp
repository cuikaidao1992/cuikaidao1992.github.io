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

    <title>异常库配置</title>

    <link rel="stylesheet" href="${ctx}/home/service/service.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/dep/datetimepicker/css/bootstrap-datetimepicker.css"/>

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
                    <a href="index.html">业务配置管理</a>
                </li>
                <li class="active">
                    <a href="#">异常库配置</a>
                </li>
            </ul>
        </div>
        <!-- /面包屑导航-->
        <!--头部按钮-->
        <div class="page-header position-relative">
            <div class="header-title">
                <h1>异常库配置</h1>
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
                            <span class="widget-caption">异常列表</span>
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
                        <div class="widget-body clearfix">
                            <div class="col-sm-12">
                            
                            	 <input id="from" value="${from}"  style="display: none"/>
                            
                                 <form id="registrationForm" method="post" class="form-horizontal clearfix" onsubmit="return validateForm(this)"> 
                                 	
									<input value="${data.id}" type="text" name="id" style="display: none"/>
                                 
                                     <div class="bancgud">
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">异常名称<span class="help-inline"><font color="red">*</font> </span></label>
                                            <div class="col-lg-8">
                                                <input type="text" value="${data.name}" class="form-control" name="name" data-bv-notempty="true" data-bv-notempty-message="异常名称不能为空" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">重要性</label>
                                            <div class="col-lg-8">
                                                <select class="form-control" name="importance">
                                                    <option value="0">请选择</option>
                                                    <option value="1" <c:if test="${data.importance==1}">selected="selected"</c:if> >不重要</option>
                                                    <option value="2" <c:if test="${data.importance==2}">selected="selected"</c:if>>一般</option>
                                                    <option value="3" <c:if test="${data.importance==3}">selected="selected"</c:if>>重要</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">推荐科室</label>
                                            <div class="col-lg-8">
                                                <select class="form-control" name="departmentId">
                                                    <option value="0">请选择</option>
                                                    <c:forEach items="${deps}" var="dep">
                                                    	<c:choose>
                                                    		<c:when test="${data.departmentId==dep.id}">
                                                    			<option value="${dep.id}" selected="selected">${dep.name}</option>
                                                    		</c:when>
                                                    		<c:otherwise>
                                                    			<option value="${dep.id}">${dep.name}</option>
                                                    		</c:otherwise>
                                                    	</c:choose>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">建议时间</label>
                                            <div class="col-lg-8">
                                                <input name="adviceTime" value="<fmt:formatDate value="${data.adviceTime}" pattern="yyyy-MM-dd "/>" type="text" class="form-control date-picker" >
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">推荐项目</label>
                                            <div class="col-lg-8">
                                                <select name="departType" class="form-control" name="adviceProjectId">
                                                    <option value="0" selected="selected">请选择</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">所属系统</label>
                                            <div class="col-lg-8">
                                                <select name="departType" class="form-control" name="belongSysId">
                                                    <option value="0" selected="selected">请选择</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">性别</label>
                                            <div class="col-lg-8">
                                                <select class="form-control" name="sex">
                                                    <option value="0" <c:if test="${data.sex==0}">selected="selected"</c:if> >不限</option>
                                                    <option value="1" <c:if test="${data.sex==1}">selected="selected"</c:if>>男</option>
                                                    <option value="2" <c:if test="${data.sex==2}">selected="selected"</c:if>>女</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">其他名称</label>
                                            <div class="col-lg-8">
                                                <textarea rows="3" name="alias" placeholder="多个异常名称用，分开">${data.alias}</textarea>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">解释</label>
                                            <div class="col-lg-8">
                                                <textarea rows="3" name="explanation">${data.explanation}</textarea>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">原因</label>
                                            <div class="col-lg-8">
                                                <textarea rows="3" name="reason">${data.reason}</textarea>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">建议</label>
                                            <div class="col-lg-8">
                                                <textarea rows="3" name="advice" >${data.advice}</textarea>
                                            </div>
                                        </div>
                                     </div>
                                     
                                     <div class="col-sm-8  col-xs-offset-3 btn-bottm" style="padding-top:25px">
                                         <input type="submit" class=" btn btn-darkorange  col-sm-2" value="确认" />
                                         <a class="btn btn-active col-sm-2 col-xs-offset-3" href="${ctx}/exception/exception">取消</a>
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

<script type="text/javascript" src="${ctx}/home/institutions/exception.js"></script>
<script type="text/javascript" src="${ctx}/dep/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="${ctx}/dep/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

</body>

</html>