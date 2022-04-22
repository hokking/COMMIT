package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.IQnaService;
import kr.or.ddit.commit.service.QnaServiceImpl;

/**
 * Servlet implementation class Qnadelete
 */
@WebServlet("/Qnadelete.do")
public class Qnadelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Qnadelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 0. 클라이언트 요청 시 qna_num 가져오기
		int num = Integer.parseInt(request.getParameter("qna_num"));
		
		// 1. service객체
		IQnaService service = QnaServiceImpl.getInstance();
		
		// 2. service메서드 호출
		int dnum = service.deleteQna(num);
		
		// 3. 전체 글 갯수 가져오기
		int count = service.totalCount();
		
		// 4. 한 페이지당 출력할 글 갯수
		int perList = 3;
		
		// 5. 한 화면에 출력할 페이지 수
		int perPage = 2;
		
		// 6. 전체 페이지 수
		int totalPage = (int) Math.ceil((double)count / perList);
		
		// 7. request에 저장
		request.setAttribute("res", dnum);
		request.setAttribute("tpage", totalPage);
		
		// 8. jsp로 포워드
		request.getRequestDispatcher("qna/result.jsp").forward(request, response);
	
	}

}
