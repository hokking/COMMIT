<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
  //서블릿에서 수행결과 공유
   int  res = (Integer)request.getAttribute("res");
   if(res > 0) {
%>
	 { "sw" : "성공" }
	 <!-- "sw"이라는 key값에 "string"(value)을 대입 -->
 
 <%  }else{ %>
	  
	 {"sw" : "실패" }
 
<%
   }
%>

<!-- 쿼리문에 대한 성공,실패 -->