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
		url : ctx + '/subjects/addSubjects',
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

















