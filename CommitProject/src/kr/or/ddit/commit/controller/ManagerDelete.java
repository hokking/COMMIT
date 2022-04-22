package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.IManagerService;
import kr.or.ddit.commit.service.ManagerServiceImpl;


@WebServlet("/managerDelete.do")
public class ManagerDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0. 클라이언트 요청시 renum
		String id = request.getParameter("id");
//			System.out.println("= " + num);	
		//1.  service객체 
		IManagerService  service = ManagerServiceImpl.getService();
		
		//2 service메소드 호출 - 결과값 
		int res = service.deleteBoard(id);
		//------------------------------------------
		//전체글갯수 가져오기 
		 int count = service.total();
		
		//한페이지당 출력 글 갯수 
		int perList = 3;
		
		//한화면에 출력할 페이지수 
		int perPage = 2;
		
		//전체페이지수 - 전체글갯수 / perList
		int totalPage =   (int)Math.ceil((double)count / perList);
		//------------------------------------------------------
		 //3. request에 저장
        request.setAttribute("res", res);
        request.setAttribute("tpage", totalPage);
        
        //4. jsp로 forward
        request.getRequestDispatcher("manager/delresult.jsp").forward(request, response);
	
	}

}
