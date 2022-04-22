<%@page import="kr.or.ddit.commit.service.FreedomServiceImpl"%>
<%@page import="kr.or.ddit.commit.vo.FreedomVO"%>
<%@page import="kr.or.ddit.commit.service.IFreedomService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<style>
#board_content{
	height : 50px;
}
</style>
<%
	
	int freedomnum = Integer.parseInt(request.getParameter("freedomnum"));
	IFreedomService service = FreedomServiceImpl.getService();
	FreedomVO vo = service.selectOneFreeBoard(freedomnum);
	
%>
<script>
$(function(){
	$('#update').on('click',function(){
		up = $('#freedomUpdate').serializeArray();
		$.ajax({
			url : '/CommitProject/freedomUpdate.do',
			data : up,
			type : 'post',
			success : function(res) {
				//alert(res);
				if(res=="OK"){
					location.href="<%=request.getContextPath()%>/freedom/freedomMain.jsp";
				}
			},
			dataType : 'json'
		})
	})
	$('#tomain').on('click',function(){
		location.href="<%=request.getContextPath()%>/freedom/freedomMain.jsp";
	})
})

</script>

</head>
<body>



<form id="freedomUpdate">
 	<input type="hidden" name="num" value="<%=vo.getFreedom_num()%>">   <!-- 게시글 번호 설정 -->
	<div>
		<br>
		<div>
			<input type="text" placeholder="제목을 입력해주세요" name="title" value="<%=vo.getFreedom_title()%>">
		</div>
		<br>
		<div>
			<textarea placeholder="내용을 입력해주세요" name="content"><%=vo.getFreedom_con() %></textarea>
		</div>
		<br>
		<div>#해시태그 입력</div>
		<div>
			<%
			String tag1, tag2, tag3, tag4;
			tag1 = tag2 = tag3 = tag4  = "";
			
			switch(vo.getTag_num()){
				case 1 : tag1 = "checked"; break;
				case 2 : tag2 = "checked"; break;
				case 3 : tag3 = "checked"; break;
				case 4 : tag4 = "checked"; break;
			}
			%>
			<input type="radio" value="1" <%=tag1 %> name="tag">
			<label>#취준</label>
		
			<input type="radio" value="2" <%=tag2 %> name="tag">
			<label>#이직</label>
		
			<input type="radio" value="3" <%=tag3 %> name="tag">
			<label>#퇴사</label>
		
			<input type="radio" value="4" <%=tag4 %> name="tag"> 
			<label>#잡담</label>
		</div>
		<br>		
		<div>
			<button type="button" id="update">게시글 수정완료</button>
		</div>
		<br>	
		<div>
			<button type="button" id="tomain">목록으로 돌아가기</button>
		</div>
	</div>
</form>

</body>
</html>