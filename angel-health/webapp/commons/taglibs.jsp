<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- ${pageContext.request.contextPath} --%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<link rel="shortcut icon" href="${ctx}/dep/moban/img/favicon.png" type="image/x-icon">	
<!--Basic Styles-->
<link href="${ctx}/dep/moban/css/bootstrap.min.css" rel="stylesheet" />
<link id="bootstrap-rtl-link" href="" rel="stylesheet" />
<link href="${ctx}/dep/moban/css/font-awesome.min.css" rel="stylesheet" />
<link href="${ctx}/dep/moban/css/weather-icons.min.css" rel="stylesheet" />

<!--Beyond styles-->
<link href="${ctx}/dep/moban/css/beyond.min.css" rel="stylesheet" />
<link href="${ctx}/dep/moban/css/demo.min.css" rel="stylesheet" />
<link href="${ctx}/dep/moban/css/typicons.min.css" rel="stylesheet" />
<link href="${ctx}/dep/moban/css/animate.min.css" rel="stylesheet" />
<!-- 其他css -->
<link href="${ctx}/dep/moban/css/dataTables.bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="${ctx}/home/common/css.css">

<!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
<script src="${ctx}/dep/moban/js/skins.min.js"></script>

<!--Basic Scripts-->
<script src="${ctx}/dep/moban/js/jquery-2.0.3.min.js"></script>
<script src="${ctx}/dep/moban/js/bootstrap.min.js"></script>

<!--Beyond Scripts-->
<script src="${ctx}/dep/moban/js/beyond.min.js"></script>

<!-- 其他 -->
<script src="${ctx}/dep/moban/js/validation/bootstrapValidator.js"></script>
<script src="${ctx}/dep/moban/js/datatable/jquery.dataTables.min.js"></script>
<script src="${ctx}/dep/moban/js/datatable/ZeroClipboard.js"></script>
<script src="${ctx}/dep/pagings.js"></script>


<script>
var ctx = '${ctx}';
var msg = '${m}';
</script>

