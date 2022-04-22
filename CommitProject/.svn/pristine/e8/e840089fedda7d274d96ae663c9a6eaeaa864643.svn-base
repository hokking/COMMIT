<%@page import="kr.or.ddit.commit.service.ResumeServiceImple"%>
<%@page import="kr.or.ddit.commit.service.IResumeService"%>
<%@page import="kr.or.ddit.commit.vo.QnaVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.commit.service.QnaServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IQnaService"%>
<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/qna.js"></script>
<style type="text/css">
body{
   min-width: 1600px;
}

header{
   margin-top: 10px;
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


article{
   margin-left: 310px;
  	height: 800px;
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

#Div {
   position: absolute; 
   visibility: hidden; 
   font-size: 12px; 
   background: white;
   width: 200px;
   height: auto;
}

#menu1 {
   margin-right: 20px;
}

td {
	padding: 5px;
	padding-left: 9px;
	padding-bottom: 20px;
}

th {
	text-align : center;
}

.container{
	margin-top:20px;
	margin-bottom: 10px;
	width: 1000px;
	float: left;
}


ul{
	display : inline-block;
	float : left;
}

	table{
		
		margin-right: 110px;
		text-align : center;	
}
	
	th, td{
		text-align : center;
}
	  
	ul{

	display : inline-block;
}

	.pager{

	float : left;
	margin : 5px;
	margin-left : 20px;

}

#list{
	border: 2px solid #93D8D9;
	border-radius: 15px;
	height: 800px;
	width: 1000px;
	padding-left: 130px;
	padding-top: 30px;
	margin-top: 40px;
}


#no{

display: inline-block;
float: left;
font-size: 20px;
width: 100px;
font-weight: bold;
}
#tt{
display: inline-block;
float: left;
font-size: 20px;
width: 250px;
font-weight: bold;
}
#da{
display: inline-block;
float: left;
font-size: 20px;
width: 250px;
font-weight: bold;
}
#ap{
font-size: 20px;
font-weight: bold;
width: 100px;
float: left;
}
#all{
	margin-left: 5px;
	margin-top: 30px;
	text-align: center;
}
hr{
	margin-left: 15px;
}

#tn{
width: 100px;
font-size: 20px;
}
#tt2{
width: 300px;
font-size: 20px;
}
#td{
font-size: 20px;
width: 200px;
}
#ta{
font-size: 20px;
width: 200px;
}
#pageList{
	margin-left: 200px;
}
#write{
background: #93D8D9;
margin-left: 260px;
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
</style>
<%
	HttpSession session1 = request.getSession();
	MemberVO mem = (MemberVO)session1.getAttribute("loginMember");
	
	mem = (MemberVO)session1.getAttribute("loginMember");
	String memid = mem.getMem_id();
	Integer num = mem.getMem_num();
	
	IResumeService service2 = ResumeServiceImple.getInstance();
	String com = service2.conselect(memid);
	String name = service2.userselect(memid);
	
%>

<script type="text/javascript">
currentPage = 1;
<%
Integer currentPage = 1;
IQnaService service = QnaServiceImpl.getInstance();
Map<String, Integer> map = service.pageInfo(currentPage);
List<QnaVO> list = service.selectByPage(map);
if(request.getAttribute("list") != null){
	list = (List<QnaVO>)request.getAttribute("list");
%>
currentPage = <%=request.getAttribute("page")%>;
<%
}
%>
  
  
  $(function(){
	 //비회원이면 글쓰기 버튼 숨기기
	/*   $('#list').on('click', '.action', function(){
		  idx = $(this).attr('idx');
		  name = $(this).attr('name');
	  }) */
	  
	  
	  //글 작성
	  $('#write').on('click', function(){
		  $('#myModal').modal('show');
		  return false;
	  })
	  
	  //글쓰기 후 전송버튼
	  $('#register').on('click', function(){
		  
		  var result = confirm("등록한 질문은 수정 및 삭제가 불가능합니다. 등록하시겠습니까?");
		  
		  if(result){
			  fdata = $('#myModal form').serializeArray();
			  console.log(fdata);
			  saveQna();
			  alert("질문이 등록되었습니다.");
		  }else{
			  alert("질문 등록이 취소되었습니다.");
			  location.href = "<%=request.getContextPath()%>/qna/qnamain.jsp";
		  }
	  })

	   $('#pageList').on('click', '.paging', function(){
			currentPage = $(this).text(); //여기서 this는 paging, 클릭한 page번호
			location.href = "<%=request.getContextPath() %>/QnaPaging.do?page=" + currentPage;
			listPage(currentPage);
			
		})
		
		//next이벤트
		$('#pageList').on('click', '.next', function(){
			currentPage = parseInt($('.paging').last().text()) + 1;
			location.href = "<%=request.getContextPath() %>/QnaPaging.do?page=" + currentPage;
			listPage(currentPage);
		})
		
		//previous이벤트
		$('#pageList').on('click', '.prev', function(){
			currentPage = parseInt($('.paging').first().text()) - 1;
			location.href = "<%=request.getContextPath() %>/QnaPaging.do?page=" + currentPage;
			listPage(currentPage);
		});
	   
	   
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
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/hr/hrmain.jsp'" type="button" class="nt">인재풀</button>
      <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/freedom/freedomMain.jsp'" type="button" class="nt">커뮤니티</button>
    </div>
   

   <div id="sbar1">
   
   <input id = "sbar2" type = "text" placeholder = "검색어를 입력하세요">
   <input id = "sbar3" type = "submit" style='cursor:pointer' value="">
      <button id="my" style='cursor:pointer' type="button" onclick="location.href='login.jsp'">
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
<h1><b>Q&A</b></h1>
<div id="list">


<div id="all">
<div id="no">NO</div>
<div id="tt">제목</div>
<div id="da">작성일</div>
<div id="ap">답변</div></div>
<br><br>
<hr width="80%">
<br>
	<table >

	<%
	for(QnaVO vo : list){
		if(mem.getMem_id().equals(vo.getMem_id())||mem.getMem_num()==3){
	%>
	
	<tr>
		<td id="tn"><%=vo.getQna_num() %></td>
		<td id="tt2"><a href="<%=request.getContextPath()%>/qna/qnadetail.jsp?qna_num=<%=vo.getQna_num() %>"><%=vo.getQna_title() %></a></td>
		<td id="td"><%=vo.getQna_date().substring(0,10) %></td>
		<td id="ta">
		<%if(vo.getAns_con()!=null){
		
		%>
		답변완료
		
		<%
		}else{
		%>
		
		답변대기
		<%
		}
		%>
		</td>
	</tr>
	
	<%	
	}
	}
	%>

	
	
</table><br><br>


<div id="pageList"></div><button id="write" data-toggle="modal" data-target="#myModal" type="button" class="btn btn-success btn-sm" >글쓰기</button>
<script type="text/javascript">
	
	listPage(currentPage);
	
</script>

	<!-- 글쓰기 폼 -->
	<div id= "myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	  
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Qna 글쓰기</h4>
	      </div>
	      <div class="modal-body">
	        <form>
	        	<input type="hidden" name="mem_id" value="<%=mem.getMem_id()%>">
		        <label>제목</label><input class="intxt" type="text" name="qna_title"><br>
		        <label>내용</label><br>
		        <textarea class="intxt" name="qna_con" rows="10" cols="50"></textarea>
		        <br>
	        	<input type="button" value="등록" id="register">
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	</div>
	  </div>
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
