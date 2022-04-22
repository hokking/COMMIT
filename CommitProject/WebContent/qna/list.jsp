<%@page import="kr.or.ddit.commit.vo.QnaVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//서블릿에서 request 자료 받기
	List<QnaVO> list = (List<QnaVO>)request.getAttribute("list");
	
	Integer spage = (Integer)request.getAttribute("sp");
	Integer tpage = (Integer)request.getAttribute("tp");
	Integer epage = (Integer)request.getAttribute("ep");
	
%>
{
	"tp" : "<%=tpage %>",
	"sp" : "<%=spage %>",
	"ep" : "<%=epage %>",
	"datas" : [
<%

	for(int i = 0; i<list.size(); i++){
		QnaVO vo = list.get(i);
		if(i > 0) out.print(",");
%>
{
	"qna_num" : "<%=vo.getQna_num() %>",
	"qna_title" : "<%=vo.getQna_title() %>",
<%-- 	"qna_con" : "<%=vo.getQna_con() %>", --%>
	"qna_date" : "<%=vo.getQna_date().substring(0,10) %>"
	}

<%
}

%>
]
}




