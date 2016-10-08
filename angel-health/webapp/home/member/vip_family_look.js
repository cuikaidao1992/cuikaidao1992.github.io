$(function() {
	
	if(msg=='error'){
		Notify('操作失败！', 'top-right', '2000', 'error', 'fa-check', true);
	}
	if(msg=='success'){
		Notify('操作成功！！', 'top-right', '2000', 'success', 'fa-check', true);
	}
	
	$('.search-box').bind('input propertychange', function() {
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
});
function liclick(id,name){
	$(".search-box").val(name);
	$("#SearcherList").hide();
	$("#masterId").val(id);
}
function submitclick(){
	var dataPush = new Array();	
	$("input[id^=key]").each(function(i,n){
		dataPush.push({
			"key" : this.value,
			"value" : $("#val"+this.id.substring(this.id.length-1,this.id.length)).val()
		});
	});
	$("#familyPeople").val(JSON.stringify(dataPush));
	$("#sb").click();
}
