package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.IQnaService;
import kr.or.ddit.commit.service.QnaServiceImpl;
import kr.or.ddit.commit.vo.QnaVO;

/**
 * Servlet implementation class QnaPaging
 */
@WebServlet("/QnaPaging.do")
public class QnaPaging extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int page = Integer.parseInt(request.getParameter("page"));
		IQnaService service = QnaServiceImpl.getInstance();
		Map<String, Integer> map = service.pageInfo(page);
		List<QnaVO> list = service.selectByPage(map);
		
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.getRequestDispatcher("qna/qnamain.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
