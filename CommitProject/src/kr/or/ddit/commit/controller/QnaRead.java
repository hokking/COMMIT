package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.IQnaService;
import kr.or.ddit.commit.service.QnaServiceImpl;
import kr.or.ddit.commit.vo.QnaVO;

/**
 * Servlet implementation class QnaRead
 */
@WebServlet("/QnaRead.do")
public class QnaRead extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaRead() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("qna_num"));
		
		IQnaService service = QnaServiceImpl.getInstance();
		
		List<QnaVO> list = (List<QnaVO>)service.readQna(num);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("qna/result.jsp").forward(request, response);
	
	}

}
