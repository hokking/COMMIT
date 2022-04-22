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

/**
 * Servlet implementation class NoticeList
 */
@WebServlet("/NoticeList.do")
public class NoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NoticeList() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	//0. page받기
		String page = request.getParameter("page");
		int spage = Integer.parseInt(page);
		
	//1. service객체
		INoticeService service = NoticeServiceImpl.getInstance();
		
	//2. service메소드 호출 - pageInfo(spage)
	//spage에 따라 start, end, startPage, endPage, totalpage값 구하기
		Map<String, Integer> map = service.pageInfo(spage);
		
		List<NoticeVO> list = service.getAllNotice(map);
		
	//3. 결과값 저장 - list, startPage, endPage, totalPage
		request.setAttribute("list", list);
		request.setAttribute("tp", map.get("tp")); //totalPage
		request.setAttribute("sp", map.get("sp")); //startPage
		request.setAttribute("ep", map.get("ep")); //endPage
		
	//4. 응답결과 getRequestDispatcher로 보낸다
		request.getRequestDispatcher("notice/list.jsp").forward(request, response);
	
	
	}

}
