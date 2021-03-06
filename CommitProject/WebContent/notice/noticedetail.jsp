<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@page import="kr.or.ddit.commit.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commit.service.NoticeServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.INoticeService"%>
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
<script src="../js/notice.js"></script>
<style type="text/css">
body{
   min-width: 1600px;
}

header{
   margin-top: 30px;
   height: 80px;
   margin-bottom: 20px;
   width:1600px;
   padding-left: 240px;
}

article{
   margin-left: 310px;
   width: 1500px;
   height: 800px;
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
	float: left;
   margin-left: 140px;
   margin-top: 40px;
   position: fixed;
  position: absolute;
      top: 30px;
       right: 480px;
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

  background-image: url('<%=request.getContextPath()%>/images/?????????3.png');
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

table, tr, th, td{
	
}

ul{
	display : inline-block;
	float : left;
}

.paging, .next, .prev{
	float : left;
}

#con{
	font-size: 15px;
	
	width: 500px;
	display: inline-block;
	
}
#con2{
	
	width: 650px;
	display: inline-block;
}
#list{
	border: 2px solid #93D8D9;
	border-radius: 15px;
	height: 800px;
	width: 1000px;
	padding-left: 130px;
	padding-top: 80px;
	margin-top: 40px;
}
#box{
	font-size: 17px;
}
#title{
	font-size: 25px;
}
hr{
	
	margin-left: 15px;
	margin-right: 5px;
}
#pageList{
	display:inline-block;
	padding-left: 300px;
}
#write{
	background: #93D8D9;
	margin-bottom:65px;
	margin-left: 280px;
}
#con{

height: 500px;
}
#bu{

padding-left: 500px;
}

.bu2{
	background: #93D8D9;
	border: 0px;
	outline: none;
	border-radius: 5px;
	width: 80px;
	height: 30px;
}
</style>


</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("notice_num"));
	INoticeService service = NoticeServiceImpl.getInstance();
	NoticeVO nvo = service.selectNotice(no);
	
	//???????????? ??? ????????? ????????? ??????
	service.updateView(no);
	
	//?????? Session???????????? ?????? ?????? ??????
	HttpSession session1 = request.getSession();
	
	//Session?????? ????????????
	MemberVO mem = (MemberVO)session1.getAttribute("loginMember");
	
%>

<script type="text/javascript">

$(function(){
 	//?????????, ???????????? ?????? ??????
 	<%
 	if(mem==null || mem.getMem_num()!=3){
 	%>
 		$('#update').hide();
		$('#delete').hide();
 	<%	
 	}
 	%>
 	
	<%-- if(<%=mem.getMem_id()%>!=null){
 		$('#update').hide();
 		$('#delete').hide();
	//???????????? ?????? ??????
	}else if(<%=mem.getMem_num()%>!=3){
 		$('#update').hide();
 		$('#delete').hide();
 	} --%>
	
	$('#update').on('click', function(){
		$('#myModal').modal('show');
	})
	
	$('#register').on('click', function(){
		data = $('#myModal form').serializeArray();
		console.log(data);
		
		updateNotice();
	})
	
	
})

</script>

<header>
    <div id ="nu">
    <%
		HttpSession session2 = request.getSession();
    	MemberVO mvo = new MemberVO();
    	if(session2.getAttribute("loginMember") != null){
	%>
	   <button onclick="location.href='<%=request.getContextPath()%>/board/main2.jsp'" type="button" id="logo" href="main.jsp">
	   <img style='cursor:pointer' id="logoimg" alt="??????.png" src="<%=request.getContextPath() %>/images/????????????1.PNG">
	   </button>
	<%
    	} else {
    %>
	   <button onclick="location.href='<%=request.getContextPath()%>/board/main.jsp'" type="button" id="logo" href="main.jsp">
	   <img style='cursor:pointer' id="logoimg" alt="??????.png" src="<%=request.getContextPath() %>/images/????????????1.PNG">
	   </button>
    <%
    	}
    %>
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/recruit/recruitMain.jsp'" type="button" class="nt">????????????</button>
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/companyinfo/companyinfoMain.jsp'" type="button" class="nt">????????????</button>
        <button style='cursor:pointer' onclick="location.href='main.jsp'" type="button" class="nt">?????????</button>
      <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/freedom/freedomMain.jsp'" type="button" class="nt">????????????</button>
    </div>
   

   <div id="sbar1">
   
   <input id = "sbar2" type = "text" placeholder = "???????????? ???????????????">
   <input id = "sbar3" type = "submit" style='cursor:pointer' value="">
      <button id="my" style='cursor:pointer' type="button" onclick="location.href='login.jsp'">
      <font size="2"><b>????????????/?????????</b></font></button>
   
   </div>


</header>

<article>
<h1><b>????????????</b></h1>
<div id="list">

		<h2>[<%=nvo.getNotice_head() %>]&nbsp;<%=nvo.getNotice_title() %></h2><br>
		<h4>????????? :<%=nvo.getNotice_date().substring(0, 10) %>&nbsp;&nbsp;&nbsp; ????????? : </span><%=nvo.getNotice_view() %></h4>
	<hr width="80%">
	<div id="con" ><%=nvo.getNotice_con().replaceAll("\r", "").replaceAll("\n", "<br>") %></div>
	<br><br>
	
	<div id = "bu">
	<input class="bu2" type="button" value="????????????" id="update">
	<input class="bu2" type="button" value="????????????" id="delete" onclick="location.href = 'noticedelete.jsp?notice_num=<%=nvo.getNotice_num() %>'">
	<input class="bu2" type="button" value="????????????" id="return" onclick="location.href = 'noticemain.jsp'">
	</div>
	

<!-- ??? ???????????? -->
	<div id= "myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	  
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">????????? ??????</h4>
	      </div>
	      <div class="modal-body">
	        <form action = '/CommitProject/NoticeUpdate.do'>
	        	<input type="hidden" name="notice_num" value="<%=nvo.getNotice_num() %>">
	        	<select name = "notice_head" title="????????? ??????">
	        		<option value="">?????????</option>
	        		<option value="??????">??????</option>
	        		<option value="??????">??????</option>
	        		<option value="??????">??????</option>
	        	</select>
		        <label>??????</label><input class="intxt" type="text" name="notice_title" value="<%=nvo.getNotice_title() %>"><br>
		        <label>??????</label><br>
		        <textarea class="intxt" name="notice_con" rows="10" cols="50"><%=nvo.getNotice_con() %></textarea>
		        <br>
	        	<input type="button" value="??????" id="register">
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
   <a>???????????????</a>
   <a>????????????</a>
   <a>????????????????????????</a>
   <a>????????????</a>
   <a>????????????</a>
   ?????? ????????????: 010-2949-1459(?????? 9:00~18:00), ???????????? 12:00~13:00, ??????/????????? ??????)<br>
   ?????????: help@commit.co.kr/Fax: 042-1111-1111(???????????????)<br>
   (???)??????HR, ???:0000, ??????????????? ?????? ?????????, ??????:??????
   ????????? ??????:000-00-00000/????????????????????????: ?????? ?????? ??? 0000-0???/ ???????????????: ???0000???<BR>
   Copyright(c) (???)??????HR, All rights reserved
   </div>
</footer>
</body>
</html>
