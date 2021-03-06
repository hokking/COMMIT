package kr.or.ddit.commit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.FreedomServiceImpl;
import kr.or.ddit.commit.service.IFreedomService;

@WebServlet("/freedomDelete.do")
public class FreedomDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
	
		//1.  service객체 
		IFreedomService  service = FreedomServiceImpl.getService();
		
		//2 service메소드 호출 - 결과값 
		int res = service.deleteFreeboard(num);
		
        //4. jsp로 forward
        request.getRequestDispatcher("freedom/freedomMain.jsp").forward(request, response);
	}

}
