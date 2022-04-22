package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.IRecruitService;
import kr.or.ddit.commit.service.RecruitServiceImpl;
import kr.or.ddit.commit.vo.RecruitVO;

@WebServlet("/recruitSearch.do")
public class RecruitSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String data = request.getParameter("data");
		
		IRecruitService service = RecruitServiceImpl.getInstance();
		
		List<RecruitVO> list = service.searchRecruit(data);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("recruit/recruitList.jsp").forward(request, response);
	}

}
