package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.commit.service.FreeRepleServiceImpl;
import kr.or.ddit.commit.service.IFreeRepleService;
import kr.or.ddit.commit.vo.FreeRepleVO;

@WebServlet("/freedomRepleUpdate.do")
public class FreedomRepleUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		FreeRepleVO vo = new FreeRepleVO();
		vo.setReple_con(request.getParameter("content"));
		vo.setReple_num(Integer.parseInt(request.getParameter("num")));
		
		IFreeRepleService service = FreeRepleServiceImpl.getService(); 
		
		int cnt = service.updateFreeReple(vo);
		
		Gson gson = new Gson();
		String result = "Fail";
		if(cnt>0) {
			result = "OK";
		}
		response.getWriter().write(gson.toJson(result));
	}

}
