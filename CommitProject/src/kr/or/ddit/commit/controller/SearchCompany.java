package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.CompanyInfoServiceImpl;
import kr.or.ddit.commit.service.ICompanyInfoService;
import kr.or.ddit.commit.vo.CompanyVO;

@WebServlet("/searchCompany.do")
public class SearchCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String comname = request.getParameter("comname");
		ICompanyInfoService service = CompanyInfoServiceImpl.getInstance();
		List<CompanyVO> list = service.searchCompany(comname);
		request.setAttribute("comList", list);
		request.getRequestDispatcher("companyinfo/companyDetail.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
