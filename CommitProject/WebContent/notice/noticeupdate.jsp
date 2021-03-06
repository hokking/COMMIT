<%@page import="kr.or.ddit.commit.vo.NoticeVO"%>
<%@page import="kr.or.ddit.commit.service.NoticeServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.INoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/notice.js">

</script>
</head>
<body>
<%
		
	int no = Integer.parseInt(request.getParameter("notice_num"));
	INoticeService service = NoticeServiceImpl.getInstance();
	NoticeVO nvo = service.selectNotice(no);

// 	HttpSession msession = request.getSession();
//	String managerId = (String)msession.getAttribute("loginMember");

%>	
<!-- 글쓰기 -->
	<div id= "myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	  
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">게시글 수정</h4>
	      </div>
	      <div class="modal-body">
	        <form>
	        	<select name = "head" title="말머리 선택">
	        		<option value="말머리">말머리</option>
	        		<option value="안내">안내</option>
	        		<option value="오픈">오픈</option>
	        		<option value="기타">기타</option>
	        	</select>
		        <label>제목</label><input class="intxt" type="text" name="subject"><br>
		        <label>내용</label><br>
		        <textarea class="intxt" name="content" rows="10" cols="50"></textarea>
		        <br>
	        	<input type="button" value="등록" id="register">
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	
	  </div>
	</div>


</body>
</html>