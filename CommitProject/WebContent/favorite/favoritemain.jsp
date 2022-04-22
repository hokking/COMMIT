<%@page import="kr.or.ddit.commit.service.ResumeServiceImple"%>
<%@page import="kr.or.ddit.commit.service.IResumeService"%>
<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@page import="javax.websocket.Session"%>
<%@page import="kr.or.ddit.commit.vo.RecruitVO"%>
<%@page import="kr.or.ddit.commit.service.RecruitServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IRecruitService"%>
<%@page import="kr.or.ddit.commit.vo.FavoriteVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commit.service.FavoriteServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IFavoriteService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심공고 조회 화면</title>

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

article{
	margin-top: 60px;
	width: 1200px;
	margin-left: 400px;
}

footer{
 border: 1px solid red;
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
background: #FAFAFA;
	border-radius: 15px;
	border: 2px solid #93D8D9;
	width: 950px;
	
	height: 300px;
	padding-top: 50px;
} 
.bmain{
	border-radius: 15px;
	background: #93D8D9;
	width: 140px;
	height: 100px;
	font-size: 19px;
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

#my3{
   padding-top:5px;
   float: left;
}
#rs{
	margin-left: 100px;
}
#con{
	
	font-size: 25px;
	font-weight: bold;
	color: grey;
	text-align: center;
	
}
</style>


<%
HttpSession session1 = request.getSession();
MemberVO mem = (MemberVO) session1.getAttribute("loginMember");

String mem_id = mem.getMem_id();
Integer num = mem.getMem_num();


IFavoriteService fservice = FavoriteServiceImpl.getInstance();
IResumeService service2 = ResumeServiceImple.getInstance();
List<FavoriteVO> flist = fservice.getAllfav(mem_id);

String com = service2.conselect(mem_id);
String name = service2.userselect(mem_id);
int rs= fservice.favoriteTF2(mem_id);
%>

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
          <a href="#">MyHome</a>
        </li>
        <li>
          <a href="#">이력서</a>
          <ul>
            <li><a href="<%=request.getContextPath() %>/mypage/resume.jsp">이력서 관리</a></li>
            <li><a href="<%=request.getContextPath() %>/mypage/resumeWrite.jsp">이력서 등록</a></li>
          </ul>
        </li>
        <li>
          <a href="#">지원현황</a>
          <ul>
            <li><a href="#">2차메뉴아이템</a></li>
            <li><a href="#">2차메뉴아이템</a></li>
            <li><a href="#">2차메뉴아이템</a></li>
            <li><a href="#">2차메뉴아이템</a></li>
          </ul>
        </li>
        <li>
          <a href="#">관심공고/기업</a>
          <ul>
            <li><a href="#">관심공고</a></li>
            <li><a href="#">관심기업</a></li>
          </ul>
        </li>
        <li>
          <a href="#">개인정보관리</a>
          <ul>
            <li><a href="#">2차메뉴아이템</a></li>
            <li><a href="#">2차메뉴아이템</a></li>
            <li><a href="#">2차메뉴아이템</a></li>
            <li><a href="#">2차메뉴아이템</a></li>
          </ul>
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

<article>

	<h2>관심공고</h2>
	<div id="my">
	<div id="rs">총 <%=rs %>건</div>
	<hr width="90%">
	
	
<%
if(flist != null){
	for(FavoriteVO vo : flist){
%>
		<div id="con">
		<a href="<%=request.getContextPath() %>/recruitDetail.do?recruit_num=<%=vo.getRecruit_num() %>"><%=fservice.recselect(vo.getRecruit_num()) %></a><br>
		</div>
<%		
	}
}
%>

	</div>
</article>

</body>
</html>