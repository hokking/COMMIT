<%@page import="kr.or.ddit.commit.vo.HrVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<HrVO> list = (List<HrVO>)request.getAttribute("list");
%>
[
<%
	for(int i = 0; i < list.size(); i++){
		HrVO vo = list.get(i);
		if(i > 0) out.print(",");
%>		
	{	
		"resume_num" : "<%= vo.getResume_num() %>",
		"resume_area" : "<%= vo.getResume_area() %>",
		"resume_job" : "<%= vo.getResume_job() %>",
		"resume_title" : "<%= vo.getResume_title() %>"
	}
<%

	}

%>	
]

