<%@page import="kr.or.ddit.commit.vo.JobapplyVO"%>
<%@page import="kr.or.ddit.commit.service.JobapplyServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IJobapplyService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.commit.vo.FavoriteVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commit.service.FavoriteServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IFavoriteService"%>
<%@page import="kr.or.ddit.commit.service.RecruitServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IRecruitService"%>
<%@page import="kr.or.ddit.commit.service.CompanyInfoServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.ICompanyInfoService"%>
<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@page import="kr.or.ddit.commit.vo.RecruitVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=024d6ad1cca6e08143bfd68c23308467&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">

/* border 스타일에 white 절대 삭제하지 말것. */

/* html, body{ 이거 엉케해ㅑ야되노
	width: 100%;
	height: 100%;
} */
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
   width: 1000px;
   padding-top: 20px;
   padding-left: 100px;
  
}
#apply1{
	position: fixed;
	top:230px;
	right:450px;
	background: #93D8D9;
	border-radius: 5px;
	width: 150px;
	height: 50px;
}
#apply2{
	position: fixed;
	top:230px;
	right:450px;
	background: #93D8D9;
	border-radius: 5px;
	width: 150px;
	height: 50px;
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


#service{
	text-align: center;
	font-size: 7px;
}

#con{
	border: 2px solid #93D8D9;
	border-radius: 15px;
	width: 850px;
	height: 1200px;
}
.name{
	margin-left: 40px;
	margin-top: 40px;
}
#con2{
	padding-top: 15px;
	margin-left: 50px;
}
#like{
	position: fixed;
	top:230px;
	right:380px;
}
#likeimg{
	border: 2px solid #93D8D9; 
	border-radius: 15px;
	width: 45px;
	height: 45px;
}

</style>
<%
	RecruitVO recruitVo = (RecruitVO)request.getAttribute("recruitVo");
	
	IRecruitService service = RecruitServiceImpl.getInstance();
	service.updateViews(recruitVo.getRecruit_num());
	
	HttpSession session1 = request.getSession();
	
	MemberVO mvo = null;
	String id = null;
	Integer num = 0;
	if(session1.getAttribute("loginMember")!=null){
		mvo = (MemberVO)session1.getAttribute("loginMember");
		id = mvo.getMem_id();
		num = recruitVo.getRecruit_num();
	}
%>
<script type="text/javascript">

$(function(){
	$('#like').on('click', function(){
		if($('#likeimg').attr("src") == "<%=request.getContextPath()%>/images/찜전.png"){
			$.ajax({
				url : '<%=request.getContextPath() %>/FavoriteInsert.do',
				data : {"mem_id" : "<%=id %>", "recruit_num" : "<%=num %>"},
				type : 'post',
				
				success : function(res){
				},
				error : function(xhr){
					alert(xhr.status)
				},
				dataType : 'json'
			})
		} else {
			$.ajax({
				url : '<%=request.getContextPath() %>/FavoriteDelete.do',
				data : {"mem_id" : "<%=id %>", "recruit_num" : "<%=num %>"},
				type : 'post',
				
				success : function(res){
				},
				error : function(xhr){
					alert(xhr.status)
				},
				dataType : 'json'
			})
		}
		location.href="<%=request.getContextPath() %>/recruitDetail.do?recruit_num=<%=recruitVo.getRecruit_num() %>"
	})
	function start(){
	$.ajax({
		url : '<%=request.getContextPath() %>/FavoriteTF.do',
		data : {"mem_id" : "<%=id %>", "recruit_num" : "<%=num %>"},
		type : 'post',
		
		success : function(res){
			if(res.sw == "성공"){
				$('#likeimg').attr("src", "<%=request.getContextPath()%>/images/찜완.png");
			}else{
				$('#likeimg').attr("src", "<%=request.getContextPath()%>/images/찜전.png");
			}
		},
		error : function(xhr){
			alert(xhr.status)
		},
		dataType : 'json'
	})
	}
	start();
	
	
})

</script>
<script>

	function apply1(){
		if("<%=mvo%>" == null){
			alert("회원가입이 필요합니다.");
			location.href = "<%=request.getContextPath()%>/join/joinMain.jsp";
		}
		location.href = "<%=request.getContextPath()%>/recruit/recruitResume.jsp?recruitNum=<%=recruitVo.getRecruit_num()%>";
	}
	
	function apply2(){
		location.href = "<%=request.getContextPath()%>/selectApplicant.do?recruit_num=<%=recruitVo.getRecruit_num()%>";
	}
	
