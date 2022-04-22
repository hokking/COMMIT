package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.commit.service.IResumeService;
import kr.or.ddit.commit.service.LoginServiceImpl;
import kr.or.ddit.commit.service.ResumeServiceImple;
import kr.or.ddit.commit.vo.ResumeVO;

@WebServlet("/Resume.do")
public class Resume extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Resume() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String memid = request.getParameter("mem_id");
		
		ResumeServiceImple service = ResumeServiceImple.getInstance();
		
		ResumeVO mvo = new ResumeVO();
		mvo.setMem_id(memid);
		
		
		
	}

}
