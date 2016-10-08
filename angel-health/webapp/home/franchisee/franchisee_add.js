$(function() {
	
	$(".radio_btn").click(function(){
		if($(this).find(".checkbox-slider").is(':checked')){
			$(".server_2").hide();
			$(".server_1").stop().slideToggle(500);
		}else {
			$(".server_1").hide();
			$(".server_2").stop().slideToggle(500);
		}
	});

   $('.dropify').dropify({
	 messages: {
		 'default': '点击或拖拽文件到这里',
		 'replace': '点击或拖拽文件到这里来替换文件',
		 'remove':  '移除文件',
		 'error':   '对不起，你上传的文件太大了'
	 }
   });
	
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
	
	//时间控件
	$("body").on("focus.page", ".date-picker", function() {
		$(this).datetimepicker({
			format : "yyyy-mm-dd",
			minView : 2,
			autoclose : true,
			language : "zh-CN"
		})
	});
	
    $("#test-upload").fileinput({
        'showPreview' : false,
        'allowedFileExtensions' : ['jpg', 'png','gif'],
        'elErrorContainer': '#errorBlock'
    });
	
    
    $('input[name="isOne"]').change(function(){
    	if($(this).is(':checked')){
    		$(this).val(1);
    	}else{
    		$(this).val(0);
    	}
    });
    
    //文件上传
    $('input.dropify').change(function(){
    	
        var formData = new FormData();  
        
        formData.append('uploadfile', $(this)[0].files[0]);
        
        var inputName = $(this).attr('extra');
        	
        $.ajax({  
            url: ctx + '/pic/uploadFile' ,  
            type: 'POST',  
            data: formData,  
            async: false,  
            cache: false,  
            contentType: false,  
            processData: false,
            success: function (data) { 
            	
            	if(data.status == "success"){
            		
            		var oValue = $('input[name="'+inputName+'"]').val();
            		var nVlue = "";
            		
            		if(oValue != null && oValue != "")
            			nVlue = oValue + "," + data.path;
            		else
            			nVlue = data.path;
            			
            		$('input[name="'+inputName+'"]').val(nVlue);
            		
            		console.log($('input[name="'+inputName+'"]').val());
            		
            	}else{	
            		alert("上传失败！");
            	}
            	
            },
            error: function(){
            	alert("系统错误");
            }
    	});
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
		url : ctx + '/franchisee/addFranchisee',
		data : $('#registrationForm').serialize(),
		dataType : 'json',
		type : 'post',
		success : function(data){
			if(data.status != "success"){
				alert(data.msg);
			}else{
				location.href = ctx + '/franchisee/franchisee';
			}
		},
		error : function(){
			alert("系统错误");
		}
	});
	
	return false;
}




$("#file-1").fileinput({
    uploadUrl: '#', 
    allowedFileExtensions : ['jpg', 'png','gif'],
    overwriteInitial: false,
    maxFileSize: 100,
    maxFilesNum: 10,
   
    slugCallback: function(filename) {
        return filename.replace('(', '_').replace(']', '_');
    }
});
 $("#file-2").fileinput({
    uploadUrl: '#', 
    allowedFileExtensions : ['jpg', 'png','gif'],
    overwriteInitial: false,
    maxFileSize: 100,
    maxFilesNum: 10,
   
    slugCallback: function(filename) {
        return filename.replace('(', '_').replace(']', '_');
    }
});
 $("#file-3").fileinput({
    uploadUrl: '#', 
    allowedFileExtensions : ['jpg', 'png','gif'],
    overwriteInitial: false,
    maxFileSize: 100,
    maxFilesNum: 10,
   
    slugCallback: function(filename) {
        return filename.replace('(', '_').replace(']', '_');
    }
});
 $("#file-4").fileinput({
    uploadUrl: '#', 
    allowedFileExtensions : ['jpg', 'png','gif'],
    overwriteInitial: false,
    maxFileSize: 100,
    maxFilesNum: 10,
   
    slugCallback: function(filename) {
        return filename.replace('(', '_').replace(']', '_');
    }
});
 $("#file-5").fileinput({
    uploadUrl: '#', 
    allowedFileExtensions : ['jpg', 'png','gif'],
    overwriteInitial: false,
    maxFileSize: 100,
    maxFilesNum: 10,
   
    slugCallback: function(filename) {
        return filename.replace('(', '_').replace(']', '_');
    }
});
 $("#file-6").fileinput({
    uploadUrl: '#', 
    allowedFileExtensions : ['jpg', 'png','gif'],
    overwriteInitial: false,
    maxFileSize: 100,
    maxFilesNum: 10,
   
    slugCallback: function(filename) {
        return filename.replace('(', '_').replace(']', '_');
    }
});
 $("#file-7").fileinput({
    uploadUrl: '#', 
    allowedFileExtensions : ['jpg', 'png','gif'],
    overwriteInitial: false,
    maxFileSize: 100,
    maxFilesNum: 10,
   
    slugCallback: function(filename) {
        return filename.replace('(', '_').replace(']', '_');
    }
});
 $("#file-8").fileinput({
    uploadUrl: '#', 
    allowedFileExtensions : ['jpg', 'png','gif'],
    overwriteInitial: false,
    maxFileSize: 100,
    maxFilesNum: 10,
   
    slugCallback: function(filename) {
        return filename.replace('(', '_').replace(']', '_');
    }
});

 $("#file-9").fileinput({
    uploadUrl: '#', 
    allowedFileExtensions : ['jpg', 'png','gif'],
    overwriteInitial: false,
    maxFileSize: 100,
    maxFilesNum: 10,
   
    slugCallback: function(filename) {
        return filename.replace('(', '_').replace(']', '_');
    }
});
















