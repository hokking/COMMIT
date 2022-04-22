<%@page import="kr.or.ddit.commit.service.ResumeServiceImple"%>
<%@page import="kr.or.ddit.commit.service.IResumeService"%>
<%@page import="kr.or.ddit.commit.vo.QnaVO"%>
<%@page import="kr.or.ddit.commit.service.QnaServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IQnaService"%>
<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Qna 상세페이지</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="../js/qna.js"> </script>  
  
  <style type="text/css">
  body{
   min-width: 1600px;
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
  
  table{
  
  width : 300px;
  margin : 5px;
  text-align : center;
  
  }
  
  th , td{
  text-align : center;
  }
  
  #list{
	border: 2px solid #93D8D9;
	border-radius: 15px;

	width: 1000px;
	padding-top: 30px;
	margin-top: 40px;
	padding-bottom: 50px;
}
.con{
margin-left: 130px;
}

.b{
	background: #93D8D9;
	border-radius: 5px;
	border:0px;
	outline: none;
	height: 25px;
	
}
#bd{
	margin-left: 700px;
}
  </style>
  
<%
	int num = Integer.parseInt(request.getParameter("qna_num"));
	IQnaService service = QnaServiceImpl.getInstance();
	QnaVO vo = service.readQna(num);
	
	HttpSession session1 = request.getSession();
	MemberVO mvo = (MemberVO)session1.getAttribute("loginMember");

	String memid = mvo.getMem_id();
	Integer num2 = mvo.getMem_num();
	IResumeService service2 = ResumeServiceImple.getInstance();
	
	String com = service2.conselect(memid);
	String name = service2.userselect(memid);
	
%>
  
<script type="text/javascript">

$(function(){
	//관리자아니면 버튼 숨기기
	
	$('#update').on('click', function(){
		if("<%=mvo.getMem_id()%>"=="admin"){
			$('#myModal').modal('show');
		}else{
			alert("등록된 게시글은 관리자만 수정 가능합니다.");
		}
	})
	
	$('#delete').on('click', function(){
		if("<%=mvo.getMem_id()%>"=="admin"){
			location.href = "<%=request.getContextPath()%>/qna/qnadelete.jsp?num=<%=vo.getQna_num()%>";			
		}else{
			alert("등록된 게시글은 관리자만 삭제 가능합니다.");
		}
	})	
	<%-- 	
		<%if(!(vo.getMem_id().equals("admin"))){%>
		return false;
		<% } else{%>
		<%} %> --%>
	
	$('#register').on('click', function(){
		data = $('#myModal form').serializeArray();
		console.log(data);
		
		updateQna();
	})
	
})
	</script>
</head>

<body> 

<header>
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
      <button id="my" style='cursor:pointer' type="button" onclick="location.href='login.jsp'">
             <%if(num2==1){
	%>
   
      <button id="my3" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/mypageMain.jsp'">
      <font size="2"><b><%=name %>님</b></font></button>
  
   <%
   }else if(num2==2){
	   
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
		<div class="con"><h2>[<%=vo.getQna_date().substring(0,10)%>&nbsp;문의내역]&nbsp;<%=vo.getQna_title() %></h2><br><br>
		<%=vo.getQna_con().replaceAll("\r", "").replaceAll("\n", "<br>") %>
		</div>
		<div id="bd">
	<input class="b" type="button" value="답변달기" id="update">
	<input class="b" type="button" value="삭제하기" id="delete">
	<input class="b" type="button" value="돌아가기" id="return" onclick="location.href = 'qnamain.jsp'">
	</div><br>
		<hr width="80%">
		
		<% if(vo.getAns_con() != null) {%>
		<div class="con">
		<h2>[<%=vo.getAns_date().substring(0,10)%>&nbsp;답변내역]</h2><br><br>
		<%=vo.getAns_con().replaceAll("\r", "").replaceAll("\n", "<br>") %>
		<% } %><br><br>
		
		

		</div>
		
		
</div>

	

<!-- 글 수정하기 -->
	<div id= "myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	  
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">관리자 답변 수정</h4>
	      </div>
	      <div class="modal-body">
	        <form action = '/CommitProject/QnaUpdate.do'>
	        	<input type="hidden" name="qna_num" value="<%=vo.getQna_num()%>">
		        <label>내용</label><br>
		        <textarea class="intxt" name="ans_con" rows="10" cols="50"><%=vo.getAns_con()==null ? "답변을 입력해주세요" : vo.getAns_con() %></textarea>
		        
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
</article>

</body>
</html>
