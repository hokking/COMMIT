<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 서블릿에서 결과값 공유하기
	Integer num = (Integer)request.getAttribute("res");
	// a001~, null;
	
	if(num > 0) {
%>
	
		{
			"sw" : "성공"
		}
	
<%
	} else {
%>
	
		{
			"sw" : "실패"
		}
	
<%	
	}
%>