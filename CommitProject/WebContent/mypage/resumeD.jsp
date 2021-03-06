<%@page import="kr.or.ddit.commit.service.JobworkServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IJobworkService"%>
<%@page import="kr.or.ddit.commit.vo.JobworkVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@page import="kr.or.ddit.commit.service.ResumeServiceImple"%>
<%@page import="kr.or.ddit.commit.service.IResumeService"%>
<%@page import="kr.or.ddit.commit.vo.ResumeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- MkdRBxlmv8xriF0qxpjx, p3rKRFm792 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <link
    rel="shortcut icon"
    size="64*64" 
    href="./images/파비콘.png"
     />

<%
   	request.setAttribute("page", 1);

	int resumNum = Integer.parseInt(request.getParameter("resume_num"));

	IResumeService service = ResumeServiceImple.getInstance();
	
	
	ResumeVO vo = service.detailresume(resumNum);

	
	HttpSession session1 = request.getSession();
	MemberVO mvo = new MemberVO();
	
	
	mvo = (MemberVO)session1.getAttribute("loginMember");
	String memid = mvo.getMem_id();
	Integer num = mvo.getMem_num();
	String name = service.userselect(memid);
	String com = service.conselect(memid);
%> 

<style type="text/css">
body{
   min-width: 1600px;
    margin: 0;
  padding: 0;
  list-style: none;
}

ul,li {
  margin: 0;
  padding: 0;
  list-style: none;
}

a {
  color: inherit;
  text-decoration: none;
}

header{
   margin-top: 30px;
   height: 80px;
   margin-bottom: 20px;
   width:1600px;
   padding-left: 238px;
}
#nu{
	
	width:800px;
	height: 70px;
	float: left;
}
section{ /* 아니섹션 미친럼 inline이라 옆에 아무도 올 수 없는 개왕따 */
  
   width: 500px;
   padding-left: 400px;
    float: left;
}


footer{
 
   margin-top: 1000px;
   width:1600px;
  margin-left: 130px;
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

   margin-left: 80px;
   margin-top: 40px;
/*    position: fixed;
  position: absolute;
      top: 30px;
       right: 480px; */
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

    background-image: url('<%=request.getContextPath()%>/images/돋보기3.png');
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
   border: 2px solid #93D8D9;
   width:330px;
   height: 185px;
   background: #FAFAFA;
   padding-top: 20px;
   border-radius: 15px;
   padding-top: 40px;
   padding-left:40px;
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



/*커스텀*/

.con {
  max-width: 1200px;
}

/*사이드 메뉴 바*/
.side-menu-button {
  display: none;
}
@media (max-width: 2800px) {
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
.img-box img {
  display: block;
  width: 100%;
}

#my{
	background: #white;
	border-radius: 15px;
	border: 2px solid #93D8D9;
	width: 950px;
	padding-left: 100px;
	
}
.bmain{
	border-radius: 15px;
	background: #93D8D9;
	width: 150px;
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


#cnt{
	
	padding-left: 60px;
	display: inline-block;
	margin-right: 600px;
}

#bresume{
	border-radius: 15px;
	background: #93D8D9;
	width: 150px;
	height: 50px;
	font-size: 15px;
	color: white;
	border: 0px;
	outline: none;
	
}
#title{
	/* border: 1px solid blue; */
	text-align: center;
	font-size: 25px;
	font-weight: bold;
	color: grey;
}

#my2{
	margin-top: 90px;
	margin-left: 90px;
	
}
.b{
	background: #93D8D9;
	border-radius: 5px;
	border:0px;
	width: 100px;
	height: 35px;
}
#db{
	margin-top: 20px;
	padding-left: 610px;
}
#my3{
   padding-top:5px;
   float: left;
}

