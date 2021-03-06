package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.IResumeService;
import kr.or.ddit.commit.service.ResumeServiceImple;
import kr.or.ddit.commit.vo.ResumeVO;

@WebServlet("/ResumeUpdate.do")
public class ResumeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ResumeUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ResumeVO vo = new ResumeVO();
		vo.setResume_chk(Integer.parseInt(request.getParameter("chk")));
		vo.setResume_job(request.getParameter("job"));
		vo.setResume_title(request.getParameter("title"));
		vo.setResume_schoolname(request.getParameter("school"));
		vo.setResume_major(request.getParameter("major"));
		vo.setResume_score(request.getParameter("score"));
		vo.setResume_career(request.getParameter("career"));
		vo.setResume_tel(request.getParameter("tel"));
		vo.setResume_area(request.getParameter("area"));
		vo.setResume_skill(request.getParameter("skill"));
		vo.setResume_self(request.getParameter("self"));
		vo.setResume_num(Integer.parseInt(request.getParameter("resumNum")));
		
		IResumeService service = ResumeServiceImple.getInstance();
		service.updateresume(vo);
		
		request.getRequestDispatcher("mypage/resumeUpdate.jsp").forward(request, response);
		
		
		
		
	}

}
