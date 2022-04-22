package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.commit.service.IQnaService;
import kr.or.ddit.commit.service.QnaServiceImpl;
import kr.or.ddit.commit.vo.QnaVO;

/**
 * Servlet implementation class QnaInsert
 */
@WebServlet("/QnaInsert.do")
public class QnaInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("mem_id", request.getParameter("mem_id"));
		map.put("qna_title", request.getParameter("qna_title"));
		map.put("qna_con", request.getParameter("qna_con"));
		
		IQnaService service = QnaServiceImpl.getInstance();
		
		int num = service.insertQna(map);
		
		request.setAttribute("res", num);
		
		request.getRequestDispatcher("qna/result.jsp").forward(request, response);
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


}
