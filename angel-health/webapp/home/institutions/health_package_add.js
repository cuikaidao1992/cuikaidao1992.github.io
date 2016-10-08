	
$(function() {
	
	$("#registrationForm").bootstrapValidator();
	$("#registrationForm").on('success.form.bv', function(e) {
        e.preventDefault();
    });
	
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
			url : ctx + '/medicalContent/getMedicalContent',
			data : {medicalId : medicalId},
			dataType : 'json',
			type : 'post',
			success : function(data){
				
				var zNodes =[];
				
				if(data.list != null){
					
					for(var i=0; i<data.list.length; i++){
						
						var subject = {};
						subject['id'] = data.list[i].id;
						subject['pId'] = 0;
						subject['name'] = data.list[i].name;
						subject['oid'] = data.list[i].id;
						
						zNodes.push(subject);
						
						if(data.list[i].childs != null){
							
							for(var j=0; j<data.list[i].childs.length; j++){
								var content = {};
								content['id'] = data.list[i].id + '' + data.list[i].childs[j].id;
								content['pId'] = data.list[i].id;
								content['name'] = data.list[i].childs[j].name;
								content['oid'] = data.list[i].childs[j].id;
								zNodes.push(content);
							}
						}
					}
				}
				
				//树加载
				$.fn.zTree.init($("#treeDemo"), setting, zNodes);
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
				treeObj.expandAll(true);
				
			},
			error : function(){
				alert("系统错误");
			}
		});
		
	});

	
});


function validateForm(form, callback, confirmMsg){
	
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	
	var nodes = treeObj.getCheckedNodes(true);
	
	var service = []; 
	
    for(var i=0; i<nodes.length; i++){
    	var node = nodes[i];
    	var snode = {};
    	snode['id'] = node['id'];
    	snode['pId'] = node['pId'];
    	snode['name'] = node['name'];
    	snode['oid'] = node['oid'];
    	service.push(snode);
    } 
	
    var serviceRow = JSON.stringify(service);
    
    console.log(serviceRow);
	
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
		url : ctx + '/packages/addHealthPackage',
		data : $('#registrationForm').serialize() + '&serviceRow=' + serviceRow,
		dataType : 'json',
		type : 'post',
		success : function(data){
			if(data.status != "success"){
				alert(data.msg);
			}else{
				location.href = ctx + '/packages/healthPackage';
			}
		},
		error : function(){
			alert("系统错误");
		}
	});
	
	return false;
}




//加载树
var setting = {
	check: {
		enable: true
	},
	data: {
		simpleData: {
			enable: true
		}
	}
};


var code;

function setCheck() {

	var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			py = $("#py").attr("checked")? "p":"",
			sy = $("#sy").attr("checked")? "s":"",
			pn = $("#pn").attr("checked")? "p":"",
			sn = $("#sn").attr("checked")? "s":"",
			type = { "Y":py + sy, "N":pn + sn};
	zTree.setting.check.chkboxType = type;
	showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
}

function showCode(str) {
	if (!code) code = $("#code");
	code.empty();
	code.append("<li>"+str+"</li>");
}
function fuzhi(data){
	zNodes=eval("("+data+")");
	$.fn.zTree.init($("#treeDemo"), setting, zNodes);

	setCheck();
	$("#py").bind("change", setCheck);
	$("#sy").bind("change", setCheck);
	$("#pn").bind("change", setCheck);
	$("#sn").bind("change", setCheck);

}











			

