<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

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
#input1{
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


<script type="text/javascript">
//function check(){
$(function(){
	
 $('form').on('submit', function() {

	idvalue = $('#input1').val();
	$.ajax({
		url : "<%=request.getContextPath() %>/checkId.do",
		data : {"id" : idvalue},
		type : 'post',
		success : function(res){
			if(res.sw == "사용가능한 id입니다."){
				alert("회원가입이 필요합니다.")
				location.href="<%=request.getContextPath()%>/board/가입테스트.jsp";
			} else {
				location.href="<%=request.getContextPath()%>/login/loginMain.jsp?mem_id=" + idvalue;
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
	
	
	
})
})

</script>
</head>
<body>


<section>
<button id="logo" style='cursor:pointer' onclick="location.href='main.jsp'" type="button" id="logo" href="main.jsp">
	<img  id="logoimg" alt="로고.png" src="<%=request.getContextPath() %>/board/images/로그인로고.png" >
</button><br>

<div id="welcome">
<font size="4">반가워요</font><br>
<font size="5"><b>커밋</b>으로 <b>ComeIT!</b></font><br><br>
<font size="3"><b>이메일</b></font><br>
<form onsubmit="return false;" method="post">
	<input id="input1" type="text" placeholder="이메일을 입력해주세요"><br>
	<!-- 아이디가 존재하면 로그인창으로 존재하지않으면 회원가입 창으로 연결되게 버튼 설정해야함 -->
	<input id="input2" type="submit" value="커밋 시작하기" style='cursor:pointer'>
</form>
</div>
<br>

<div id="snslogin">
<hr id="lhr" width="35%" align="left">SNS로 1초만에 로그인<hr id="rhr" width="35%" align="right"><br>
	
	<div id="dsns">
	<button class="bsns" onclick="location.href='main.jsp'" type="button" id="naver_id_login">
	 <img class="snsimg" src="./images/네이버.png" alt="" style='cursor:pointer' >
	</button>
	<script type="text/javascript">
	  	var naver_id_login = new naver_id_login("MkdRBxlmv8xriF0qxpjx", "http://localhost/CommitProject/board/naverCallback.jsp");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("green", 1, 40);
	  	naver_id_login.setDomain("http://localhost/CommitProject/login/login.jsp");
	  	naver_id_login.setState(state);
	  	naver_id_login.init_naver_id_login();
  	</script>
	<button  class="bsns" type="button" id="kakao">
	<img class="snsimg" src="./images/카카오.png" alt="" style='cursor:pointer'>
	</button>
	<script>
	$(function(){
		$('#kakao').on('click', function(){
	        Kakao.init('dcd8f89b69b4974502641f42cedac963');
	        Kakao.Auth.authorize({
	        	redirectUri: 'http://127.0.0.1/CommitProject/board/kakaoCallback.jsp'
       		 })
		})
	})
</script>
	<button  class="bsns" onclick="location.href='main.jsp'" type="button" id="google" style="cursor:pointer">
	<img class="snsimg" src="./images/크롬.png" alt="">
	</button>
	</div>
	
	<!-- <div id="join"><font size="2">기업 고객이신가요? <a href="">기업서비스 바로가기</a></font></div> -->
</div>
</section>
	

</body>
</html>


