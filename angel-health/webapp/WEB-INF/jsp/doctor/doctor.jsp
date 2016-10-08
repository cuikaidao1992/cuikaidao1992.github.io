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
    <title>医师信息</title>
    <link href="${ctx}/dep/moban/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/moban/css/font-awesome.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/moban/css/beyond.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/moban/css/typicons.min.css" rel="stylesheet" />
    <link href="${ctx}/dep/moban/css/animate.min.css" rel="stylesheet" />
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
                          <a href="doctor.html">医师信息管理</a>
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
                        <h1>
                            医师信息服务
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
                                <div class="widget-body">
                                    <div class="table-toolbar">
                                        <a href="${ctx }/doctor/add" class="btn btn-blue col-padd">
                                            <i class="fa fa-plus"></i>新增医师信息
                                        </a>
                                        <a href="javascript:void(0)" class="btn btn-azure col-padd" onclick="check()">
                                            <i class="fa fa-check-square-o"></i>审核
                                        </a>
                                        <form action="" method="post" id="hiddens">
	                                        <div class="col-sm-2 col-padd">
	                                            <span class="input-icon">
	                                                <input type="text" class="form-control input-sm borderrdu" name="name" value="${doctor.name }" placeholder="姓名/手机号/职称" style="border-radius:30px!important;">
	                                                 <i class="glyphicon glyphicon-search blue" id="searchEr"></i>
	                                            </span>
	                                        </div>
                                       </form>
                                    </div>
                                    <table class="table table-striped table-hover table-bordered"  id="bodyHtml" >
                                        <thead>
                                            <tr role="row">
                                                <th width="5%" ></th>
                                                <th width="15%">
                                                   医师编号 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                <th width="15%">
                                                    医师姓名 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                <th width="16%">
                                                    医师职称 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                <th width="15%">
                                                    手机号 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                <th idth="16%">
                                                   科室 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                  <th width="6%">
                                                   状态 <span class="fa indicator fa-unsorted"></span>
                                                </th>
                                                <th width="15%">
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
                                                <td width="12%"><input type="text"class="six"  value="${list.id }"  disabled="disabled"></td>
                                                <td width="15%"><input type="text" class="six namese" value="${list.name }" disabled="disabled"></td>
                                                <td width="12%"><input type="text" class="six" value="${list.profession }"  disabled="disabled"></td>
                                                <td width="15%">
                                                    <input type="text" value="${list.mobile }" class="six"  disabled="disabled">
                                                </td>
                                                <td  width="15%"><input type="text" class="six"  value="${list.department }"  disabled="disabled"></td>
                                                <td width="6%">
                                                    <c:if test="${list.status==0}">
                                                    	<span class="label label-default">未审核</span>
                                                    </c:if>
                                                    <c:if test="${list.status==1}">
                                                    	<span class="label label-success">已审核</span>
                                                    </c:if>
                                                    <c:if test="${list.status==2}">
                                                    	<span class="label label-success">已审核</span>
                                                    </c:if>
                                                </td>
                                                <td  width="15%">
                                                    <a href="${ctx}/doctor/look?id=${list.id}" class="btn btn-ck btn-xs edit"><i class="fa fa-folder-open-o"></i> 查看</a>
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
   
    <script src="${ctx}/dep/moban/js/jquery-2.0.3.min.js"></script>
    <script src="${ctx}/dep/moban/js/bootstrap.min.js"></script>

    <script src="${ctx}/dep/moban/js/beyond.min.js"></script>

 
   
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

      //查询
		$("#searchEr").on('click', function() {
			$("#hiddens").submit();
		});

       
    });
    
	function check(){
		var ids = $("#userform").serialize();
		console.info(ids);
		alert(1)
		if(!ids){
			alert("请选择要审核的医师");
			return false;
		}
		id = ids.replace(/id=/g,"");
		if(id.indexOf("&") > 0){
			alert("一次只能选择一个医师进行审核");
			return false;
		}
		location.href = "${ctx}/doctor/checkDoctor?id="+id;
	}

</script>
 

</body>

</html>
