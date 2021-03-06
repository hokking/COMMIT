<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

<style type="text/css">

body,ul,li {
  margin: 0;
  padding: 0;
  list-style: none;
}
a {
  color: inherit;
  text-decoration: none;
}

/*라이브러리*/
html,body {
  overflow-x : hidden;
}
.con {
  margin: 0 auto;
}
.row::after {
  content:"";
  display: block;
  clear: both;
}
.cell {
  float: left;
}
.img-box img {
  display: block;
  width: 100%;
}

/*커스텀*/

.con {
  max-width: 1200px;
}

/*사이드 메뉴 바*/
.side-menu-button {
  display: none;
}
@media (max-width: 1400px) {
  .side-menu-button {
    display: block;
  }
}
/*사이드 메뉴 버튼*/
.side-menu-button {
  position: absolute;
  top: 20px;
  left: 20px;
  cursor: pointer;
  
}
.side-menu-button .img-box {
  margin-top: 30px;
  width: 20px;
}
/*사이드 메뉴 박스*/
.side-menu-button:hover .side-menu-bar {
  left: 0;
}
.side-menu-bar {
  position: fixed;
  top: 0;
  left: -300px;
  height: 100%;
  width: 300px;
  background-color: white;
  box-sizing: border-box;
  z-index:3;
  transition: left 1s;
}
.side-menu-bar .side-menu-box ul > li {
  position: relative;
  background-color: #dfdfdf;
}
.side-menu-bar .side-menu-box > ul {
  margin-top: 40px;
}
.side-menu-bar .side-menu-box ul > li > a {
  display: block;
  padding: 20px;
  font-weight: bold;
  white-space: nowrap;
}
.side-menu-bar .side-menu-box > ul > li > a {
  padding-left: 40px;
}
.side-menu-bar .side-menu-box ul > li:hover > a {
  color: white;
  background-color:  #93D8D9;
}
.side-menu-bar .side-menu-box ul ul {
  display: none;
  position: absolute;
  top: 0;
  left: 100%;
}
.side-menu-bar .side-menu-box ul > li:hover > ul {
  display: block;
}




#logoimg {
	width: 100px;
	height: 30px;
	
}

#blogo{
	border: 0px;
	background: white;
	outline: none;
}
#logo{
	
	padding-top: 45px;
	padding-left: 90px;
}
#my{
	padding-left: 90px;
	margin-top: 50px;
	background: #FAFAFA;
	border-radius: 15px;
	border: 2px solid #93D8D9;
	
}
.bmain{
	border-radius: 15px;
	background: #93D8D9;
	width: 200px;
	height: 100px;
	font-size: 20px;
	color: white;
	border: 0px;
	outline: none;
	margin-top: 20px;
}
.box {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
    border: 2px solid #93D8D9;
    display: inline-block;
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
#mainb{
	
	width: 80%;
	float: right;
}

#nu{
	
	 width: 70%;
	 float: right;
	 padding-right: 190px;
	
}

