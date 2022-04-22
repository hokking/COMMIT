package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.FreeRepleServiceImpl;
import kr.or.ddit.commit.service.IFreeRepleService;
import kr.or.ddit.commit.vo.FreeRepleVO;

@WebServlet("/freedomRepleDelete.do")
public class FreedomRepleDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FreeRepleVO  vo = new FreeRepleVO();
		
		IFreeRepleService service = FreeRepleServiceImpl.getService();
	
		int res = // 0아니면 1
		service.deleteFreeReple(Integer.parseInt(request.getParameter("replenum")));
		// request.getParameter("replenum") : replenum을 jsp에서 받아옴
		
		request.setAttribute("res", res);
		request.getRequestDispatcher("freedom/result.jsp").forward(request, response);
		// result.jsp 로 보내서 성공,실패 판단
		
	}

}
