$(function () {
	province("");
	/*Notify('您的信息已提交成功！', 'top-right', '2000', 'success', 'fa-check', true); */
	if(msg=='error'){
		Notify('操作失败！', 'top-right', '2000', 'error', 'fa-check', true);
	}
	if(msg=='success'){
		Notify('操作成功！！', 'top-right', '2000', 'success', 'fa-check', true);
	}
	$('.date-picker').datepicker({format: "yyyy-mm-dd"});

	//--Bootstrap Time Picker--
	$('#timepicker1').timepicker();
	
	$("#s_province").change(function(){
		city(this.value);
	});
	$("#s_city").change(function(){
		area(this.value);
	});
	if(ci!=""){
		city(pr);
	}
	if(co!=""){
		city(ci);
	}
	
	var addressNum = 0;
	$(".address").click(function(){
		var add_content='<div class="form-group" style="overflow:hidden;padding-top:0px">'+
														'<div class="col-sm-8">'+
														'<input id=addressNum'+addressNum+' type="text" class="form-control">'+
														'</div>'+
														'<div class="com-sm-1 ">'+
														'<i class="fa fa-minus address_min">'+
														'</i>'+
														'</div>'+
													'</div>';
			
			    $(this).parent().before(add_content);
			    $(".address_min").click(function(){
					$(this).parent().siblings().remove().end().parent().remove();
				})
				addressNum++;
	})
	$(".address_min").each(function(){
		
		$(this).click(function(){
			$(this).parent().siblings().remove().end().parent().remove();
		});
	});
});


function submitclick(){
	var dataPush = new Array();	
	$("input[id^=addressNum]").each(function(i,n){
		dataPush.push({
			"key" : this.id,
			"value" : this.value
		});
	});
	$("input[id^=LookAddress]").each(function(i,n){
		dataPush.push({
			"key" : this.id,
			"value" : this.value
		});
	});
	$("#appendAddress").val(JSON.stringify(dataPush));
	$("#sb").click();
}
function province(id){
	$.ajax({
		type : "post",
		url : ctx+"/customer/ajaxLoadAddress",
		data:"parentId="+id,
		success : function(data) {
			for(var i=0;i<data.length;i++){
				var o = new Option(data[i].name,data[i].id);
				if(data[i].id==pr){
					o.selected = true; 
				}
				document.getElementById("s_province").options.add(o);
			}
			
			city(data[0].id)
		}
	});
}
function city(id){
	document.getElementById("s_city").options.length=0; 

	$.ajax({
		type : "post",
		url : ctx+"/customer/ajaxLoadAddress",
		data:"parentId="+id+"&type="+3,
		success : function(data) {
			for(var i=0;i<data.length;i++){
				var o = new Option(data[i].name,data[i].id);
				if(data[i].id==ci){
					o.selected = true; 
				}
				document.getElementById("s_city").options.add(o);
			}
			area(data[0].id);
		}
	});
}
function area(id){
	document.getElementById("s_county").options.length=0; 
	$.ajax({
		type : "post",
		url : ctx+"/customer/ajaxLoadAddress",
		data:"parentId="+id+"&type="+4,
		success : function(data) {
			for(var i=0;i<data.length;i++){
				var o = new Option(data[i].name,data[i].id);
				if(data[i].id==co){
					o.selected = true; 
				}
				document.getElementById("s_county").options.add(o);
			}
		
		}
	});
}


