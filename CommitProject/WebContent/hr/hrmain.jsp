<%@page import="kr.or.ddit.commit.service.ResumeServiceImple"%>
<%@page import="kr.or.ddit.commit.service.IResumeService"%>
<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@page import="kr.or.ddit.commit.vo.JobworkVO"%>
<%@page import="kr.or.ddit.commit.service.JobworkServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IJobworkService"%>
<%@page import="kr.or.ddit.commit.service.RegionServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IRegionService"%>
<%@page import="kr.or.ddit.commit.vo.RegionVO"%>
<%@page import="kr.or.ddit.commit.vo.HrVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commit.service.HrServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IHrService"%>
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
<title>인재풀 메인</title>
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

    background-image: url('<%= request.getContextPath()%>/images/돋보기3.png');
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


.container{
	margin-top:20px;
	margin-bottom: 10px;
	width: 1000px;
}

h1{
	margin-left : 10px;
}
table{
	margin-left : 50px;
	width : 900px;
	font-size: 18px;
	margin-top: 20px;
}

tr, th, td{
	text-align : center;
}

#hrlist{
	border: 2px solid #93D8D9;
	width: 1000px;
	border-radius: 15px;
	margin-top: 30px;
	border-spacing: 10px;
	
	
	
}
.dropdown{
	display : inline-block;
}


</style>

<%
	HttpSession session1 = request.getSession();
// 	MemberVO mem = (MemberVO)session1.getAttribute("loginMember");
	MemberVO mem = (MemberVO)session.getAttribute("loginMember");
// 	out.print("mem : " + mem);
%>


<script type="text/javascript">
	$(function(){
		$('#logout').on('click', function(){
			location.href = "/CommitProject/logout.do"
		});
		
		if(<%=mem.getMem_num()%> == 0){
			alert("접근권한이 없습니다.")
			location.href = "<%=request.getContextPath() %>/board/main2.jsp";
		} else if(<%=mem.getMem_num()%> == 1) {
			alert("기업회원만 이용할 수 있습니다.")
			location.href = "<%=request.getContextPath() %>/board/main2.jsp";
		}
		$('input:checkbox').on('change', function() {
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
			console.log(rchk_arr);
			console.log(jchk_arr);
			$.ajax({
				url : '<%=request.getContextPath()%>/hrFilter.do',
				data : {
					"jarr" : jchk_arr,
					"rarr" : rchk_arr
				},
				type : 'get',
				success : function(res){
					str = "<table>";
					str += "<tr><th>지역</th><th>포지션</th><th>제목</th></tr>"
					if(<%=mem.getMem_num()%> == 0){
						alert("접근 권한이 없습니다.");
					}else{
					$.each(res, function(i,v){
						str += "<tr><td>" + v.resume_area + "</td>"	
						str += "<td>" + v.resume_job + "</td>"	
						str += "<td><a href='<%=request.getContextPath()%>/hr/hrDetail.jsp?resume_num="+v.resume_num+"'>" + v.resume_title + "</a></td></tr>"	
					})
					}
					str += "</table>";
					$('#hrlist1').html(str);
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
		
		
		
	})


</script>


</head>
<body>
<%
	IHrService hservice = HrServiceImpl.getInstance();
	List<HrVO> hlist = hservice.getAllhr();
	
	IRegionService rservice = RegionServiceImpl.getInstance();
	List<RegionVO> rlist = rservice.selectAllRegion();
	
	IJobworkService jservice = JobworkServiceImpl.getInstance();
	List<JobworkVO> jlist = jservice.selectAllJobwork();
	
	MemberVO mvo = new MemberVO();
// 	mvo = (MemberVO) session1.getAttribute("loginMember");
	mvo = (MemberVO) session.getAttribute("loginMember");
	String memid = mvo.getMem_id();
	int num = mvo.getMem_num();
	
	IResumeService service = ResumeServiceImple.getInstance();
	String name = service.userselect(memid);
	String com = service.conselect(memid);

%>		

<header>
    <div id ="nu">
    <%if(memid!=null){ %>
   <button onclick="location.href='<%=request.getContextPath()%>/board/main2.jsp'" type="button" id="logo" href="main2.jsp">
   
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
   
      <button id="my" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/mypageMain.jsp'">
      <font size="2"><b><%=name %>님</b></font></button>
  
   <%
   }else if(num==2){
	   
   %>
   
   	<button id="my" style='cursor:pointer' type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/mypageMain2.jsp'">
      <font size="2"><b><%=com %>님</b></font></button>
      
   <%
   }
   %>
   <%
	if(mvo==null){
		out.print("<font size='2'><b>회원가입/로그인</b></font></button>");
	}else{
		out.print("<button type='button' id='logout' style='cursor:pointer'>로그아웃</button>");
	}
%>
   </div>


</header>



<article>
	<h1><b>인재풀</b></h1>
	<div id="hrlist">
      <div class="container">	
		<div class="dropdown" style="float: left;">
            <button class="btn btn-default dropdown-toggle" type="button"
               id="menu1" data-toggle="dropdown">
               	지역 <span class="caret"></span>
            </button>
			<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
               <li role="presentation">
                   <li><input role="menuitem" tabindex="-1" type="checkbox" id="rall" name="regchk" value="all"> 전체</li>
<%
            for(RegionVO rg : rlist) {
%>
                   <li><input role="menuitem" tabindex="-1" type="checkbox" name="regchk" id="<%= rg.getReg_num() %>" value="<%= rg.getReg_name() %>"> <%= rg.getReg_name() %></li>
<%
            }
%>
			</ul>
		</div>         
        
       	<div class="dropdown" style="float: left;">
            <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
               	포지션 <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
               <li role="presentation">
                   <li><input role="menuitem" tabindex="-1" type="checkbox" id="jall" name="jwchk" value="all"> 전체</li>
<%
            for(JobworkVO jw : jlist) {
%>
                   <li><input role="menuitem" tabindex="-1" type="checkbox" 
                   name="jwchk" id="<%= jw.getWork_num() %>" value="<%= jw.getWork_name() %>"> 
                   <%= jw.getWork_name() %> </li>
<%
            }
%>
            </ul>
            
         </div>
		<div id="hrlist1">
		<table>
		<tr>
		<th>지역<br>&nbsp;</th><th>포지션<br>&nbsp;</th><th>이력서<br>&nbsp;</th>
		</tr>	
<%
	if(mem == null || mem.getMem_num()==1){
		%>
		<script>
		alert("접근 권한이 없습니다.");
		location.href = "<%=request.getContextPath() %>/board/main2.jsp";
		</script>
		<%
	}else{
		for(HrVO hvo : hlist){
%>			
		<tr>
			<td><%=hvo.getResume_area() %></td>
			<td><%=hvo.getResume_job() %></td>
			<td><a href="<%=request.getContextPath() %>/hr/hrDetail.jsp?resume_num=<%=hvo.getResume_num()%>"><%=hvo.getResume_title() %></a></td>
		</tr>
		<% 			
			}
		}
		%>	
			</table><br>
			</div>

	</div>
</div>
         
			
</article>	

</body>
</html>