</style>
<script type="text/javascript">
$(function(){
	$('#delete').on('click', function(){
		
		var result = confirm("채용공고를 삭제하시겠습니까?");
		
		if(result) {
			location.href = "<%=request.getContextPath()%>/ResumeDelete.do?num=<%= resumNum%>";
		} else {
			location.href='<%=request.getContextPath() %>/mypage/resume.jsp';
		}
		
// 		$.ajax({
// 			url : '/CommitProject/ResumeDelete.do',
// 			type : 'post',
<%-- 			data : {"num" : <%= resumNum%>}, --%>
// 			success : function(res){
// 				alert("삭제했습니다.")
<%-- 				location.href = "<%=request.getContextPath()%>/mypage/resume.jsp"; --%>
// 			},
// 			error: function(xhr){
// 				alert("상태: "+ xhr.status);
// 			},
// 			dataType : 'json'
// 		})
		
	})
})
</script>

</head>
<body>
<header>

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


    <div id ="nu">
   <button onclick="location.href='<%=request.getContextPath()%>/board/main2.jsp'" type="button" id="logo" href="main.jsp">
   <img style='cursor:pointer' id="logoimg" alt="로고.png" src="<%=request.getContextPath() %>/images/심플로고1.PNG">
   </button>
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/recruit/recruitMain.jsp'" type="button" class="nt">채용공고</button>
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/companyinfo/companyinfoMain.jsp'" type="button" class="nt">회사정보</button>
        <button style='cursor:pointer' onclick="location.href='main.jsp'" type="button" class="nt">인재풀</button>
      <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/freedom/freedomMain.jsp'" type="button" class="nt">커뮤니티</button>
    </div>
   

   <div id="sbar1">
   
   <input id = "sbar2" type = "text" placeholder = "검색어를 입력하세요">
   <input id = "sbar3" type = "submit" style='cursor:pointer' value="">
        <%if(num==1){
	%>
   
      <button id="my3" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/mypageMain.jsp'">
      <font size="2"><b><%=name %>님</b></font></button>
  
   <%
   }else if(num==2){
	   
   %>
   
   	<button id="my3" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/mypageMain2.jsp'">
      <font size="2"><b><%=com %>님</b></font></button>
      
   <%
   }
   %>
   </div>


</header>


<section>
	<br>
	<h1>이력서관리</h1>
	<div id="my">
	 		
  	 	
  	 	<h1><%=name %></h1>
  	 	<h2><%=vo.getResume_title() %></h2><br>
  	 	📧&nbsp;<%=memid %><br>
  	 	📞&nbsp;<%=vo.getResume_tel() %><br>
  		🏴‍☠️ &nbsp;<%=vo.getResume_area() %><br>
  	 	💼&nbsp;<%=vo.getResume_career() %><br>
		  
		  🔍︎&nbsp;
		  <%
		  	if(vo.getResume_chk()==1){
		  		%>
		  		인재풀 공개<br>
		  		<%
		  	}else if(vo.getResume_chk()==2){
		  %>
		인재풀 비공개<br>
		  <%
		  	}
		  %>
		  
		<hr width="90%" align="left">
		
  	 	<h2>기술스택/직무</h2>
  	 	<font size = "4"><b>기술스택</b></font><br>
  	 	<%=vo.getResume_skill() %><br><br>
  	 		<font size = "4"><b>직무</b></font><br>
  	 	 💻&nbsp;<%=vo.getResume_job() %><br>
  	 	<hr width="90%" align="left">
  	 	
  	 	<h2>학력</h2>
  	 	<font  class="inputs" size = "4"><b>학교명</b></font>&nbsp;&nbsp;&nbsp;&nbsp;
  	 	<font size = "4"><b>학과명</b></font><br>
  	 	<%=vo.getResume_schoolname() %>
  	 	<%=vo.getResume_major() %><br><br>
  	 	<font size = "4"><b>학점</b></font><br>
  	 	<%=vo.getResume_score() %><br><br>
  	 	
  	 	<hr width="90%" align="left">
  	 	
  	 	<h2>자기소개서</h2>
  	 	<%=vo.getResume_self() %>
		<br>
		<br>
		
		<hr width="90%" align="left">
		<div id="db">
		<input class="b" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath() %>/mypage/resumeUpdate.jsp?resume_num=<%=resumNum%>'" value="수정하기">
		<input class="b" id="delete" style='cursor:pointer' type="button" value="삭제하기">
		<input class="b" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath() %>/mypage/resume.jsp'" value="목록으로">
		</div>
	
	</div>
	

</section>

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
