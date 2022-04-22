package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.FreeRepleServiceImpl;
import kr.or.ddit.commit.service.IFreeRepleService;
import kr.or.ddit.commit.vo.FreeRepleVO;


@WebServlet("/freedomRepleList.do")
public class FreedomRepleList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int freedomNum = Integer.parseInt(request.getParameter("freedomNum"));
		
		//1
		IFreeRepleService service = FreeRepleServiceImpl.getService();
		
		//2
		List<FreeRepleVO> list = service.selectAllFreeReple(freedomNum);
				
		//3
		request.setAttribute("list", list);
		
		//4
		request.getRequestDispatcher("freedom/freedomDetail.jsp").forward(request, response);
		
		
		
	}

}
