<%@page import="kr.or.ddit.commit.vo.CompanyVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commit.vo.WorkerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  	<%
  	WorkerVO  worker  = (WorkerVO)request.getAttribute("workerVo");
	%>

    <%
     if(worker!=null){
     
	%>
		   {
		      "id"   :"<%= worker.getMem_id() %>",
		      "name" :"<%= worker.getMem_name() %>",
		      "gender" :"<%= worker.getMem_gender() %>",
		      "birth" :"<%= worker.getMem_bir() %>",
		      "addr" :"<%= worker.getMem_addr() %>",
		      "tel" :"<%= worker.getMem_tel() %>"
		
		  	}    	  
	  <%  
     }
	  %>
	  
	  
  	<%
  	CompanyVO  company  = (CompanyVO)request.getAttribute("companyVo");
	%>

    <%
    if(company!=null){
    
	%>
		   {
		      "id"   :"<%= company.getMem_id() %>",
		      "comname" :"<%= company.getCom_name() %>",
		      "num" :"<%= company.getCom_num() %>",
		      "ceo" :"<%= company.getCom_ceo() %>",
		      "url" :"<%= company.getCom_url() %>",
		      "addr1" :"<%= company.getCom_addr1() %>",
		      "addr2" :"<%= company.getCom_addr2() %>",
		      "addNum" :"<%= company.getCom_addnum() %>",
		      "comtel" :"<%= company.getCom_tel() %>",
		      "memNum" :"<%= company.getCom_memnum() %>",
		      "bir" :"<%= company.getCom_bir() %>",
		      "div" :"<%= company.getCom_div() %>",
		      "job" :"<%= company.getCom_job() %>"		      
		
		  	}    	  
	  <%   	  
	  
    }
	  %>