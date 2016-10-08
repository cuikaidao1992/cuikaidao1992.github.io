$(function () {

	province("");
	$("#registrationForm").bootstrapValidator();

	$("body").on("focus.page", ".date-picker", function() {
		$(this).datetimepicker({
			format: "yyyy-mm-dd",
			minView: 2,
			autoclose: true,
			language: "zh-CN"
		})
	});

	/* 新增 */
	$('#tagIdSubmitAddVip_btn').on('click', function() {
		setTimeout(function() {
			$('#closeCourse').click();
		}, 1000);
	});
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

	$('.adds').click(function() {
		('.tabhid').addClass('cur')
	})
	//时间控件
	$('.date-picker').datepicker();
	
	$('.date-picker').datepicker({format: "yyyy-mm-dd"});

	//--Bootstrap Time Picker--
	$('#timepicker1').timepicker();
	
	$("#s_province").change(function(){
		city(this.value);
	});
	$("#s_city").change(function(){
		area(this.value);
	});
});

function submitclick(){
	$("#sb").click();
}
function submitform() {

	$('#registrationForm').data('bootstrapValidator').validate();

	if($('#registrationForm').data('bootstrapValidator').isValid()) {
		Notify('您的信息已提交成功！', 'top-right', '2000', 'success', 'fa-check', true); 
	}
	return false;

}
function province(id){
	$.ajax({
		type : "post",
		url : ctx+"/customer/ajaxLoadAddress",
		data:"parentId="+id,
		success : function(data) {
			for(var i=0;i<data.length;i++){
				var o = new Option(data[i].name,data[i].id);
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
				document.getElementById("s_county").options.add(o);
			}
		
		}
	});
}
function submitclick(){
	var dataPush = new Array();	
	$("input[id^=addressNum]").each(function(i,n){
		dataPush.push({
			"key" : this.id,
			"value" : this.value
		});
	});
	$("#appendAddress").val(JSON.stringify(dataPush));
	$("#sb").click();
}




