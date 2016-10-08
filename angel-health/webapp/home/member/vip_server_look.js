$(function () {
	
	
	
	$('#timepicker1').timepicker({
		defaultTime: false,
		showMeridian:false
		});
	$("#memberForm").bootstrapValidator();
	var table2 = $('#table2').dataTable({
				"bAutoWidth" : false,
				"bFilter" : false,
				"sPaginationType": "two_button",
				"bPaginate":true,
				"bLengthChange": false, 
				"oLanguage" : {
					"sLengthMenu" : "每页显示 _MENU_ 条记录",
					"sZeroRecords" : "抱歉， 没有找到",
					"sInfo" : "从 _START_ 到 _END_ / 共 _TOTAL_ 条数据",
					"sInfoEmpty" : "",
					"sInfoFiltered" : "",
					"oPaginate" : {
						"sFirst" : "首页",
						"sPrevious" : "前一页",
						"sNext" : "后一页",
						"sLast" : "尾页"
					},
					"sProcessing" : ""
				},
				"sAjaxSource" : ctx+"/reserve/ajaxLoadBuzPackages", //ajax请求地址
				"bDestroy" : true,
				"bRetrieve" : false,
				"bServerSide" : true,//服务端fenye
				"fnServerData" : retrieveData,
				"aoColumns" : [
					{"mDataProp" : "id","bSortable": false,'sClass': "text-center","mRender": function ( data, type, full ) {
						return '<label onclick="tj('+data+')" class="labletab" style="padding-top: 0px"> <input name="ajaxradio" type="radio" class="radio_1" onClick=""> <span class="text" checked></span> </label>';
		              }},
					{"mDataProp" : "code","bSortable": false,'sClass': "text-center"},
					{"mDataProp" : "name","bSortable": false,'sClass': "text-center"},
					{"mDataProp" : "serviceRow","bSortable": false,'sClass': "text-center"}],
					"aoColumnDefs" : [{
		   	            sDefaultContent: '',
		   	            aTargets: [ '_all' ]
			   	      }]
	});
	
	var table1 = $('#table1').dataTable({
		"bAutoWidth" : false,
		"bFilter" : false,
		"sPaginationType": "two_button",
		"bPaginate":true,
		"bLengthChange": false, 
		"oLanguage" : {
			"sLengthMenu" : "每页显示 _MENU_ 条记录",
			"sZeroRecords" : "抱歉， 没有找到",
			"sInfo" : "从 _START_ 到 _END_ / 共 _TOTAL_ 条数据",
			"sInfoEmpty" : "",
			"sInfoFiltered" : "",
			"oPaginate" : {
				"sFirst" : "首页",
				"sPrevious" : "前一页",
				"sNext" : "后一页",
				"sLast" : "尾页"
			},
			"sProcessing" : ""
		},
		"sAjaxSource" : ctx+"/reserve/ajaxLoadBuzServicePackages", //ajax请求地址
		"bDestroy" : true,
		"bRetrieve" : false,
		"bServerSide" : true,//服务端fenye
		"fnServerData" : retrieveServiceData,
		"aoColumns" : [
			{"mDataProp" : "id","bSortable": false,'sClass': "text-center","mRender": function ( data, type, full ) {
				return '<label onclick="yy('+data+')" class="labletab" style="padding-top: 0px"> <input name="ajaxrServiceadio" type="radio" class="radio_1" onClick=""> <span class="text" checked></span> </label>';
              }},
			{"mDataProp" : "code","bSortable": false,'sClass': "text-center"},
			{"mDataProp" : "name","bSortable": false,'sClass': "text-center"},
			{"mDataProp" : "price","bSortable": false,'sClass': "text-center"},
			{"mDataProp" : "serviceContent","bSortable": false,'sClass': "text-center"},
			{"mDataProp" : "serviceRow","bSortable": false,'sClass': "text-center"}],
			"aoColumnDefs" : [{
   	            sDefaultContent: '',
   	            aTargets: [ '_all' ]
	   	      }]
		});
	
	$('#doctorName').bind('input propertychange', function() {
		if($(this).val()!=""){
			$("#docList").show().css({
				width:$(this).width()+26
			});

		}
	});
	
	$('#masterName').bind('input propertychange', function() {
		if($(this).val()!=""){
			$("#SearcherList").show().css({
				width:$(this).width()+26
			});

		}
	});
	$("#masterName").keyup(function(){
		$.ajax({
			type : "post",
			url : ctx+"/family/loadUser",
			data:"search="+this.value,
			success : function(data) {
				var s = JSON.parse(data["msg"]);
				var ul = document.getElementById("searchul");
				$("#searchul").find("li").remove();
				for(var i=0;i<s.length;i++){
			　　　　//添加 li
			　　　　var li = document.createElement("li");
			　　　　//设置 li 属性，如 id
			　　　　li.setAttribute("id", s[i]["id"]);
			　　　　li.innerHTML = '<span onclick=liclick(\''+s[i]["id"]+'\',\''+s[i]["name"]+'\')>'+s[i]["name"]+':'+s[i]["memPhone"]+'</span>';
			　　　　ul.appendChild(li);
				}
			}
		});
	});
	
	
	$("#doctorName").keyup(function(){
		$.ajax({
			type : "post",
			url : ctx+"/family/loadDoctor",
			data:"search="+this.value,
			success : function(data) {
				var s = JSON.parse(data["msg"]);
				var ul = document.getElementById("docul");
				$("#docul").find("li").remove();
				for(var i=0;i<s.length;i++){
			　　　　//添加 li
			　　　　var li = document.createElement("li");
			　　　　//设置 li 属性，如 id
			　　　　li.setAttribute("id", s[i]["id"]);
			　　　　li.innerHTML = '<span onclick=doculliclick(\''+s[i]["id"]+'\',\''+s[i]["name"]+'\')>'+s[i]["name"]+':'+s[i]["mobile"]+'</span>';
			　　　　ul.appendChild(li);
				}
			}
		});
	});
})
var $radio_btn_1 = $(".radioyes .radio .labletab .radio_1");
var $radio_btn_2 = $(".radioyes .radio .labletab .radio_2");
$radio_btn_1.click(function() {
	$(".server_2").hide();
	$(".server_1").slideToggle("slow")
})
$radio_btn_2.click(function() {
	$(".server_1").hide();
	$(".server_2").slideToggle("slow");
})
//--Bootstrap Date Picker--
$('.date-picker').datepicker({
	format: "yyyy-mm-dd"
});

//--Bootstrap Time Picker--

function retrieveData(sSource, aoData, fnCallback){
	$.ajax({
		"type" : "Post",
		"url" : sSource,
		"dataType" : "json",
		"data" : aoData,
		"success" : function(resp) {
			fnCallback(resp.returnObject); //服务器端返回的对象的returnObject部分是要求的格式  
		}
	});
}
function retrieveServiceData(sSource, aoData, fnCallback){
	$.ajax({
		"type" : "Post",
		"url" : sSource,
		"dataType" : "json",
		"data" : aoData,
		"success" : function(resp) {
			fnCallback(resp.returnObject); //服务器端返回的对象的returnObject部分是要求的格式  
		}
	});
}
function liclick(id,name){
	$("#masterName").val(name);
	$("#SearcherList").hide();
	$("#masterId").val(id);
}
function doculliclick(id,name){
	$("#doctorName").val(name);
	$("#docList").hide();
	$("#doctorId").val(id);
}
function yy(id){
	$("#servicePackageId").val(id);
}
function tj(id){
	$("#packageId").val(id);
}
function submitClick(){
	var data = $("#inputEmail3").val();
	var time = $("#timepicker1").val();
	$("#reserveTime").val(data + " " + time+":00");
	$("#sb").click();
}

