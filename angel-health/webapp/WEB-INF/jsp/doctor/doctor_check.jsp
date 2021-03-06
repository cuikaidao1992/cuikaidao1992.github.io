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
    <title>新增医师信息--</title>
    <link href="${ctx}/dep/moban/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/moban/css/font-awesome.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/moban/css/weather-icons.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <link href="${ctx}/dep/moban/css/beyond.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/moban/css/typicons.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/moban/css/animate.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/moban/css/dataTables.bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="${ctx}/home/common/css.css">
    <script src="${ctx}/dep/moban/js/jquery-2.0.3.min.js"></script>
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
                <a href="#">医师信息管理</a>
            </li>
            <li class="active">
                医师信息服务
            </li>
        </ul>
    </div>
    <!-- /面包屑导航-->
    <!--头部按钮-->
    <div class="page-header position-relative">
        <div class="header-title">
            <h1>医师信息服务</h1>
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
                        <span class="widget-caption">医师信息列表</span>
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
                                <form action ="${ctx}/doctor/update" class="form-horizontal form-bordered searchinfo col-xs-offset-1" method="post" >
                                    <div class=" bancgud" >
                                        <div class="formfont">基础信息</div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label no-padding-right">医师姓名<span class="help-inline"><font color="red">*</font> </span></label>
                                            <div class="col-sm-7">
                                                <input type="text" class="form-control zj-dd" name="name" id="tt" placeholder="请输入医师姓名"value="${doctor.name }" disabled="disabled">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label  class="col-sm-2 control-label no-padding-right">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
                                            <div class="radio">
                                                <label >
                                                    <input name="sex" type="radio" disabled="disabled" ${doctor.sex=="1"?"checked='checked'":""}>
                                                    <span class="text">男 &nbsp;&nbsp;</span>
                                                </label>
                                                <label class="">
                                                    <input name="sex" type="radio" class="" disabled="disabled" ${doctor.sex=="2"?"checked='checked'":""}>
                                                    <span class="text">女</span>
                                                </label>
                                                <label class="">
                                                    <input name="sex" type="radio" class="" disabled="disabled" ${doctor.sex=="0"?"checked='checked'":""}>
                                                    <span class="text">其他</span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label  class="col-sm-2 control-label no-padding-right">手&nbsp;&nbsp;&nbsp;机&nbsp;&nbsp;号</label>
                                            <div  class="col-sm-7">
                                                <input type="text" class="form-control fl " name="mobile" placeholder="请输入手机号" value="${doctor.mobile }" disabled="disabled">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label no-padding-right">医师职称</label>
                                            <div class="col-sm-7" >
                                                <input type="text" class="form-control fl " name="profession" value="${doctor.profession }" disabled="disabled">

                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label  class="col-sm-2 control-label no-padding-right">医师职业类别</label>
                                            <div class="checkbox">
                                                <label >
                                                    <input name="type" type="radio" disabled="disabled" ${doctor.type=="1"?"checked='checked'":""}>
                                                    <span class="text" >临床</span>
                                                </label>
                                                <label class="">
                                                    <input name="type" type="radio" class="" disabled="disabled" ${doctor.type=="2"?"checked='checked'":""}>
                                                    <span class="text">中医</span>
                                                </label>
                                                <label class="">
                                                    <input name="type" type="radio" class="" disabled="disabled" ${doctor.type=="3"?"checked='checked'":""}>
                                                    <span class="text">中西医结合</span>
                                                </label>
                                                <label class="">
                                                    <input name="type" type="radio" class="" disabled="disabled" ${doctor.type=="4"?"checked='checked'":""}> 
                                                    <span class="text">口腔</span>
                                                </label>

                                                <label class="">
                                                    <input name="type" type="radio" class="" disabled="disabled" ${doctor.type=="5"?"checked='checked'":""}>
                                                    <span class="text">公共卫生</span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label  class="col-sm-2 control-label no-padding-right">营业执照<span class="help-inline"><font color="red">*</font> </span></label>
                                            <input type="hidden" name="physicianQualificationCertificate" value="${doctor.physicianQualificationCertificate}">
                                            <div class="col-sm-7">
                                            	<c:if test="${doctor.physicianQualificationCertificate != null}">
	                                                <img src="http://10.1.1.132/${doctor.physicianQualificationCertificate}">
                                            	</c:if>
                                            	<c:if test="${doctor.physicianQualificationCertificate == null}">
                                            		<img src="">
                                            	</c:if>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label  class="col-sm-2 control-label no-padding-right">医师所属科室</label>
                                            <div  class="col-sm-7">
                                                <input type="text" class="form-control fl " name="department" placeholder="请输入科室" value="${doctor.department }" disabled="disabled">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label  class="col-sm-2 control-label no-padding-right">医师所属单位</label>
                                            <div  class="col-sm-7">
                                                <input type="text" class="form-control fl " name="hospital" placeholder="请输入所属单位" disabled="disabled" value="${doctor.hospital }">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label  class="col-sm-2 control-label no-padding-right">医师描述</label>
                                            <div  class="col-sm-7">
                                                <textarea class="dc_text" name="description" disabled="disabled">${doctor.description }</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label class="col-sm-2 control-label no-padding-right">审核状态</label>
                                            <div class="radio check-status">
                                                <label>
                                                    <input name="status" type="radio" checked="checked" data-bv-field="form-field-radio1" value="1">
                                                    <span class="text">通过</span>
                                                </label>
                                                <label class="">
                                                    <input name="status" type="radio" class="" data-bv-field="form-field-radio1" value="2" id="nochoose">
                                                    <span class="text">未通过</span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group" id="reason" style="display: none">
                                            <label  class="col-sm-2 control-label no-padding-right">原因</label>
                                            <div  class="col-sm-7">
                                                <textarea class="dc_text" name="checkFailMsg"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" name="id" value="${doctor.id }">
                                    <div class="col-xs-10  col-xs-offset-3 btn-bottm" style="padding-top:25px">
                                        <button id="tagIdSubmitAddVip_btn" type="submit" class=" btn btn-darkorange  col-sm-2 col-xs-offset-3" data-toggle="modal">确认</button>
                                        <button class=" btn btn-active col-sm-2 col-xs-offset-3" type="button" onclick="window.history.back(-1)">取消</button>
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
<!-- /右侧内容 -->
<!--  <div class="modal fade in" id="closeCourse" aria-hidden="true">
    <div class="modal-dialog" >
        <div class="modal-content"  style="border-radius:50px!important" >

            <div class="modal-body form-horizontal" >
              <p class="text-warning">您的会员信息已提交成功</p>
            </div>
        </div>
    </div>
