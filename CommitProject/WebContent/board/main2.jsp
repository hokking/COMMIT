<%@page import="kr.or.ddit.commit.vo.RecruitVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commit.service.RecruitServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IRecruitService"%>
<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@page import="kr.or.ddit.commit.service.ResumeServiceImple"%>
<%@page import="kr.or.ddit.commit.service.IResumeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- MkdRBxlmv8xriF0qxpjx, p3rKRFm792 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
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
var index = 0;   //이미지에 접근하는 인덱스
window.onload = function(){
    slideShow();
}

function slideShow() {
var i;
var x = document.getElementsByClassName("slide1");  //slide1에 대한 dom 참조
for (i = 0; i < x.length; i++) {
   x[i].style.display = "none";   //처음에 전부 display를 none으로 한다.
}
index++;
if (index > x.length) {
    index = 1;  //인덱스가 초과되면 1로 변경
}   
x[index-1].style.display = "block";  //해당 인덱스는 block으로
setTimeout(slideShow, 4000);   //함수를 4초마다 호출

}

</script>
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
section{ /* 아니섹션 미친럼 inline이라 옆에 아무도 올 수 없는 개왕따 */
  
   width: 500px;
   padding-left: 400px;
   display: inline-block;
    float: left;
}

aside{

   width:  500px;
   float: left;
   height: 230px;
   margin-left: 160px;
   margin-bottom: 50px;
    float: left;
}

article{
   margin-left: 310px;
  
  margin-top: 270px;
   width: 1400px;
   padding-top: 20px;
   padding-left: 100px;
  
}

