package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.CompanyInfoServiceImpl;
import kr.or.ddit.commit.service.ICompanyInfoService;
import kr.or.ddit.commit.service.IMemberService;
import kr.or.ddit.commit.service.MemberServiceImpl;
import kr.or.ddit.commit.vo.CompanyVO;
import kr.or.ddit.commit.vo.WorkerVO;

@WebServlet("/memberSelect.do")
public class MemberSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String mvoid = request.getParameter("mvoid");
		int mvonum = Integer.parseInt(request.getParameter("mvonum"));
		IMemberService service1 = MemberServiceImpl.getInstance();
		ICompanyInfoService service2 = CompanyInfoServiceImpl.getInstance();
		WorkerVO wvo = new WorkerVO();
		CompanyVO cvo = new CompanyVO();
		if(mvonum == 1) {
			wvo = service1.workerDetail(mvoid);
			request.setAttribute("wvo", wvo);
		} else {
			cvo = service2.companyDetail(mvoid);
			request.setAttribute("cvo", cvo);
		}
		request.getRequestDispatcher("mypage/infomodify.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
