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
    <title>字典</title>

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
                                    <span class="widget-caption">字典列表</span>
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
                                        <a href="" class="btn btn-darkorange col-padd" id="deleteBatch">
                                           <i class="fa fa-minus"></i>批量删除
                                        </a>
                                         <a href="${ctx}/manager/dict/add" class="btn btn-blue col-padd"  >
                                           <i class="fa fa-plus"></i>新增字典配置
                                        </a>
                                        <div class="clear form-group">
                                            <form action="${ctx }/manager/dict/index" method="post" id="hiddens">
                                            <div class="slt_tj" style="line-height:34px;padding-bottom:20px">
                                               <lable class="fl label-control">类型</lable>
                                                <div class="col-xs-2">
                                                   <input type="text" class="form-control fl " name="type"  placeholder="请输入类型内容" >
                                                </div>
                                                <lable class="label-control fl">描述</lable>
                                                <div class="col-xs-2">
                                                    <input type="text" class="form-control" name="description">
                                                </div>
                                                <div class="fl" style="text-align:center;background:#5db2ff;color:#fff;padding:0px 28px;border-radius:3px;cursor:pointer">
                                                    <span class="cxun" id="search">查询</span>
                                                </div>
                                            </div>
                                        </form>
                                        </div>
                                    </div>


                                   <!--  <div class="clear row">aaaaaaaaaaaa
                                       <label>类型</label>
                                       <select>
                                           <option>类型一</option>
                                           <option>类型一</option>
                                           <option>类型一</option>
                                           <option>类型一</option>
                                       </select>
                                       <label>描述</label>
                                       <input type="text" class="clear"style="width:5%">
                                       <span >查询</span>
                                    </div>
                                     -->

                                    
                                   <table class="table table-striped table-hover table-bordered"  id="bodyHtml" >
                                        <thead>
                                            <tr role="row">
                                                <th width="5%" >
                                                    <label>
                                                        <input type="checkbox"  id="hvtck" name="id">
                                                        <span class="text" id="dohovertree"></span>
                                                        
                                                    </label>
                                                </th>
                                                <th width="10%">
                                                    键值 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                <th width="8%">
                                                    标签 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                <th width="14%">
                                                    类型 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                <th width="8%">
                                                    描述 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                <th idth="16%">
                                                   排序<span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                <th width="23%">
                                                   操作 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                        <form action="" id="userform" method="post">
                                        <c:forEach items="${pager.list }" var="list">
                                           <tr>
                                              <td width="5%">
                                                    <label>
                                                        <input type="checkbox" name="id" value="${list.id }">
                                                        <span class="text"></span>
                                                    </label>
                                                </td>
                                                <td width="10%"><input type="text"class="six"   value="${list.value }"  disabled="disabled"></td>
                                                <td width="10%"><input type="text" class="six"  value="${list.label }" class="namese" disabled="disabled"></td>
                                                <td width="8%"><input type="text" class="six"   value="${list.type }"  disabled="disabled"></td>
                                                <td width="8%">
                                                  <input type="text" value="${list.description }" class="six"  disabled="disabled">
                                                </td>
                                                <td  width="15%"><input type="text" value="${list.sort }"  disabled="disabled"></td>
                                               <td  width="25%">
                                                    <a href="${ctx}/manager/dict/edit?method=1&id=${list.id}" class="btn btn-ck btn-xs edit"><i class="fa fa-folder-open-o"></i> 查看</a>
                                                    <a href="${ctx}/manager/dict/edit?method=2&id=${list.id}" class="btn btn-info btn-xs edit"><i class="fa fa-pencil"></i> 修改</a>
                                                    <a href="#" class="btn btn-danger btn-xs removeClass" onclick="deleteSingle(${list.id})"><i class="fa fa-trash-o"></i> 删除</a>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                            </form>
                                        </tbody>
                                     </table>
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
										<c:if test="${pager.totalPages != 1 && pager.totalPages != 0}">
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
		<script src="${ctx}/dep/moban/js/beyond.min.js"></script>

		<!---->
		<script src="${ctx}/dep/moban/js/validation/bootstrapValidator.js"></script>
   		<script src="${ctx}/dep/jquery.dataTables.min.js"></script>
    	<script src="${ctx}/dep/datatable/ZeroClipboard.js"></script>
 
   
   <script>
    $(function () {
        //编辑
        function editClass(_this){
            if($(_this).html() == "编辑"){
                $(_this).parent().parent().find(".time-input").hide();
                $(_this).parent().parent().find(".time-select").show();
                $(_this).html("完成");
                $(_this).parent().parent().find("input").removeAttr("disabled");
            }else {
                $(_this).parent().parent().find(".time-input").show();
                $(_this).parent().parent().find(".time-select").hide();
                $(_this).html("编辑");
                $(_this).parent().parent().find("input").attr("disabled",true);
            }
        }
        // 删除
        function removeClass(_this){
            $(_this).parent().parent().remove();
        }

        $(".editClass").on('click',function(){
            editClass(this)
        });

        $(".removeClass").on('click',function(){
            removeClass(this)
        });
        $("#search").click(function(){
        	$("#hiddens").submit();
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
				url : "${ctx}/manager/dict/delete",
				type : "POST",
				data : {"ids":ids},
				dataType : "json",
				success : function(data) {
					if (data > 0) {
						alert("删除成功！")
						window.location.href = "${ctx}/manager/dict/index";
					} else {
						alert("删除失败！");
						return false;
					}
				}
			});
		}
	})
	function deleteSingle(id){
		if(confirm("是否确定删除")){
			$.ajax({
				url : "${ctx}/manager/dict/deleteById",
				type : "POST",
				data : {"id":id},
				dataType : "json",
				success : function(data) {
					if (data > 0) {
						alert("删除成功！")
						window.location.href = "${ctx}/manager/dict/index";
					} else {
						alert("删除失败！");
						return false;
					}
				}
			});
		}
	}

</script>
 

</body>

</html>
