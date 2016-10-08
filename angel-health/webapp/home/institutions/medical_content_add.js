
$(function() {
	
	$("#registrationForm").bootstrapValidator();
	$("#registrationForm").on('success.form.bv', function(e) {
        e.preventDefault();
    });
	
	var from = $('#from').val();
	
	if(from == "check"){
		$('#registrationForm').find('input').attr('disabled', 'disabled');
		$('#registrationForm').find('select').attr('disabled', 'disabled');
		$('#registrationForm').find('textarea').attr('disabled', 'disabled');
		$('#registrationForm').find('button').attr('disabled', 'disabled');
	}
	
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
				$('#subjects').html('');
				
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
	
	//异步加载科室
	$.ajax({
		url : ctx + '/department/getAllDepartment',
		dataType : 'json',
		type : 'post',
		success : function(data){
			
			$('#department').html('<option value="0">请选择</option>');
			
			for(var i=0; i<data.list.length; i++){
				$('#department').append('<option value="'+data.list[i].id+'">'+data.list[i].name+'</option>');
			}
		},
		error : function(){
			alert("系统错误");
		}
	});
	

});


function validateForm(form, callback, confirmMsg){
	
	
	 var $form = $(form);

     var formData = $form.data('bootstrapValidator');
     if (formData) {
    	 // 修复记忆的组件不验证
    	 formData.validate();

		if (!formData.isValid()) {
			return false;
		}
    }
	
	$.ajax({
		url : ctx + '/medicalContent/addMedicalContent',
		data : $('#registrationForm').serialize(),
		dataType : 'json',
		type : 'post',
		success : function(data){
			if(data.status != "success"){
				alert(data.msg);
			}else{
				location.href = ctx + '/medicalContent/medicalContent';
			}
		},
		error : function(){
			alert("系统错误");
		}
	});
	
	return false;
}




















