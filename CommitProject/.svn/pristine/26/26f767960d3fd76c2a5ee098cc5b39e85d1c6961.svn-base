package kr.or.ddit.commit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.IRecruitService;
import kr.or.ddit.commit.service.RecruitServiceImpl;
import kr.or.ddit.commit.vo.RecruitVO;

@WebServlet("/recruitUpdate.do")
public class RecruitUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		RecruitVO recruitVo = new RecruitVO();
		recruitVo.setRecruit_num(Integer.parseInt(request.getParameter("rn")));
		recruitVo.setRecruit_name(request.getParameter("title"));
		recruitVo.setWork_num(Integer.parseInt(request.getParameter("pst")));
		recruitVo.setReg_num(Integer.parseInt(request.getParameter("reg")));
		recruitVo.setRecruit_skill(request.getParameter("skill"));
		recruitVo.setRecruit_duty(request.getParameter("duty"));
		recruitVo.setRecruit_spec(request.getParameter("spec"));
		recruitVo.setRecruit_qlt(request.getParameter("qlt"));
		recruitVo.setRecruit_bnf(request.getParameter("bnf"));
		
		
		System.out.println(Integer.parseInt(request.getParameter("rn")));
		
		IRecruitService service = RecruitServiceImpl.getInstance();
		
		service.updateRecruit(recruitVo);
		
		
	}

}
