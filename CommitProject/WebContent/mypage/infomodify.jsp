<%@page import="kr.or.ddit.commit.vo.CompanyVO"%>
<%@page import="kr.or.ddit.commit.vo.MemberVO"%>
<%@page import="kr.or.ddit.commit.vo.WorkerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	HttpSession session1 = request.getSession();
    	MemberVO mvo = (MemberVO)session1.getAttribute("loginMember");
    	if(mvo.getMem_num() == 1){
    		WorkerVO wvo = (WorkerVO)request.getAttribute("wvo");
    %>
    {
		"pw" : "<%=mvo.getMem_pass() %>",
		"name" : "<%=wvo.getMem_name() %>",
		"gender" : "<%=wvo.getMem_gender() %>",
		"bir" : "<%=wvo.getMem_bir() %>",
		"addr" : "<%=wvo.getMem_addr() %>",
		"tel" : "<%=wvo.getMem_tel() %>"
    }
    <%
    	} else {
    		CompanyVO cvo = (CompanyVO)request.getAttribute("cvo");
    %>
    {
    	"pw" : "<%=mvo.getMem_pass() %>",
    	"num" : "<%=cvo.getCom_num() %>",
    	"name" : "<%=cvo.getCom_name() %>",
    	"tel" : "<%=cvo.getCom_tel() %>",
    	"url" : "<%=cvo.getCom_url() %>",
    	"addr" : "<%=cvo.getCom_addr1() + " " + cvo.getCom_addr2() %>",
    	"ceo" : "<%=cvo.getCom_ceo() %>",
    	"img" : "<%=cvo.getCom_img() %>"
    }
    <%
    	}
    %>
    
    
    
    