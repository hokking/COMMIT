<%@page import="kr.or.ddit.commit.vo.FreedomVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//서블릿에서 request자료 받기
	List<FreedomVO> list = (List<FreedomVO>)request.getAttribute("list");
	
	Integer spage = (Integer)request.getAttribute("sp");
	Integer tpage = (Integer)request.getAttribute("tp");
	Integer epage = (Integer)request.getAttribute("ep");
%>

{
	"tp" : "<%= tpage %>",
	"sp" : "<%= spage %>",
	"ep" : "<%= epage %>"
}