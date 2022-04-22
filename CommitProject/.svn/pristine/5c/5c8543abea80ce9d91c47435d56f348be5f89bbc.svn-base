/**
 * 
 */

function  repleInsert(repleInsert){
	$.ajax({
		url : '/CommitProject/freedomRepleInsert.do',
		type : 'post',
		data : reple,  
		success : function(res){
			//성공 - res.sw
			//댓글 리스트 출력 
			repleList(repleInsert);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}



function repleList(repleList){ // reple: 댓글등록버튼  또는 제목클릭 
	//freedomNum의 해당하는 댓글을 가져온다 
	$.ajax({
		 url : '/CommitProject/freedomRepleList.do',
		 type : 'post',
		 data : {'freedomNum' : freedomNum},
		 success : function(res){
			  code ="";
			  $(repleList).parents('.panel').find('.body').find('.repl').remove();
			 
			$.each(res, function(i, v){ 
			  code += '<div> ';                                              
			  code += '<p>';                                                    
			  code += v.id +'&nbsp; ';
			  code += '날짜 : ' +v.date + '&nbsp;';              
			  code += '</p>';
			  code += '<p>';
			  code += '<input freedomNum="'  + v.repleNum + '" type="button" name="r_modify"  class="action" value="댓글수정">';
			  code += '<input freedomNum="' + v.repleNum +'" type="button" name="r_delete"  class="action" value="댓글삭제">';
			  code += '</p>';
			  code += '<p>';
			  code += '내용출력 <br>';
			  code += v.content ;
			  code += '</p>';                 
			  code += '</div>';
			 
			})//$.each 
			 
			$(reple).parents('.panel').find('.body').append(code);
		 },
		 error : function(xhr){
			 alert("상태 : " + xhr.status);
		 },
		 dataType : 'json'
	})	 
	
}