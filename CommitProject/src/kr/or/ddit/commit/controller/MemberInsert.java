package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.IJoinService;
import kr.or.ddit.commit.service.JoinServiceImpl;
import kr.or.ddit.commit.vo.MemberVO;
import kr.or.ddit.commit.vo.WorkerVO;

@WebServlet("/memberInsert.do")
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberVO memvo = new MemberVO();
		memvo.setMem_id(request.getParameter("mem_id"));
		memvo.setMem_pass(request.getParameter("mem_pass"));
		memvo.setMem_num(1);
		
		WorkerVO wvo = new WorkerVO();
		wvo.setMem_id(request.getParameter("mem_id"));
		wvo.setMem_name(request.getParameter("mem_name"));
		wvo.setMem_bir(request.getParameter("mem_bir"));
		wvo.setMem_gender(request.getParameter("gender"));
		wvo.setMem_tel(request.getParameter("mem_tel"));
		wvo.setMem_addr(request.getParameter("mem_add1")+ " " +request.getParameter("mem_add2"));
		
		IJoinService service = JoinServiceImpl.getInstance();
		String mid = service.memberJoin(memvo);
		service.workerJoin(wvo);
		
		request.setAttribute("id", mid);
		request.getRequestDispatcher("join/result.jsp").forward(request, response);
		
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
