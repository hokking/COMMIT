package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.FreedomServiceImpl;
import kr.or.ddit.commit.service.IFreedomService;
import kr.or.ddit.commit.vo.FreedomVO;

@WebServlet("/FreedomList.do")
public class FreedomList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String page = request.getParameter("page");
		int spage = Integer.parseInt(page);
		IFreedomService service = FreedomServiceImpl.getService();
		
		Map<String, Integer> map = service.pageInfo(spage);
		List<FreedomVO> list = service.getAllFreedom(map);
		request.setAttribute("list", list);
		request.setAttribute("tp", map.get("tpage")); //totalPage
		request.setAttribute("sp", map.get("spage")); //startPage
		request.setAttribute("ep", map.get("epage")); //endPage
		
		request.getRequestDispatcher("freedom/list.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
