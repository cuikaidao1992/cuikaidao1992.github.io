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
    <title>新增机构</title>

    <link rel="stylesheet" href="${ctx}/dep/zTree/css/zTreeStyle/zTreeStyle.css" />

</head>
<body>
<!-- Main Container -->
<div class="main-container container-fluid">
    <!-- Page Container -->
    <div class="page-container">
        <!-- Page Sidebar -->
        <!-- /右侧内容 -->
        <div class="page-content">
            <!-- 面包屑导航 -->
            <div class="page-breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home"></i> <a href="index.html">首页</a></li>
                    <li class="active"><a href="#">业务配置管理</a></li>
                    <li class="active">体检库配置</li>
                </ul>
            </div>
                <!--头部按钮-->
                <div class="page-header position-relative">
                    <div class="header-title">
                        <h1>体检库配置</h1>
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
                                    <span class="widget-caption">新增体检项</span>
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
                                <div class="widget-body" style="overflow:hidden">
                                <div class="col-lg-12 col-sm-12 col-xs-12 ">
                                    <div class="widget">
                                    
                                    <input id="from" value="${from}"  style="display: none"/>
                                    
                                        <form id="registrationForm" method="post" class="form-horizontal " onsubmit="return validateForm(this)">
                                            
                                            <input value="${data.id}" type="text" name="id" style="display: none"/>
                                            
                                            <div class="bancgud">
                                                <div class="form-group">
                                                    <label class="col-lg-2 control-label">体检库名称</label>
                                                    <div class="col-lg-8">
                                                        <select class="form-control" name="medicalId" >
                                                            <option value="0" selected="selected">请选择</option>
                                                            <c:forEach items="${medicals}" var="m">
                                                            	<option value="${m.id}">${m.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-2 control-label">体检项目名称</label>
                                                    <div class="col-lg-8">
                                                        <input placeholder="项目名称"  type="text" name="name" class="form-control" data-bv-notempty="true" data-bv-notempty-message="项目名称不能为空" >
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-2 control-label">体检项目描述</label>
                                                    <div class="col-lg-8">
                                                        <textarea class="form-control" name="descrpiton" rows="3"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-sm-8  col-xs-offset-3 btn-bottm" style="padding-top:25px">
												<input type="submit" class=" btn btn-darkorange  col-sm-2" value="确认">
												<a class=" btn btn-active col-sm-2 col-xs-offset-3" onclick="window.history.back(-1)">取消</a>
											</div>
                                            
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${ctx}/home/institutions/subjects_add.js"></script>


</body>
</html>