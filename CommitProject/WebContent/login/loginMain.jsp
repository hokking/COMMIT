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

body{
	min-width : 1300px;
	background: #FAFAFA
}

section{
	margin-left: 490px;
	display: inline-block;
	width: 50%;
	height: 1000px;
	background: white;

	
}

#logo {
	border: 0px;
	background: white;
	outline: none;
	margin-left: 380px;

}

#welcome{
	margin-top: 50px;
	padding-left: 30px;
}
input{
	border-radius: 5px;
	border: 2px solid #93D8D9;
	
}
.input1{
height: 35px;
margin-top: 5px;
width:93%;
}


#input2{
margin-top: 10px;
height: 50px;
width:94%;
}

hr{
	display: inline-block;
	
}
#snslogin{
	padding-top:30px;
	padding-left: 15px;
}
.snsimg{
	width: 40px;
	height: 40px;
	
}
.bsns{
	border: 0px;
	background: white;
	outline: none;
	
}
#dsns{
	margin-top:30px;
	padding-left: 360px;
}

#lhr{
	margin-left: 25px;
	margin-right: 10px;
}
#rhr{
	margin-left:20px;
}
#join{
	margin-top: 20px;
	padding-left: 200px;
	
}

a{
	font-size:13px;
	text-decoration:  underline;
}

a:link{
	color :  black;
	font-weight: bold;
	font-size: 13px;
	text-decoration:  underline; /* line-through, underline, verline, overline */
}

a:visited{
 color : black;

}
a:hover{
	text-decoration : none;
	 color : #93D8D9;
	 background: white;
	 text-decoration:  underline;
}
a:active{
	color : black;
	font-weight: bold;
	text-decoration:  none;
}


</style>

</head>
<body>



<section>
<button id="logo" style='cursor:pointer' onclick="location.href='<%=request.getContextPath()%>/board/main.jsp'" type="button" id="logo" href="main.jsp">
	<img id="logoimg" alt="??????.png" src="<%=request.getContextPath() %>/board/images/???????????????.png" >
</button><br>

<%
	String result = (String)request.getAttribute("fail");
%>

<div id="welcome">

<font size="5"><b>?????????</b></font><br>
<font size="3">??????????????? ??????????????????</font><br><br><br>
<font size="3"><b>?????????</b></font><br>
<%
	String id = request.getParameter("mem_id");
%>
<form action="<%=request.getContextPath() %>/Login.do" method="post">
<input class="input1" type="text" name="mem_id" value="<%=id %>" placeholder="???????????? ??????????????????"><br>
<font size="3"><b>????????????</b></font><br>
<input class="input1" type="password" name="mem_pass" placeholder="??????????????? ??????????????????"><br>
<%
	if(result != null){
%>
	<span id="spanid"><%=result %></span>
<%	
	}
%>
<input id="input2" type="submit" value="?????? ????????????" style='cursor:pointer'>
</form>


</div>
<br>

<div id="snslogin">
<hr id="lhr" width="35%" align="left">SNS??? 1????????? ?????????<hr id="rhr" width="35%" align="right"><br>
	
	<div id="dsns">
	<button class="bsns" onclick="location.href='main.jsp'" type="button" id="naver">
	 <img class="snsimg" src="<%=request.getContextPath() %>/board/images/?????????.png" alt="" style='cursor:pointer' >
	</button>
	<button  class="bsns" onclick="location.href='main.jsp'" type="button" id="kakao">
	<img class="snsimg" src="<%=request.getContextPath() %>/board/images/?????????.png" alt="" style='cursor:pointer' >
	</button>
	<button  class="bsns" onclick="location.href='main.jsp'" type="button" id="google" style='cursor:pointer' >
	<img class="snsimg" src="<%=request.getContextPath() %>/board/images/??????.png" alt="">
	</button>
	</div>
	
	<!-- <div id="join"><font size="2">?????? ??????????????????? <a href="">??????????????? ????????????</a></font></div> -->
</div>
</section>
	

</body>
</html>


