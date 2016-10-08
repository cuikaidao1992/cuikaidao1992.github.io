var currentPage;
var total;
var totalPages;
var pageSize;

$().ready(function(){
	currentPage = $(".dw_page").attr("currentPage");
	total = $(".dw_page").attr("total");
	totalPages = $(".dw_page").attr("totalPages");
	pageSize = $(".dw_page").attr("pageSize");
});
	
function getRootPath(){
	var strPath=window.document.location.pathname;
	var postPath=strPath.substring(0,strPath.substr(1).indexOf('/')+1);
	return postPath;
}
	
function _next(){
	if(currentPage==totalPages || totalPages == 0){
		alert("当前页为尾页，没有下一页！")
	}else{
		currentPage++;
		subData(currentPage, pageSize);
	}
}

function _go(nexPage){
	subData(nexPage, pageSize);
}

function _back(){
	if(currentPage==1){
		alert("当前页为首页，没有上一页！")
	}else{
		currentPage--;
		subData(currentPage, pageSize);
	}
}

function subData(currentPage, pageSize){
	var currentPageinput = createInput("hidden","currentPage",currentPage);
	var pageSizeinput = createInput("hidden","pageSize",pageSize);
	$("#hiddens").append(currentPageinput);
	$("#hiddens").append(pageSizeinput);
	$("#hiddens").submit();
}

function createInput(type, name, value){
	var input=$("<input>");
	input.attr("type", type);
	input.attr("name", name);
	input.attr("value", value);
	return input;
}
        