</div> -->
<script src="${ctx}/dep/moban/js/bootstrap.min.js"></script>
<script src="${ctx}/dep/moban/js/beyond.js"></script>
<script src="${ctx}/dep/jquery.selectlist.js"></script>
<script src="${ctx}/dep/moban/js/validation/bootstrapValidator.js"></script>
<script type="text/javascript" src="${ctx}/dep/datetime/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="${ctx}/dep/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${ctx}/dep/fileinput.js" type="text/javascript"></script>
<script src="${ctx}/dep/fileinput_locale_zh.js" type="text/javascript"></script>
<script>
    $(function () {
    	
        $("#doctorForm").bootstrapValidator();

        $("body").on("focus.page",".date-picker",function(){
            $(this).datetimepicker({
                format: "yyyy-mm-dd",
                minView:2,
                autoclose: true,
                language: "zh-CN"
            })
        });
        $("#file-1").fileinput({
            uploadUrl: '#',
            allowedFileExtensions : ['jpg', 'png','gif'],
            overwriteInitial: false,
            maxFileSize: 100,
            maxFilesNum: 10,

            slugCallback: function(filename) {
                return filename.replace('(', '_').replace(']', '_');
            }
        });
        $('.abcselect').selectlist({
            zIndex: 1000,
            width: 400,
            height: 200

        });

        $("#nochoose").click(function(){
        	if(this.checked){
        		$("#reason").css("display","block");
        	}else{
        		$("#reason").css("display","none");
        	}
        })
        
    })
    
    
</script>
</body>
</html>
