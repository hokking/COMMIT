<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@page import="kr.or.ddit.commit.service.ResumeServiceImple"%>
<%@page import="kr.or.ddit.commit.service.IResumeService"%>
<%@page import="kr.or.ddit.commit.vo.ResumeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
    <link
    rel="shortcut icon"
    size="64*64" 
    href="./images/파비콘.png"
     />

<%
   request.setAttribute("page", 1);
%>

<script type="text/javascript">

</script>
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


#bsave{
	margin-top: 30px;
	margin-bottom: 20px;
	padding-left: 700px;
}

#save, #back {
	border-radius: 5px;
	border: 0px;
	background: #93D8D9;
	width: 80px;
	height: 30px;
	font-size: 15px;
}


</style>


<script type="text/javascript">

$(function(){
	   $('#save').on('click',function(){
	      data = $('#insert').serializeArray();
	      console.log(data);
	      $.ajax({
	         url : '/CommitProject/ResumeUpdate.do',
	         data : data,
	         type : 'post',
	         success : function(res) {
	         },
	         dataType : 'json'
	      })
	      alert("등록하였습니다.")
	      location.href="<%=request.getContextPath()%>/mypage/resume.jsp";
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
   <button onclick="location.href='main.jsp'" type="button" id="logo" href="main.jsp">
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
      <button style='cursor:pointer' type="button" onclick="location.href='login.jsp'">
      <font size="2"><b>회원가입/로그인</b></font></button>
   
   </div>


</header>


<section>
	<br>
	<h1>이력서수정</h1>
	
	<%
	IResumeService service = ResumeServiceImple.getInstance();
	int resumNum = Integer.parseInt(request.getParameter("resume_num"));
	
	ResumeVO vo = service.detailresume(resumNum);
	
	HttpSession session1 = request.getSession();
	MemberVO mvo = new MemberVO();
	mvo = (MemberVO)session1.getAttribute("loginMember");
	String memid = mvo.getMem_id();
	
	String name = service.userselect(memid);

	%> 
	<script type="text/javascript">
	$(function(){
		$('#area option[value="<%=vo.getResume_area()%>"]').prop("selected", true);
		$('#career option[value="<%=vo.getResume_career()%>"]').prop("selected", true);
		$('#chk option[value="<%=vo.getResume_chk()%>"]').prop("selected", true);
		$('#job option[value="<%=vo.getResume_job()%>"]').prop("selected", true);
		
	});
	
	</script>
	
	<form id="insert">
	<div id="my">
	 		
  	 	<input type="hidden" name ="resumNum" value="<%=resumNum%>">
  	 	
  	 	<h1><%=name %></h1>
  	 	<input class="inputs" id="title" name = "title" type="text" value="<%=vo.getResume_title() %>"><br><br>
  	 	📧&nbsp;<%=memid %><br>
  	 	📞<input id="tel" name ="tel" type ="text" value="<%=vo.getResume_tel() %>"><br>
  		🏴‍☠️ <select id="area" name='area'>
			  <option>-- 지역 --</option>
			  <option value="대전">대전</option>
			  <option value="서울">서울</option>
			  <option value="경기">경기</option>
			  <option value="제주">제주</option>
			  <option value="광주">광주</option>
			  <option value="세종">세종</option>
			  <option value="경상">경상</option>
			  <option value="충청">충청</option>
			  <option value="인천">인천</option>
			  <option value="부산">부산</option>
			  <option value="대구">대구</option>
			  <option value="울산">울산</option>
			  <option value="강원">강원</option>
			  <option value="전라">전라</option>
			</select>
  	 	<br>
  	 	
  	 	💼<select id="career" name='career'>
			  <option>-- 경력 --</option>
			  <option>신입</option>
			  <option value="1년차">1년차</option>
			  <option value="2년차">2년차</option>
			  <option value="3년차">3년차</option>
			  <option value="4년차">4년차</option>
			  <option value="5년차">5년차</option>
			  <option value="6년차">6년차</option>
			  <option value="7년차">7년차</option>
			  <option value="8년차">8년차</option>
			  <option value="9년차">9년차</option>
			  <option value="10년차">10년차 이상</option>
		  </select><br><br>
		  
		  🔍︎<select id="chk" name='chk'>
			  <option selected>--공개여부 --</option>
			  <option value="1">공개</option>
			  <option value="2">비공개</option>
		  </select><br><br>
		  
  	 	<h2>기술스택/직무</h2>
  	 	<font size = "4"><b>기술스택</b></font><br>
  	 	<input class="inputs" name ="skill" id="skill" type="text" value="<%=vo.getResume_skill() %>"><br><br>
  	 	<font size = "4"><b>직무</b></font><br>
  	 	💻 <select id="job" name="job">
		  	<option selected>--포지션--</option>
  	 		<option value="서버/백엔드 개발자">서버/백엔드 개발자</option>
  	 		<option value="프론트엔드 개발자">프론트엔드 개발자</option>
  	 		<option value="웹 풀스택 개발">웹 풀스택 개발자</option>
  	 		<option value="안드로이드 개발자">안드로이드 개발자</option>
  	 		<option value="IOS 개발자">IOS 개발자</option>
  	 		<option value="크로스플랫폼 앱개발자">크로스플랫폼 앱개발자</option>
  	 		<option value="게임 클라이언트 개발자">게임 클라이언트 개발자</option>
  	 		<option value="DBA">DBA</option>
  	 		</select><br><br>
  	 		
  	 	<h2>학력</h2>
  	 	<font  class="inputs" size = "4"><b>학교명</b></font>
  	 	<font size = "4"><b>학과명</b></font><br><br>
  	 	<input  class="inputs" id="school" name="school" type="text" value="<%=vo.getResume_schoolname() %>">
  	 	<input  class="inputs" id="major" name="major" type="text" value="<%=vo.getResume_major() %>"><br><br>
  	 	<font size = "4"><b>학점</b></font><br>
  	 	<input  class="inputs" id="score" name="score" type="text" value="<%=vo.getResume_score() %>"><br><br>
  	 	
  	 	<h2>자기소개서</h2>
  	 	<textarea id="self" name="self" rows="10" cols="50"><%=vo.getResume_self()%></textarea>
		<br>
		
		<div id="bsave">
		<input id="save" style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/mypage/resume.jsp'"type="button" value="저장">
		
		<input id="back" style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/mypage/resume.jsp'"type="button" value="취소">
		</div>
  	 	
	</div>
	</form>

</section>


</body>
</html>
