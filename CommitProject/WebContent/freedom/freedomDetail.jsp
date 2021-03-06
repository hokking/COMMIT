<%@page import="kr.or.ddit.commit.service.ResumeServiceImple"%>
<%@page import="kr.or.ddit.commit.service.IResumeService"%>
<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@page import="kr.or.ddit.commit.service.FreeRepleServiceImpl"%>
<%@page import="kr.or.ddit.commit.vo.FreeRepleVO"%>
<%@page import="kr.or.ddit.commit.service.IFreeRepleService"%>

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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/reple.js"></script>
<style>
#repleUpdate{
 	display : none; 
}

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
   width: 1200px;
   height: 900px;
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

#list{
	border: 2px solid #93D8D9;
	border-radius: 15px;
	
	width: 920px;
	
	padding-top: 50px;
	margin-top: 40px;
}

#userim{
	width: 30px;
	height: 30px;
}
#con1, #con2, #con3{
	
	margin-left: 100px;
}


.bt{
	border: 2px solid #93D8D9;
	border-radius: 5px;
	
}
#btd{
	margin-left: 400px;
}
#repleContnet{
	width: 600px;
	height:50px;
	font-size: 16px;
	border-radius: 5px;
}
#repled{
	
	display: inline-block;
	float: left;
}

#repled2{
	
	width: 100px;
	float: left;
}
.re{
	background: #EBEBEB;
	border-radius: 15px;
	width: 700px;
	height: 200px;
	padding-left: 20px;
	padding-top: 20px;
	margin-bottom: 10px;
}

#reimg{
	width:30px;
	height: 30px;
	display: inline-block;
}
#reple_delete, #reple_update{
	border: 2px solid  #93D8D9;
	border-radius: 5px;
}
#rd{
	margin-left: 500px;
}
#reple_write{
	background: #93D8D9;
	border-radius: 5px;
	width: 120px;
	height: 55px;
}

</style>
<%
	
	int freedomnum = Integer.parseInt(request.getParameter("freedomnum"));
	IFreedomService service = FreedomServiceImpl.getService();
	FreedomVO vo = service.selectOneFreeBoard(freedomnum);
	service.FreedomView(vo);
	vo = service.selectOneFreeBoard(freedomnum);
	IFreeRepleService repleService = FreeRepleServiceImpl.getService(); 
	List<FreeRepleVO> repleList = repleService.selectAllFreeReple(freedomnum);

	//?????? Session???????????? ?????? ?????? ??????
	HttpSession session1 = request.getSession();
	
	//Session?????? ????????????
	MemberVO mem = (MemberVO)session1.getAttribute("loginMember");
	String memid = mem.getMem_id();
	Integer num = mem.getMem_num();
	IResumeService service2 = ResumeServiceImple.getInstance();
	
	String com = service2.conselect(memid);
	String name = service2.userselect(memid);
	
%>	
	

<script>

