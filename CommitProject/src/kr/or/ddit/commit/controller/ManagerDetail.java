package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.IManagerService;
import kr.or.ddit.commit.service.IRecruitService;
import kr.or.ddit.commit.service.ManagerServiceImpl;
import kr.or.ddit.commit.service.RecruitServiceImpl;
import kr.or.ddit.commit.vo.CompanyVO;
import kr.or.ddit.commit.vo.RecruitVO;
import kr.or.ddit.commit.vo.WorkerVO;


@WebServlet("/managerDetail.do")
public class ManagerDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		String memId = request.getParameter("mem_id");
		
		IManagerService service = ManagerServiceImpl.getService();
		
		WorkerVO worVo = service.detailWorker(memId);
		request.setAttribute("workerVo", worVo);
		
		CompanyVO comVo = service.detailCompany(memId);
		request.setAttribute("companyVo", comVo);
		
		request.getRequestDispatcher("manager/detail.jsp").forward(request, response);
	}


}

	

