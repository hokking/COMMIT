package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.vo.MemberVO;

@WebServlet("/membermake.do")
public class Membermake extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("mem_id");
		MemberVO mvo = new MemberVO();
		mvo.setMem_id(id);
		mvo.setMem_pass("1");
		mvo.setMem_num(1);
		SessionLogin sl = SessionLogin.getInstance();
		sl.slogin(mvo, request);
		request.getRequestDispatcher("board/main2.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
