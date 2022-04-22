package kr.or.ddit.commit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.commit.service.FreedomServiceImpl;
import kr.or.ddit.commit.service.IFreedomService;
import kr.or.ddit.commit.vo.FreedomVO;
import kr.or.ddit.commit.vo.MemberVO;

@WebServlet("/freedomInsert.do")
public class FreedomInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		FreedomVO vo = new FreedomVO();
				
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
		
		vo.setMem_id(loginMember.getMem_id());
		vo.setFreedom_title(request.getParameter("title"));
		vo.setFreedom_con(request.getParameter("content"));
		vo.setTag_num(Integer.parseInt(request.getParameter("tag")));
		
		//1 service 객체 얻기
		IFreedomService  service = FreedomServiceImpl.getService();
		
		//2 service메소드 호출 - 결과값 
		service.insertFreeboard(vo);
		
		//3 출력
	
		//4 jsp로 
		request.getRequestDispatcher("freedom/freedomMain.jsp").forward(request, response);
	}

}
