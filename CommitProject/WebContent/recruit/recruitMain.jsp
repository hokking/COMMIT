<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@page import="kr.or.ddit.commit.vo.RegionVO"%>
<%@page import="kr.or.ddit.commit.service.RegionServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IRegionService"%>
<%@page import="kr.or.ddit.commit.vo.RecruitVO"%>
<%@page import="kr.or.ddit.commit.service.RecruitServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IRecruitService"%>
<%@page import="kr.or.ddit.commit.vo.JobworkVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commit.service.JobworkServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IJobworkService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<%
   IJobworkService jservice = JobworkServiceImpl.getInstance();
   List<JobworkVO> jobList = jservice.selectAllJobwork();
   
   IRecruitService rservice = RecruitServiceImpl.getInstance();
   List<RecruitVO> recruitList = rservice.selectAllRecruitPop();
   
   IRegionService gservice = RegionServiceImpl.getInstance();
   List<RegionVO> regionList = gservice.selectAllRegion();
   
   HttpSession session1 = request.getSession();
//    MemberVO mem = (MemberVO)session1.getAttribute("loginMember");
   
   MemberVO mem = (MemberVO)session.getAttribute("loginMember");
   //out.print("mem1 : " + mem);
%>
<script>
	$(function() {
		$('#logout').on('click', function(){
			location.href = "/CommitProject/logout.do"
		})
		
		$('#filt').html($('input:radio[name=a]').val());
		
		$('input').on('change', function() {
			rchk_arr = new Array();
			jchk_arr = new Array();
			$('input:checkbox[name=regchk]:checked').each(function() {
				var chk = $(this).val();
				if(chk == 'all') {
					rchk_arr = new Array();
					return false;
				}
				rchk_arr.push(chk);
			})
			
			$('input:checkbox[name=jwchk]:checked').each(function() {
				var chk = $(this).val();
				if(chk == "all") {
					jchk_arr = new Array();
					return false;
				}
				jchk_arr.push(chk);
			})
			$('input:radio[name=a]:checked').each(function() {
				aa = $(this).val();
				$('#filt').html(aa);
			})
			
// 			$('#aa').on()
			console.log(rchk_arr);
			console.log(jchk_arr);
			console.log(aa);
			$.ajax({
				url : '<%=request.getContextPath()%>/recruitFilter.do',
				data : {
					"jarr" : jchk_arr,
					"rarr" : rchk_arr,
					"filt" : aa
				},
				type : 'get',
				success : function(res) {
					str = "<table>";
					$.each(res, function(i, v) {
						if(i % 4 == 0 && i < res.size) {
							str += "<tr>";
						}
						str += "<td>";
						str += "<a href='<%= request.getContextPath()%>/recruitDetail.do?recruit_num=" + v.recruitNum + "'>";
						str += "<img class='pimg' src='<%=request.getContextPath()%>/images/??????"+(i%4+1)+".PNG' alt=''><br>";
						str += "<h4>" + v.recruitName + "</h4>";
						str += v.recruitSkill + "<br>";
						str += "[" + v.regName + "]";
						str += v.recruitSpec;
						str += "</a></td>";
						if(i > 0 && i % 4 == 3) {
							str += "</tr>";
						}
						
					})
					str += "</table>";
					$('#rview').html(str);
					
				},
				dataType : 'json'

			})

		})
		$('#rall').on('click', function() {
			if ($('#rall').is(':checked')) {
				$('input[name=regchk]:checkbox').prop('checked', true);
			} else {
				$('input[name=regchk]:checkbox').prop('checked', false);
			}
		})
		$('#jall').on('click', function() {
			if ($('#jall').is(':checked')) {
				$('input[name=jwchk]:checkbox').prop('checked', true);
			} else {
				$('input[name=jwchk]:checkbox').prop('checked', false);
			}
		})
		
		
		$('#sbar3').on('click', function() {
			data = $('#sbar2').val();
			console.log(data);
			$.ajax({
				url : '<%=request.getContextPath()%>/recruitSearch.do',
				type : 'post',
				data : {"data" : data},
				success : function(res) {
					str = "<br><br><br><h3>?????? ??????</h3>";
					str += "<table>";
					$.each(res, function(i, v) {
						if(i % 4 == 0 && i < res.size) {
							str += "<tr>";
						}
						str += "<td>";
						str += "<a href='<%= request.getContextPath()%>/recruitDetail.do?recruit_num=" + v.recruitNum + "'>";
						str += "<img class='pimg' src='<%=request.getContextPath()%>/images/??????"+(i%4+1)+".PNG' alt=''><br>";
						str += "<h4>" + v.recruitName + "</h4>";
						str += v.recruitSpec + "<br>";
						str += v.recruitSkill + "<br>";
						str += v.regName;
						str += "</a></td>";
						if(i > 0 && i % 4 == 3) {
							str += "</tr>";
						}
						
					})
					str += "</table>";
					$('#rview').html(str);
					
				},
				dataType : 'json'
			})
		})
		// ??????????????? ?????????
		

	})
