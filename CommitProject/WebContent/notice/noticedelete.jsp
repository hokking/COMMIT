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
<script type="text/javascript">

</script>
</head>
<body>
<%
		
	int no = Integer.parseInt(request.getParameter("notice_num"));
	INoticeService service = NoticeServiceImpl.getInstance();
	int notice = service.deleteNotice(no);

// 	HttpSession msession = request.getSession();
//	String managerId = (String)msession.getAttribute("loginMember");

%>
<script type="text/javascript">
	alert("<%=no%>번 게시글이 삭제되었습니다.");
	location.href = "<%=request.getContextPath()%>/notice/noticemain.jsp";
</script>	

	
</body>
</html>