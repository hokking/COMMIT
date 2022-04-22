package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.ApplyResumeServiceImpl;
import kr.or.ddit.commit.service.IApplyResumeService;
import kr.or.ddit.commit.vo.JobapplyVO;

@WebServlet("/applyResume.do")
public class ApplyResume extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int resumeNum = Integer.parseInt(request.getParameter("resumeNum"));
		int recruitNum = Integer.parseInt(request.getParameter("recruitNum"));
		
		JobapplyVO vo = new JobapplyVO();
		vo.setRecruit_num(recruitNum);
		vo.setResume_num(resumeNum);
		IApplyResumeService service = ApplyResumeServiceImpl.getInstance();
		service.insertApply(vo);
		request.getRequestDispatcher("mypage/mypageMain.jsp").forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
