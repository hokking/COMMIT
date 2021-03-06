<%@page import="kr.or.ddit.commit.service.ResumeServiceImple"%>
<%@page import="kr.or.ddit.commit.service.IResumeService"%>
<%@page import="kr.or.ddit.commit.vo.CompanyVO"%>
<%@page import="kr.or.ddit.commit.service.CompanyInfoServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.ICompanyInfoService"%>
<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@page import="kr.or.ddit.commit.vo.RegionVO"%>
<%@page import="kr.or.ddit.commit.service.RegionServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IRegionService"%>
<%@page import="kr.or.ddit.commit.vo.JobworkVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commit.service.JobworkServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IJobworkService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">              
<script src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<title>Insert title here</title>
<%
	HttpSession session1 = request.getSession();
	MemberVO loginMember = (MemberVO)session1.getAttribute("loginMember");

	ICompanyInfoService cservice = CompanyInfoServiceImpl.getInstance();
	CompanyVO cvo = cservice.companyDetail(loginMember.getMem_id());
	
	
	
	String memid = loginMember.getMem_id();
	Integer num = loginMember.getMem_num();
	IResumeService service3 = ResumeServiceImple.getInstance();
	int rs = service3.selectresume(memid); 
	String com = service3.conselect(memid);
	String name = service3.userselect(memid);
%>
<script>
	$(function() {
		
		var IMP = window.IMP;
		IMP.init("imp75988108");
		$('#check_module').on('click', function() {
			IMP.request_pay({
				pg: 'inicis',
				pay_method: 'card',
				merchant_uid: 'commit_' + new Date().getTime(),
				name: '??????????????????',
				amount: parseInt($("#rview option:selected").val()) * 10000,
// 				amount: 100,
				buyer_email: '<%=cvo.getMem_id()%>',
				buyer_name: '<%=cvo.getCom_name()%>',
				buyer_tel: '<%=cvo.getCom_tel()%>',
				buyer_addr: '<%=cvo.getCom_addr1() + " " + cvo.getCom_addr2()%>'
			}, function(rsp) {
// 		 		var formData = new FormData();
		 		data = $('#recruitInsert').serializeArray();
	            data.push({name : 'method', value : rsp.pay_method});
	            data.push({name : 'amount', value : rsp.paid_amount});
	            data.push({name : 'id', value : '<%=cvo.getMem_id()%>'});
		 		
// 		 		formData.append("method", rsp.pay_method);
// 		 		formData.append("amount",rsp.paid_amount);
<%-- 		 		formData.append("id", '<%=cvo.getMem_id()%>'); --%>
// 		 		formData.append("title", $('#title').val());
// 		 		formData.append("sdate", $('#sdate').val());
// 		 		formData.append("pst", $('#pst option:selected').val());
// 		 		formData.append("reg", $('#reg option:selected').val());
// 		 		formData.append("skill", $('#skill').val());
// 		 		formData.append("duty", $('#duty').val());
// 		 		formData.append("spec", $('#spec').val());
// 		 		formData.append("qlt", $('#qlt').val());
// 		 		formData.append("bnf", $('#bnf').val());
		         
// 		 	    for(var i=0; i<$('#img')[0].files.length; i++){
// 		 	        formData.append('uploadFile', $('#img')[0].files[i]);
// 		 	    }
// 				console.log(formData);
				console.log(rsp);
				if (rsp.success) {
					$.ajax({
						url : '<%=request.getContextPath()%>/recruitInsert.do',
						type : 'post',
						data : data,
						dataType : 'json'
					})
					
// 					$.ajax({
<%-- 						url : '<%=request.getContextPath()%>/recruitInsert.do', --%>
// 						contentType : false,
//         				processData : false,
// 						type : 'post',
// 						data : formData,
// 						dataType : 'json'
// 					})
					
				
					var msg = '????????? ?????????????????????.';
// 					msg += '??????ID : ' + rsp.imp_uid;
// 					msg += '?????? ??????ID : ' + rsp.merchant_uid;
// 					msg += '?????? ?????? : ' + rsp.paid_amount;
// 					msg += '?????? ???????????? : ' + rsp.apply_num;
// 					msg += '?????? ?????? ?????? : ' + rsp.paid_at;
// 					msg += '?????? ?????? : ' + rsp.pay_method;
// 					msg += '?????? ?????? : ' + rsp.paid_amount;
					location.href= "<%=request.getContextPath()%>/mypage/mypageMain2.jsp";
				} else {
					var msg = '????????? ?????????????????????.';
// 					msg += '???????????? : ' + rsp.error_msg;
				}
				alert(msg);
			})
		})
	})
