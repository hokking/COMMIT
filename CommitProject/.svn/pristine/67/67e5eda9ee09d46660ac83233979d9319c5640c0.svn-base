<%@page import="kr.or.ddit.commit.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%

	// 서블릿에서 수행된 결과 공유하여 jsonObject배열을 생성
	List<ZipVO> list = (List<ZipVO>)request.getAttribute("aaaa");

%>

[
<%
	for(int i=0; i<list.size(); i++){
		ZipVO vo = list.get(i);
		if(i>0) out.print(",");
		String bunji = vo.getBunji();
		if(bunji == null) bunji="";
%>
	
	{
		"zipcode" : "<%= vo.getZipcode() %>",
		"addr" : "<%= vo.getSido() %> <%= vo.getGugun() %> <%= vo.getDong() %>",
		"bunji" : "<%= bunji %>"
	}
	
<%
	}
%>
]