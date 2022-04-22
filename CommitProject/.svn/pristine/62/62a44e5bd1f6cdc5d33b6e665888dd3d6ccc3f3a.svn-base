package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.FreedomServiceImpl;
import kr.or.ddit.commit.service.IFreedomService;
import kr.or.ddit.commit.vo.FreedomVO;

@WebServlet("/freedomTagSearch.do")
public class FreedomTagSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int tagnum = 0; 
		if(request.getParameter("tag")!=null) {		
			tagnum = Integer.parseInt(request.getParameter("tag"));
		}
		
		IFreedomService  service = FreedomServiceImpl.getService();
		List<FreedomVO> list = null;
		if(tagnum==0) {
			list = service.selectAllFreeBoard();
		}else {
			list = service.searchTagFreeBoard(tagnum);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("tag", tagnum);
						
        request.getRequestDispatcher("freedom/freedomMain.jsp").forward(request, response);
		
	}

}