</script>
<style type="text/css">
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
article{ /* ???????????? ????????? inline?????? ?????? ????????? ??? ??? ?????? ????????? */
  	margin-top: 50px;
   width:800px;
   margin-left: 400px;
   
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

/*?????????*/

.con {
  max-width: 1200px;
}

/*????????? ?????? ???*/
.side-menu-button {
  display: none;
}
@media (max-width: 2800px) {
  .side-menu-button {
    display: block;
  }
}
/*????????? ?????? ??????*/
.side-menu-button {
  position: absolute;
  top: 20px;
  left: 20px;
  cursor: pointer;
  
}
.side-menu-button .img-box {
  margin-top: 30px;
  width: 20px;
}
/*????????? ?????? ??????*/
.side-menu-button:hover .side-menu-bar {
  left: 0;
}
.side-menu-bar {
  position: fixed;
  top: 0;
  left: -300px;
  height: 100%;
  width: 300px;
  background-color: white;
  box-sizing: border-box;
  z-index:3;
  transition: left 1s;
}
.side-menu-bar .side-menu-box ul > li {
  position: relative;
  background-color: #dfdfdf;
}
.side-menu-bar .side-menu-box > ul {
  margin-top: 40px;
}
.side-menu-bar .side-menu-box ul > li > a {
  display: block;
  padding: 20px;
  font-weight: bold;
  white-space: nowrap;
}
.side-menu-bar .side-menu-box > ul > li > a {
  padding-left: 40px;
}
.side-menu-bar .side-menu-box ul > li:hover > a {
  color: white;
  background-color:  #93D8D9;
}
.side-menu-bar .side-menu-box ul ul {
  display: none;
  position: absolute;
  top: 0;
  left: 100%;
}
.side-menu-bar .side-menu-box ul > li:hover > ul {
  display: block;
}
.img-box img {
  display: block;
  width: 100%;
}

#con{
background: #white;
	border-radius: 15px;
	border: 2px solid #93D8D9;
	width: 950px;
	padding-left: 100px;
}
#title{
	text-align: center;
	font-size: 25px;
	font-weight: bold;
	color: grey;
}

table{
	margin-top: 50px;
}

#check_module{
	background: #93D8D9;
	border-radius: 5px;
	margin-left: 700px;
	width: 80px;
	height: 40px;
	font-size: 15px;
}

</style>
</head>
<body>

<%
	IJobworkService service = JobworkServiceImpl.getInstance();
	List<JobworkVO> jobList = service.selectAllJobwork();
	
	IRegionService gservice = RegionServiceImpl.getInstance();
	List<RegionVO> regionList = gservice.selectAllRegion();
	
	
	
%>

<header>

<div class="side-menu-button">
  <div class="img-box">
    <img src="<%=request.getContextPath() %>/images/????????????.png" alt="">
  </div>
  <div class="side-menu-bar">
    <nav class="side-menu-box">
      <ul>
        <li>
          <a href="<%=request.getContextPath() %>/mypage/mypageMain.jsp">MyHome</a>
        </li>
        <li>
          <a href="<%=request.getContextPath() %>/mypage/resume.jsp">?????????</a>
          <ul>
            <li><a href="<%=request.getContextPath() %>/mypage/resume.jsp">????????? ??????</a></li>
            <li><a href="<%=request.getContextPath() %>/mypage/resumeWrite.jsp">????????? ??????</a></li>
          </ul>
        </li>
        <li>
          <a href="<%=request.getContextPath() %>/mypage/statusApply.jsp">????????????</a>
         
        </li>
        <li>
          <a href="<%=request.getContextPath() %>/favorite/favoritemain.jsp">????????????</a>
         
        </li>
        <li>
          <a href="<%=request.getContextPath() %>/mypage/info.jsp">??????????????????</a>
       
        </li>
    </nav>
  </div>
