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
<title>电子病例服务</title>
<link rel="shortcut icon" href="assets/img/favicon.png"
	type="image/x-icon">

<!--Basic Styles-->

<link id="bootstrap-rtl-link" href="" rel="stylesheet" />
<!--Fonts-->
<!--Beyond styles-->
<link href="${ctx}/dep/moban/css/demo.min.css" rel="stylesheet" />
<link href="${ctx}/dep/moban/css/typicons.min.css" rel="stylesheet" />
<link href="${ctx}/dep/moban/css/animate.min.css" rel="stylesheet" />
<link id="skin-link" href="" rel="stylesheet" type="text/css" />

<!--Page Related styles-->
<link href="${ctx}/dep/moban/css/dataTables.bootstrap.css"
	rel="stylesheet" />
<link rel="stylesheet" href="${ctx}/home/common/css.css">

</head>

<body>
	<div class="page-content">
		<!-- 面包屑导航 -->
		<div class="page-breadcrumbs">
			<ul class="breadcrumb">
				<li><i class="fa fa-home"></i> <a href="index.html">首页</a></li>
				<li class="active"><a href="###">健康档案管理</a></li>
				<li class="active">电子病例服务</li>
			</ul>
		</div>
		<!-- /面包屑导航-->
		<!--头部按钮-->
		<div class="page-header position-relative">
			<div class="header-title">
				<h1>电子病例服务</h1>

			</div>
			<!--Header Buttons-->
			<div class="header-buttons">
				<a class="sidebar-toggler" href="#"> <i class="fa fa-arrows-h"></i>
				</a> <a class="refresh" id="refresh-toggler" href=""> <i
					class="glyphicon glyphicon-refresh"></i>
				</a> <a class="fullscreen" id="fullscreen-toggler" href="#"> <i
					class="glyphicon glyphicon-fullscreen"></i>
				</a>
			</div>
			<!--头部按钮end-->
		</div>
		<div class="page-body">
			<div class="row">
				<div class="col-xs-12 col-md-12">
					<div class="widget">
						<div class="widget-header ">
							<span class="widget-caption">电子病例列表</span>
							<div class="widget-buttons">
								<a href="#" data-toggle="maximize"> <i class="fa fa-expand"></i>
								</a> <a href="#" data-toggle="collapse"> <i class="fa fa-minus"></i>
								</a> <a href="#" data-toggle="dispose"> <i class="fa fa-times"></i>
								</a>
							</div>
						</div>
						<div class="widget-body">
							<div class="table-toolbar">

								<a href="javascript:void(0);" onclick="delAll()"
									class="btn btn-darkorange col-padd"> <i class="fa fa-minus"></i>批量删除
								</a> <a href="${ctx }/cpr/addPage" class="btn btn-blue col-padd">
									<i class="fa fa-plus"></i>新增电子病例记录
								</a>
								<form action="" method="post" id="hiddens">
									<div class="col-sm-2 col-padd">
											<span class="input-icon"> <input type="text"
											class="form-control input-sm borderrdu " name="cprName"
											style="border-radius: 30px !important;" placeholder="电子病例名称"
											value="${cpr.cprName }"> <i
											class="glyphicon glyphicon-search blue" id="searchCpr"></i>
										</span>
									</div>
								</form>
							</div>
							<table class="table table-striped table-hover table-bordered"
								id="bodyHtml">
								<thead>
									<tr role="row">
										<th width="5%"><label> <input id="hvtck"
												type="checkbox"> <span class="text" id="dohovertree"></span>
										</label></th>
										<th width="10%">元素<span class="fa indicator fa-unsorted"></span>
										</th>
										<th width="16%">电子病历编号 <span
											class="fa indicator fa-unsorted"></span>
										</th>
										<th width="16%">电子病历名称 <span
											class="fa indicator fa-unsorted"></span>
										</th>
										<th width="10%">就诊时间 <span
											class="fa indicator fa-unsorted"></span>
										</th>

										<th width="25%">操作 <span class="fa indicator fa-unsorted"></span>
										</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${pager.list }" var="list" varStatus="i">
										<tr>
											<td width="5%"><label> <input type="checkbox"
													id="${list.id }" name="myHoverTreechk"> <span
													class="text"></span>
											</label></td>
											<td width="12%"><input type="text" value="${i.index +1}"
												disabled="disabled"></td>
											<td width="10%"><input type="text" value="${list.id }"
												class="namese" disabled="disabled"></td>
											<td width="8%"><input type="text" class="six"
												value="${list.cprName }" disabled="disabled"></td>
											<td width="5%"><input type="text"
												value=" <fmt:formatDate value="${list.recordTime }" type='both'/>"
												disabled="disabled"></td>
											<td width="25%"><a href="${ctx }/cpr/toLook/${list.id}/0"
												class="btn btn-ck btn-xs edit"><i
													class="fa fa-folder-open-o"></i> 查看</a> <a href="${ctx }/cpr/toLook/${list.id}/1"
												class="btn btn-info btn-xs edit"><i class="fa fa-pencil"></i>
													修改</a> <a href="javascript:void(0);" class="btn btn-danger btn-xs removeClass"><i
													class="fa fa-trash-o"></i> 删除</a></td>
										</tr>
									</c:forEach>


								</tbody>
							</table>
							<%@ include file="../def/common_pagebar.jsp"%>

						</div>
					</div>
					<P class="bottomfont">© 2016 Angel Health Management Ltd. :
						天使健康管理有限公司</P>
				</div>

			</div>

		</div>

	</div>
	<!-- /右侧内容 -->
	</div>
	</div>
	<script type="text/javascript">
		//回车查询
		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				$("#hiddens").submit();
			}
		}
		//批量删除
		function delAll() {
			var checkboxs = document.getElementsByName("myHove" + "rTreechk");
			cklen = checkboxs.length;
			var s = "";
			for (var i = 0; i < cklen; i++) {
				if (checkboxs[i].checked) {
					s = s + checkboxs[i].id + ","
				}
			}
			s = s.substring(0, s.length - 1);
			del(s);
		}

		function del(e) {
			$.ajax({
				type : "post",
				url : ctx + "/cpr/del",
				data : {
					"ids" : e
				},
				dataType : "json",
				success : function(data) {
					if (data > 0) {
						location.reload();
					}else{
						
					}
				}
			});
		}
		$(function() {
			//查询
			$("#searchCpr").on('click', function() {
				$("#hiddens").submit();
			});

			$(".editClass").on('click', function() {
				editClass(this)
			});

			$(".removeClass").on('click', function() {
				var id = $(this).parent().parent().find("input[name='myHoverTreechk']").attr("id");
				del(id);
			});

		});
		window.onload = function() {
			var checkboxs = document.getElementsByName("myHove" + "rTreechk");
			var hvtck = document.getElementById("hvtck");
			cklen = checkboxs.length;
			hvtck.onclick = function() {
				if (this.checked == true) {
					for (var i = 0; i < cklen; i++) {
						checkboxs[i].checked = true;
					}
					document.getElementById("dohovert" + "ree").innerHTML = ""
				} else {
					for (var i = 0; i < cklen; i++) {
						checkboxs[i].checked = false;
					}
					document.getElementById("dohovertree").innerHTML = ""
				}
			}
		}
	</script>


</body>

</html>


