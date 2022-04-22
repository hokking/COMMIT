<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String id = (String)request.getAttribute("id");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		alert("<%=id %> 님 환영합니다.");
		location.href="<%=request.getContextPath()%>/board/main.jsp";
	})

</script>
</head>
<body>
	
</body>
</html>