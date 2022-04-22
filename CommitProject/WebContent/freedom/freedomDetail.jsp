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

	//현재 Session가져오기 위한 객체 생성
	HttpSession session1 = request.getSession();
	
	//Session값을 읽어오기
	MemberVO mem = (MemberVO)session1.getAttribute("loginMember");
	String memid = mem.getMem_id();
	Integer num = mem.getMem_num();
	IResumeService service2 = ResumeServiceImple.getInstance();
	
	String com = service2.conselect(memid);
	String name = service2.userselect(memid);
	
%>	
	

<script>

$(function(){
	
	//비회원
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
 	//관리자
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
			data : {"num": del}, // num : key, del : value값(데이터)
			type : 'post',
			success : function(res) {				
			},
			dataType : 'json'
		})	
		location.href="<%=request.getContextPath()%>/freedom/freedomMain.jsp";
	});
		
	$('#reple_delete').on('click', function(){
		
		del = $('#reple_delete').attr("freedomNum");
		//attr(속성) : 속성값을 가져온다
		
		$.ajax({ // 보내주는 정보(주소, 데이터, 타입)
			url : "/CommitProject/freedomRepleDelete.do",
			data : {"replenum": del}, // num : key, del : value값(데이터)
			type : 'post',
			success : function(res) {	
// 				alert(res.sw); 
				// res에 있는 sw값을 출력하는 것, 여기서 res는 function의 변수
				
			},
			dataType : 'json'
		})	
		location.href="<%=request.getContextPath()%>/freedom/freedomDetail.jsp?freedomnum=<%=freedomnum%>";
	});
	
	$(document).on('click', '#reple_update', function(){
			
	
			 oldtext = $(this).parent().prev().html();
			 num = $(this).attr("freedomNum"); 
			 // attr은 속성값을 의미, 한개면 get, 두개면 set
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
			
		//textarea 에서 수정한 내용을 가져오기  -\r\n -> <br>
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
				
				//p 부분을 검색 - 원래 내용이 있었던 자리 
				p =  $('#repleUpdate').parent();
				 		
				//수정폼닫기
				$('#repleUpdate').appendTo($('body'));
				$('#repleUpdate').hide();
			
				//수정내용을 원래자리p으로 보내기 
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
<h1><b>커뮤니티</b></h1>
<div id="list">
<div id="con1">
<h1><%=vo.getFreedom_title() %></h1><img id="userim" alt="user" src="<%=request.getContextPath()%>/images/user.png">
<%=vo.getMem_id() %><br><br>
<font size="2"><%=vo.getFreedom_date().substring(0, 10) %>&nbsp;조회수&nbsp;<%=vo.getFreedom_view() %></font>
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
		tagName = "#취준";
	}else if(vo.getTag_num()==2){
		tagName = "#이직";
	}else if(vo.getTag_num()==3){
		tagName = "#퇴사";
	}else if(vo.getTag_num()==4){
		tagName = "#잡담";
	}
%>

<%=tagName%>
<br><br><br><br>
<%
	
} else {	
%>
<h4>게시물이 없습니다</h4>

<%
}
%>



<div id="btd">	

<% if(memid.equals(vo.getMem_id())){ %>
	<button  style='cursor:pointer' class="bt" type="button" id="board_update" class="board_update">게시글 수정</button>
	<button  style='cursor:pointer' class="bt" type="button" id="board_delete" class="board_delete">게시글 삭제</button>	
	
	<%} %>
	<button  style='cursor:pointer' class="bt" type="button" id="tomain">목록으로 돌아가기</button>
</div>
<br>
</div>


<hr width="80%">
<div id= "con3">
<form action="<%=request.getContextPath()%>/freedomRepleInsert.do" method="post">
	<input type="hidden" name="freedom_num" value="<%=vo.getFreedom_num() %>">

	
		
<div id="repled">
	<textarea placeholder="위 고민과 같은 경험이 있거나, 알고 계신 정보가 있다면 조언 부탁드려요~" name="repleContnet" id="repleContnet"></textarea>
</div>
<div id="repled2">	
	<button type="submit" id="reple_write"  style='cursor:pointer'>댓글 작성</button>
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
	  <input freedomNum="<%=rvo.getReple_num() %>" type="button" id="reple_delete"   style='cursor:pointer' class="action" value="댓글삭제">
	  <input freedomNum="<%=rvo.getReple_num() %>" type="button" id="reple_update"   style='cursor:pointer' class="action" value="댓글수정" style="visibility: visible;">
		
	<%} %>
		
	  </div>
	  </p>
 </div>	

<%
 	}
 } else {	
%>

<br>
<h4>댓글이 없습니다</h4>

<%
 }
%>

<div id="repleUpdate" >
<textarea rows="5" cols="50"></textarea>
<br>
<input type="button" value="확인" id="ok">
<input type="button"  value="취소" id="cancle">
</div>




</div>
</article>

</body>
</html>