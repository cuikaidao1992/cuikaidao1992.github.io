$(function() {
	var num =1;
	$(".family_i").click(function(){
			var add_family_content='<div  class="form-group" style="overflow:hidden;padding-top:0px">'+
							        '<div class="col-sm-3">'+
							            '<input id=key'+num+' type="text" class="form-control">'+
							        '</div>'+
							        '<div class="col-sm-8">'+
							           '<input id=val'+num+' type="text" class="form-control">'+
							        '</div>'+
							        '<div class="com-sm-1 adress sc">'+
							        '<i class="fa fa-minus cunt_close family_i_1" ></i>'+
							        '</div>'+
							        '</div>';
			   $(".aaa").before(add_family_content);
			   $(".sc").click(function(){
			   		$(this).parent().remove();
			   })
			   num++;
	})
	
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
			　　　　// 添加 li
			　　　　var li = document.createElement("li");
			　　　　// 设置 li 属性，如 id
			　　　　li.setAttribute("id", s[i]["id"]);
			　　　　li.innerHTML = '<span onclick=liclick(\''+s[i]["id"]+'\',\''+s[i]["name"]+'\')>'+s[i]["name"]+':'+s[i]["memPhone"]+'</span>';
			　　　　ul.appendChild(li);
				}
			}
		});
	});
	
	
	$("#memberForm").bootstrapValidator();
/*	$("#memberForm").bootstrapValidator({
		fields: {
				name:{
					message: 'The name is not valid',
					validators:{
						notEmpty:{// 非空验证：提示消息
	                         message: '用户名不能为空'
	                     }
					}
				},
				masterName:{
					message: 'The masterName is not valid',
					validators:{
						notEmpty:{// 非空验证：提示消息
	                         message: '会员不能为空'
	                     }
					}
				},
				phone:{
					message: 'The phone is not valid',
					validators:{
						notEmpty:{// 非空验证：提示消息
	                         message: '电话不能为空'
	                     }
					}
				}
		}
	}).on('success.form.bv', function(e) {
		
	 });*/
	$('.adds')
			.click(
					function() {

						var addLesson = '<div class="clear form-group">'
								+ '<label  for="inputPassword3" class="col-sm-2 control-label no-padding-right">祖&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;父</label>'
								+ '<div class="col-sm-7 " style="margin-left:10px">'
								+ '<input type="text" class="form-control fl "  placeholder="请输入姓名" >'
								+ '</div>'
								+ '</div>'
								+ '<div  class="clear form-group">'
								+ '<label  for="inputPassword3" class="col-sm-2 control-label no-padding-right">祖&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;母</label>'
								+ '<div class="col-sm-7 " style="margin-left:10px">'
								+ '<input type="text" class="form-control fl "  placeholder="请输入姓名" >'
								+ '</div>'
								+ '</div>'
								+ '<div  class="clear form-group">'
								+ '<label  for="inputPassword3" class="col-sm-2 control-label no-padding-right">父&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;亲</label>'
								+ '<div class="col-sm-7 " style="margin-left:10px">'
								+ '<input type="text" class="form-control fl "  placeholder="请输入姓名" >'
								+ '</div>'
								+ '</div>'
								+ '<div  class="clear form-group">'
								+ '<label  for="inputPassword3" class="col-sm-2 control-label no-padding-right">母&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;亲</label>'
								+ '<div class="col-sm-7 " style="margin-left:10px">'
								+ '<input type="text" class="form-control fl "  placeholder="请输入姓名" >'
								+ '</div>'
								+ '</div>'
								+ '<div  class="clear form-group">'
								+ '<label  for="inputPassword3" class="col-sm-2 control-label no-padding-right">儿&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;子</label>'
								+ '<div class="col-sm-7 " style="margin-left:10px">'
								+ '<input type="text" class="form-control fl "  placeholder="请输入姓名" >'
								+ '</div>'
								+ '</div>'
								+ '<div  class="clear form-group">'
								+ '<label  for="inputPassword3" class="col-sm-2 control-label no-padding-right">女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;儿</label>'
								+ '<div class="col-sm-7 " style="margin-left:10px">'
								+ '<input type="text" class="form-control fl "  placeholder="请输入姓名" >'
								+ '</div>'
								+ '</div>';

						$(".formbdcenb").last().append(addLesson).show("slow");

						$(".sc").click(function() {

							$(this).parent().remove();

						})
						console.info(this.class)
					})

	$('.adds').click(function() {
		('.tabhid').addClass('cur')
	})
	/* 新增 */
	$('#tagIdSubmitAddVip_btn').on('click', function() {
		setTimeout(function() {
			$('#closeCourse').click();
		}, 1000);
	});
	$("#city").click(function(e) {
		SelCity(this, e);
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