footer{
 
   margin-top: 200px;
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


.joinbutton{
	background: #93D8D9;
	color : white;
	font-size: 15px;	
	font-weight: bold;
	width: 150px;
	height: 50px;
	margin-top: 15px;
	border:none;
	border-radius: 15px;
}
.ac{
	color: black;
	text-decoration: none;
}
.a:hover {
	text-decoration: none;
}

</style>

<script type="text/javascript">
$(function(){
	
	$('#logout').on('click', function(){
		location.href = "/CommitProject/logout.do"
	})
	
	$('#sbar3').on('click', function() {
		data = $('#sbar2').val();
		console.log(data);
		$.ajax({
			url : '<%=request.getContextPath()%>/recruitSearch.do',
			type : 'post',
			data : {"data" : data},
			success : function(res) {
				str = "<h3>검색 결과</h3>";
				str += "<table>";
				$.each(res, function(i, v) {
					if(i % 4 == 0 && i < res.size) {
						str += "<tr>";
					}
					str += "<td>";
					str += "<a href='<%= request.getContextPath()%>/recruitDetail.do?recruit_num=" + v.recruitNum + "'>";
					str += "<img class='pimg' src='<%=request.getContextPath()%>/images/회사"+(i%4+1)+".PNG' alt=''><br>";
					str += "<h4>" + v.recruitName + "</h4>";
					str += v.recruitSpec + "<br>";
					str += v.recruitSkill + "<br>";
					str += v.regName;
					str += "</a></td>";
					if(i > 0 && i % 4 == 3) {
						str += "</tr>";
					}
					
				})
				str += "</table>";
				$('#rview').html(str);
				
			},
			dataType : 'json'
		})
	})
})
</script>

</head>
<body>
 	<%
	HttpSession session1 = request.getSession();
	MemberVO mvo = new MemberVO();
	mvo = (MemberVO) session1.getAttribute("loginMember");
	String memid = mvo.getMem_id();
	Integer num = mvo.getMem_num();
	IResumeService service = ResumeServiceImple.getInstance();
	String name = service.userselect(memid);
	String com = service.conselect(memid);
	%>
	
	
<header>
    <div id ="nu">
   <button onclick="location.href='<%=request.getContextPath()%>/board/main2.jsp'" type="button" id="logo" href="main.jsp">
   <img style='cursor:pointer' id="logoimg" alt="로고.png" src="./images/심플로고1.PNG">
   </button>
   
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/recruit/recruitMain.jsp'" type="button" class="nt">채용공고</button>
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/companyinfo/companyinfoMain.jsp'" type="button" class="nt">회사정보</button>
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/hr/hrmain.jsp'"type="button" class="nt">인재풀</button>
      <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/freedom/freedomMain.jsp'" type="button" class="nt">커뮤니티</button>
    </div>
   


   <div id="sbar1">
   
   <input id = "sbar2" type = "text" placeholder = "검색어를 입력하세요">
   <input id = "sbar3" type = "submit" style='cursor:pointer' value="">
   
   <%if(num==1){
	%>
   
      <button id="my" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/mypageMain.jsp'">
      <font size="2"><b><%=name %>님</b></font></button>
  
   <%
   }else if(num==2){
	   
   %>
   
   	<button id="my" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/mypageMain2.jsp'">
      <font size="2"><b><%=com %>님</b></font></button>
      
   <%
   }
   %>
   </div>


</header>

<section>
      <!-- 로고사진 이미지 크기는 미리 650*230으로 저장한걸 가져와야한다. 여기서 크기 조정 x -->
        <img class="slide1" src="./images/슬라이드1.PNG" alt="">
        <img class="slide1" src="./images/슬라이드2.PNG" alt="">
        <img class="slide1" src="./images/슬라이드1.PNG" alt="">
        <img class="slide1" src="./images/슬라이드2.PNG" alt="">   

</section>

<aside>


	
	<div id="login">

	<%
	if(num==1){
	%>
	
	<%=name %>님 반가워요 <button type="button" id="logout" style='cursor:pointer'>로그아웃</button><br>
	커밋의 다양한 혜택을 만나보세요.<br>
	
	
	<input onClick="location.href='<%=request.getContextPath()%>/mypage/resume.jsp'" style='cursor:pointer' class="joinbutton" type="button" value="이력서 작성">
	<input onClick="location.href='<%=request.getContextPath()%>/mypage/mypageMain.jsp'" style='cursor:pointer' class="joinbutton" type="button" value="마이페이지"> 
	<%
	}else if(num==2){
	%>
	
	<%=com %>님 반가워요 <button type="button" id="logout" style='cursor:pointer'>로그아웃</button><br>
	커밋의 다양한 혜택을 만나보세요.<br>
	
	<input onClick="location.href='<%=request.getContextPath() %>/recruit/recruitInsert.jsp'" style='cursor:pointer' class="joinbutton" type="button" value="공고등록">
	<input onClick="location.href='<%=request.getContextPath()%>/mypage/mypageMain2.jsp'" style='cursor:pointer' class="joinbutton" type="button" value="마이페이지"> 
	<% 	
	}else if(num==3){
	%> 
		<input onClick="location.href='<%=request.getContextPath()%>/mypage/mypageMain3.jsp'" style='cursor:pointer' class="joinbutton" type="button" value="마이페이지">
		 <button type="button" id="logout" style='cursor:pointer'>로그아웃</button><br> 
	<%
	}
	%>
	
	
	
	
	<br>
	<div id="notice">
	<font color="#68C8CA"><b>Notice</b></font><br>
	<a href="<%=request.getContextPath()%>/notice/noticemain.jsp">12월의 업데이트 소식을 확인하세요!</a>
	</div>
	</div>
   
</aside>

<%
   IRecruitService rservice = RecruitServiceImpl.getInstance();
   List<RecruitVO> recruitList = rservice.selectAllRecruitPop();
   List<RecruitVO> recruitListNew = rservice.selectAllRecruitNew();
   
%>
<article>
<div id="rview">
<h3>이번주 인기 포지션</h3>
		<table id="popular">
<%
	      for(int i = 0; i < recruitList.size(); i++) {
	         RecruitVO vo = recruitList.get(i);
	         if(i % 4 == 0 && i < recruitList.size()) {
%>
	      <tr>
<%
	         }
%>
	         <td>
	         	<a class="ac" href="<%= request.getContextPath()%>/recruitDetail.do?recruit_num=<%= vo.getRecruit_num()%>">
	            <img class="pimg" src="<%=request.getContextPath()%>/images/회사<%=i%4 + 1%>.PNG" alt=""><br>
	            
	             <h3><b><%= vo.getRecruit_name() %></b></h3>
	            <%= vo.getRecruit_skill() %><br>
	            [<%= rservice.selectRegion(vo.getRecruit_num()) %>]
	              <%= vo.getRecruit_spec() %>
	         	</a>
	         </td>
	      
<%
	         if(i > 0 && i % 4 == 3) {
%>
	      </tr>
<%
	         }
	      }
%>
	        
	   </table>
<br><br>

<h3>신규 등록 포지션</h3>
		<table id="new">
<%
	      for(int i = 0; i < recruitList.size(); i++) {
	         RecruitVO vo = recruitListNew.get(i);
	         if(i % 4 == 0 && i < recruitList.size()) {
%>
	      <tr>
<%
	         }
%>
	         <td>
	         		<a class="ac" href="<%= request.getContextPath()%>/recruitDetail.do?recruit_num=<%= vo.getRecruit_num()%>">
	            <img class="pimg" src="<%=request.getContextPath()%>/images/회사<%=i%4 + 1%>.PNG" alt=""><br>
	            
	             <h3><b><%= vo.getRecruit_name() %></b></h3>
	            <%= vo.getRecruit_skill() %><br>
	            [<%= rservice.selectRegion(vo.getRecruit_num()) %>]
	              <%= vo.getRecruit_spec() %>
	         	</a>
	         </td>
	      
<%
	         if(i > 0 && i % 4 == 3) {
%>
	      </tr>
<%
	         }
	      }
%>
	        
	   </table>
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
