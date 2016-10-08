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

<title>体检报告服务</title>

<link rel="shortcut icon" href="${ctx}/dep/moban/img/favicon.png"
	type="image/x-icon">

<!--Basic Styles-->

<!--Beyond styles-->
<link href="${ctx}/dep/moban/css/demo.min.css" rel="stylesheet" />
<link href="${ctx}/dep/moban/css/typicons.min.css" rel="stylesheet" />
<link href="${ctx}/dep/moban/css/animate.min.css" rel="stylesheet" />

<!---->
<link href="${ctx}/dep/moban/css/dataTables.bootstrap.css"
	rel="stylesheet" />
<link rel="stylesheet" href="${ctx}/home/common/css.css">
<link rel="stylesheet"
	href="${ctx}/dep/zTree/css/zTreeStyle/zTreeStyle.css" />
<link rel="stylesheet" href="${ctx}/home/service/service.css" />


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
					<li><i class="fa fa-home"></i> <a href="index.html">首页</a></li>
					<li class="active"><a href="###">健康档案管理</a></li>
					<li class="active">体检报告服务</li>
				</ul>
			</div>
			<!-- /面包屑导航-->
			<!--头部按钮-->
			<div class="page-header position-relative">
				<div class="header-title">
					<h1>体检报告服务</h1>
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
							<div class="widget-header">
								<span class="widget-caption">体检报告列表</span>
								<div class="widget-buttons">
									<a href="#" data-toggle="maximize"> <i class="fa fa-expand"></i>
									</a> <a href="#" data-toggle="collapse"> <i class="fa fa-minus"></i>
									</a> <a href="#" data-toggle="dispose"> <i class="fa fa-times"></i>
									</a>
								</div>
								<!--Widget Buttons-->
							</div>
							<!--Widget Header-->
							<div class="widget-body">
								<div id="home" class="tab-pane in active">
									<div class="table-toolbar">
										<a href="javascript:void(0);" onclick="delAll()"
											class="btn btn-darkorange col-padd"> <i
											class="fa fa-minus"></i>批量删除
										</a> <a href="${ctx }/examination/addPage"
											class="btn btn-blue col-padd"> <i class="fa fa-plus"></i>新增体检报告
										</a>
										<form action="" method="post" id="hiddens">
											<div class="col-sm-2 col-padd">
												<span class="input-icon"> <input type="text"
													class="form-control input-sm borderrdu "
													style="border-radius: 30px !important;"
													placeholder="体检报告名称" name="name" value="${examination.name }"> <i
													class="glyphicon glyphicon-search blue" id="searchExm"></i>
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
												<th>体检报告编号 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>体检报告名称 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>会员名称 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th>上传时间 <span class="fa indicator fa-unsorted"></span>
												</th>
												<th width="20%">操作<span
													class="fa indicator fa-unsorted"></span>
												</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${pager.list }" var="list" varStatus="i">
												<tr>
													<td><label> <input type="checkbox"
															id="${list.id }" name="myHoverTreechk"> <span
															class="text"></span>
													</label></td>
													<td><input type="text" class="six" value="${list.id }"
														disabled="disabled"></td>
													<td><input type="text" class="six"
														value="${list.name }" disabled="disabled"></td>
													<td><input type="text" class="six"
														value="${list.customerName }" disabled="disabled"></td>
													<td><input type="text" class="six"
														value=" <fmt:formatDate value="${list.recordTime }" type='both'/>"
														disabled="disabled"></td>
													<td><a href="#" class="btn btn-ck btn-xs edit"><i
															class="fa fa-folder-open-o"></i> 查看</a> <a href="#"
														class="btn btn-danger btn-xs removeClass"><i
															class="fa fa-trash-o"></i> 删除</a></td>
												</tr>
											</c:forEach>
											<tr>
											</tr>

										</tbody>
									</table>
									<%@ include file="../def/common_pagebar.jsp"%>
								</div>

							</div>
							<!--Widget Body-->
						</div>

					</div>

				</div>
			</div>

		</div>

	</div>

	<P class="bottomfont">© 2016 Angel Health Management Ltd. :
		天使健康管理有限公司</P>

	<!-- /右侧内容 -->
	</div>

	</div>


	<!---->
	<script src="${ctx}/dep/moban/js/validation/bootstrapValidator.js"></script>

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
				url : ctx + "/examination/del",
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
			$("#registrationForm").bootstrapValidator();

			$("#editForm").bootstrapValidator();

			//查询
			$("#searchExm").on('click', function() {
				$("#hiddens").submit();
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

		function deleteBatch() {
			$('input[name="myHoverTreechk"]').each(function() {
				if ($(this).is(':checked'))
					$(this).parent().parent().parent().remove();
			})
		}

		$('input.checkedAll').change(
				function() {
					if ($(this).is(':checked')) {
						$(this).parent('label').parent('.checkbox').siblings(
								'.row').find('input')
								.prop("checked", 'checked');
					} else {
						$(this).parent('label').parent('.checkbox').siblings(
								'.row').find('input').prop('checked', '');
					}
				})

		$('input.checkedSingle').change(
				function() {
					if ($(this).is(':checked')) {
						var isAllChecked = 'checked';
						$(this).closest('.row').find('.checkedSingle').each(
								function() {
									if (!$(this).is(':checked'))
										isAllChecked = '';
								})
						$(this).closest('.row').siblings('.checkbox').find(
								'.checkedAll').prop('checked', isAllChecked);
					} else {
						$(this).closest('.row').siblings('.checkbox').find(
								'.checkedAll').prop('checked', '');
					}
				})
	</script>

</body>

</html>