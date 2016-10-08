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
    <title>新增体检指标</title>

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
                    <li class="active">体检库指标项配置</li>

                </ul>
            </div>
            <!--头部按钮-->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>体检库指标项配置</h1>
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
                                <span class="widget-caption">新增体检指标</span>
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
                                        <form id="registrationForm" method="post" class="form-horizontal clearfix bv-form" onsubmit="return validateForm()">
                                            <div class="bancgud">
                                                
                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">选择体检库</label>
                                                    <div class="col-lg-8">
                                                        <select class="form-control" id="medical">
                                                            <option value="0" selected="selected">请选择</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">选择项目</label>
                                                    <div class="col-lg-8">
                                                        <select class="form-control" name="subjectsId" id="subjects">
                                                            <option value="0" selected="selected">请选择</option>
                                                        </select>
                                                     </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">科室名称</label>
                                                    <div class="col-lg-8">
                                                        <select class="form-control" name="departmentId" id="department">
                                                            <option value="0" selected="selected">请选择</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">指标项名称<span class="help-inline"><font color="red">*</font></span></label>
                                                    <div class="col-lg-8">
                                                        <input type="text" name="name" class="form-control" data-bv-notempty="true" data-bv-notempty-message="指标项名称不能为空">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">适宜年龄</label>
                                                    <div class="col-lg-8">
                                                        <input type="text" name="useAgeMin" class="form-control" placeholder="最小年龄" style="width: 200px;display: inline-block;" >
                                                        ~
                                                        <input type="text" name="useAgeMax" class="form-control" placeholder="最大年龄" style="width: 200px;display: inline-block;" >
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">男性参考范围</label>
                                                    <div class="col-lg-8">
                                                        <input type="text" name="scopeManMin" class="form-control" placeholder="最小范围" style="width: 200px;display: inline-block;" >
                                                        ~
                                                        <input type="text" name="scopeManMax" class="form-control" placeholder="最大范围" style="width: 200px;display: inline-block;" >
                                                    </div>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">女性参考范围</label>
                                                    <div class="col-lg-8">
                                                        <input type="text" name="scopeWomenMin" class="form-control" placeholder="最小范围" style="width: 200px;display: inline-block;" >
                                                        ~
                                                        <input type="text" name="scopeWomenMax" class="form-control" placeholder="最大范围" style="width: 200px;display: inline-block;" >
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">数据单位</label>
                                                    <div class="col-lg-8">
                                                        <input type="text" name="unit" class="form-control" data-bv-field="unit">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">是否重要</label>
                                                    <div class="control-group">
                                                        <div class="radio" style="display: inline-block;">
                                                            <label>
                                                                <input name="isImportant" value="1" type="radio" checked="checked" >
                                                                <span class="text">是</span>
                                                            </label>
                                                        </div>
                                                        <div class="radio" style="display: inline-block;">
                                                            <label>
                                                                <input name="isImportant" value="0" type="radio">
                                                                <span class="text">否</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">是否对比</label>
                                                    <div class="control-group">
                                                        <div class="radio" style="display: inline-block;">
                                                            <label>
                                                                <input name="isCompare" value="1" type="radio" checked="checked" >
                                                                <span class="text">是</span>
                                                            </label>
                                                        </div>
                                                        <div class="radio" style="display: inline-block;">
                                                            <label>
                                                                <input name="isCompare" value="0" type="radio" >
                                                                <span class="text">否</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">指标项说明</label>
                                                    <div class="col-lg-8">
                                                        <textarea class="form-control" name="descrpiton" rows="3" ></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-8  col-xs-offset-2" style="padding-top:25px">
                                                <input type="submit" class=" btn btn-darkorange  col-sm-2 col-xs-offset-3"  value="确认"/>
                                                <a class=" btn btn-active col-sm-2 col-xs-offset-3" type="button" onclick="window.history.back(-1)">取消</a>
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

<script src="${ctx}/home/institutions/medical_content_add.js"></script>

</body>
</html>