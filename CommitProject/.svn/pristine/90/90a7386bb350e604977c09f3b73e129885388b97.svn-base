/**
 * 
 */

function saveNotice(){
	$.ajax({
		
		url : '/CommitProject/NoticeInsert.do',
		data : data,
		type : 'post',
		success : function(res){
			//modal 닫기
			$('#myModal').modal('hide');
			
			//modal 안의 입력 내용 지우기
			$('.intxt').val("");
			location.href = "/CommitProject/notice/noticemain.jsp"
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

function updateNotice(){
	$.ajax({
		
		url : '/CommitProject/NoticeUpdate.do',
		data : data,
		type : 'post',
		success : function(res){
			//alert(res.sw);
	 		
	 		//modal 안의 입력 내용 지우기
	 		$('#myModal .intxt').text("");
	 		
			//modal 닫기
			$('#myModal').modal('hide');
			location.href = "/CommitProject/notice/noticedetail.jsp?notice_num="+res.notice_num;
		},
		error :  function(xhr){
			alrert("상태 : " + xhr.status);
		},
		dataType : 'json'
		
	})

}

function listPage(cpage){
	$.ajax({
		
		url : '/CommitProject/NoticeList.do',
		data : {"page" : cpage},
		type : 'get',
		success : function(res){
			$('#pageList').empty();
			
			//이전버튼 만들기
			if(res.sp > 1){
				pager='<ul class="pager">';
				pager+='<li><a class="prev" href="#">Previous</a></li>';
				pager+='</ul>';
			
			$('#pageList').append(pager);	
			}
			
			//페이지 번호 만들기
				pager = '<ul class="pagination pager">';
				for(i=res.sp; i<=res.ep; i++){
					if(currentPage == i){
						pager += '<li class="active"><a class="paging" href="#">' + i + '</a></li>';
					}else{
						pager += '<li><a class="paging" href="#">' + i + '</a></li>';
					}
				}
				pager += '</ul>';
				$('#pageList').append(pager);
				
			//다음버튼 만들기
			if(res.ep < res.tp){
				pager='<ul class="pager">';
				pager+='<li><a class="next" href="#">Next</a></li>';
				pager+='</ul>';
				$('#pageList').append(pager);
			}
			
		},
		error : function(xhr){
			alrert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
	
	
	
}







