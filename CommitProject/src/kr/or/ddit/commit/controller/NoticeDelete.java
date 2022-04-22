package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.INoticeService;
import kr.or.ddit.commit.service.NoticeServiceImpl;


@WebServlet("/NoticeDelete.do")
public class NoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("notice_num"));
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		int nonum = service.deleteNotice(num);
		
		request.setAttribute("res", nonum);
		
		request.getRequestDispatcher("notice/result.jsp").forward(request, response);
		
		
	}

}
