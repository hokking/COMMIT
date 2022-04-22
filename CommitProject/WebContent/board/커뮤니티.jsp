<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<style type="text/css">

/* border 스타일에 white 절대 삭제하지 말것. */

/* html, body{ 이거 엉케해ㅑ야되노
	width: 100%;
	height: 100%;
} */
body{
	min-width : 1300px;
}

header{
 border: 1px solid white; 
height: 80px;
margin-bottom: 20px;

}


article{
	margin-left: 160px;
	border:3px solid white;
	display: block;
	display: inline-block;
	width: 50%;
	padding-top: 20px;
	
}

footer{
	border:3px solid red;
	margin-top: 200px;
	
}

#logo {
	float: left;
	margin-left: 150px;
	padding-top: 40px;
	width:150px;
}

#logoimg {
	width: 100px;
	height: 30px;
	
}

.nt {
	/* border : 2px solid red; */
	float: left;
	margin-right: 25px;
	margin-left: 25px;
	margin-top: 40px;
	font-size: 15px;
	font-weight: bold;
	
	letter-spacing: 0;
	-webkit-transition: all .28s ease-in-out;
	transition: all .28s ease-in-out;
	
}


.nt:hover,
.nt:focus,
.nt:active {
	letter-spacing: 5px;
}
.nt:after,
.nt:before {
	border: 1px solid rgba(255, 255, 255, 0);
	bottom: 0;
	content: " ";
	display: block;
	margin: 0 auto;
	position: relative;
	-webkit-transition: all .28s ease-in-out;
	transition: all .28s ease-in-out;
	width: 0;
}
.nt:hover:after,
.nt:hover:before {
	border-color: #93D8D9;
	-webkit-transition: width 350ms ease-in-out;
	transition: width 350ms ease-in-out;
	width: 80%;
}
.nt:hover:before {
	bottom: auto;
	top: 0;
}



li {
	list-style-type: none;
}

button {
	border: 0px;
	background: white;
	outline: none;
}

#sbar1{
	display: inline-block;
	float: right;
	margin-right: 140px;
	margin-top: 40px;
	
}

#my{
	padding-top:5px;
	float: left;
}

#sbar2 {
	width: 150px;
	height: 23px;
	border-radius: 5px;
	border: 2px solid #68C8CA;
	display: inline-block;
	float: left;
	
}

#sbar3{

 	background-image: url('./images/돋보기3.png');
    background-repeat: no-repeat;
    width: 30px;
    height:30px;
    border: 0px;
 	cursor:pointer;
 	outline: 0;
 	background-color: white;
 	margin-left: 3px;
 	margin-right: 10px;
 	float: left;
 
}

#searchimg {
	width: 20px;
	height: 20px;
}


#login {
	border: 1px solid white;
	width:94%;
	height: 180px;
	background: #FAFAFA;
	padding-top: 20px;
	border-radius: 15px;
	padding-top: 50px;
	padding-left:10px;
	margin-right: 20px;
		
}

#joinbutton{
	background: #93D8D9;
	color : white;
	font-size: 15px;	
	font-weight: bold;
	width: 300px;
	height: 50px;
	margin-top: 15px;
	border:none;
	border-radius: 15px;
}

#popular{
	border-spacing: 10px;
}

#new{
	border-spacing: 10px;
}

.slide1{
	border-radius: 15px;
}


#sns{
	border: 5px solid white;
	height: 80px;
}

.bsns{
	float: left;
	margin-top: 10px;
}
.pimg{
	border-radius: 15px;
}

#service{
	text-align: center;
	font-size: 7px;
}
</style>
</head>
<body>

<header>
	
	<button onclick="location.href='main.jsp'" type="button" id="logo" href="main.jsp">
	<img  style='cursor:pointer' id="logoimg" alt="로고.png" src="./images/심플로고1.PNG">
	</button>

	<div id ="nu">
	  	<button style='cursor:pointer' onclick="location.href='채용공고.jsp'" type="button" class="nt">채용공고</button>
	  	<button style='cursor:pointer' onclick="location.href='main.jsp'" type="button" class="nt">회사정보</button>
	  	<button style='cursor:pointer' onclick="location.href='main.jsp'" type="button" class="nt">인재풀</button>
		<button style='cursor:pointer' onclick="location.href='main.jsp'" type="button" class="nt">커뮤니티</button>
    </div>
   
   <form>
	<div id="sbar1">
	<input id = "sbar2" type = "text" placeholder = "검색어를 입력하세요">
	<input id = "sbar3" type = "submit" style='cursor:pointer' value="">
	<button id="my" style='cursor:pointer' type="button" onclick="location.href='login.jsp'">
		<font size="2"><b>회원가입/로그인</b></font></button>
	</div>
	</form>
</header>


<article>
<h1><b>커뮤니티</b></h1>
실시간 전체글
</article>

<footer>
	<div id="service">
	<a>서비스소개</a>
	<a>이용약관</a>
	<a>개인정보처리방침</a>
	<a>제휴문의</a>
	<a>고객센터</a>
	커밋 고객센터: 010-2949-1459(평일 9:00~18:00), 점심시간 12:00~13:00, 주말/공휴일 휴무)<br>
	이메일: help@commit.co.kr/Fax: 042-1111-1111(세금계산서)<br>
	(주)커밋HR, 우:0000, 대전광역시 서구 둔산동, 대표:옹기
	사업자 등록:000-00-00000/직업정보제공사업: 서울 관악 제 0000-0호/ 통신판매업: 제0000호<BR>
	Copyright(c) (주)커밋HR, All rights reserved
	</div>
</footer>
</body>
</html>


