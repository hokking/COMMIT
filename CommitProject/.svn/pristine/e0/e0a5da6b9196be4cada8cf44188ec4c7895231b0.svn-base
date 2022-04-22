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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/js/freedomMain.js"></script>
<style>
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
   height: 800px;
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


#service{
   text-align: center;
   font-size: 7px;
}


#menu1 {
   margin-right: 20px;
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


#list{
	border: 2px solid #93D8D9;
	border-radius: 15px;
	height: 800px;
	width: 1050px;
	padding-left: 100px;
	padding-top: 30px;
	margin-top: 40px;
}

#searchFreeBoard{
	height : 25px;
}

#se{
width: 500px;
height: 45px;
font-size: 15px;
}

#se2{
width: 500px;
height: 300px;
font-size: 15px;
}

#insert{
	background:  #93D8D9;
	border-radius: 5px;
	height: 33px;
	width: 90px;
}
#tomain{
	background:  #93D8D9;
	border-radius: 5px;
	height: 33px;
	width: 150px;
}

select{
width: 150px;
height: 30px;
font-size: 15px;
}

#tag{
float:left;
text-align:center;
width: 100px;
font-size: 18px;
font-weight: bold;
display: inline-block;
}
#tt{
float:left;
text-align:center;
width: 300px;
font-size: 18px;
font-weight: bold;
display: inline-block;
}
#wr{
float:left;
text-align:center;
width: 150px;
font-size: 18px;
font-weight: bold;
display: inline-block;
}

#da{
float:left;
text-align:center;
width: 200px;
display: inline-block;
font-size: 18px;
font-weight: bold;
}
#vi{
float:left;
text-align:center;
width: 100px;
display: inline;
font-size: 18px;
font-weight: bold;

}

table{
	text-align:center;
}
td{
	padding-top: 10px;
}
#tag2{
width: 100px;
font-size: 15px;
font-size:20px;
}
#tt2{
width: 300px;
font-size: 15px;
font-size:20px;
}
#wr2{
width: 150px;
font-size: 15px;
font-size:20px;
}

#da2{
width: 200px;
font-size:20px;
}
#vi2{
width: 100px;
font-size: 20px;
}
#pageList{
	display:inline-block;
	
	margin-left: 370px;
}
#board_write{
	margin-left: 320px;
	border: 2px solid #93D8D9;
	border-radius: 5px;
	height: 30px;
}

</style>

<%	
	//현재 Session가져오기 위한 객체 생성
	HttpSession session1 = request.getSession();
	//Session값을 읽어오기
// 	MemberVO mem = (MemberVO)session1.getAttribute("loginMember");
	MemberVO mem = (MemberVO)session.getAttribute("loginMember");
// 	out.print("mem : " + mem);
	
	String memid = mem.getMem_id();
	Integer num = mem.getMem_num();
	IResumeService service2 = ResumeServiceImple.getInstance();
	
	String com = service2.conselect(memid);
	String name = service2.userselect(memid);
	
%>	



<script>
$(function(){
   $('#insert').on('click',function(){
      ins = $('#freedomInsert').serializeArray();
      $.ajax({
         url : '/CommitProject/freedomInsert.do',
         data : ins,
         type : 'post',
         success : function(res) {
         },
         dataType : 'json'
      })
      location.href="<%=request.getContextPath()%>/freedom/freedomMain.jsp";
   })
   $('#tomain').on('click',function(){
      location.href="<%=request.getContextPath()%>/freedom/freedomMain.jsp";
   })
})

</script>

</head>
<body>

<header>
    <div id ="nu">
    
    <%if(memid!=null){ %>
    
   <button onclick="location.href='<%=request.getContextPath()%>/board/main2.jsp'" type="button" id="logo" href="main.jsp">
   
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
   <%
	if(mem==null){
		out.print("<font size='2'><b>회원가입/로그인</b></font></button>");
	}else{
		out.print("<button type='button' id='logout' style='cursor:pointer'>로그아웃</button>");
	}
%>
   </div>


</header>


<article>

<h1><b>커뮤니티</b></h1>
<div id="list">
	<br>
<form id="freedomInsert">
   <div>
   	<div><h3>글을 작성해주세요</h3></div>
      <br>
      <div>
         <input id="se" type="text" placeholder="제목을 입력해주세요" name="title">
      </div>
      <br>
      <div>
         <textarea id="se2" placeholder="내용을 입력해주세요" name="content"></textarea>
      </div>
      <br>
      <div>
         <div>#해시태그 입력</div>
         
         <input type="radio" value="1" name="tag">
         <label>#취준</label>
      
         <input type="radio" value="2" name="tag">
         <label>#이직</label>
      
         <input type="radio" value="3" name="tag">
         <label>#퇴사</label>
      
         <input type="radio" value="4" name="tag">
         <label>#잡담</label>
      </div>
      <br>      
      <div>
         <button type="button" id="insert">게시글등록</button>
      </div>
      <br>   
      <div>
         <button type="button" id="tomain">목록으로 돌아가기</button>
      </div>
   </div>
</form>

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