<%@page import="kr.or.ddit.commit.service.RecruitServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.IRecruitService"%>
<%@page import="kr.or.ddit.commit.vo.RecruitVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<RecruitVO> list = (List<RecruitVO>)request.getAttribute("list");
	IRecruitService service = RecruitServiceImpl.getInstance();
%>
[
<%
		for(int i = 0; i < list.size(); i++) {
			RecruitVO vo = list.get(i);
			if(i > 0) out.print(",");
%>
	{
		"recruitNum" : "<%= vo.getRecruit_num() %>",
		"recruitName" : "<%= vo.getRecruit_name() %>",
		"recruitSpec" : "<%= vo.getRecruit_spec() %>",
		"recruitSkill" : "<%= vo.getRecruit_skill() %>",
		"regName" : "<%= service.selectRegion(vo.getRecruit_num()) %>"
	}
<%
		}
%>
]