<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//서블릿에서 수행결과 공유
	int res = (Integer)request.getAttribute("res");
	int notice_num = request.getAttribute("notice_num") == null ? 0 : (Integer)request.getAttribute("notice_num");
	
	if(res > 0){
%>		
		{ "sw" : "성공", "notice_num": "<%=notice_num %>" }
		
<%	}else{ %>

		{ "sw" : "실패", "notice_num": "<%=notice_num %>" }
<%		
	}
%>