</script>
   
    <link
    rel="shortcut icon"
    size="64*64" 
    href="./images/?????????.png"
     />

<%
   request.setAttribute("page", 1);
%>


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
#nu{
	
	width:800px;
	height: 70px;
	float: left;
}
section{ /* ???????????? ????????? inline?????? ?????? ????????? ??? ??? ?????? ????????? */
  
   width: 500px;
   padding-left: 400px;
   display: inline-block;
    float: left;
}

aside{

   width:  500px;
   float: left;
   height: 230px;
   margin-left: 160px;
   margin-bottom: 50px;
    float: left;
}

article{
   margin-left: 310px;
  margin-top: 60px;
   width: 1500px;
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
.container{
	margin-top:20px;
	margin-bottom: 10px;
	width: 1000px;
	float: left;
}

a{
	color: black;
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}

</style>
</head>
<body>

<header>
    <div id ="nu">
   <%if(mem!=null){ %>
   <button onclick="location.href='<%=request.getContextPath()%>/board/main2.jsp'" type="button" id="logo" href="main2.jsp">
   
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
      <button id="my" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath() %>/board/login.jsp'">
<%
	if(mem==null){
		out.print("<font size='2'><b>????????????/?????????</b></font></button>");
	}else{
		out.print("<button type='button' id='logout' style='cursor:pointer'>????????????</button>");
	}
%>
      </button>
   
   </div>


</header>

<article>
 <h1><b>????????????</b></h1>
      <div class="container">
         <div class="dropdown" style="float: left;">
            <button class="btn btn-default dropdown-toggle" type="button"
               id="menu1" data-toggle="dropdown">
               	?????? <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                  <li><input role="menuitem" tabindex="-1" type="checkbox" id="rall" name="regchk" value="all"> ??????</li>
<%
            for(RegionVO rg : regionList) {
%>
                  <li><input role="menuitem" tabindex="-1" type="checkbox" name="regchk" id="<%= rg.getReg_num() %>" value="<%= rg.getReg_num() %>"> <%= rg.getReg_name() %></li>
<%
            }
%>
            </ul>
         </div>
         <div class="dropdown" style="float: left;">
            <button class="btn btn-default dropdown-toggle" type="button"
               id="menu1" data-toggle="dropdown">
               	????????? <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                  <li><input role="menuitem" tabindex="-1" type="checkbox" id="jall" name="jwchk" value="all"> ??????</li>
<%
            for(JobworkVO jw : jobList) {
%>
                  <li><input role="menuitem" tabindex="-1" type="checkbox" 
                   name="jwchk" id="<%= jw.getWork_num() %>" value="<%= jw.getWork_num() %>"> 
                   <%= jw.getWork_name() %> </li>
<%
            }
%>
            </ul>
         </div>
         <div class="dropdown" style="float: right;">
         	<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="filt">
			<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" aria-labelledby="menu1" id="aa">
                <li><input role="menuitem" tabindex="-1" type="radio" id="pop" name="a" value="?????????" checked="checked"> ?????????</li>
                <li><input role="menuitem" tabindex="-1" type="radio" id="new" name="a" value="?????????"> ?????????</li>
			</ul>
		</div>
	</div>
      
   
   <div id="rview">
	   <table>
<%
	      for(int i = 0; i < recruitList.size(); i++) {
	         RecruitVO vo = recruitList.get(i);
	         if(i % 4 == 0 && i < recruitList.size()) {
%>
	      <tr>
<%
	         }
%>
	         <td>
	         	<a id="hi" href="<%= request.getContextPath()%>/recruitDetail.do?recruit_num=<%= vo.getRecruit_num()%>">
	            <img class="pimg" src="<%=request.getContextPath()%>/images/??????<%=i%4 + 1%>.PNG" alt=""><br>
	           
	            <h4><b><%= vo.getRecruit_name() %></b></h4>
	            <%= vo.getRecruit_skill() %><br>
	            [<%= rservice.selectRegion(vo.getRecruit_num()) %>]
	              <%= vo.getRecruit_spec() %>
	         	</a>
	         </td>
	      
<%
	         if(i > 0 && i % 4 == 3) {
%>
	      </tr>
<%
	         }
	      }
%>
	        
	   </table>
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
