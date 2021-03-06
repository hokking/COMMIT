package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.IResumeService;
import kr.or.ddit.commit.service.ResumeServiceImple;

/**
 * Servlet implementation class ResumeDelete
 */
@WebServlet("/ResumeDelete.do")
public class ResumeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ResumeDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int num =  Integer.parseInt(request.getParameter("num"));
		
		IResumeService service = ResumeServiceImple.getInstance();
		service.deleteresume(num);
		request.getRequestDispatcher("mypage/resume.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
