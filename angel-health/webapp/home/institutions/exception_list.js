function deleteException(id){
	
	$.ajax({
		url : ctx + '/exception/deleteHealthException',
		data : {id:id},
		dataType : 'json',
		type : 'post',
		success : function(data){
			if(data.status != "success"){
				alert(data.msg);
			}else{
				location.href = ctx + '/exception/exception';
			}
		},
		error : function(){
			alert("系统错误");
		}
	});
}


function deleteBatch(){
	
	var checks =[]; 
	
	$('input[name="myHoverTreechk"]:checked').each(function(){ 
		checks.push($(this).val()); 
	}); 
	
	if(checks.length == 0)
		return;
	
	$.ajax({
		url : ctx + '/exception/deleteHealthExceptionBatch',
		data : {checks:checks},
		dataType : 'json',
		type : 'post',
		success : function(data){
			if(data.status != "success"){
				alert(data.msg);
			}else{
				location.href = ctx + '/exception/exception';
			}
		},
		error : function(){
			alert("系统错误");
		}
	});
	
}