</script>
</head>
<body>


<header>
    <div id ="nu">
   <button onclick="location.href='<%=request.getContextPath()%>/board/main2.jsp'" type="button" id="logo" href="main.jsp">
   <img style='cursor:pointer' id="logoimg" alt="로고.png" src="./images/심플로고1.PNG">
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
      <%
	if(mvo==null){
		out.print("<font size='2'><b>회원가입/로그인</b></font></button>");
	}else{
		out.print("<button type='button' id='logout' style='cursor:pointer'>로그아웃</button>");
	}
%></button>
   
   </div>


</header>


<article>
<h1>채용공고</h1>
<div id="con">

<h2 class="name"><%= recruitVo.getRecruit_name() %></h2>
<h4 class="name"><%= recruitVo.getCom_name() %></h4>
<hr width="90%">
<div id="con2">
<h3>포지션</h3>
<%= recruitVo.getWork_name() %>
<h3>기술스택</h3>
<%= recruitVo.getRecruit_skill() %>
<h3>주요업무</h3>
<%= recruitVo.getRecruit_duty() %>
<h3>자격요건</h3>
<%= recruitVo.getRecruit_qlt() %>
<h3>우대사항</h3>
<%= recruitVo.getRecruit_spec() %>
<h3>복지및혜택</h3>
<%= recruitVo.getRecruit_bnf() %>
<h3>찾아오시는 길</h3>
<div id="map" style="width:300px;height:300px;margin-top:10px;display:block"></div>
		<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

   		//지도를 미리 생성
   		var map = new daum.maps.Map(mapContainer, mapOption);
   		//주소-좌표 변환 객체를 생성
   		var geocoder = new daum.maps.services.Geocoder();
   		//마커를 미리 생성
  		var marker = new daum.maps.Marker({
  		position: new daum.maps.LatLng(37.537187, 127.005476),
  		map: map
 		});
		<% 
			ICompanyInfoService service1 = CompanyInfoServiceImpl.getInstance();
			String addr = service1.companyMap(recruitVo.getMem_id());
		%>
        // 주소로 상세 정보를 검색
        geocoder.addressSearch("<%=addr %>", function(results, status) {
            // 정상적으로 검색이 완료됐으면
            if (status === daum.maps.services.Status.OK) {

                var result = results[0]; //첫번째 결과의 값을 활용

                // 해당 주소에 대한 좌표를 받아서
                var coords = new daum.maps.LatLng(result.y, result.x);
                // 지도를 보여준다.
                mapContainer.style.display = "block";
                map.relayout();
                // 지도 중심을 변경한다.
                map.setCenter(coords);
                // 마커를 결과값으로 받은 위치로 옮긴다.
                marker.setPosition(coords)
            }
        });
          
		</script>
</div>
</div>
</article>

<aside>
<% 
if(mvo != null){
	if((mvo.getMem_id()).equals(recruitVo.getMem_id())){ %>
<aside>
<button id="apply2" type="button" onclick="apply2()" style='cursor:pointer'>
<font size="3"><b>지원자 현황보기</b></font></button>
</aside>
<%} else { %>
<aside>
<%
IJobapplyService service2 = JobapplyServiceImpl.getInstance();
JobapplyVO jvo = new JobapplyVO();
System.out.println(recruitVo.getRecruit_num());
System.out.println(id);

jvo.setRecruit_num(recruitVo.getRecruit_num());
jvo.setMem_id(id);
int count = service2.selectRecruit2(jvo);
System.out.println(count+100);
if(count > 0){
%>
<button id="apply1" type="button" >
<font size="3"><b>지원 완료</b></font></button>
<%} else { %>
<button id="apply1" type="button" onclick="apply1()" style='cursor:pointer'>
<font size="3"><b>지원하기</b></font></button>
<%} %>
<div id="blike">
<button id="like"  style='cursor:pointer' type="button"><img id="likeimg" src="<%=request.getContextPath()%>/images/찜전.png"></button>
</div>
</aside>
<%}} %>

</aside>

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


