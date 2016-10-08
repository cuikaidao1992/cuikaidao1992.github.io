$(function() {
	
	$("#organizationAddForm").bootstrapValidator();
	$("#organizationAddForm").on('success.form.bv', function(e) {
        e.preventDefault();
    });
	
	var from = $('#from').val();
	
	if(from == "check"){
		$('#organizationAddForm').find('input').attr('disabled', 'disabled');
		$('#organizationAddForm').find('select').attr('disabled', 'disabled');
		$('#organizationAddForm').find('textarea').attr('disabled', 'disabled');
		$('#organizationAddForm').find('button').attr('disabled', 'disabled');
	}

	$("body").on("focus.page", ".date-picker", function() {
		$(this).datetimepicker({
			format : "yyyy-mm-dd",
			minView : 2,
			autoclose : true,
			language : "zh-CN"
		})
	});

	$('#adds').click(function() {

		var addLesson = '<div class=" clear formleft" >'
				+ '<label>地<span>址</span></label>'
				+ ' <input type="text" class="formstyle">'
				+ '<i class="fa fa-minus sc" style="width:20px;height:20px;padding-left:10px;cursor:pointer"></i>'
		'</div>';
		$(".formbdcen").last().append(addLesson);
		$(".sc").click(function() {

			$(this).parent().remove();

		})
	})
});

/* 新增 */
$('#tagIdSubmitAddVip_btn').on('click', function() {
	setTimeout(function() {
		$('#closeCourse').click();
	}, 1000);
});

$("#city").click(function(e) {
	SelCity(this, e);
});


function validateOrganizationAddForm(form, callback, confirmMsg){
	
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
		url : ctx + '/medical/addMedical',
		data : $('#organizationAddForm').serialize(),
		dataType : 'json',
		type : 'post',
		success : function(data){
			if(data.status != "success"){
				alert(data.msg);
			}else{
				location.href = ctx + '/medical/organization';
			}
		},
		error : function(){
			alert("系统错误");
		}
	});
	
	return false;
}




