</div>



    <div id ="nu">
   <button onclick="location.href='<%=request.getContextPath()%>/board/main2.jsp'" type="button" id="logo" href="main.jsp">
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

<h1>????????????</h1>

	<div id="con">
	   
	   <form id="recruitInsert">
	   	
	   		<table>
				<tr>
					
					<td><input id="title" class="intxt" type="text" name="title" placeholder="??????????????? ???????????????"></td>
				</tr>
				<tr>
    				
    				<td><input class="intxt" type="date" name="sdate" id="sdate"></td>
    			</tr>
				<tr>
    				
    				<td>
    					<select id="rview" name="rview">
    						<option>???????????????</option>
    						<option value="7">7???</option>
    						<option value="14">14???</option>
    					</select>
    				</td>
    			</tr>
		    	<tr>
		    	
		    		<td>????<select id="pst" name="pst">
		    				<option>?????????</option>
<%
				for(JobworkVO jw : jobList) {
%>
    				<option value="<%= jw.getWork_num()%>"><%= jw.getWork_name() %></option>
<%
				}
%>
    					</select>
    				</td>
    			</tr>
    			<tr>
    				
    				<td>?????????????<select id="reg" name="reg">
    						<option>??????</option>
<%
				for(RegionVO rg : regionList) {
%>
    				<option value="<%= rg.getReg_num() %>"><%= rg.getReg_name() %></option>
<%
				}
%>
    					</select>
    				</td>
    			</tr>
	   			<tr><td colspan="2"><h2>????????????/??????</h2>
  	 			<font size = "4"><b>????????????</b></font><br></td></tr>
		 		<tr><td colspan="2"><textarea name="skill" id="skill" rows="10" cols="50" placeholder="java , oracle"></textarea></td></tr>
	   			
	   			<tr><td colspan="2"><label><font size = "4"><b>????????????</b></font></label></td></tr>
		 		<tr><td colspan="2"><textarea name="duty" id="duty" rows="10" cols="50" placeholder="???????????? ????????? ??????????????? ??????, ?????? "></textarea></td></tr>
		 		
      			<tr><td colspan="2"><label><font size = "4"><b>????????????</b></label><br></td></tr>
    			<tr><td colspan="2"><textarea name="spec" id="spec" rows="10" cols="50" placeholder="??????/??????"></textarea></td></tr>
		   		<tr><td colspan="2"><label><font size = "4"><b>????????????</b></label></td></tr>
		 		<tr><td colspan="2"><textarea name="qlt" id="qlt" rows="10" cols="50" placeholder="??????????????? ?????? ?????? 5??? ??????, ?????? ?????? ????????? ?????? ????????? ????????? ?????? ???"></textarea></td></tr>
		   		<tr><td colspan="2"><label><font size = "4"><b>???????????????</b></label></td></tr>
		 		<tr><td colspan="2"><textarea name="bnf" id="bnf" rows="10" cols="50" placeholder=" ?????? ?????? ??????"></textarea></td></tr>
<!-- 		   		<tr><td colspan="2"><label><font size = "4"><b>???????????????</b></label></td></tr> -->
<!-- 		 		<tr><td colspan="2"><input type="file" id="img" name="img" rows="10" cols="50"></td></tr> -->
				<tr>
				
				</tr>
			</table><br><br>
   		</form>
		
      <button id="check_module" style='cursor:pointer'>??????</button><br><br>
<!--       <button id="save" style="padding:10px; margin-left:10%">??????</button> -->
	</div>
	
	</article>
</body>
</html>