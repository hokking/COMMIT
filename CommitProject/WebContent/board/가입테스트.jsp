<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"></script>
<style type="text/css">

/* border 스타일에 white 절대 삭제하지 말것. */
/* html, body{ 이거 엉케해ㅑ야되노
	width: 100%;
	height: 100%;
} */

body{
	min-width : 1300px;
	background: #FAFAFA
}

section{
margin-left: 490px;
	display: inline-block;
	width: 50%;
	height: 1300px;
	background: white;

	
}

#logo {
	border: 0px;
	background: white;
	outline: none;
	margin-left: 350px;

}

#welcome{
	
	padding-left: 30px;
}

input{
	border-radius: 5px;
	border: 2px solid #93D8D9;
	width: 100px;
	height: 30px;
	font-size: 15px;
}
#ifr{
width: 800px; 
height: 1000px; 
border: 0; 
margin-left: 50px;

}


</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#worker').on('click', function(){
			$("#ifr").attr("src", "<%=request.getContextPath()%>/join/workerJoin.jsp");
		})
		
		$('#company').on('click', function(){
			$("#ifr").attr("src", "<%=request.getContextPath()%>/join/companyJoin.jsp");
		})
	})

	
</script>

</head>
<body>



<section>
<button id="logo" style='cursor:pointer' onclick="location.href='main.jsp'" type="button" id="logo" href="main.jsp">
	<img  id="logoimg" alt="로고.png" src="../board/images/로그인로고.png" >
</button><br>

<div id="welcome">

<font size="6"><b>회원가입</b></font><br>
<font size="3">가입유형을 선택해주세요</font><br><br>

<input type="button" name="worker" id="worker" value="구직회원">
<input type="button" name="company" id="company" value="기업회원">
</div>
<br>
<iframe id="ifr" name="ifr" >

</iframe>
</section>
	

</body>
</html>


