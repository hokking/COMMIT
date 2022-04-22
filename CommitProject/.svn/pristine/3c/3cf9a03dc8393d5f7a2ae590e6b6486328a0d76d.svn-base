package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.commit.service.FreeRepleServiceImpl;
import kr.or.ddit.commit.service.IFreeRepleService;
import kr.or.ddit.commit.vo.FreeRepleVO;
import kr.or.ddit.commit.vo.MemberVO;


@WebServlet("/freedomRepleInsert.do")
public class FreedomRepleInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
		
		
		//0. 클라이언트 요청시 전송값 받기 
		FreeRepleVO  vo = new FreeRepleVO();
				
		vo.setFreedom_num(Integer.parseInt(request.getParameter("freedom_num")));
		vo.setMem_id(loginMember.getMem_id());
		vo.setReple_con(request.getParameter("repleContnet"));
		
		//1
		IFreeRepleService  service = FreeRepleServiceImpl.getService();
		
		//2
		service.insertFreeReple(vo);
		
		//3. 
		//request.getRequestDispatcher("freedom/freedomDetail.jsp?freedomnum=" + vo.getFreedom_num()).forward(request, response);
		response.sendRedirect(request.getContextPath()+"/freedom/freedomDetail.jsp?freedomnum=" + vo.getFreedom_num());
		
		
	}

}
