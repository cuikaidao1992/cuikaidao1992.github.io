$("#bodyHtml").treetable({ expandable: true });

	
$(function() {
	
	//异步加载体检库
	$.ajax({
		url : ctx + '/medical/getAllMedical',
		dataType : 'json',
		type : 'post',
		success : function(data){
			
			$('#medical').html('<option value="0">请选择</option>');
			
			for(var i=0; i<data.list.length; i++){
				$('#medical').append('<option value="'+data.list[i].id+'">'+data.list[i].name+'</option>');
			}
		},
		error : function(){
			alert("系统错误");
		}
	});
	
	//联动加载体检项目
	$('#medical').change(function(){
		
		var medicalId = $(this).val();
		
		$.ajax({
			url : ctx + '/subjects/getAllSubject',
			data : {medicalId : medicalId},
			dataType : 'json',
			type : 'post',
			success : function(data){
				$('#subjects').html('<option value="0">请选择</option>');
				
				if(data.list != null){
					for(var i=0; i<data.list.length; i++){
						$('#subjects').append('<option value="'+data.list[i].id+'">'+data.list[i].name+'</option>');
					}
				}
				
				if(data.list == null || data.list.length <= 0)
					$('#subjects').html('<option value="0">请选择</option>');
				
			},
			error : function(){
				alert("系统错误");
			}
		});
		
	});
	
});

function searchByParam(){
	
	var medicalId = $('#medical').val();
	
	var subjectsId = $('#subjects').val();
	
	location.href = ctx +　"/medicalContent/medicalContent?medicalId=" +　medicalId + "&subjectsId=" + subjectsId;
	
}















			

