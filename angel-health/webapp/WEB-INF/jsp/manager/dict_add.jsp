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
    <title>新增字典</title>
	<link rel="shortcut icon" href="${ctx}/dep/moban/img/favicon.png" type="image/x-icon">

	<!--Basic Styles-->
	<link href="${ctx}/dep/moban/css/bootstrap.min.css" rel="stylesheet" />
	<link id="bootstrap-rtl-link" href="" rel="stylesheet" />
	<link href="${ctx}/dep/moban/css/font-awesome.min.css" rel="stylesheet" />
	<link href="${ctx}/dep/moban/css/weather-icons.min.css" rel="stylesheet" />

	<!--Beyond styles-->
	<link id="beyond-link" href="${ctx}/dep/moban/css/beyond.min.css" rel="stylesheet" />
	<link href="${ctx}/dep/moban/css/demo.min.css" rel="stylesheet" />
	<link href="${ctx}/dep/moban/css/typicons.min.css" rel="stylesheet" />
	<link href="${ctx}/dep/moban/css/animate.min.css" rel="stylesheet" />
	<link id="skin-link" href="" rel="stylesheet" type="text/css" />

	<!---->
	<link href="${ctx}/dep/moban/css/dataTables.bootstrap.css" rel="stylesheet" />
	<link rel="stylesheet" href="${ctx}/home/common/css.css">
	<link rel="stylesheet" href="${ctx}/dep/zTree/css/zTreeStyle/zTreeStyle.css" />
	<link rel="stylesheet" href="${ctx}/home/sysconfig/sysconfig.css" />

	<!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
	<script src="${ctx}/dep/moban/js/skins.min.js"></script>

</head>

<body>
    
    <!-- 导航 -->
  
    <!-- /Navbar -->
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
                        <li>
                            <i class="fa fa-home"></i>
                            <a href="index.html">首页</a>
                        </li>
                        <li class="active">
                          <a href="###">业务配置管理</a>
                        </li>
                        <li class="active">
                            字典配置
                        </li>
                         
                    </ul>
                </div>
                <!-- /面包屑导航-->
                <!--头部按钮-->
                <div class="page-header position-relative">
                    <div class="header-title">
                        <h1>
                            字典配置
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
                                    <span class="widget-caption">添加字典内容</span>
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
                                            <div class=" bancgud" >
                                        
                                            	 <div class="formfont">基础信息</div>
                                            	  <form class="form-horizontal" method="post" role="form" id="dicForm" onsubmit="return userformcheck()">
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label no-padding-right">键&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;值<span class="help-inline"><font color="red">*</font> </span></label>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control zj-dd"  id="tt" placeholder="  请输入键值" name="value" data-bv-notempty="true" data-bv-notempty-message="键值为必填项，不能为空">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label no-padding-right">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;签</label>
                                                        <div  class="col-sm-8">
                                                            <input type="text" class="form-control fl " name="label" placeholder="请输入标签内容">
                                                        </div>
                                                    </div>
                                                    
                                         
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label no-padding-right">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型</label>
                                                    	 <div  class="col-sm-8">
				                                          <input type="text" class="form-control fl " name="type"  placeholder="请输入类型内容" >
				                                            
                                                        </div>
                                                    </div>
                                                    													
 
                                                    <div class="form-group">
                                                        <label  class="col-sm-2 control-label no-padding-right">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述</label>
                                                        <div  class="col-sm-8">
                                                            <input type="text" class="form-control fl " name="description" placeholder="请输入描述内容">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label  class="col-sm-2 control-label no-padding-right">排&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;序</label>
                                                        <div  class="col-sm-8">
                                                            <input type="text" class="form-control fl " name="sort" placeholder="请输入标签内容">
                                                        </div>
                                                    </div>
                                                     <div class="form-group">
                                                        <label class="col-sm-2 control-label no-padding-right">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</label>
                                                        <div  class="col-sm-8">
                                                            <textarea name="remarks"></textarea>
                                                        </div>
                                                    </div>

                                                </div>
                                              
                                             <div class="col-sm-6  col-xs-offset-3 btn-bottm" style="padding-top:25px">
		                                          <button id="tagIdSubmitAddVip_btn" type="submit" class=" btn btn-darkorange  col-sm-2 col-xs-offset-3" href="#closeCourse" data-toggle="modal">确认</button>
		                                         <button class=" btn btn-active col-sm-2 col-xs-offset-3" type="button" onClick="window.open('workbook.html')">取消</button>
		                                       </div>
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
            <!-- /右侧内容 -->

<!--  <div class="modal fade in" id="closeCourse" aria-hidden="true">
    <div class="modal-dialog" >
        <div class="modal-content"  style="border-radius:50px!important" >
            
            <div class="modal-body form-horizontal" >
              <p class="text-warning">您的字典信息已提交成功</p>
            </div>
        </div>
    </div>
</div> -->

    
	   	<!--Basic Scripts-->
		<script src="${ctx}/dep/moban/js/jquery-2.0.3.min.js"></script>
		<script src="${ctx}/dep/moban/js/bootstrap.min.js"></script>

		<!--Beyond Scripts-->
		<script src="${ctx}/dep/moban/js/beyond.min.js"></script>

		<!---->
		<script src="${ctx}/dep/moban/js/validation/bootstrapValidator.js"></script>
   		<script src="${ctx}/dep/jquery.dataTables.min.js"></script>
    	<script src="${ctx}/dep/datatable/ZeroClipboard.js"></script>
    	<script src="${ctx}/dep/jquery.selectlist.js"></script>
    	<script type="text/javascript" src="${ctx}/dep/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
  		<script type="text/javascript" src="${ctx}/dep/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
  		
  <script type="text/javascript">
        $(function(){
             $("#dicForm").bootstrapValidator();
        })
  </script>
   <script type="text/javascript">
        $('#tagIdSubmitAddVip_btn').on('click',function(){
        setTimeout(function(){
            $('#closeCourse').click();
        },1000);
        });
     $("#city").click(function (e) {
         SelCity(this,e);
        });
     
     function userformcheck(){
    	 var value = $("#tt").val().trim();
 		if (!value) {
 			alert("请输入键值！");
 			return false;
 		}
		$.ajax({
			url : "${ctx}/manager/dict/save",
			type : "POST",
			data : $("#dicForm").serialize(),
			dataType : "json",
			success : function(data) {
				if($(data)[0]["code"]=="1"){
					alert($(data)[0]["msg"]);
					window.location.href = "${ctx}/manager/dict/index";
				}else{
					alert($(data)[0]["msg"]);
				}
			}
		});
	}
   </script>


</body>

</html>
