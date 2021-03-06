<%@page import="kr.or.ddit.commit.vo.RecruitVO"%>
<%@page import="kr.or.ddit.commit.service.RecruitServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IRecruitService"%>
<%@page import="kr.or.ddit.commit.service.RegionServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.JobworkServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IRegionService"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commit.service.IJobworkService"%>
<%@page import="kr.or.ddit.commit.vo.JobworkVO"%>
<%@page import="kr.or.ddit.commit.vo.RegionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<%
	int recruitNum = Integer.parseInt(request.getParameter("recruitNum"));	

	IJobworkService service = JobworkServiceImpl.getInstance();
	List<JobworkVO> jobList = service.selectAllJobwork();
	
	IRegionService gservice = RegionServiceImpl.getInstance();
	List<RegionVO> regionList = gservice.selectAllRegion();
	
	IRecruitService rservice = RecruitServiceImpl.getInstance();
	RecruitVO vo = rservice.selectRecruit(recruitNum);
	
%>

<script type="text/javascript">
	$(function() {
		$('#reg option[value="<%=vo.getReg_num()%>"]').prop("selected", true);
		$('#pst option[value="<%=vo.getWork_num()%>"]').prop("selected", true);
		console.log(<%=vo.getWork_num()%>);
		console.log(<%=vo.getReg_num()%>);
		$('#update').on('click', function() {
			data = $('#recruitUpdate').serializeArray();
			data.push({name : 'rn', value : '<%=recruitNum%>'});
			console.log(data);
			$.ajax({
				url : '<%=request.getContextPath()%>/recruitUpdate.do',
				data : data,
				type : 'get',
				dataType : 'json'
			})
			location.href='<%=request.getContextPath()%>/mypage/recruitMyDetail.jsp?recruit_num=<%=vo.getRecruit_num()%>';
		})
	})
</script>
</head>
<body>
<div>

	<form id="recruitUpdate">
		<table>
			<tr>
				<td><label>?????????</label></td>
				<td><input class="intxt" type="text" name="title" value="<%=vo.getRecruit_name()%>"></td>
			</tr>
			<tr>
   				<td colspan="2"><label>???????????????</label></td>
   			</tr>
   			<tr>
   				<td colspan="2">
   				<%=(vo.getRecruit_start()).substring(0, 10)%> ~ <%= (vo.getRecruit_end()).substring(0, 10) %>
   				</td>
   			</tr>
	    	<tr>
	    		<td><label>?????????</label></td>
	    		<td>
	    			<select id="pst" name="pst">
	    				<option> --?????????-- </option>
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
   				<td><label>??????</label></td>
   				<td>
   					<select id="reg" name="reg">
   						<option> --??????-- </option>
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
     		<tr><td colspan="2"><label>?????? ??????</label><br></td></tr>
   			<tr><td colspan="2"><textarea name="skill" rows="10" cols="50"><%= vo.getRecruit_skill() %></textarea></td></tr>
   			<tr><td colspan="2"><label>????????????</label></td></tr>
	 		<tr><td colspan="2"><textarea name="duty" rows="10" cols="50"><%= vo.getRecruit_duty() %></textarea></td></tr>
     		<tr><td colspan="2"><label>????????????</label><br></td></tr>
   			<tr><td colspan="2"><textarea name="spec" rows="10" cols="50"><%= vo.getRecruit_spec() %></textarea></td></tr>
	   		<tr><td colspan="2"><label>????????????</label></td></tr>
	 		<tr><td colspan="2"><textarea name="qlt" rows="10" cols="50"><%= vo.getRecruit_qlt() %></textarea></td></tr>
	   		<tr><td colspan="2"><label>????????? ??????</label></td></tr>
	 		<tr><td colspan="2"><textarea name="bnf" rows="10" cols="50"><%= vo.getRecruit_bnf() %></textarea></td></tr>
		</table>
  	</form>
  	<button id="update" style="padding:10px; margin-left:10%">??????</button>
	</div>
</body>
</html>