.nt {
	border: 0px;
	background: white;
	outline: none;
	/* border : 2px solid red; */
	float: left;
	margin-right: 25px;
	margin-left: 25px;
	
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



</style>
<script type="text/javascript">
<%
HttpSession session1 = request.getSession();
MemberVO mvo = (MemberVO)session1.getAttribute("loginMember");
%>
$(function(){

	$.ajax({
		url : "<%=request.getContextPath()%>/memberSelect.do",
		data : { "mvoid" : "<%=mvo.getMem_id()%>",
				 "mvonum" : "<%=mvo.getMem_num() %>"		
				},
		type : 'post',
		success : function(res){
				str = "";
				str += "<font  class='inputs' size = '4'><b>아이디</b></font><br>"
				str += "<font  class='inputs' size = '4'><b><%=mvo.getMem_id() %></b></font><br><br>"
				str += "<font  class='inputs' size = '4'><b>비밀번호</b></font><br>"
				str += "<input  class='inputs' id='mem_pass1' type='password' placeholder='password'><br><br>"
				str += "<font  class='inputs' size = '4'><b>비밀번호 확인</b></font><br>"
				str += "<input  class='inputs' id='mem_pass2' type='password' placeholder='password'><br><br>"
			if(<%=mvo.getMem_num()%> == 1){
				str += "<font  class='inputs' size = '4'><b>이름</b></font><br>"
				str += "<input  class='inputs' id='name' type='text' value='"+res.name+"'><br><br>"
				str += "<font  class='inputs' size = '4'><b>성별</b></font><br>"
				str += "<input class='inputs' type='radio' name='gender' value='남자'>남자"
				str += "<input class='inputs' type='radio' name='gender' value='여자'>여자<br><br>"
				str += "<font  class='inputs' size = '4'><b>생년월일</b></font><br>"
				str += "<font  class='inputs' size = '4'><b>"+ res.bir +"</b></font><br><br>"
				str += "<font  class='inputs' size = '4'><b>전화번호</b></font><br>"
				str += "<input class='inputs' type='text' name='mem_tel' value='"+ res.tel +"'><br><br>"
			} else {
				str += "<font  class='inputs' size = '4'><b>회사명</b></font><br>"
				str += "<input  class='inputs' id='name' type='text' value='"+res.name+"'><br><br>"
				str += "<font  class='inputs' size = '4'><b>사업자 등록번호</b></font><br>"
				str += "<input  class='inputs' id='num' type='text' value='"+res.num+"'><br><br>"
				str += "<font  class='inputs' size = '4'><b>홈페이지</b></font><br>"
				str += "<input class='inputs' type='text' id='com_url' value='"+ res.url +"'><br><br>"
				str += "<font  class='inputs' size = '4'><b>전화번호</b></font><br>"
				str += "<input class='inputs' type='text' id='com_tel' value='"+ res.tel +"'><br><br>"
				str += "<font  class='inputs' size = '4'><b>대표자</b></font><br>"
				str += "<input class='inputs' type='text' id='com_ceo' value='"+ res.ceo +"'><br><br>"
				
			}
				str += "<button type='button' id=modify>수정</button>"
				$('#info').append(str);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
	})
	
	$(document).on('click', '#modify', function(){
		pass1 = $('#mem_pass1').val();
		pass2 = $('#mem_pass2').val();
		if(pass1.length < 1){
			alert("비밀번호를 입력하세요");
			return false;
		}
		if(pass1 != pass2){
			alert("비밀번호를 확인하세요");
			return false;			
		}
		if(<%=mvo.getMem_num() %> == 1){
			$.ajax({
				url : "<%=request.getContextPath() %>/workerUpdate.do",
				data : { "id" : "<%=mvo.getMem_id() %>",
					"pass" : $('#mem_pass1').val(),
					"name" : $('#name').val(),
					"gender" : $('input [name = gender]').attr("checked"),
					"tel" : $('input [name = mem_tel]').val()
					},
				type : 'post',
				success : function(res){
					
				},
				dataType : 'json'
			})
		} else {
			$.ajax({
				url : "<%=request.getContextPath() %>/companyUpdate.do",
				data : { "id" : "<%=mvo.getMem_id() %>",
					"pass" : $('#mem_pass1').val(),
					"name" : $('#name').val(),
					"num" : $('#num').val(),
					"url" : $('#com_url').val(),
					"tel" : $('#com_tel').val(),
					"ceo" : $('#com_ceo').val()
					},
				type : 'post',
				success : function(res){
					
				},
				dataType : 'json'
			})
		}
		location.href = "<%=request.getContextPath()%>/mypage/mypageMain.jsp"
	})
})
</script>

</head>
<body>

<div class="side-menu-button">
  <div class="img-box">
    <img src="<%=request.getContextPath() %>/images/사이드바.png" alt="">
  </div>
  <div class="side-menu-bar">
    <nav class="side-menu-box">
      <ul>
        <li>
          <a href="<%=request.getContextPath() %>/mypage/mypageMain.jsp">MyHome</a>
        </li>
        <li>
          <a href="<%=request.getContextPath() %>/mypage/resume.jsp">이력서</a>
          <ul>
            <li><a href="<%=request.getContextPath() %>/mypage/resume.jsp">이력서 관리</a></li>
            <li><a href="<%=request.getContextPath() %>/mypage/resumeWrite.jsp">이력서 등록</a></li>
          </ul>
        </li>
        <li>
          <a href="<%=request.getContextPath() %>/mypage/statusApply.jsp">지원현황</a>
         
        </li>
        <li>
          <a href="<%=request.getContextPath() %>/favorite/favoritemain.jsp">관심공고</a>
         
        </li>
        <li>
          <a href="<%=request.getContextPath() %>/mypage/info.jsp">개인정보관리</a>
       
        </li>
    </nav>
  </div>
</div>



<div class="prod-list-bar con">

  <div class="prod-list-box">
  
    <div id="logo">
  <button onclick="location.href='<%=request.getContextPath() %>/board/main2.jsp'" type="button" id="blogo" href="main.jsp">
	<img  style='cursor:pointer' id="logoimg" alt="로고.png" src="<%=request.getContextPath() %>/images/심플로고1.PNG">
	</button>
	
	<div id ="nu">
	  	<button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/recruit/recruitMain.jsp'" type="button" class="nt">채용공고</button>
	  	<button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/companyinfo/companyinfoMain.jsp'" type="button" class="nt">회사정보</button>
	  	<button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/hr/hrmain.jsp'" type="button" class="nt">인재풀</button>
		<button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/freedom/freedomMain.jsp'" type="button" class="nt">커뮤니티</button>
    </div>
	</div>

	
	<div id="my">
  	<h1>개인정보관리</h1>
	  	<div id=info>
	  	
	  	</div>
	</div>
	
	</div>
  
  
</div>
</body>
</html>