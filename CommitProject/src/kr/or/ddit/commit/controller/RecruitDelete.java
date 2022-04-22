package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.IRecruitService;
import kr.or.ddit.commit.service.RecruitServiceImpl;

@WebServlet("/recruitDelete.do")
public class RecruitDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int recruitNum = Integer.parseInt(request.getParameter("recruitNum"));
		
		IRecruitService service = RecruitServiceImpl.getInstance();
		
		service.deleteRecruit(recruitNum);
	}

}
