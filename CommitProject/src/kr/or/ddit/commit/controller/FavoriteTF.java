package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.FavoriteServiceImpl;
import kr.or.ddit.commit.service.IFavoriteService;

@WebServlet("/FavoriteTF.do")
public class FavoriteTF extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("mem_id");
		String num = request.getParameter("recruit_num");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mem_id", id);
		map.put("recruit_num", num);
		
		IFavoriteService service = FavoriteServiceImpl.getInstance();
		int res = service.favoriteTF(map);
		System.out.println(res);
		request.setAttribute("res", res);
		request.getRequestDispatcher("favorite/result.jsp").forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
