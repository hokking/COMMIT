/**
 * 
 */



function listPage(cpage){
	
	 $.ajax({
//			url : '/CommitProject/manager.do' ,
			url : '/CommitProject/managerSearch.do' ,
			data : { "page" :cpage },
			type : 'get',
			success : function(res){
			   code = '<div class="panel-group" id="accordion">';
			   $.each(res.datas,function(i, v){
				  code +='<div class="panel panel-default"> ';
				  code +='	<div class="panel-heading"> ';
				  code +='		<h4 class="panel-title"> ';
				  code +='			<a  idx="'+v.id+'"name="list" class="action" data-toggle="collapse" data-parent="#accordion" href="#collapse'+i+'">'+v.id+'</a>';
				  code +='		</h4>';
				  code +='	</div>';
				  code +='	<div id="collapse' + i + '" class="panel-collapse collapse">';
				  code +='	<div class="panel-body pbody"> ';                                              
				  code +='		<p class="p1">  ';                                                    
				  code +='			회원분류 : ' +  v.num ;
				  code +='		</p>';
				  code +='		<p class="p2 listp2">';
				  code +='			회원아이디 : ' +  v.id + '<br>';
				  code +='			회원비밀번호 : ' +  v.pass + '<br>';
				  code +='		</p>';
				  code +='		<div id="detailView">';
				  code +='		</div>';
				  code +='		<p class="p3">';
				  if(v.num!=3){
				  code +='			<input  idx="' + v.id +'"type="button" name="delete"  class="action" value="삭제">';
				  code +='			<input  idx="' + v.id +'" id_num="' + v.num + '"  type="button" name="detail"  class="action" value="상세보기">';
				  }
				  code +='		</p>';
				  code +='	</div>';
				  code +='	</div>';
				  code +='</div>';
			   })
			   code += '</div>';
			   $('#list').html(code);
			   
			   $('#pageList').empty();
			   
			   //이전버튼 만들기 
			   if(res.sp > 1) {
				  pager='<ul class="pager">';
				  pager +=' <li><a class="prev" href="#">Previous</a></li>';
				  pager +=' </ul>';
				  
				  $('#pageList').append(pager)
			   }
			
			 //페이지번호 만들기 
			  pager = '<ul class="pagination pager">';
			 for(i=res.sp; i<=res.ep; i++){
				if(currentPage == i) {
					 pager += '<li class="active"><a class="paging" href="#">' + i + '</a></li>';
				}else{
					 pager += '<li><a  class="paging" href="#">' + i + '</a></li>';
				} 
			 }
			  pager += '</ul>';
			  $('#pageList').append(pager) 
			
			 //다음버튼 만들기 
			  if(res.ep < res.tp){
				  pager='<ul class="pager">';
				  pager +=' <li><a class="next" href="#">Next</a></li>';
				  pager +=' </ul>';
				  
				  $('#pageList').append(pager)
			  }
			   
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);//200
	    	},
	    	dataType : 'json'
		 })
}//listPage

function deleteBoard(){
	$.ajax({
		url : '/CommitProject/managerDelete.do' ,
		type : "get",
		data : {"id" : idx},
		success : function(res){
			alert(res.sw);
			//currentPage 와  totalPage 를 비교 
		   	
			if(res.sw == "성공") {
			    
				if(currentPage > res.tpage) currentPage = res.tpage;
			
			    //다시 전체 리스트 중 currentPage의 리스트을  출력
			    listPage(currentPage);
			}
			
		},
		error : function(xhr){
			alert("상태 :" + xhr.status);
		},
		dataType : 'json'
	})
}

