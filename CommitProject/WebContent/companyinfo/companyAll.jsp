<%@page import="kr.or.ddit.commit.vo.CompanyVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commit.service.CompanyInfoServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.ICompanyInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=024d6ad1cca6e08143bfd68c23308467&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
	#logo {
		width: 150px;
		height: 150px;
		display: inline-block;
		float: left;
	}
	#name{
		/* border: 1px solid red; */
		width: 500px;
		
	}
	#cominfo{
		/* border: 1px solid red; */
		margin-top: 100px;
		width: 900px;
	}
	.imgg{
		width: 60px;
		height: 60px;
		margin-right: 80px;
	}
	#cominfo2{
	/* 	border: 1px solid red; */
		width: 100px;
		height: 400px;
		display: inline-block;
		float: left;
		font-size: 17px;
		font-weight: bold;
		margin-left: 100px;
	}
	#cominfo3{
	/* border: 1px solid blue; */
	float: left;
	width: 300px;
	height: 400px;
	font-size: 17px;
	
	}
	#cominfo11{
	
		padding-left: 100px;
	}
	#map {
	overflow: visible;
	
	}
	#year{
	
	width: 140px;
	display: inline-block;
	float: left;
	}
	#di{
	
	display: inline-block;
	float: left;
	width: 160px;
	}
	#mem{
	
	display: inline-block;
	float: left;
	width: 110px;
	}
	#sales{
	
	display: inline-block;
	float: left;
	width: 150px;
	}
	#income{
	
	
	float: left;
	}
</style>
</head>
<body>
<%
	String id = request.getParameter("mem_id");
	ICompanyInfoService service = CompanyInfoServiceImpl.getInstance();
	CompanyVO cvo = service.companyDetail(id);
%>
<img src="/CommitProject/companylogo/<%=cvo.getCom_img()%>" id="logo">
		<div id="name"><h2><%=cvo.getCom_name()%></h2></div><br><br>

	<div id="cominfo">
	<h2><b>기업개요</b></h2>
	<hr><br>
	<div id ="cominfo11">
	<img class="imgg" src="<%=request.getContextPath() %>/images/time.png">
	<img class="imgg" src="<%=request.getContextPath() %>/images/office-building.png">
	<img class="imgg" src="<%=request.getContextPath() %>/images/group.png">
	<img class="imgg" src="<%=request.getContextPath() %>/images/profit.png">
	<img class="imgg" src="<%=request.getContextPath() %>/images/payment.png"><br>
	
	<div id="year"><font class ="fontc" size="4"><b><%=cvo.getCom_bir().substring(0, 10) %></b></font><br>설립연도</div>
	<div id="di"><font class ="fontc" size="4"><b><%=cvo.getCom_div() %></b></font><br>기업형태</div>
	<div id="mem"><font class ="fontc" size="4"><b><%=cvo.getCom_memnum() %>명</b></font><br>사원수</div>
	<div id="sales"><font class ="fontc" size="4"><b><%=cvo.getCom_sales().replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",") %>원</b></font><br>매출액</div>
	<div id="income"><font class ="fontc" size="4"><b><%=cvo.getCom_income().replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",") %>원</b></font><br>평균연봉</div>
	<br>
	
	</div>
	<br><hr><br><br>
	<div id="cominfo2">업종<br><br>대표자명<br><br>홈페이지<br><br>기업주소<br><br>이메일<br><br>대표번호</div>
	<div id="cominfo3"><%=cvo.getCom_job() %><br><br><%=cvo.getCom_ceo() %><br><br><%=cvo.getCom_url() %><br><br>
	<%=cvo.getCom_addr1() + " " + cvo.getCom_addr2() %><br><br><%=cvo.getMem_id() %><br><br><%=cvo.getCom_tel() %><br><br>
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
			String addr = service1.companyMap(id);
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
	</div><br>
	
</body>
</html>