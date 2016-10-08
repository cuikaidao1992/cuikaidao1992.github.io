$(function () {
        var s = JSON.parse(json);
        var add = "";
        var type = "";
        for(var i=0;i<s.length;i++){
        	type = (s[i].key.split("_"))[3];
        	if(type=="checkbox"||type=="radio"){
        		var a = s[i].key.split("_");
        		var id = a[0]+"_"+a[1]+"_"+a[2]+s[i].value+"_"+type;
        		$("#"+id).attr("checked","true");
        	}else{
        		$("#"+s[i].key).val(s[i].value);
        	}
        }
});
function next(val) {
	$("section[name^=section]").each(function() {
		$("#" + this.id).css("display", "none");
	})
	$("#sec" + val).fadeIn(1000)
}

function sendHead(val) {
	var a = val.split(",");
	$("div[id^=group]").each(function() {
		$("#" + this.id).css("display", "block");
	})
	for(var num = 0; num < a.length; num++) {
		$("#group" + a[num]).css("display", "none");
	}
}
function neverDrink(){
	$('.que_end_43').css("display", "none");
	$("#neverDrink").css("display", "none");
}
function drink43(){
	$('.que_end_43').css("display", "none");
	$("#neverDrink").css("display", "block");
}
function showdrink43(){
	$('.que_end_43').css("display", "block");
}
function upData(){
	var dataPush = new Array();	
	$("input:text[id^=group]").each(function(i,n){
		if(this.value!=""){
			dataPush.push({
				"key" : this.id,
				"value" : this.value
			});
		}
	});
	$("select[id^=group]").each(function(i,n){
		if(this.value!=""){
			dataPush.push({
				"key" : this.id,
				"value" : this.value
			});
		}
	});
	$("input:radio[id^=group]").each(function(i,n){
		if(this.value!=""){
			dataPush.push({
				"key" : this.id,
				"value" : this.value
			});
		}
		
	});
	$("input:checkbox[id^=group]").each(function(i,n){
		if(this.value!=""){
			dataPush.push({
				"key" : this.id,
				"value" : this.value
			});
		}
		
	});
	$("#content").val(JSON.stringify(dataPush))
	$("#form").submit();
}
function es(val){
	var a = val.split(",");
	$("div[id^=part]").each(function() {	
		$("#" + this.id).css("display", "block");
	})
	for(var num = 0; num < a.length; num++) {
		$("#part" + a[num]).css("display", "none");
	}
}
function ea(val){
	var a = val.split(",");
	$("div[id^=ea]").each(function() {
		$("#" + this.id).css("display", "block");
	})
	for(var num = 0; num < a.length; num++) {
		$("#ea" + a[num]).css("display", "none");
	}
}
function eb(val){
	var a = val.split(",");
	$("div[id^=eb]").each(function() {
		$("#" + this.id).css("display", "block");
	})
	for(var num = 0; num < a.length; num++) {
		$("#eb" + a[num]).css("display", "none");
	}
}
function ec(val){
	var a = val.split(",");
	$("div[id^=ec]").each(function() {
		$("#" + this.id).css("display", "block");
	})
	for(var num = 0; num < a.length; num++) {
		$("#ec" + a[num]).css("display", "none");
	}
}



