<%@page import="kr.or.ddit.commit.vo.FreeRepleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//서브릿에서 실행결과 공유 
List<FreeRepleVO>  list =(List<FreeRepleVO>)request.getAttribute("list");
%>
[
  <%
    for(int i=0; i<list.size(); i++){
    	FreeRepleVO  vo =  list.get(i);
    	if(i > 0) out.print(",");
   %>
  
      {
      
     
        "freedomNum" : "<%= vo.getFreedom_num() %>",
        "repleNum" : "<%= vo.getReple_num() %>",
        "id"  : "<%= vo.getMem_id() %>",
        "content"  : "<%= vo.getReple_con().replaceAll("\r", "").replaceAll("\n", "<br>") %>",
        "date"  : "<%= vo.getReple_date() %>"
      	
      
      }
    	
 
 <% }
  %>
]

