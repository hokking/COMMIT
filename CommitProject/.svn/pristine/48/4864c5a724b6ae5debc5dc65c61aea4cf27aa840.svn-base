package kr.or.ddit.commit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.commit.service.FreedomServiceImpl;
import kr.or.ddit.commit.service.IFreedomService;
import kr.or.ddit.commit.vo.FreedomVO;

@WebServlet("/freedomUpdate.do")
public class FreedomUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		//0. 클라이언트 요청시 전송 데이터 
		FreedomVO vo = new FreedomVO();
		vo.setFreedom_num(Integer.parseInt(request.getParameter("num")));
		vo.setFreedom_title(request.getParameter("title"));
		vo.setFreedom_con(request.getParameter("content"));
		vo.setTag_num(Integer.parseInt(request.getParameter("tag")));
		vo.setFreedom_date(request.getParameter("date"));
		
		//1. service 객체 얻기
		IFreedomService service = FreedomServiceImpl.getService();
		
		//2. service 메소드 호출 - 결과값 얻기
		int cnt = service.updateFreeBoard(vo);		
		
		//3. 결과 출력 또는 json데이터 생성 - jsp에 위임
		Gson gson = new Gson();
		String result = "Fail";
		if(cnt>0) {
			result = "OK";
		}
		response.getWriter().write( gson.toJson(result) );
		//request.getRequestDispatcher("freedom/freedomDetail.jsp?freedomnum="+vo.getFreedom_num()).forward(request, response);
		
		
		
	}

}
