<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  //서블릿에서 request의  자료 공유 
  List<MemberVO>  list  = (List<MemberVO>)request.getAttribute("list");
  Integer spage = (Integer) request.getAttribute("spage");
  Integer  tpage =(Integer) request.getAttribute("tpage");
  Integer  epage =(Integer) request.getAttribute("epage");
 %>
 {
   "tp" : "<%= tpage %>",
   "sp" : "<%= spage %>",
   "ep" : "<%= epage %>",
   "datas" : [
  <%
     for(int i=0; i<list.size(); i++){
    	  MemberVO vo = list.get(i);
    	  if(i > 0) out.print(",");
  %>
   {
      "id"     :"<%= vo.getMem_id() %>",
      "num"	   :"<%= vo.getMem_num() %>",
      "pass"   :"<%= vo.getMem_pass() %>"

  }    	  
 <%   	  
    }
  %>
 ]
 
 }
 
 
 
 
 
 
 
 
 
 
 
 