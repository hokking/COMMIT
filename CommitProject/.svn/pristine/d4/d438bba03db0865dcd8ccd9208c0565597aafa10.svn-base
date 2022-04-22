package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.commit.service.IResumeService;
import kr.or.ddit.commit.service.ResumeServiceImple;
import kr.or.ddit.commit.vo.MemberVO;
import kr.or.ddit.commit.vo.ResumeVO;

@WebServlet("/ResumeInsert.do")
public class ResumeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ResumeInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ResumeVO vo = new ResumeVO();
		
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
		
		/* mem_id �꽭�뀡�븞�맖 */
		
		vo.setMem_id(loginMember.getMem_id());
		vo.setResume_title(request.getParameter("title"));
		vo.setResume_tel(request.getParameter("tel"));
		vo.setResume_area(request.getParameter("area"));
		vo.setResume_career(request.getParameter("career"));
		vo.setResume_skill(request.getParameter("skill"));
		vo.setResume_job(request.getParameter("job"));
		vo.setResume_schoolname(request.getParameter("school"));
		vo.setResume_major(request.getParameter("major"));
		vo.setResume_score(request.getParameter("score"));
		vo.setResume_chk(Integer.parseInt(request.getParameter("chk")));
		vo.setResume_self(request.getParameter("self"));
		
		IResumeService service = ResumeServiceImple.getInstance();
		service.insertresume(vo);
		
		
		
	

}
	
	
}
