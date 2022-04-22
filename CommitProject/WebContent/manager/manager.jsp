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
<script src="<%=request.getContextPath()%>/manager/board.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<style>

body{
   min-width: 1600px;
    margin: 0;
  padding: 0;
  list-style: none;
}

ul,li {
  margin: 0;
  padding: 0;
  list-style: none;
}

a {
  color: inherit;
  text-decoration: none;
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
article{ /* 아니섹션 미친럼 inline이라 옆에 아무도 올 수 없는 개왕따 */
  	margin-top: 50px;
   width:800px;
   margin-left: 450px;
   
}


footer{
 
   margin-top: 1000px;
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


.p1{
  width : 80%;
  padding : 5px;
  margin : 3px;
  float : left;
}
.p2{
  clear : both;
}
.p3{
  width : 17%;
  padding : 5px;
  margin : 2px;
  float : right ; 
}
.pager{
  width : 100px;
  float : left;
  margin :5px;
  margin-left : 5%;
}
.b{
	background: #93D8D9;
	border-radius: 5px;
	width: 70px;
	height: 30px;
}
#pageList{
	margin-left: 300px;
}
</style>

<!-- 
회원 정보 조회 및 삭제
- 회원 관리 버튼(구직자, 회사)
- 회원 목록
- 회원마다 우측에 조회, 삭제 버튼 > 상세조회 <아코디언> 
 -->

<%	
//현재 Session가져오기 위한 객체 생성
HttpSession session1 = request.getSession();

//Session값을 읽어오기
MemberVO mem = (MemberVO)session1.getAttribute("loginMember");

String memid = mem.getMem_id();
Integer num = mem.getMem_num();
IResumeService service3 = ResumeServiceImple.getInstance();

String com = service3.conselect(memid);
String name = service3.userselect(memid);
%>	


<script>
currentPage = 1;

$(function(){
	
	listPage(currentPage);
	
	//리스트 이벤트 
	$('#list').on('click', '.action', function(){
		 name = $(this).attr('name');	 
		
		if(name== "delete"){
// 			 alert(idx + "번째 글을 삭제합니다");
		 
			 deleteBoard();//db삭제 - 후 다시 리스트 출력
		}
		if(name== "detail"){
		 idx = $(this).attr('idx');
		 idnum = $(this).attr('id_num');
		 viewEl = $(this).parent().parent();
			 detailMember(viewEl, idx, idnum);
		}
	})	
	
	//페이지번호  리스트 이벤트 
	$('#pageList').on('click', '.paging', function(){
		currentPage =   $(this).text().trim();
		
		option = $('select[name=search_MemNum]').val();
		text = $('input[name=search_MemId]').val();
// 		listPage(currentPage);
		searchMember(currentPage);
	})
	//next이벤트 
	$('#pageList').on('click', '.next', function(){
		 currentPage =   parseInt($('.paging').last().text().trim()) + 1;
		 option = $('select[name=search_MemNum]').val();
		 text = $('input[name=search_MemId]').val();
// 		 listPage(currentPage);
			searchMember(currentPage);
	})
	//previous 이벤트
	$('#pageList').on('click', '.prev', function(){
		 currentPage =   parseInt($('.paging').first().text().trim()) - 1;
		 option = $('select[name=search_MemNum]').val();
		 text = $('input[name=search_MemId]').val();
// 		 listPage(currentPage);
			searchMember(currentPage);
	})
	
	// 검색이벤트
	$('#search').on('click', function(){
		 select = $(this).parent().find('select');
		 option = $('option:checked', select).val();
		 text = $(this).parent().find('input').val();
// 		 
	searchMember(currentPage);
			searchMember(1);
		})

	})//$function
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
<h2><b>관리자 메인 페이지 입니다.</b></h2>
<br>
<div>
	<form>
<%-- 	<form action="<%=request.getContextPath()%>"> --%>
	<select name="search_MemNum">
	 	 <option value="1" >개인회원</option> 
	 	 <option value="2" >기업회원</option>
	 	 <option value="3" >관리자</option>
	</select>
	 	<input type="text" name="search_MemId" placeholder="입력하세요">
	 	<button class="b" type="button" id="search">검색</button>
	 	<button class="b" type="button" id="total" onclick="location.href='<%=request.getContextPath() %>/manager/manager.jsp'">전체보기</button>
	 	<button class="b" type="button" id="total" onclick="location.href='<%=request.getContextPath() %>/board/main2.jsp'">홈가기</button>	 	
	</form>
	<br>
</div>

<div id="list"></div>
<div id="pageList"></div>
</article>

</body>
</html>