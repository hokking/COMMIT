package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.commit.dao.LoginDaoImpl;
import kr.or.ddit.commit.service.LoginServiceImpl;
import kr.or.ddit.commit.vo.MemberVO;


@WebServlet("/Login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String memid = request.getParameter("mem_id");
		String mempass = request.getParameter("mem_pass");
		
		LoginServiceImpl service = LoginServiceImpl.getInstance();
		
		MemberVO mvo = new MemberVO();
		mvo.setMem_id(memid);
		mvo.setMem_pass(mempass);
		MemberVO mvo2 = new MemberVO();
		mvo2 = new MemberVO();
		mvo2 = service.getLoginMember(mvo);
		String loginfail = "삐빅-로그인에 실패하셨습니다";
		
		if(mvo2 == null) { //로그인 실패
			request.setAttribute("fail", loginfail);
			request.getRequestDispatcher("login/loginMain.jsp").forward(request, response);
		}else { //로그인 성공
			SessionLogin sl = SessionLogin.getInstance();
			sl.slogin(mvo2, request);
			response.sendRedirect(request.getContextPath() + "/board/main2.jsp");
		}
		
		
		
	}

}
