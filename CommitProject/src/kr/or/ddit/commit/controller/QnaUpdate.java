package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.IQnaService;
import kr.or.ddit.commit.service.QnaServiceImpl;
import kr.or.ddit.commit.vo.QnaVO;

/**
 * Servlet implementation class QnaUpdate
 */
@WebServlet("/QnaUpdate.do")
public class QnaUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		QnaVO vo = new QnaVO();
		
		vo.setQna_num(Integer.parseInt(request.getParameter("qna_num")));
		vo.setAns_con(request.getParameter("ans_con"));
		
		IQnaService service = QnaServiceImpl.getInstance();
		
		int cnt = service.updateQna(vo);
		
		request.setAttribute("res", cnt);
		request.getRequestDispatcher("qna/result.jsp").forward(request, response);
	
	}

}