function detailMember(viewEl, memId, idnum){
	
	$.ajax({
		url : '/CommitProject/managerDetail.do' ,
		type : "get",
		data : {"mem_id" : memId},
		success : function(res){
			
			//code = '<div class = "maodal">';
			var code = "";
	
			if(idnum==1){				
					
				code += '<div id="memView" class = "modal">';
				code += 	'<div class = "modal_content">';
				code += 	'아이디 : ' + res.id + '<br>';
				code += 	'이름 : ' + res.name + '<br>';
				code += 	'성별 : ' + res.gender + '<br>';
				code += 	'생년월일 : ' + res.birth + '<br>';
				code += 	'주소 : ' + res.addr + '<br>';
				code += 	'전화번호 : ' + res.tel + '<br>';
				code +=		'</div>';
				code += 	'<br>';
				code += 	'<a href="#" onclick="$(this).parent().hide()">닫기</a>';
				code += '</div>';
				
			}else if(idnum==2){
					
				code += '<div id="memView" class = "modal">';
				code += 	'<div class = "modal_content">';
				code += 	'아이디 : ' + res.id + '<br>';
				code += 	'기업명 : ' + res.comname + '<br>';
				code += 	'사업자번호 : ' + res.num + '<br>';
				code += 	'사업주 : ' + res.ceo + '<br>';
				code += 	'설립연도 : ' + res.bir + '<br>';
				code += 	'기업규모 : ' + res.div + '<br>';
				code += 	'사원수 : ' + res.memNum + '<br>';
				code += 	'사업분야 : ' + res.job + '<br>';
				code += 	'주소 : ' + res.addr1 + '<br>';
				code += 	'상세주소 : ' + res.addr2 + '<br>';
				code += 	'우편주소 : ' + res.addNum + '<br>';
				code += 	'전화번호 : ' + res.comtel + '<br>';
				code += 	'url : ' + res.url + '<br>';
				code +=		'</div>';
				code += 	'<br>';
				code += 	'<a href="#" onclick="$(this).parent().hide()">닫기</a>';
				code += '</div>';
			
				
			}else if(idnum==3){
				
				code += '<div id="memView" class = "modal">';
				code += 	'<div class = "modal_content">';
				code += 	'관리자 상세정보 없음';
				code +=		'</div>';
				code += 	'<br>';
				code += 	'<a href="#" onclick="$(this).parent().hide()">닫기</a>';
				code += '</div>';
					
			}
			//code += "</div>";
			
//			$(".pbody #detailView").html(code);
//			$(".modal",".pbody #detailView").show();
			$("#detailView", viewEl).html(code);
			$(".modal",$("#detailView", viewEl)).show();
		},
		error : function(xhr){
			alert("상태 :" + xhr.status);
		},
		dataType : 'json'
	})
}

function searchMember(cpage){
	
	$.ajax({
		url : '/CommitProject/managerSearch.do',
		type : "get",
		data : {"page":cpage, "option":option, "text":text},
		success : function(res){
			
			  code = '<div class="panel-group" id="accordion">';
			
			  $.each(res.datas,function(i, v){
		
				  code +='<div class="panel panel-default"> ';
				  code +='	<div class="panel-heading"> ';
				  code +='		<h4 class="panel-title"> ';
				  code +='			<a  idx="'+v.id+'"name="list" class="action" data-toggle="collapse" data-parent="#accordion" href="#collapse'+i+'">'+v.id+'</a>';
				  code +='		</h4>';
				  code +='	</div>';
				  code +='	<div id="collapse' + i + '" class="panel-collapse collapse">';
				  code +='	<div class="panel-body pbody"> ';                                              
				  code +='		<p class="p1">';                                                    
				  code +='			회원분류 :<span class="wr listwr"> ' + v.num;
				  code +='		</p>';
				  code +='		<p class="p2 listp2">';
				  code +='			회원아이디 : ' +  v.id + '<br>';
				  code +='			회원비밀번호 : ' +  v.pass + '<br>';
				  code +='		</p>';
				  code +='		<div id="detailView">';
				  code +='		</div>';				  
				  code +='		<p class="p3">';
				  if(v.num!=3){
				  code +='			<input  idx="' + v.id +'" type="button" name="delete"  class="action" value="삭제">';
				  code +='			<input  idx="' + v.id +'" id_num="' + v.num + '"  type="button" name="detail"  class="action" value="상세보기">';
				  }
				  code +='		</p>';
				  code +='	</div>';
				  code +='	</div>';
				  code +='</div>';
								  				
			   })
			   code += '</div>';
			   $('#list').html(code);
			   
			 //  $('#pageList').empty();
			   var pager = "";
			   //이전버튼 만들기 
			   if(res.sp > 1) {
				  pager +='<ul class="pager">';
				  pager +=' <li><a class="prev" href="#">Previous</a></li>';
				  pager +=' </ul>';
				  
//				  $('#pageList').append(pager)
			   }
			
			 //페이지번호 만들기 
			  pager += '<ul class="pagination pager">';
			 for(i=res.sp; i<=res.ep; i++){
				if(cpage == i) {
					 pager += '<li class="active"><a class="paging" href="#">' + i + '</a></li>';
				}else{
					 pager += '<li><a  class="paging" href="#">' + i + '</a></li>';
				} 
			 }
			  pager += '</ul>';
//			  $('#pageList').append(pager) 
			
			 //다음버튼 만들기 
			  if(res.ep < res.tp){
				  pager +='<ul class="pager">';
				  pager +=' <li><a class="next" href="#">Next</a></li>';
				  pager +=' </ul>';
				  
//				  $('#pageList').append(pager)
			  }
			  $('#pageList').html(pager)
			   
		
		},
		error : function(xhr){
			alert("상태 :" + xhr.status);
		},
		dataType : 'json'
	})
			

	
}




