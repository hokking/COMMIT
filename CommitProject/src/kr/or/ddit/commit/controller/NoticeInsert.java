package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.or.ddit.commit.service.INoticeService;
import kr.or.ddit.commit.service.NoticeServiceImpl;


@WebServlet("/NoticeInsert.do")
public class NoticeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("head", request.getParameter("head"));
		map.put("subject", request.getParameter("subject"));
		map.put("content", request.getParameter("content"));
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		int num = service.insertNotice(map);
		
		//request에 저장
		request.setAttribute("res", num);
		
		//jsp로 보내서 상태 확인하기
		request.getRequestDispatcher("notice/result.jsp").forward(request, response);
	
	}

}
