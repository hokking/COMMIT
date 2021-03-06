package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.CompanyInfoServiceImpl;
import kr.or.ddit.commit.service.ICompanyInfoService;

@WebServlet("/companyUpdate.do")
public class CompanyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String num = request.getParameter("num");
		String url = request.getParameter("url");
		String tel = request.getParameter("tel");
		String ceo = request.getParameter("ceo");
		System.out.println(url);
		ICompanyInfoService service = CompanyInfoServiceImpl.getInstance();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pass", pass);
		map.put("name", name);
		map.put("num", num);
		map.put("url", url);
		map.put("tel", tel);
		map.put("ceo", ceo);
		service.companyUpdate(map);
		service.companyUpdatepass(map);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
