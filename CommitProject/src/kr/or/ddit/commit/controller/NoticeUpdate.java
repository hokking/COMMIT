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
import kr.or.ddit.commit.vo.NoticeVO;


@WebServlet("/NoticeUpdate.do")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("notice_num"));
		System.out.println("num=" + num);
		String title = request.getParameter("notice_title");
		String content = request.getParameter("notice_con");
		String head = request.getParameter("notice_head");
		
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		NoticeVO nvo = new NoticeVO();
		nvo.setNotice_num(num);
		nvo.setNotice_title(title);
		nvo.setNotice_con(content);
		nvo.setNotice_head(head);
		
		int unum = service.updateNotice(nvo);
		
		
		//request에 저장
		request.setAttribute("res", unum);
		request.setAttribute("notice_num", num);
		
		//jsp로 보내서 상태 확인하기
		request.getRequestDispatcher("notice/result.jsp").forward(request, response);
	
	}

}
