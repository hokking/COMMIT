package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.ApplyResumeServiceImpl;
import kr.or.ddit.commit.service.IApplyResumeService;
import kr.or.ddit.commit.vo.ResumeVO;

@WebServlet("/selectApplicant.do")
public class SelectApplicant extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int recruit_num = Integer.parseInt(request.getParameter("recruit_num"));
		
		IApplyResumeService service = ApplyResumeServiceImpl.getInstance();
		List<ResumeVO> list = service.selectApplicant(recruit_num);
		request.setAttribute("listApplicant", list);
		request.getRequestDispatcher("mypage/applicantNum.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
