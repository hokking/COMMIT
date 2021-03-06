<%@page import="kr.or.ddit.commit.service.ResumeServiceImple"%>
<%@page import="kr.or.ddit.commit.service.IResumeService"%>
<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$('#logout').on('click', function(){
		location.href = "/CommitProject/logout.do"
	})
	
	$('#searchbtn').on('click', function(){
		search = $('#companysearch').val();
		$("#comifr").attr("src", "<%=request.getContextPath()%>/companyinfo/companyDetail.jsp?comname=" + search);
		$("#comimage").hide();
	})
})
</script>

    <link
    rel="shortcut icon"
    size="64*64" 
    href="./images/파비콘.png"
     />

<%
   request.setAttribute("page", 1);
%>


<style type="text/css">
body{
   min-width: 1600px;
}

header{
   margin-top: 30px;
   height: 80px;
   margin-bottom: 20px;
   width:1600px;
   padding-left: 230px;
}
#nu{
	
	width:800px;
	height: 70px;
	float: left;
}

article{
    margin-left: 310px;
   width: 1500px;
   padding-top: 20px;
   padding-left: 100px;
   
  
}

footer{
   margin-top: 500px;
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

    background-image: url('<%= request.getContextPath()%>/images/돋보기3.png');
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

#searchbtn{
 width: 100px;
   height:55px;
	 border-radius: 5px;
	   font-size: 15px;
	   background:  #68C8CA;
	   
}

#companysearch{
  width: 500px;
   height: 50px;
 border: 2px solid #68C8CA;
  border-radius: 5px;
   font-size: 15px;
    margin-left: 120px;
    margin-top: 10px;
    margin-bottom: 50px;
}
#com{
	border: 2px solid #93D8D9;
	border-radius: 15px;
	width: 950px;
	background: #FAFAFA;
	padding-left: 50px;
	padding-top: 20px;
}
#comimage{
	width:250px;
	height: 250px;
	margin-left: 300px;
	
}

</style>
</head>
<body>
 	<%
 	MemberVO mvo = (MemberVO)session.getAttribute("loginMember");
//  	out.print("mvo : " + mvo);
// 	HttpSession session1 = request.getSession();
// 	MemberVO mvo = new MemberVO();
// 	mvo = (MemberVO) session.getAttribute("loginMember");
	String memid = null;
	Integer num = 0;
	IResumeService service = null;
	String name = null;
	String com = null;
	if(mvo != null){
		memid = mvo.getMem_id();
		num = mvo.getMem_num();
		service = ResumeServiceImple.getInstance();
		name = service.userselect(memid);
		com = service.conselect(memid);
		
// 		out.print("<br />memid : " + memid + "<br />");
// 		out.print("num : " + num);
	}
	%>
	
<header>
    <div id ="nu">
    <%if(memid!=null){ %>
   <button onclick="location.href='<%=request.getContextPath()%>/board/main2.jsp'" type="button" id="logo" href="main2.jsp" />
   
   <%
    }else{  
   %>
     <button onclick="location.href='<%=request.getContextPath()%>/board/main.jsp'" type="button" id="logo" href="main.jsp">
     
     <%
    }
     %>
   <img style='cursor:pointer' id="logoimg" alt="로고.png" src="<%=request.getContextPath() %>/images/심플로고1.PNG">
   </button>
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/recruit/recruitMain.jsp'" type="button" class="nt">채용공고</button>
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/companyinfo/companyinfoMain.jsp'" type="button" class="nt">회사정보</button>
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/hr/hrmain.jsp'" type="button" class="nt">인재풀</button>
      <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/freedom/freedomMain.jsp'" type="button" class="nt">커뮤니티</button>
    </div>
   

   <div id="sbar1">
   
   <input id = "sbar2" type = "text" placeholder = "검색어를 입력하세요">
   <input id = "sbar3" type = "submit" style='cursor:pointer' value="">
      <%if(num==1){
	%>
   
      <button id="my" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/mypageMain.jsp'">
      <font size="2"><b><%=name%>님</b></font></button>
  
   <%
   }else if(num==2){
	   
   %>
   
   	<button id="my" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/mypageMain2.jsp'">
      <font size="2"><b><%=com%>님</b></font></button>
      
   <%
   }
   %>
   <%
	if(mvo==null){
		out.print("<font size='2'><b>회원가입/로그인</b></font></button>");
	}else{
		out.print("<button type='button' id='logout' style='cursor:pointer'>로그아웃</button>");
	}
%>
   </div>


</header>



<article>
<div id="com">
 <h1><b>회사검색</b></h1>
    <div>
	<input type="text" name="companysearch" id="companysearch" placeholder = "회사명을 입력하세요">
	<button type="button" id="searchbtn" >검색</button>
</div>

<img id="comimage" alt="My Image" src="<%= request.getContextPath()%>/images/회사.png">
<iframe id="comifr" name="comifr" style="width:1500px; height: 1500px; border: 0;">
</iframe>
</div>

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