$(function(){
	
	//?????????
 	<%
 	if(mem==null){
 	%>
 		$('#board_update').hide();
 		$('#board_delete').hide();
 		$('#reple_write').hide();
 		$('#reple_delete').hide();
 		$('#reple_update').hide();
 		$('#repleContnet').hide(); 		
 		
 	<%
 	//?????????
 	}else if(mem.getMem_num()==3){
 	%>
 		$('#board_update').hide();
 		$('#reple_write').hide();
 		$('#reple_update').hide();
 		$('#repleContnet').hide(); 	
 		$('#board_delete').show();
 		$('#reple_delete').show();
 	
 	<%
 	}
 	%>
 	
	$('#tomain').on('click',function(){
		location.href="<%=request.getContextPath()%>/freedom/freedomMain.jsp";
	});
	
	$('#board_update').on('click', function(){
		location.href="<%=request.getContextPath()%>/freedom/freedomUpdate.jsp?freedomnum=<%=freedomnum%>";
	});
	
	$('#board_delete').on('click', function(){
		del = <%=vo.getFreedom_num() %>;
		$.ajax({
			url : "/CommitProject/freedomDelete.do",
			data : {"num": del}, // num : key, del : value???(?????????)
			type : 'post',
			success : function(res) {				
			},
			dataType : 'json'
		})	
		location.href="<%=request.getContextPath()%>/freedom/freedomMain.jsp";
	});
		
	$('#reple_delete').on('click', function(){
		
		del = $('#reple_delete').attr("freedomNum");
		//attr(??????) : ???????????? ????????????
		
		$.ajax({ // ???????????? ??????(??????, ?????????, ??????)
			url : "/CommitProject/freedomRepleDelete.do",
			data : {"replenum": del}, // num : key, del : value???(?????????)
			type : 'post',
			success : function(res) {	
// 				alert(res.sw); 
				// res??? ?????? sw?????? ???????????? ???, ????????? res??? function??? ??????
				
			},
			dataType : 'json'
		})	
		location.href="<%=request.getContextPath()%>/freedom/freedomDetail.jsp?freedomnum=<%=freedomnum%>";
	});
	
	$(document).on('click', '#reple_update', function(){
			
	
			 oldtext = $(this).parent().prev().html();
			 num = $(this).attr("freedomNum"); 
			 // attr??? ???????????? ??????, ????????? get, ????????? set
			 newtext =  oldtext.replace(/<br>/g, "\n");
// 			 newtext = oldtext;
			 
			 $('#repleUpdate textarea').val(newtext);
			 
			 $('#repleUpdate textarea').attr("freedomNum", num);
			 
			 $(this).parent().prev().empty();
			 
			 $(this).parent().prev().append($('#repleUpdate'));
 			 $('#repleUpdate').show();
			 
			 if($(this).is(":visible") == true) {
			 	$(this).attr("style", "visibility:hidden");
// 			 	$(this).hide();
			 } else {				 
			 	$(this).attr("style", "visibility:visible");
// 			 	$(this).show();
			 }
	
		
 	});
	
	
	
	$('#ok').on('click', function(){
			
		//textarea ?????? ????????? ????????? ????????????  -\r\n -> <br>
		 oldtext = $('#repleUpdate textarea').val();	
		 newtext = oldtext.replace(/\r/g, "").replace(/\n/g, "<br>");
		 rnum = $('#repleUpdate textarea').attr("freedomNum");
		 var okbtn = this;			 
		
		$.ajax({
			url : "/CommitProject/freedomRepleUpdate.do",
			data : {"content" : newtext,
					"num" : rnum		
			},
			type : "post",
			success : function(res) {	
				
				$('#reple_update', $(okbtn).parents(".re")).attr("style", "visibility:visible");
				
				//p ????????? ?????? - ?????? ????????? ????????? ?????? 
				p =  $('#repleUpdate').parent();
				 		
				//???????????????
				$('#repleUpdate').appendTo($('body'));
				$('#repleUpdate').hide();
			
				//??????????????? ????????????p?????? ????????? 
				$(p).html(newtext);
								
			},
			dataType : 'json'
		})
	})
	
	$('#cancle').on('click',function(){
		
		$('#reple_update', $(this).parents(".re")).attr("style", "visibility:visible");
		
		p =  $('#repleUpdate').parent();
		
		$('body').append($('#repleUpdate'));
		$('#repleUpdate').hide();
	
		$(p).html(oldtext);
		
		
		
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
   <img style='cursor:pointer' id="logoimg" alt="??????.png" src="<%=request.getContextPath() %>/images/????????????1.PNG">
   </button>
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/recruit/recruitMain.jsp'" type="button" class="nt">????????????</button>
        <button style='cursor:pointer' onclick="location.href='<%=request.getContextPath() %>/companyinfo/companyinfoMain.jsp'" type="button" class="nt">????????????</button>
        <button style='cursor:pointer' onclick="location.href='main.jsp'" type="button" class="nt">?????????</button>
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
   
   </div>
 
</header>

<article>
<h1><b>????????????</b></h1>
<div id="list">
<div id="con1">
<h1><%=vo.getFreedom_title() %></h1><img id="userim" alt="user" src="<%=request.getContextPath()%>/images/user.png">
<%=vo.getMem_id() %><br><br>
<font size="2"><%=vo.getFreedom_date().substring(0, 10) %>&nbsp;?????????&nbsp;<%=vo.getFreedom_view() %></font>
</div>
<hr width="80%">
<br><br>

<div id ="con2">
<%=vo.getFreedom_con().replaceAll("\r", "").replaceAll("\n", "<br>") %>

<br><br><br><br>
<%
if(vo != null) {
	
	String tagName = null; 
	if(vo.getTag_num()==1){
		tagName = "#??????";
	}else if(vo.getTag_num()==2){
		tagName = "#??????";
	}else if(vo.getTag_num()==3){
		tagName = "#??????";
	}else if(vo.getTag_num()==4){
		tagName = "#??????";
	}
%>

<%=tagName%>
<br><br><br><br>
<%
	
} else {	
%>
<h4>???????????? ????????????</h4>

<%
}
%>



<div id="btd">	

<% if(memid.equals(vo.getMem_id())){ %>
	<button  style='cursor:pointer' class="bt" type="button" id="board_update" class="board_update">????????? ??????</button>
	<button  style='cursor:pointer' class="bt" type="button" id="board_delete" class="board_delete">????????? ??????</button>	
	
	<%} %>
	<button  style='cursor:pointer' class="bt" type="button" id="tomain">???????????? ????????????</button>
</div>
<br>
</div>


<hr width="80%">
<div id= "con3">
<form action="<%=request.getContextPath()%>/freedomRepleInsert.do" method="post">
	<input type="hidden" name="freedom_num" value="<%=vo.getFreedom_num() %>">

	
		
<div id="repled">
	<textarea placeholder="??? ????????? ?????? ????????? ?????????, ?????? ?????? ????????? ????????? ?????? ???????????????~" name="repleContnet" id="repleContnet"></textarea>
</div>
<div id="repled2">	
	<button type="submit" id="reple_write"  style='cursor:pointer'>?????? ??????</button>
</div><br><br><br><br>


</form>

<%
	if(repleList != null) {
 		for(FreeRepleVO rvo : repleList ){
 			
 %>
 			                      
	   <div class="re">    
	  <img alt="" id="reimg" src="<%=request.getContextPath()%>/images/reple.png">&nbsp;<%=rvo.getMem_id() %> &nbsp;<span class="date"> <%=rvo.getReple_date().substring(0, 10) %></span></p>
	  <p><%=rvo.getReple_con().replaceAll("\r", "").replaceAll("\n", "<br>")  %></p>                 
	  <p>
	  <div id="rd">

<%
	if(memid.equals(rvo.getMem_id())){

%>
	  <input freedomNum="<%=rvo.getReple_num() %>" type="button" id="reple_delete"   style='cursor:pointer' class="action" value="????????????">
	  <input freedomNum="<%=rvo.getReple_num() %>" type="button" id="reple_update"   style='cursor:pointer' class="action" value="????????????" style="visibility: visible;">
		
	<%} %>
		
	  </div>
	  </p>
 </div>	

<%
 	}
 } else {	
%>

<br>
<h4>????????? ????????????</h4>

<%
 }
%>

<div id="repleUpdate" >
<textarea rows="5" cols="50"></textarea>
<br>
<input type="button" value="??????" id="ok">
<input type="button"  value="??????" id="cancle">
</div>




</div>
</article>

</body>
</html>