<%@page import="kr.or.ddit.commit.vo.JobapplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<JobapplyVO> jobList = (List<JobapplyVO>)request.getAttribute("list");
%>

[
<%
	for(int i = 0; i < jobList.size(); i++) {
		JobapplyVO vo = jobList.get(i);
		if(i > 0) out.print(",");
%>
	{
		"gender" : "<%= vo.getMem_gender() %>",
		"gcnt" : "<%= vo.getGender_cnt() %>"	
	}

<%
	}
%>
]