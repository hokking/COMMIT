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
 * Servlet implementation class QnaList
 */
@WebServlet("/QnaList.do")
public class QnaList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 0. 클라이언트 요청시 전송되는 값 - page
		
		String page = request.getParameter("page");
		int spage = Integer.parseInt(page);
		
		// 1. service객체
		IQnaService service = QnaServiceImpl.getInstance();
		
		// 2. service 메소드 호출
		Map<String, Integer> map = service.pageInfo(spage);
		List<QnaVO> list = service.selectByPage(map);
		
		// 3. 결과값 저장
		request.setAttribute("list", list);
		request.setAttribute("tp", map.get("tp"));
		request.setAttribute("sp", map.get("sp"));
		request.setAttribute("ep", map.get("ep"));
		
		
		// 4. 응답결과 보내기
		request.getRequestDispatcher("qna/list.jsp").forward(request, response);
	
	}

}
