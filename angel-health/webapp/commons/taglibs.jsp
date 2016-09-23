<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- ${pageContext.request.contextPath} --%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link href="${ctx}/dep/moban/css/bootstrap.min.css" rel="stylesheet" />
<link href="${ctx}/dep/moban/css/font-awesome.min.css" rel="stylesheet" />
<link href="${ctx}/dep/moban/css/weather-icons.min.css" rel="stylesheet" />
<link id="beyond-link" href="${ctx}/dep/moban/css/beyond.min.css"
	rel="stylesheet" />
<script src="${ctx}/dep/moban/js/jquery-2.0.3.min.js"></script>
<script src="${ctx}/dep/moban/js/bootstrap.min.js"></script>
<script src="${ctx}/dep/moban/js/beyond.min.js"></script>
<script src="${ctx}/dep/moban/js/datatable/jquery.dataTables.min.js"></script>
<script src="${ctx}/dep/moban/js/datatable/ZeroClipboard.js"></script>