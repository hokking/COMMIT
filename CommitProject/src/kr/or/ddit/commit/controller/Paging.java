package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.INoticeService;
import kr.or.ddit.commit.service.NoticeServiceImpl;
import kr.or.ddit.commit.vo.NoticeVO;

@WebServlet("/paging.do")
public class Paging extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int page = Integer.parseInt(request.getParameter("page"));
		INoticeService service = NoticeServiceImpl.getInstance();
		Map<String, Integer> map = service.pageInfo(page);
		List<NoticeVO> nolist = service.getAllNotice(map);
		request.setAttribute("list", nolist);
		request.setAttribute("page", page);
		request.getRequestDispatcher("notice/noticemain.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
