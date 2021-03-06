<%@page import="kr.or.ddit.commit.service.ResumeServiceImple"%>
<%@page import="kr.or.ddit.commit.service.IResumeService"%>
<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.commit.vo.FreedomVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commit.service.FreedomServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IFreedomService"%>
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
width: 200px;
height: 30px;
font-size: 15px;
}

#se2{
	background:  #93D8D9;
	border-radius: 5px;
	height: 33px;
	width: 90px;
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
	//?????? Session???????????? ?????? ?????? ??????
	HttpSession session1 = request.getSession();
	//Session?????? ????????????
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
currentPage = 1;
<%
Integer currentPage = 1;
IFreedomService service = FreedomServiceImpl.getService();
Map<String, Integer> map = service.pageInfo(currentPage);
List<FreedomVO> alllist = service.selectAllFreeBoard();
List<FreedomVO> list = service.getAllFreedom(map);
if(request.getAttribute("list") != null){
	list = (List<FreedomVO>)request.getAttribute("list");
%>

currentPage = <%=request.getAttribute("page")%>;
<%
}
%>
$(function(){
	$('#logout').on('click', function(){
		location.href = "/CommitProject/logout.do"
	});
	
	//?????????
 	<%
 	if(mem==null || mem.getMem_num()==3){
 	%>
 		$('#board_write').hide();
 
 	<%
 	}
 	%>
 	
		
	// ????????? ??????
	$('input:radio').on('change', function() {
		tag = $('input[name=search]:checked').val();

		location.href = "<%=request.getContextPath()%>/freedomTagSearch.do?tag="+tag;
	})
<%
	List<FreedomVO> searchlist = (List<FreedomVO>)request.getAttribute("list");
	Integer tag = (Integer)request.getAttribute("tag");
	
	
	// IFreedomService(??????)??? service??? ???????????? FreedomServiceImpl?????? getService()??? ?????????
	// ?????????????????? servcie??? FreedomServiceImpl??? ?????? service??? ????????????
	// ???????????? ????????? ??????
	
	
	// List<FreedomVO> list = FreedomServiceImpl.getService().selectAllFreeBoard();
	// service??? FreedomServiceImpl.getService()??? ??????
	// <FreedomVO>??? ??????
	// ?????? List?????? ????????? <FreedomVO>????????? ?????????
	// service.selectAllFreeBoard(); ??? FreedomServiceImpl ?????? ?????? selectAllFreeBoard()??? ?????????????????? ??????
	
	if(searchlist != null){
		list = searchlist;
	}
	
	if(tag!=null){
%>
		$('input:radio[value=<%=tag%>]').attr("checked", "checked")

<%		
	}
%>

	$('#search').on('click',function(){
		location.href="<%=request.getContextPath()%>/freedom/freedomSearch.jsp";
	})
	

	// ????????? ??????
	$('#board_write').on('click', function(){
		location.href="<%=request.getContextPath()%>/freedom/freedomInsert.jsp";
	})



	//????????? ?????? ????????? ?????????
	$('#pageList').on('click', '.paging', function(){
		currentPage = $(this).text(); //????????? this??? paging, ????????? page??????
		location.href = "<%=request.getContextPath() %>/FreedomPaging.do?page=" + currentPage;
		listPage(currentPage);
	})
	//next?????????
	$('#pageList').on('click', '.next', function(){
		currentPage = parseInt($('.paging').last().text()) + 1;
		location.href = "<%=request.getContextPath() %>/FreedomPaging.do?page=" + currentPage;
		listPage(currentPage);
	})
	//previous?????????
	$('#pageList').on('click', '.prev', function(){
		currentPage = parseInt($('.paging').first().text()) - 1;
		location.href = "<%=request.getContextPath() %>/FreedomPaging.do?page=" + currentPage;
		listPage(currentPage);
	});
	
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
   <img style='cursor:pointer' id="logoimg" alt="??????.png" src="<%=request.getContextPath() %>/images/????????????1.PNG">
   </button>
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/recruit/recruitMain.jsp'" type="button" class="nt">????????????</button>
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/companyinfo/companyinfoMain.jsp'" type="button" class="nt">????????????</button>
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/hr/hrmain.jsp'" type="button" class="nt">?????????</button>
      <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/freedom/freedomMain.jsp'" type="button" class="nt">????????????</button>
    </div>
   

   <div id="sbar1">
   
   <input id = "sbar2" type = "text" placeholder = "???????????? ???????????????">
   <input id = "sbar3" type = "submit" style='cursor:pointer' value="">
      <%if(num==1){
	%>
   
      <button id="my3" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/mypageMain.jsp'">
      <font size="2"><b><%=name %>???</b></font></button>
  
   <%
   }else if(num==2){
	   
   %>
   
   	<button id="my3" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/mypageMain2.jsp'">
      <font size="2"><b><%=com %>???</b></font></button>
      
   <%
   }
   %>
   <%
	if(mem==null){
		out.print("<font size='2'><b>????????????/?????????</b></font></button>");
	}else{
		out.print("<button type='button' id='logout' style='cursor:pointer'>????????????</button>");
	}
%>
   </div>


</header>

<article>
<h1><b>????????????</b></h1>
<div id="list">
	<br>
<div>
	<div><h2>????????? ????????? <b><%=alllist.size()%></b>???</h2></div>
	<br>
	<div>
		<div>
			<form action="<%=request.getContextPath()%>/freedom/freedomSearch.jsp">
			<select name="search_select">
			 	 <option value="1" >??????</option> 
			 	 <option value="2" >?????????</option>
			</select>
			 	<input id="se" type="text" name="search_text" placeholder="?????? ???????????? ??????????">
			 	<button id="se2" type="submit" id="search" style='cursor:pointer'>??????</button><button type="button" id="board_write">?????????</button>
			</form>
		</div>
	</div>
</div>
<br>
<div>
	 <div>
		<span>
			<input type="radio" value="0" name="search" >
			<label>????????????</label>
		</span>
		<span>
			<input type="radio" value="1" name="search">
			<label>#??????</label>
		</span>
		<span>
			<input type="radio" value="2" name="search">
			<label>#??????</label>
		</span>
		<span>
			<input type="radio" value="3" name="search">
			<label>#??????</label>
		</span>
		<span>
			<input type="radio" value="4" name="search">
			<label>#??????</label>
		</span>
	</div>
	<br>
	
</div>
<br>


<div id="aa">
<div id="tag">??????</div>
<div id="tt">??????</div>
<div id="wr">?????????</div>
<div id="da">?????????</div>
<div id="vi">?????????</div><br><br>

<table>
<%
if(list != null) {
	for(FreedomVO vo : list ){

%>

<tr>
	<td id="tag2"><%=vo.getFreedom_num() %></td>
	<td id="tt2"><a href="<%= request.getContextPath() %>/freedom/freedomDetail.jsp?freedomnum=<%= vo.getFreedom_num()%>"><%=vo.getFreedom_title() %></a></td>
	<td id="wr2"><%=vo.getMem_id() %></td>
	<td id="da2"><%=vo.getFreedom_date().substring(0, 10) %></td>
	<td id="vi2"> <%=vo.getFreedom_view() %></td>
</tr>


<%
	}
} else {
%>


<h4>???????????? ????????????</h4>
<%
}
%>

</table><br>
<div id="pageList"></div>
</div>
<script type="text/javascript">
	listPage(currentPage);
</script>
</div>
</article>

<!-- <div id="list"></div> -->
<!-- <div id="pageList"></div> -->

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
