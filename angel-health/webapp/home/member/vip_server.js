$(function () {
        //编辑
        function editClass(_this){
            if($(_this).html() == "编辑"){
                $(_this).parent().parent().find(".time-input").hide();
                $(_this).parent().parent().find(".time-select").show();
                $(_this).html("完成");
                $(_this).parent().parent().find("input").removeAttr("disabled");
            }else {
                $(_this).parent().parent().find(".time-input").show();
                $(_this).parent().parent().find(".time-select").hide();
                $(_this).html("编辑");
                $(_this).parent().parent().find("input").attr("disabled",true);
            }
        }
        // 删除
        function removeClass(_this){
            $(_this).parent().parent().remove();
        }

        $(".editClass").on('click',function(){
            editClass(this)
        });

        $(".removeClass").on('click',function(){
            removeClass(this)
        });
        
        var checkboxs=document.getElementsByName("myHove"+"rTreechk");
		  var hvtck=document.getElementById("hvtck");
		  cklen=checkboxs.length;
		  hvtck.onclick=function()
		  {
			if(this.checked==true)
			{
			  for(var i=0;i<cklen;i++)
			  {
				checkboxs[i].checked=true;
			  }
			  document.getElementById("dohovert"+"ree").innerHTML=""
			}
			else
			{
			  for(var i=0;i<cklen;i++)
			  {
				checkboxs[i].checked=false;
			  }
			  document.getElementById("dohovertree").innerHTML=""
			}
		  }        
        
});
function delAll(){
	var checkboxs=document.getElementsByName("myHove"+"rTreechk");
	cklen=checkboxs.length;
	var s = "";
	for(var i=0;i<cklen;i++)
	{
		if(checkboxs[i].checked){
			s = s+checkboxs[i].id+","
		}
	}
	s = s.substring(0,s.length-1);
	del(s);
}

function del(e){
	$.ajax({
		type:"post",
		url:ctx+"/reserve/del",
		data:{"ids":e},
		dataType:"json",
		success:function(data){
			location.reload();
		}
	});
}
function  checkForm(){
   if(event.keyCode ==13){
	     
	}
}




