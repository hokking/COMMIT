<%@page import="kr.or.ddit.commit.service.ResumeServiceImple"%>
<%@page import="kr.or.ddit.commit.service.IResumeService"%>
<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@page import="kr.or.ddit.commit.vo.WorkerVO"%>
<%@page import="kr.or.ddit.commit.service.ApplyResumeServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IApplyResumeService"%>
<%@page import="kr.or.ddit.commit.vo.HrVO"%>
<%@page import="kr.or.ddit.commit.service.HrServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IHrService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

#con{
	border: 2px solid #93D8D9;
	width: 900px;
	border-radius: 15px;
	margin-top: 30px;
	padding-left: 100px;
}
</style>
</head>
<body>

<%
	int num = Integer.parseInt(request.getParameter("resume_num"));
	System.out.println(num);

	IHrService service = HrServiceImpl.getInstance();
	HrVO vo = service.detailhr(num);
	
	IApplyResumeService service1 = ApplyResumeServiceImpl.getInstance();
	WorkerVO wvo = service1.selectID(vo.getMem_id());	
	
	HttpSession session1 = request.getSession();
	
	MemberVO mvo = new MemberVO();
	mvo = (MemberVO) session1.getAttribute("loginMember");
	String memid = mvo.getMem_id();
	
	int num2 = mvo.getMem_num();
	
	IResumeService service2 = ResumeServiceImple.getInstance();
	String name = service2.userselect(memid);
	String com = service2.conselect(memid);
	
	
%>

<header>
    <div id ="nu">
    <%if(memid!=null){ %>
   <button onclick="location.href='<%=request.getContextPath()%>/board/main2.jsp'" type="button" id="logo" href="main2.jsp">
   
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
        <button style='cursor:pointer' onclick="location.href='main.jsp'" type="button" class="nt">인재풀</button>
      <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/freedom/freedomMain.jsp'" type="button" class="nt">커뮤니티</button>
    </div>
   

   <div id="sbar1">
   
   <input id = "sbar2" type = "text" placeholder = "검색어를 입력하세요">
   <input id = "sbar3" type = "submit" style='cursor:pointer' value="">
      <%if(num2==1){
	%>
   
      <button id="my" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/mypageMain.jsp'">
      <font size="2"><b><%=name %>님</b></font></button>
  
   <%
   }else if(num2==2){
	   
   %>
   
   	<button id="my" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/mypageMain2.jsp'">
      <font size="2"><b><%=com %>님</b></font></button>
      
   <%
   }
   %>
   
   </div>


</header>

<article>
	
	<h1><b>인재풀</b></h1>
	<div id="con">

  	 	<h1><%=wvo.getMem_name() %></h1>	 		
  	 	<h2><%=vo.getResume_title() %></h2><br>
  	 	📧&nbsp;<%=vo.getMem_id() %><br>
  	 	📞&nbsp;<%=vo.getResume_tel() %><br>
  		🏴‍☠️ &nbsp;<%=vo.getResume_area() %><br>
  	 	💼&nbsp;<%=vo.getResume_career() %><br>
		  

		<hr width="90%" align="left">
		
  	 	<h2>기술스택/직무</h2>
  	 	<font size = "4"><b>기술스택</b></font><br>
  	 	<%=vo.getResume_skill() %><br><br>
  	 	<font  id = "job" size = "4"><b>직무</b></font><br>
  	 	<%=vo.getResume_job() %><br><br>
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
		</div>
	
</article>


</body>
</html>