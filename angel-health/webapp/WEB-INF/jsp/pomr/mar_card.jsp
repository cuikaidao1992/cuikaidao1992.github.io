<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>用药记录服务</title>
<link rel="shortcut icon" href="../../dep/img/favicon.png"
	type="image/x-icon">

<!--Basic Styles-->
<!--Beyond styles-->

<link href="../../dep/moban/css/demo.min.css" rel="stylesheet" />
<link href="../../dep/moban/css/typicons.min.css" rel="stylesheet" />
<link href="../../dep/moban/css/animate.min.css" rel="stylesheet" />
<!--Page Related styles-->

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
						<li><i class="fa fa-home"></i> <a href="index.html">首页</a></li>
						<li class="active"><a href="###">健康档案管理</a></li>
						<li class="active">用药记录服务</li>
					</ul>
				</div>
				<!-- /面包屑导航-->
				<!--头部按钮-->
				<div class="page-header position-relative">
					<div class="header-title">
						<h1>用药记录服务</h1>

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
									<span class="widget-caption">用药记录列表</span>
									<div class="widget-buttons">
										<a href="#" data-toggle="maximize"> <i
											class="fa fa-expand"></i>
										</a> <a href="#" data-toggle="collapse"> <i
											class="fa fa-minus"></i>
										</a> <a href="#" data-toggle="dispose"> <i class="fa fa-times"></i>
										</a>
									</div>
								</div>
								<div class="widget-body">
									<div class="table-toolbar">

										<a href="javascript:void(0);" onclick="delAll()" class="btn btn-darkorange col-padd"> <i
											class="fa fa-minus"></i>批量删除
										</a> <a href="${ctx }/medicineRecord/addPage" class="btn btn-blue col-padd">
											<i class="fa fa-plus"></i>新增用药记录
										</a>
										<form action="" method="post" id="hiddens">
											<div class="col-sm-2 col-padd">
												<span class="input-icon"> <input type="text"
													class="form-control input-sm borderrdu " placeholder="药品名" name="medicineName"
													style="border-radius: 30px !important;" value="${medicineRecord.medicineName }"> <i
													class="glyphicon glyphicon-search blue" id="searchEr"></i>
												</span>
											</div>
										</form>
									</div>
									<table class="table table-striped table-hover table-bordered"
										id="bodyHtml">
										<thead>
											<tr role="row">
												<th width="5%"><label> <input type="checkbox"
														id="hvtck"> <span class="text" id="dohovertree"></span>

												</label></th>
												<th width="8%">元素 <span
													class="fa indicator fa-unsorted"></span>
												</th>
												<th width="8%">用药记录编号<span
													class="fa indicator fa-unsorted"></span>
												</th>
												<th width="14%">药品名称 <span
													class="fa indicator fa-unsorted"></span>
												</th>
												<th width="10%">用药时间<span
													class="fa indicator fa-unsorted"></span>
												</th>
												<th idth="16%">用法 <span
													class="fa indicator fa-unsorted"></span>
												</th>
												<th width="14%">用量 <span
													class="fa indicator fa-unsorted"></span>
												</th>
												<th width="23%">操作 <span
													class="fa indicator fa-unsorted"></span>
												</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${pager.list }" var="list" varStatus="i">
												<tr>
													<td width="5%"><label> <input type="checkbox" id="${list.id }"
															name="myHoverTreechk"> <span class="text"></span>
													</label></td>
													<td width="8%"><input type="text"
														value="${i.index+1 }" disabled="disabled"></td>
													<td width="8%"><input type="text" value="${list.id }"
														class="namese" disabled="disabled"></td>
													<td width="14%"><input type="text"
														value="${list.medicineName }" disabled="disabled"></td>
													<td width="10%"><input type="text"
														value=" <fmt:formatDate value="${list.useTime }" type='both'/>"
														disabled="disabled"></td>
													<td width="16%"><input type="text"
														value="${list.useMethod }${list.useTimeType}"
														disabled="disabled"></td>
													<td width="14%"><input type="text"
														value="${list.dosageMethod }${list.dosageNumber}次，每次${list.onceDosage}${list.unit}"
														disabled="disabled"></td>
													<td width="23%"><a href="${ctx }/medicineRecord/look?customerId=${list.customerId}"
														class="btn btn-ck btn-xs edit"><i
															class="fa fa-folder-open-o"></i> 查看</a> <a
														href="${ctx }/medicineRecord/editPage?id=${list.id}" class="btn btn-info btn-xs edit"><i
															class="fa fa-pencil"></i> 修改</a> <a href="#"
														class="btn btn-danger btn-xs removeClass"><i
															class="fa fa-trash-o"></i> 删除</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

									<%@ include file="../def/common_pagebar.jsp"%>

								</div>
							</div>

						</div>

					</div>

				</div>

			</div>
			<!-- /右侧内容 -->
		</div>

	</div>

	<script>
	
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
			url : ctx + "/medicineRecord/del",
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
			//编辑
			function editClass(_this) {
				if ($(_this).html() == "编辑") {
					$(_this).parent().parent().find(".time-input").hide();
					$(_this).parent().parent().find(".time-select").show();
					$(_this).html("完成");
					$(_this).parent().parent().find("input").removeAttr(
							"disabled");
				} else {
					$(_this).parent().parent().find(".time-input").show();
					$(_this).parent().parent().find(".time-select").hide();
					$(_this).html("编辑");
					$(_this).parent().parent().find("input").attr("disabled",
							true);
				}
			}

			$(".editClass").on('click', function() {
				editClass(this)
			});

			$(".removeClass").on('click', function() {
				var id = $(this).parent().parent().find("input[name='myHoverTreechk']").attr("id");
				del(id);
			});
			
			//查询
			$("#searchEr").on('click', function() {
				$("#hiddens").submit();
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
