<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- pagebar start -->
<div class="btn-font dw_page" currentPage="${pager.currentPage}"
	total="${pager.total}" totalPages="${pager.totalPages}"
	pageSize="${pager.pageSize}">
	<div class="zjtm">共${pager.totalPages }页${pager.total }条</div>
	<div class="zjrightb">
		<ul class="pagination pull-right">
			<c:if test="${pager.totalPages == 1 || pager.totalPages == 0}">
				<li class="footable-page-arrow disabled"><a data-page="prev"
					href="javascript:void(0)">上一页</a></li>
				<li class="footable-page active"><a data-page="0" href="#">1</a></li>
				<li class="footable-page-arrow disabled"><a data-page="next"
					href="javascript:void(0)">下一页</a></li>
			</c:if>
			<c:if test="${pager.totalPages != 1  && pager.totalPages != 0}">
				<c:if test="${pager.currentPage == 1}">
					<li class="footable-page-arrow disabled"><a data-page="prev"
						href="javascript:void(0)">上一页</a></li>
					<li class="footable-page active"><a data-page="0" href="#">1</a></li>
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
					<li class="footable-page"><a data-page="${pager.currentPage}"
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
		</ul>
	</div>
</div>
<!-- pagebar end -->