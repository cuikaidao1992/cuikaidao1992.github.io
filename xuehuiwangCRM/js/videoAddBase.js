(function($){
	var Page=function(){
		this.options={}
	}
	var getChapterName=function(){
		var length=$(".t-c-l").find(".sortable").find(".dis").length;
		return $.changeNum(length+1);
	}
	var getLecureName=function(chapter){
		var length=chapter.find(".class-son").length;
		return $.changeNum(length+1);
	}
	var getCname=function(){
		return $("#chapterName").val()?$("#chapterName").val():"章";
	}
	var getLname=function(){
		return $("#lectureName").val()?$("#lectureName").val():"节";
	}
	Page.prototype={
		init: function(){
			$selectMenu("course_class_type");
			var $this=this;
			/*****************这个抄到前台**********************/
			//查询自定义的章节名称
			$.ajax({
				url : rootPath+"/courseVideoChapter/customChapter",
				type: "post",
				dataType: "json",
				success: function(data){
					$("body").append('<input type="hidden" id="chapterName" value="'+(data.chapterName?data.chapterName:"")+'"/>');
					$("body").append('<input type="hidden" id="lectureName" value="'+(data.lectureName?data.lectureName:"")+'"/>');
					//查询数据
					$this.loadData($("#moduleId").val());
				}
			})
			/***********************************************/
			this.initBase();
			this.init800();
			this.init900();
			this.init1000();
			
		},
		loadData: function(moduleId){
			var $this=this;
			if(!moduleId){
				$('.base-sort').sortable({
					placeholder: "ui-state-highlight",
					update:function(event,ui){
						$this.sort(ui.item);
					},
					delay: 200,
					start: $this.collapseAll
				}).disableSelection();
				$('.base-sort').find(".sortable").sortable({
					placeholder: "ui-state-highlight",
					update:function(event,ui){
						$this.sort(ui.item.siblings());
						$this.sort(ui.item);
					},
					receive:function(event,ui){
						$this.mvLecture(ui.sender,$(event.target).parents(".dis"),ui.item);
					},
					delay: 200,
					connectWith: ".son"
				}).disableSelection();
				return;
			}
			$.ajax({
				url: rootPath+"/courseVideoChapter/load/"+moduleId,
				type:"post",
				dataType:"json",
				success: function(jsonData){
					$.each(jsonData,function(i){
						var chapter=jsonData[i];
						var html='<li id="chapter_'+chapter.id+'" class="dis" sort="'+chapter.chapterOrder+'"><p class="father">'+
						'<i class="iconfont4">&#xe630;</i>'+
						'<i class="iconfont2 open">&#xe62f;</i>'+
	                    '<a href="javascript:;">第'+getChapterName()+getCname()+'&nbsp;&nbsp;<b>'+(chapter.chapterName?chapter.chapterName:"")+'</b></a>'+
	                    '<i class="iconfont">&#xe626;</i>'+
	                    '<i class="iconfont3 add-btns" title="添加节">&#xe629;</i>'+
	                    '</p><ul class="son sortable"></ul></li>';
						$(".t-c-l").find(".base-sort").append(html);
						$(".t-c-l").find("#chapter_"+chapter.id).data("info",chapter);
						$.each(chapter.lectures,function(j){
							var lecture=chapter.lectures[j];
							var sub_html='<li id="lecture_'+lecture.id+'" class="class-son" draggable="true">'
							+'<a href="javascript:;">第'
							+getLecureName($("#chapter_"+chapter.id))+getLname()+
							'&nbsp;&nbsp;<b>'+(lecture.lectureName?lecture.lectureName:"")+'</b></a>'+
							'<i class="iconfont4">&#xe630;</i>'+
							'<i class="iconfont">&#xe626;</i></li>';
							$(".t-c-l").find("#chapter_"+chapter.id+" .son").append(sub_html);
							$(".t-c-l").find("#lecture_"+lecture.id).data("info",lecture);
						});
						$('.base-sort').sortable({
							placeholder: "ui-state-highlight",
							update:function(event,ui){
								$this.sort(ui.item);
							},
							delay: 200,
							start: $this.collapseAll
						});
						$('.base-sort').find(".sortable").sortable({
							placeholder: "ui-state-highlight",
							update:function(event,ui){
								$this.sort(ui.item.find(".dis").eq(0));
								$this.sort(ui.item);
							},
							receive:function(event,ui){
								$this.mvLecture(ui.sender,$(event.target).parents(".dis"),ui.item);
							},
							delay: 200,
							connectWith: ".son"
						}).disableSelection();
					});
					
				},
				error: function(resp,err,msg){
					console.log(resp);
				}
			})
		},
		//保存章
		saveChapter: function(data){
			var $this=this;
			if(!data){
				return ;
			}
			$.ajax({
				url:rootPath+"/courseVideoChapter/saveChapter",
				data: data,
				type:"post",
				dataType:"json",
				success:function(jsonData){
					var chapter=$("#chapter_"+jsonData.id);
					if(chapter.find(".father").find("a b").length>0){
						chapter.find(".father").find("a b").html(jsonData.chapterName);
					}else{
						chapter.find(".father").find("a").html("<b>"+jsonData.chapterName+"</b>");
					}
					chapter.data("info",jsonData);
					console.log(chapter,chapter.data("info"));
//					$this.sort(chapter);
					$.msg("保存成功");
				}
			})
		},
		//保存节
		saveLecture: function(data){
			var $this=this;
			if(!data){
				return;
			}
			delete data.updateTime;
			delete data.updator;
			$.ajax({
				url:rootPath+"/courseVideoLecture/saveLecture",
				data: data,
				type:"post",
				dataType:"json",
				success:function(jsonData){
					var lecture=$("#lecture_"+jsonData.id);
					lecture.find("a b").html(jsonData.lectureName);
					lecture.data("info",jsonData);
					var dd=$(".t-c-r").find(".n-list").find("tr").data("exercise");
					if(dd){
						dd.resourceId=$(".t-c-r").find(".lecture").attr("value");
						dd.exerciseType='PRACTICE_AFTER_CLASS';
						$.ajax({
							url: rootPath+"/courseExercise/save",
							data: dd,
							type:"post",
							dataType:"json",
							success:function(){
							}
						})
					}
					
					$.msg("保存成功");
				}
			})
		},
		delChapter : function(chapter){
			var $this=this;
			$.ajax({
				url: rootPath+"/courseVideoChapter/delChapter/"+chapter.attr("id").substring(8),
				type: "post",
				dataType: "json",
				success: function(jsonData){
					chapter.fadeOut(300,function(){
						chapter.remove();
						$(".t-c-r").find(".chapter").remove();
						$this.sort(chapter)
					})
				}
			})
		},
		delLecture: function(lecture){
			var $this=this;
			$.ajax({
				url: rootPath+"/courseVideoLecture/delLecture/"+lecture.attr("id").substring(8),
				type: "post",
				dataType: "json",
				success: function(jsonData){
					lecture.fadeOut(300,function(){
						var ele=lecture.siblings().eq(0);
						lecture.remove();
						$this.sort(ele);
						$this.showChapter(ele.parents(".dis"));
					})
				}
			})
		},
		//排序
		sort: function(ele){
			var list=new Array();
			if(ele.hasClass("dis")){
				$(".base-sort").find(".dis").each(function(i){
					var chapter={};
					var title=$(this).find(".father a b").html();
					$(this).find(".father a").html("第"+$.changeNum(i+1)+getCname()+"&nbsp;&nbsp;<b>"+title+"</b>");
					chapter.id=$(this).attr("id").substring(8);
					chapter.chapterOrder=i+1;
					list.push(chapter);
				})
				$.ajax({
					url: rootPath+"/courseVideoChapter/sortChapter",
					data: "list="+JSON.stringify(list),
					type: "post",
					dataType: "json",
					success:function(jsonData){
						$.each(jsonData,function(i,data){
							$("#chapter_"+data.id).data("info",data);
						})
					}
				})
			}
			if(ele.hasClass("class-son")){
				ele.parents(".dis").find(".class-son").each(function(i){
					var lecture={};
					var title=$(this).find("a b").html();
					$(this).find("a").html("第"+$.changeNum(i+1)+getCname()+" &nbsp;&nbsp;<b>"+title+"</b>");
					lecture.id=$(this).attr("id").substring(8);
					lecture.lectureOrder=i+1;
					list.push(lecture);
				})
				$.ajax({
					url: rootPath+"/courseVideoLecture/sortLecture",
					data: "list="+JSON.stringify(list),
					type: "post",
					dataType: "json",
					success:function(jsonData){
						$.each(jsonData,function(i,data){
							$("#lecture_"+data.id).data("info",data);
						})
					}
				})
			}
		},
		addChapter : function(chapter,callback){
			var para={};
			para.moduleId=$("#moduleId").val();
			para.itemOneId=$("#itemOneId").val();
			para.itemSecondId=$("#itemSecondId").val();
			para.classTypeId=$("#classTypeId").val();
			para.classTypeName=$("#classTypeName").val();
			para.chapterOrder=chapter.index();
			$.ajax({
				url: rootPath+"/courseVideoChapter/addChapter",
				data: para,
				type: "post",
				dataType: "json",
				success:function(data){
					chapter.attr("id","chapter_"+data.id);
					$("#chapter_"+data.id).data("info",data);
					$("#moduleId").val(data.moduleId);
					if(callback){
						callback();
					}
				}
			})
		},
		addLecture: function(lecture,callback){
			var $this=this;
			var para={};
			para.chapterId=lecture.parents(".dis").attr("id").substring(8);
			para.lectureOrder=lecture.index();
			$.ajax({
				url: rootPath+"/courseVideoLecture/addLecture",
				data: para,
				type: "post",
				dataType: "json",
				success:function(data){
					lecture.attr("id","lecture_"+data.id);
					$("#lecture_"+data.id).data("info",data);
					$('.base-sort').find(".sortable").sortable({
						placeholder: "ui-state-highlight",
						update:function(event,ui){
							$this.sort(ui.item.siblings());
							$this.sort(ui.item);
						},
						receive:function(event,ui){
							$this.mvLecture(ui.sender,$(event.target).parents(".dis"),ui.item);
						},
						delay: 200,
						connectWith: ".son"
					})
					if(callback){
						callback();
					}
				}
			})
		},
		showChapter : function(chapter){
			chapter=$("#"+chapter.attr("id"));//别删，有用
			if(chapter.attr("id")){
				var chapter_id=chapter.attr("id").substring(chapter.attr("id").indexOf("_")+1);
				var chapterDetail='<div class="t-c-r-t chapter" value="'+chapter_id+'">'+
	                '<p class="c">'+
	                '<span class="c-title">章的名称</span>'+
	                '<span class="c-content"><input class="chapterName" type="text" maxlength="20" value="" placeholder="章的名称"></span>'+
	            '</p>'+
//	            '<p class="c">'+
//	            '    <span class="c-title">顺序</span>'+
//	            '    <span class="c-content"><select id="sortChapter" placeholder="排列顺序"></select></span>'+
//	            '</p>'+
	            '<p class="c">'+
		        '<span class="c-title"></span>'+
	            '<span class="c-content">'+
	            '<a href="javascript:;" class="btn btn-mini btn-primary save">保存</a>'+
	            '</span>'+
	            '</p>'+
	            '</div>';
				$(".t-c-r").html(chapterDetail);
			}else{
				var chapterDetail='<div class="t-c-r-t chapter" value="">'+
	                '<p class="c">'+
	                '<span class="c-title">章的名称</span>'+
	                '<span class="c-content"><input class="chapterName" maxlength="20" type="text" value="" placeholder="章的名称"></span>'+
	            '</p>'+
//	            '<p class="c">'+
//	            '    <span class="c-title">顺序</span>'+
//	            '    <span class="c-content"><select id="sortChapter" placeholder="排列顺序"></select></span>'+
//	            '</p>'+
	            '<p class="c">'+
		        '<span class="c-title"></span>'+
	            '<span class="c-content">'+
	            '<a href="javascript:;" class="btn btn-mini btn-primary save">保存</a>'+
	            '</span>'+
	            '</p>'+
				 '</div>';
				$(".t-c-r").html(chapterDetail);
			}

			for(var i=1;i<=$(".t-c-l").find(".dis").length;i++){
				$(".t-c-r").find("#sortChapter").append('<option value="'+i+'">'+i+'</option>');
			}
			var data=chapter.data("info");
			if(data){
				//TODO 填充数据
				if(data.chapterName){
					$(".t-c-r").find(".chapterName").val(data.chapterName);
				}
				if(data.chapterOrder){
					$(".t-c-r").find("#sortChapter").find("option[value='"+data.chapterOrder+"']").attr("selected","selected");
				}else{
					$(".t-c-r").find("#sortChapter").find("option[value='"+(chapter.index()+1)+"']").attr("selected","selected");
				}
				
			}
		},
		showLecture : function(lecture){
			var chapter_id=lecture.parents(".dis").attr("id").substring(lecture.parents(".dis").attr("id").indexOf("_")+1);
			var lecture_id=lecture.attr("id").substring(lecture.attr("id").indexOf("_")+1);
			var lectureDetail='<div class="t-c-r-t lecture" value="'+lecture_id+'" fatherValue="'+chapter_id+'">'+
				'        <p class="c">'+
		        '    <span class="c-title">节的名称</span>'+
		        '    <span class="c-content">'+
		        '        <input class="lectureName" maxlength="20" type="text" placeholder="输入名称">'+
		        '    </span>'+
		        '</p>'+
//		        '<p class="c">'+
//		        '    <span class="c-title">顺序</span>'+
//		        '    <span class="c-content"><select id="sortLecture" type="text"></select></span>'+
//		        '</p>'+
		        '<p class="c">'+
		        '    <span class="c-title">公开视频</span>'+
		        '    <span class="c-content">'+
		        '        <input class="freeFlag" name="freeFlag" type="checkbox"> 免费视频'+
		        '        <input class="freeFlag" name="freeFlag" type="checkbox"> 试听'+
		        '    </span>'+
		        '</p>'+
		        '<p class="c">'+
		        '    <span class="c-title">视频文件</span>'+
		        '    <span class="c-content">'+
		        '       <input type="text" class="video_name"/> <input type="hidden" class="video_id"><input type="hidden" class="publishStatus"/><input type="hidden" class="publishDate"/>'+
		        '       <input type="button" class="btn btn-sm btn-primary chooseVideo" value="从库中选择">'+
		        '    </span>'+
		        '</p>'+
		        '<p class="c">'+
		        '	<span class="c-title">课后作业</span>'+
		        '	<span class="c-content">'+
		        '		<input type="radio" name="bind-set" class="radio" id="bind-paper" value="paper" checked=true/><label style="display:inline;" for="bind-paper">绑定试卷</label>&nbsp;&nbsp;&nbsp;&nbsp;'+
		        '		<input type="radio" name="bind-set" class="radio" id="bind-chapter" value="chapter"/><label style="display:inline;" for="bind-chapter">绑定章节</label>'+
		        '	</span>'+
		        '</p>'+
		        '<div class="c">'+
		        '	<span class="c-title"></span>'+
		        '   <span class="c-content">'+
		        '	<table class="n-list" style="width:300px;"></table>'+	
		        '	<a href="javascript:;" class="btn btn-default choosePaper">选择试卷</a>'+
		        '	</span>'+
		        '</div>'+
		        '<p class="c" style="margin-top:50px;">课程资料</p>'+
		        '<hr>'+
	            '<p class="c">'+ 
	            '    <span class="c-title">上传资料</span>'+
	            '    <span class="c-content"><a href="javascript:;" class="btn btn-mini btn-primary btn-upload">上传资料</a></span>'+
	            '</p>'+
	            '<p class="c">'+ 
	            '    <span class="c-title">资料列表</span>'+
	            '    <span class="c-content" id="courseList'+lecture_id+'"></span>'+
	            '</p>'+
	            '<p class="c">'+
		        '<span class="c-title"></span>'+
	            '<span class="c-content"><a href="javascript:;" class="btn btn-primary save">保存</a>'+
	            '</span>'+
	            '</p>'+
		    '</div>';
		   
			$(".t-c-r").html(lectureDetail);
			this.queryCorseResoure(lecture_id);
			for(var i=1;i<=lecture.parent().find("li").length;i++){
				$(".t-c-r").find("#sortLecture").append('<option value="'+i+'">'+i+'</option>');
			}
			var data=lecture.data("info");
			//TODO 填充数据
			if(data){
				$(".lectureName").val(data.lectureName);
				if(data.lectureOrder){
					$(".t-c-r").find(":radio[value='paper']").attr("checked",true);
					$(".t-c-r").find("#sortLecture").find("option[value='"+data.lectureOrder+"']").attr("selected","selected");
				}else{
					$(".t-c-r").find(":radio[value='chapter']").attr("checked",true);
					$(".t-c-r").find("#sortLecture").find("option[value='"+(lecture.index()+1)+"']").attr("selected","selected");
				}
				
				if(data.freeFlag==1){
					$(".freeFlag").eq(0).attr("checked",true);
				}else if(data.freeFlag==2){
					$(".freeFlag").eq(1).attr("checked",true);
				}
				if(data.videoName){
					$(".video_name").val(data.videoName);
				}
				$(".video_id").val(data.videoId);
			}
			
			$.ajax({
				url: rootPath+"/courseExercise/find",
				data: {
					resourceId:lecture_id,
					resourceType: "TEACH_METHOD_VIDEO",
				},
				type: "post",
				dataType: "json",
				success: function(exercise){
					if(exercise.tikuResourceType=="PAPER"){
						$(".t-c-r").find(":radio[value='paper']").data("exercise",exercise).trigger('click');
						$(".t-c-r").find(".n-list").html('<tr><td width="40%">'+(exercise.subjectName?exercise.subjectName:"")+'</td><td width="40%">'+(exercise.paperName?exercise.paperName:"")+'</td><td><a href="javascript:;">删除</a></td></tr>');
					}else{
						$(".t-c-r").find(":radio[value='chapter']").data("exercise",exercise).trigger('click');
						$(".t-c-r").find(".n-list").html('<tr><td width="40%">'+(exercise.chapterName?exercise.chapterName:"")+'</td><td width="40%">'+(exercise.sectionName?exercise.sectionName:"")+'</td><td><a href="javascript:;">删除</a></td></tr>');
					}
					$(".t-c-r").find(".n-list").find("tr:last").data("exercise",exercise);
				}
				
			})
			
		},
		searchPapers: function(page){
			var $tab=$(".w900"),search={};
			$tab.find("#data_table_2").find("tr").remove();
			search.tikuCategoryId=$("#choose_tiku").find("option:selected").val();
			search.tkuSubjectId=$("#choose_item").find("option:selected").val();
			search.paperName=$("#choose_paper").val();
			search.page=page;
			$.each(search,function(k,v){
				if(!v){
					delete search[k];
				}
			})
			$.ajax({
				url: rootPath+"/tikuPaper/search",
				data:search,
				type:"post",
				dataType:"json",
				success:function(jsonData){
					if(jsonData.data && jsonData.data.length>0){
						$.each(jsonData.data,function(i,data){
							$tab.find("#data_table_2").find("tbody")
							.append('<tr id="'+data.id+'">'+
				                    '<td style="width:30%;">'+(data.paperName?data.paperName:"")+'</td>'+
				                    '<td style="width:30%;">'+(data.categoryName?data.categoryName:"")+'</td>'+
				                    '<td style="width:20%;">'+(data.subjectName?data.subjectName:"")+'</td>'+
				                    '<td style="width:20%;">'+(data.dictName?data.dictName:"")+'</td>'+
				                '</tr>');
							$tab.find("#data_table_2").find("tbody").find("tr:last").data("paper",data);
						})
						$tab.find(".pagination").pagination(jsonData.rowCount, {
					    	 next_text : "下一页",
					    	 prev_text : "上一页",
					    	 current_page : jsonData.pageNo-1,
					    	 link_to : "javascript:void(0)",
					    	 num_display_entries : 8,
					    	 items_per_page : jsonData.pageSize,
					    	 num_edge_entries : 1,
					    	 callback:function(page,jq){
						    	 var pageNo = page + 1;
						    	 $this.searchPapers(pageNo);
					    	 }
					   });
					}else{
						$tab.find("#data_table_2").find("tbody").append('<tr><td>没有查到试卷&nbsp;&nbsp;</td></tr>');
					}
				}
			})
		},
		//检索视频
		searchVideos: function(page){
			var $this=this;
			var search={};
			var $tab=$("div.tab1");
			//获取当前视频类型
			$(".videotabs").find("span").each(function(){
				if($(this).hasClass("active")){
					search.flag=$(this).attr("ids");
					$tab=$("div.tab"+($(this).index()+1));
				}
			});
			
			if($tab.find("#choose_itemOne").val()){
				search.itemOneId=$tab.find("#choose_itemOne").val();
			}
			if($tab.find("#choose_itemSecond").val()){
				search.itemSecondId=$tab.find("#choose_itemSecond").val();
			}
			
			if($tab.find("#start_date").val()){
				search.beginTime=$tab.find("#start_date").val();
			}
			if($tab.find("#end_date").val()){
				search.endTime=$tab.find("#end_date").val();
			}
			if($tab.find("#tag").val()){
				var data=$tab.find("#tag").select2("data");
				$.each(data,function(i,d){
					if(i==0){
						search.videoTag=d.text?d.text:"";
					}else{
						search.videoTag+=","+d.text?d.text:"";
					}
					
				})
			}
			if($tab.find("#tj").val()){
				search.videoName=$tab.find("#tj").val();
			}
			search.page=page?page:1;

			$tab.find("#data_table").find('tr').remove();
			$tab.find(".pagination").html('');
			$.ajax({
				url: rootPath+"/video/searchVideos",
				data: search,
				type:"post",
				dataType:"json",
				success: function(jsonData){
					if(jsonData.data && jsonData.data.length>0){
						$.each(jsonData.data,function(i,data){
							$tab.find("#data_table").find("tbody")
							.append('<tr id="'+data.id+'" videoCcId="'+data.videoCcId+'" has-data="true" videoStatus="'+data.videoStatus+'">'+
				                    '<td style="width:30%;">'+(data.videoName?data.videoName:"")+'</td>'+
				                    '<td style="width:10%;">'+(data.vodeoSize?data.vodeoSize:0)+'M</td>'+
				                    '<td style="width:30%;">'+(data.videoTag?data.videoTag:"")+'</td>'+
				                    '<td style="width:10%;">'+data.creatorName+'</td>'+
				                    '<td style="width:20%;">'+(data.createTime?data.createTime:"")+'</td>'+
				                '</tr>');
						})
						$tab.find(".pagination").pagination(jsonData.rowCount, {
					    	 next_text : "下一页",
					    	 prev_text : "上一页",
					    	 current_page : jsonData.pageNo-1,
					    	 link_to : "javascript:void(0)",
					    	 num_display_entries : 8,
					    	 items_per_page : jsonData.pageSize,
					    	 num_edge_entries : 1,
					    	 callback:function(page,jq){
						    	 var pageNo = page + 1;
						    	 $this.searchVideos(pageNo);
					    	 }
					   });
					}else{
						$tab.find("#data_table").find("tbody").append('<tr><td>没有查到视频资源&nbsp;&nbsp;<a href="'+rootPath+'/video/toVideo" target="_blank" style="color:blue;text-decoration:underline;">现在去上传视频</a></td></tr>');
					}
					
				},
				error: function(resp,err,msg){
					console.log(resp);
					alert("检索异常");
				}
				
			});
			
		},
		mvLecture: function(src,target,lecture){
			var $this=this;
			var para={};
			para.target=target.attr("id").substring(8);
			para.lecture=lecture.attr("id").substring(8);
			$.ajax({
				url: rootPath+"/courseVideoLecture/mvLecture",
				data:para,
				type: "post",
				dataType: "json",
				success: function(json){
					if(src.parents(".dis").find("li").length>0){
						$this.sort(src.parents(".dis").find("li").eq(0));
					}
					
				}
			})
		},
		collapseAll: function(){
			$(".base-sort").find(".sortable").slideUp(200);
		},
		togglespan: function($ele){
			$ele.find(".sortable").slideToggle(200);
			if($ele.find(".father").find("i").hasClass("open")){
				$ele.find(".father").find(".iconfont2").removeClass("open").addClass("close").html('&#xe62e;');
			}else if($ele.find(".father").find("i").hasClass("close")){
				$ele.find(".father").find(".iconfont2").removeClass("close").addClass("open").html('&#xe62f;');
			}
		},
		queryCorseResoure : function(id){
			var oneItem=$("#itemOneId").val();
			var twoItem=$("#itemSecondId").val(); 
			var classid=$("#classTypeId").val();
			 $.ajax({
				 url : rootPath + "/classTypeResource/rourseList",
				 type: "post",
				 data:{"itemOneId":oneItem,"itemSecondId":twoItem,"classTypeId":classid,"lectureId":id,"lectureType":"TEACH_METHOD_VIDEO"},
				 dataType:"json",
				 success:function(data){
					 var html="";
					 $.each(data,function(i,item){
						 var name=item.name;
						 if(name.substring(name.lastIndexOf(".")+1)=="doc"||name.substring(name.lastIndexOf(".")+1)=="docx"){
							html+='<span class="resouList"><i class="iconfont">&#xe649;</i><font>'+item.name+'</font><a href="javascript:void(0);" class="delresource" style="margin-left:20px;" ids="'+item.id+'"><i class="iconfont">&#xe626;</i></a></span>';
						 }else if(name.substring(name.lastIndexOf(".")+1)=="xls"||name.substring(name.lastIndexOf(".")+1)=="xlsx"){
							 html+='<span class="resouList"><i class="iconfont">&#xe646;</i><font>'+item.name+'</font><a href="javascript:void(0);" class="delresource"  style="margin-left:20px;" ids="'+item.id+'"><i class="iconfont">&#xe626;</i></a></span>';
						 }else if(name.substring(name.lastIndexOf(".")+1)=="pdf"){
							 html+='<span class="resouList"><i class="iconfont">&#xe64b;</i><font>'+item.name+'</font><a href="javascript:void(0);" class="delresource"  style="margin-left:20px;" ids="'+item.id+'"><i class="iconfont">&#xe626;</i></a></span>';
						 }else if(name.substring(name.lastIndexOf(".")+1)=="ppt"||name.substring(name.lastIndexOf(".")+1)=="pptx"){
							 html+='<span class="resouList"><i class="iconfont">&#xe64a;</i><font>'+item.name+'</font><a href="javascript:void(0);" class="delresource"  style="margin-left:20px;" ids="'+item.id+'"><i class="iconfont">&#xe626;</i></a></span>';
						 }else{
							 html+='<span class="resouList"><i class="iconfont">&#xe64c;</i><font>'+item.name+'</font><a href="javascript:void(0);" class="delresource"  style="margin-left:20px;" ids="'+item.id+'"><i class="iconfont">&#xe626;</i></a></span>';
						 }
					 });
					 $("#courseList"+id).html("").append(html);
				 }
			 });
		},
		initBase: function(){
			var $this=this;
			//点击章，显示章详情
			$(".t-c-l").on("click.li.left",".father",function(){
				$this.showChapter($(this).parent());
				$this.togglespan($(this).parent());
			});
			
			//点击节，显示节详情
			$(".t-c-l").on("click.li.left",".class-son",function(){
				var data={};
				data.lectureOrder=$(this).index();
				$this.showLecture($(this));
				
			});
			//添加章操作
			$(".teacher-btns").on("click.btn.page",".btn-add-class",function(){
				var chapter='<li class="dis none"><p class="father">'+
					'<i class="iconfont4">&#xe630;</i>'+
					'<i class="iconfont2 open">&#xe62f;</i>'+
                    '<a href="javascript:;">第'+getChapterName()+getCname()+'&nbsp;&nbsp;<b></b> </a>'+
                    '<i class="iconfont">&#xe626;</i>'+
                    '<i class="iconfont3 add-btns" title="添加节">&#xe629;</i>'+
                '</p><ul class="son sortable"></ul></li>';
				$(".t-c-l").find(".base-sort").append(chapter);
				var chapter=$(".t-c-l").find(".sortable").find(".dis:last");
				chapter.fadeIn(300);
				$this.addChapter(chapter,function(){
					$this.showChapter(chapter);
				});
			});
			//添加节操作
			$(".sortable").on("click.btn.page",".add-btns",function(){
				var lecture='<li class="class-son none" draggable="true">'
					+'<a href="javascript:;">第'
					+getLecureName($(this).parents('.dis'))+getLname()+' &nbsp;&nbsp;<b></b></a>'
					+'<i class="iconfont4">&#xe630;</i>'
					+'<i class="iconfont">&#xe626;</i></li>';
				var chapter=$(this).parent().next().append(lecture);
				var lecture=$(this).parent().next().find(".class-son:last");
				lecture.fadeIn(300);
				$this.addLecture(lecture,function(){
					$this.showLecture(lecture);	
				});
				return false;
			});
			//删除章操作
			$(".sortable").on("click.btn.right",".father .iconfont",function(){
				var _this=$(this);
				if(_this.parent().parent().find(".class-son").length>0){
					alert("请先清空此章下的节");
					return false;
				}else{
					$.confirm("确定删除？",function(e){
						if(e){
							$this.delChapter(_this.parent().parent());
						}
					})
				}
				
			});
			//删除节操作
			$(".sortable").on("click.btn.right",".son .iconfont",function(){
				var _this=$(this);
//				var cf=confirm("确定删除？");
				$.confirm("确定删除？",function(e){
					if(e){
						$this.delLecture(_this.parent())
					}
				})
			});
			
			//保存章节内容
			$(".t-c-r").on("click.btn.right",".save",function(){
				var data={};
				if($(this).parents(".chapter").length){
					data.id=$(this).parents(".t-c-r").find(".t-c-r-t").attr("value");
					data.chapterName=$(this).parents(".t-c-r").find(".chapterName").val();
					data.chapterOrder=$(this).parents(".t-c-r").find("#sortChapter").val();
					$this.saveChapter(data);
				}
				if($(this).parents(".lecture").length){
					var id=$(this).parents(".t-c-r").find(".t-c-r-t").attr("value");
					var lecture=$(this).parents(".t-c-r").find(".t-c-r-t");
					data=$("#lecture_"+id).data("info");
					data.lectureName=lecture.find(".lectureName").val();
					if(lecture.find(".freeFlag").eq(0).is(":checked")){
						data.freeFlag=1;
					}else if(lecture.find(".freeFlag").eq(1).is(":checked")){
						data.freeFlag=2;
					}else{
						data.freeFlag=0;
					}
					data.videoId=lecture.find(".video_id").val();
					data.videoName=lecture.find(".video_name").val();
					if(!data.lectureName){
						$.msg('请输入节的名字');
						lecture.find(".lectureName").focus();
						return;
					}
					if(!data.videoId){
						$.msg('请选择一个视频');
						lecture.find(".video_name").focus();
						return;
					}
					$.each(data,function(k,v){
						if(v==null){
							delete data[k];
						}
					})
					$this.saveLecture(data);
				}
			});
			//章排序
			$(".t-c-r").on("change.btn.right","#sortChapter",function(){
				
			});
			//打开视频选择框
			$(".t-c-r").on("click.btn.right",".chooseVideo",function(){
				 $('.add-layer-bg').fadeIn(200,function(){
	               $('.w800').fadeIn(200);
	               $('.videotabs').find('span').eq(0).trigger('click');
	             })
			});
			//选择课后作业方式
			$(".t-c-r").on("change.radio.right",".radio",function(){
				var exercise=$(this).data("exercise");
				$(this).parents(".c").next().find(".c-content").find("a").remove();
				$(".n-list").find("tr").remove();
				
				if($(".t-c-r").find(".radio:checked").val()=="paper"){
					if(exercise){
						$(".t-c-r").find(".n-list").html('<tr><td width="40%">'+(exercise.subjectName?exercise.subjectName:"")+'</td><td width="40%">'+(exercise.paperName?exercise.paperName:"")+'</td><td><a href="javascript:;">删除</a></td></tr>');
					}
					$(this).parents(".c").next().find(".c-content").append('<a href="javascript:;" class="btn btn-default choosePaper">选择试卷</a>');
					
				}else{
					if(exercise){
						$(".t-c-r").find(".n-list").html('<tr><td width="40%">'+exercise.chapterName+'</td><td width="40%">'+exercise.sectionName+'</td><td><a href="javascript:;">删除</a></td></tr>');
					}
					$(this).parents(".c").next().find(".c-content").append('<a href="javascript:;" class="btn btn-default chooseChapter">选择章节</a>');
					
				}
				
			})
			.on("click.checkbox.right",".freeFlag",function(){
				$(this).siblings().removeAttr("checked");
			})
			//打开试卷选择框
			$(".t-c-r").on("click.btn.right",".choosePaper",function(){
				 $('.add-layer-bg').fadeIn(200,function(){
	               $('.w900').fadeIn(200);
	             })
			});
			//打开题库章节选择框
			$(".t-c-r").on("click.btn.right",".chooseChapter",function(){
				 $('.add-layer-bg').fadeIn(200,function(){
	               $('.w1000').fadeIn(200);
	             })
			});
			//改变条件，检索视频
//			$(".w800").on("change.input.search","#choose_itemOne,#choose_itemSecond,#start_date,#end_date,#tag",function(){
//				$this.searchVideos();
//			});

			$(".t-c-l").find(".dis").eq(0).trigger("click.li.left");
			//返回
			$(".btn.back").on("click",function(){
				//location.href=rootPath+$('#backurl').val();
				history.back();
			})
			//取消
			$(".btn.cancle").on("click",function(){
				location.href=rootPath+"/classType/showClassTypePage";
			});
			//下一步
			$(".btn.next").on("click",function(){
				$("#myForms").attr("action",rootPath+"/classType/showClass").submit();
			});
			//打开添加资料弹框
			$(".t-c-r").on("click",".btn.btn-upload",function(){
				$(".class-resource").show();
				$(".loading-bg").show();
				$("#doctype").attr("lecid",$(this).parents("div.lecture").attr("value"));
				
			});
			//关闭资料弹框
			$(".btn-cancel").click(function(){
				$(".class-resource").hide();
				$(".loading-bg").hide();
				$("#doctype").val("");
				$("#dochint").html("");
			});
			//上传资料
//			$("#doctype").on('change',function(){
//				$this.docChange();
//			});
			//保存资料
			$(".btn-ok").on('click',function(){
				$(".loading-bg").show();
				var oneItem=$("#itemOneId").val();
				var twoItem=$("#itemSecondId").val(); 
				var classid=$("#classTypeId").val();
				//类型code
				var resource=$("#classresource").val();
				//类型name
				var resName = $.trim($("#classresource").find("option:selected").text());
				var classTypeName=$("#classTypeName").val();
				var lectureId=$("#doctype").attr("lecid");
				var docurl=$("#doctype").attr("url");
    			var docname=$("#doctype").attr("cname");
    			var docsize=$("#doctype").attr("mark");
    			if(docurl == null || docurl == ""){
					$.msg("请先上传文档");
					$(".loading-bg").hide();
					return false;
				}
	    	    //console.log("课程资料信息---节："+lectureId+"---文件名"+docname);
					$.ajax({
						url : rootPath + "/classTypeResource/save",
						type:"post",
						data:{"itemOneId":oneItem,"itemSecondId":twoItem,"classTypeId":classid,"resourceType":resource,"classTypeName":classTypeName,"name":docname,"url":docurl,"size":docsize,"resName":resName,"lectureId":lectureId,"lectureType":"TEACH_METHOD_VIDEO"},
						dataType:"json",
						success:function(data){
							if(data.msg == "success"){
								$(".class-resource").hide();
								$("#doctype").attr("url","");
					    	//	$("#doctype").val("");
					    		$("#dochint").html("");
					    		$this.queryCorseResoure(lectureId);
					    		$(".loading-bg").hide();
					    		$.msg("资料上传成功");
							}else{
								$(".loading-bg").hide();
								$.msg("保存资料失败");
							}
						}
					});
			});
			//tab
			$(".videotabs").on('click','span',function(){
				$(".w800").find("div.layer-content").hide();
				$("div.tab"+($(this).index()+1)).show();
				$(this).siblings().removeClass("active");
				$(this).addClass("active");
				$this.searchVideos();
				 $(".term-list").find(".table-head").css("top","0px");
			});
			//删除课程资料
			$(".t-c-r").on("click","a.delresource",function(){
				var $t=$(this);
				var id=$t.attr("ids");
				$.ajax({
					url : rootPath + "/classTypeResource/delete/"+id,
					type:"post",
					dataType:"json",
					success:function(data){
						$t.parent().remove();
					}
				});
			})
			.on("click.link.del",".n-list a",function(){
				$(this).parents("tr").remove();
			})
		},
		init800: function(){
			var $this=this;
			//初始化一学科小类
			$(".tab1").find("#choose_itemOne").getSysItem();
			$(".tab1").find("#choose_itemOne").on("change",function(){
				$(".tab1").find("#choose_itemSecond").getSysItem($(this).val(),function(){
					
				});
			});
			$(".tab2").find("#choose_itemOne").getSysItem();
			$(".tab2").find("#choose_itemOne").on("change",function(){
				$(".tab2").find("#choose_itemSecond").getSysItem($(this).val(),function(){
					
				});
			});
			$(".tab2").find(".itemOne").getSysItem();
			$(".tab2").find(".itemOne").on("change",function(){
				$(".tab2").find(".itemSecond").getSysItem($(this).val(),function(){
				});
			});
			//初始化视频列表
			$(".tab1").find("#choose_itemOne").find("option[value='"+$("#itemOneId").val()+"']").attr("selected","selected");
			$(".tab1").find("#choose_itemSecond").getSysItem($("#choose_itemOne").val(),function(){
				$(".tab1").find("#choose_itemSecond").find("option[value='"+$("#itemSecondId").val()+"']").attr("selected","selected");
			});
			$(".tab2").find("#choose_itemOne").find("option[value='"+$("#itemOneId").val()+"']").attr("selected","selected");
			$(".tab2").find("#choose_itemSecond").getSysItem($(".tab2").find("#choose_itemOne").val(),function(){
				$(".tab2").find("#choose_itemSecond").find("option[value='"+$("#itemSecondId").val()+"']").attr("selected","selected");
			});
			//初始化日期框
			$(".date-picker").datetimepicker({
 				format: "yyyy-mm-dd",
 				minView:2,
 				autoclose: true,
 				language: "zh-CN"
 			});
			
			//初始化标签库
			$.ajax({
				url: rootPath+"/videoTag/list",
				type: "post",
				dataType : "json",
				success: function(jsonData){
					var datas=[];
					$.each(jsonData,function(i,data){
						if(data){
							datas.push({id:data.id,text:(data.tagName?data.tagName:"")});
						}
					});
					$(".tag").each(function(){
						$(this).select2({
							multiple: true,
							data: datas,
							width: '150px',
							height:'32px'
						})
					})
				}
			});
			$(".w800").on("change.input.search","#tag,#tj",function(){
				$this.searchVideos();
			})
			//单机选中视频，双击选择视频
			.on("click.row.model",".term-list tr[has-data]",function(){
				$(".w800").find(".term-list tr").removeClass("active");
				$(this).addClass("active");
			})
			//检索视频
			.on("click.btn.choose",":button",function(){
				$this.searchVideos();
			})
			.on("click.row.model",".term-list tr[has-data]",function(){
				$(".video_name").val($(this).children().eq(0).html());
				$(".video_id").val($(this).attr("id"));
				$(".publishStatus").val($(this).attr("publishStatus"));
				$(".publishDate").val($(this).attr("publishDate"));
				$('.w800').fadeOut(200,function(){
                    $('.add-layer-bg').fadeOut(200);
                });
			})
						.on("click",".add-video-link",function(){
				$(".add-div").show();
				$(".default-div").hide();
			})
			.on("click",".btn-add-url",function(){
				var url = $("#videourl").val();
				if(typeof(url) == "undefined" || url == null || url == ""){
					$.msg("请填入外部视频连接地址");
					return false;
				}
				//截取网址域
				if(url.indexOf("http://") >= 0){
					url = url.substring(7);
				}
				var httpTitle = url.substring(0,url.indexOf("/"));
				var videoType = httpTitle;
				var storageType="";
				/*if(httpTitle == "open.163.com"){
					//截取163的
					if(url.lastIndexOf("/") >= 0){
						outUrl = (url.substring(url.lastIndexOf("/") + 1 , url.lastIndexOf(".")));
					}else{
						$('<div class="c-fa" style="z-index;102;">您输入的地址不合法</div>').appendTo('body').fadeIn(100).delay(1000).fadeOut(200,function(){$(this).remove();});
						return false;
					}
				}else */if(httpTitle == "v.youku.com"){
					storageType = "VIDEO_STORAGE_TYPE_YK";
					//截取优酷的
					if(url.indexOf("id_") >= 0){
						if(url.indexOf("==") >= 0){
							outUrl = (url.substring(url.indexOf("id_") + 3 , url.indexOf("=")));
							$("#videourl").data("outUrl",outUrl);
						}else{
							outUrl = (url.substring(url.indexOf("id_") + 3 , url.lastIndexOf(".html")));
							$("#videourl").data("outUrl",outUrl);
						}
					}else{
						$.msg('您输入的地址不合法');
						return false;
					}
				}else if(httpTitle == "www.tudou.com"){
					storageType = "VIDEO_STORAGE_TYPE_TD";
					//截取土豆的
					if(url.indexOf("albumplay/") >= 0){
						outUrl = "a/" + (url.substring(url.indexOf("albumplay/") + ("albumplay/").length , url.lastIndexOf("/")));
						$("#videourl").data("outUrl",outUrl);
					}else if(url.indexOf("listplay/") >= 0){
						outUrl = "l/" + (url.substring(url.indexOf("listplay/") + ("listplay/").length , url.lastIndexOf("/")));
						$("#videourl").data("outUrl",outUrl);
					}else if(url.indexOf("view/") >= 0){
						outUrl = "v/" + (url.substring(url.indexOf("view/") + ("view/").length , url.lastIndexOf("/")));
						$("#videourl").data("outUrl",outUrl);
					}else{
						$.msg('您输入的地址不合法');
						return false;
					}
				}else if(httpTitle == "console.video.capitalcloud.net"){
					storageType = "VIDEO_STORAGE_TYPE_SS";
					//截取石山的
					if(url.indexOf("entryId=") >= 0){
						outUrl = (url.substring(url.indexOf("entryId=") + 8 , url.indexOf("&pubId=")));
						$("#videourl").data("outUrl",outUrl);
						$('<div class="c-fa" style="z-index;102;">已添加外部链接</div>').appendTo('body').fadeIn(100).delay(1000).fadeOut(200,function(){$(this).remove();});
						return false;
					}else{
						$('<div class="c-fa" style="z-index;102;">您输入的地址不合法</div>').appendTo('body').fadeIn(100).delay(1000).fadeOut(200,function(){$(this).remove();});
						return false;
					}
				}else{
					$.msg('您输入的地址不合法');
					return false;
				}
				$.ajax({
					url :rootPath + "/video/selVideoName" ,
					type:"post",
					data:{"url":$("#videourl").val(),"domain":httpTitle},
					dataType:"json",
					beforeSend:function(XMLHttpRequest){
						$(".addVideoTc").css("z-index",2);
		              $(".loading").show();
		              $(".loading-bg").show();
		         	},
					success:function(data){
						if(data.msg != "error"){
							$(".video-name").val(data.msg);
							$.msg('已添加外部链接');
						}
					}
				});
			})
			.on("click.btn.save",".tab2 .btn-s",function(){
				var oneItemId = $(".add-div").find(".itemOne").val();
				var twoItemId = $(".add-div").find(".itemSecond").val();
				var tag=$(".add-div").find(".tag").val();
				var videoName = $(".add-div").find(".video-name").val();
				var url = $(".add-div").find("#videourl").val();
				var outUrl=$("#videourl").data("outUrl");
				var hh = $(".hour").val() == "" ? 0 : $(".hour").val();
				var mm = $(".minute").val() == "" ? 0 : $(".minute").val();
				var ss = $(".second").val() == "" ? 0 : $(".second").val();
				/* alert(oneItemId + "\n" + twoItemId + "\n" + videoName + "\n" + url + "\n" + outUrl + "\n" + videoType); */
				if(oneItemId == null || twoItemId == null || oneItemId < 0 || twoItemId < 0){
					$.msg('请选择科目');
					return false;
				}
				if(url == "" || outUrl == ""){
					$.msg('请添加外部链接地址');
					return false;
				}
				if(videoName == ""){
					$.msg('请添加视频名称');
					return false;
				}
//	        	if(!$("#protocol").prop("checked")){
//	        		$('您尚未同意上传协议');
//	        		return false;
//	        	}
	        	if(hh == 0 && mm == 0 && ss == 0){
	        		$.msg('请填写视频时长');
	        		return false;
	        	}
	        	//截取网址域
				if(url.indexOf("http://") >= 0){
					url = url.substring(7);
				}
				var httpTitle = url.substring(0,url.indexOf("/"));
				var videoType = httpTitle;
				var storageType="";
				if(httpTitle == "v.youku.com"){
					storageType = "VIDEO_STORAGE_TYPE_YK";
				}else if(httpTitle == "www.tudou.com"){
					storageType = "VIDEO_STORAGE_TYPE_TD";
				}else if(httpTitle == "console.video.capitalcloud.net"){
					storageType = "VIDEO_STORAGE_TYPE_SS";
				}else{
					$.msg('您输入的地址不合法');
					return false;
				}
	        	//保存到video
	        	var videoTime = (hh.length == 2 ? hh : "0" + hh) + ":" + (mm.length == 2 ? mm : "0" + mm) + ":" + (ss.length == 2 ? ss : "0" + ss);
	        	$.ajax({
	        		url:rootPath + "/video/saveVideoUrl",
	        		type:"post",
	        		data:{"videoName":videoName,"videoTime":videoTime,"videoStatus":"VIDEO_PROCESS_NOMAL","itemOneId":oneItemId,"itemSecondId":twoItemId,"videoTag":tag,"webVideoId":outUrl,"webVideoDomain":videoType,"storageType":storageType},
	        		dataType:"json",
					beforeSend:function(XMLHttpRequest){
			             $.loading("")
			         },
	        		success:function(data){
	        			if(data.msg == "success"){
	        				var domain = "";
	        				/*if(videoType == "open.163.com"){
	        					domain = "网易公开课";
	        				}else */if(videoType == "v.youku.com"){
	        					domain = "优酷视频";
	        				}else if(videoType == "www.tudou.com"){
	        					domain = "土豆视频";
	        				}else if(videoType == "console.video.capitalcloud.net"){
	        					domain = "石山视频";
	        				}
//	        				$(".v_url").prepend("<tr data-id='" + data.id + "'><td><div class='operate_w'>" + videoName + "</div></td><td>" + domain + "</td><td>正常</td><td><a class='btn btn-sm btn-del' href='javascript:;' data-id='" + data.id + "'>删除</a></td></tr>");
	        				// 刷新视频列表
	        				$this.searchVideos();
	        				$(".default-div").show();
	        				$(".add-div").hide();
	        				$(".add-div").find(".itemOne").val(-1);
	        				$(".add-div").find(".itemSecond").val(-1);
	        				$(".add-div").find(".tag").val("");
	        				$(".add-div").find(".hour").val(0);
	        				$(".add-div").find(".minute").val(0);
	        				$(".add-div").find(".second").val(0);
	        				$(".add-div").find(".video-url").val("");
	        				$(".add-div").find(".video-name").val("");
	        				outUrl = "";
	        				videoType = "";
	        			}else{
							$.msg("未保存");
	        			}
	        		},
					complete:function(XMLHttpRequest,textStatus){
						$(".loading").hide();
			            $(".loading-bg").hide();
			            $.loadover()
			        }
	        	});
			}).on("click.btn.cancle",".tab2 .btn-c",function(){
				$(".add-div").hide();
				$(".default-div").show();
			})
		},
		//绑定题库事件
		init900: function(){
			var $this=this;
			//初始化题库
			$.ajax({
				url:rootPath+'/tikuCategory/getList',
				type:'post',
				dataType:'json',
				success:function(jsonData){
					$("#choose_tiku").find("option").remove();
					$("#choose_tiku").append("<option value=''>选择题库</option>")
					$.each(jsonData,function(i,data){
						$("#choose_tiku").append('<option value="'+data.id+'">'+data.tikuName+'</option>')
					})
				}
			})
			$(".w900").on("change","#choose_tiku",function(){
				//初始化题库下科目
				$.ajax({
					url:rootPath+'/tikuSubject/getList/'+$(this).val(),
					type:'post',
					dataType:'json',
					success:function(jsonData){
						$("#choose_item").find("option").remove();
						$("#choose_item").append('<option value="">选择科目</option>')
						$.each(jsonData,function(i,data){
						$("#choose_item").append('<option value="'+data.id+'">'+data.subjectName+'</option>')
					})
					}
				})
			})
			
			//搜索试卷
			.on("click.btn.search","#search_paper",function(){
				$this.searchPapers();
			})
			//单击行选中试卷
			.on("click.tr.choose","#data_table_2 tr",function(){
				var d=$(this).data("paper");
				var data={};
				data.tikuCategoryId=d.tikuCategoryId;
				data.paperId=d.id;
				data.classTypeId=$("#classTypeId").val();
				data.resourceType="TEACH_METHOD_VIDEO";
				data.resourceId=$(".t-c-r").find(".lecture").attr("value");
				data.tikuResourceType="PAPER";
				data.tikuSubjectId=d.tkuSubjectId;
				$(".t-c-r").find(".n-list").html('<tr><td width="40%">'+d.subjectName+'</td><td width="40%">'+d.paperName+'</td><td><a href="javascript:;">删除</a></td></tr>');
				$(".t-c-r").find(".n-list").find("tr:last").data("exercise",data);
				$('.add-layer-bg').fadeOut(200,function(){
					$(".w900").fadeOut(200);
				});
				
			})
		},
		init1000: function(){
			var $this=this;
			//初始化题库
			$.ajax({
				url:rootPath+'/tikuCategory/getList',
				type:'post',
				dataType:'json',
				success:function(jsonData){
					$("#choose_tiku_2").find("option").remove();
					$("#choose_tiku_2").append("<option value=''>选择题库</option>")
					$.each(jsonData,function(i,data){
						$("#choose_tiku_2").append('<option value="'+data.id+'">'+data.tikuName+'</option>')
					})
				}
			})
			$(".w1000").on("change","#choose_tiku_2",function(){
				//初始化题库下科目
				$.ajax({
					url:rootPath+'/tikuSubject/getList/'+$(this).val(),
					type:'post',
					dataType:'json',
					success:function(jsonData){
						$("#choose_subject_2").find("option").remove();
						$("#choose_subject_2").append('<option value="">选择科目</option>')
						$.each(jsonData,function(i,data){
						$("#choose_subject_2").append('<option value="'+data.id+'">'+data.subjectName+'</option>')
					})
					}
				})
			})
			.on("change","#choose_subject_2",function(){
				//初始化题库下科目
				$.ajax({
					url:rootPath+'/tikuChapter/getList',
					data:{
						tikuCategoryId: $("#choose_tiku_2").val(),
						tikuSubjectId: $(this).val()
					},
					type:'post',
					dataType:'json',
					success:function(jsonData){
						$("#choose_chapter_2").find("option").remove();
						$("#choose_chapter_2").append('<option value="">选择章</option>')
						$.each(jsonData,function(i,data){
						$("#choose_chapter_2").append('<option value="'+data.id+'">'+data.chapterName+'</option>')
					})
					}
				})
				
			})
			.on("change","#choose_chapter_2",function(){
				//初始化题库下科目
				$.ajax({
					url:rootPath+'/tikuSection/getList',
					data:{
						tikuCategoryId: $("#choose_tiku_2").val(),
						chapterId: $(this).val()
					},
					type:'post',
					dataType:'json',
					success:function(jsonData){
						$("#choose_lecture_2").find("option").remove();
						$("#choose_lecture_2").append('<option value="">选择节</option>')
						$.each(jsonData,function(i,data){
						$("#choose_lecture_2").append('<option value="'+data.id+'">'+data.sectionName+'</option>')
					})
					}
				})
			})
			.on("click.btn",".btn",function(){
				var data={};
				data.tikuCategoryId=$("#choose_tiku_2").find("option:selected").val();
				data.tikuSubjectId=$("#choose_subject_2").find("option:selected").val();
				data.tikuChapterId=$("#choose_chapter_2").find("option:selected").val();
				data.tikuSectionId=$("#choose_lecture_2").find("option:selected").val();
				data.categoryName=$("#choose_tiku_2").find("option:selected").val()?$("#choose_tiku_2").find("option:selected").text():"";
				data.chapterName=$("#choose_chapter_2").find("option:selected").val()?$("#choose_chapter_2").find("option:selected").text():"";
				data.lectureName=$("#choose_lecture_2").find("option:selected").val()?$("#choose_lecture_2").find("option:selected").text():"";
				data.classTypeId=$("#classTypeId").val();
				data.resourceType="TEACH_METHOD_VIDEO";
				data.tikuResourceType="CHAPTER";
				data.resourceId=$(".t-c-r").parents(".lecture").attr("value");
				data.topicNum=$("#choose_num_2").val();
				
				//检查数据
				if(!data.tikuChapterId){
					$.msg("必须选择章或节");
					return ;
				}
				
				if(!data.topicNum){
					$.msg("做题数量不能为空");
					return;
				}
				
				$(".t-c-r").find(".n-list").html('<tr><td width="40%">'+data.chapterName+'</td><td width="40%">'+data.lectureName+'</td><td><a href="javascript:;">删除</a></td></tr>');
				$(".t-c-r").find(".n-list").find("tr:last").data("exercise",data);
				$('.add-layer-bg').fadeOut(200,function(){
					$(".w1000").fadeOut(200);
				});
			})
			$("#choose_num_2").on("keyup",function(){
				if($(this).val() && isNaN($(this).val())){
					$(this).val("");
				}
			})
			
		}
	}
	
	$(document).ready(function(){
		var page=new Page();
		page.init();
	})
})(jQuery)