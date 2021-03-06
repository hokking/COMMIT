package kr.or.ddit.commit.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kr.or.ddit.commit.service.IPayService;
import kr.or.ddit.commit.service.IRecruitService;
import kr.or.ddit.commit.service.PayServiceImpl;
import kr.or.ddit.commit.service.RecruitServiceImpl;
import kr.or.ddit.commit.vo.FileVO;
import kr.or.ddit.commit.vo.PayVO;
import kr.or.ddit.commit.vo.RecruitVO;

@WebServlet("/recruitInsert.do")
public class RecruitInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
//		HttpSession session = request.getSession();
//		MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String sdate = request.getParameter("sdate");
        System.out.println(sdate);
        Date date = null;
        try {
			date = new Date(sdf.parse(sdate).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println("11");
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, Integer.parseInt(request.getParameter("rview")));
        String edate = sdf.format((cal.getTime()));
		System.out.println(edate);
		
		RecruitVO recruitVo = new RecruitVO();
		
		recruitVo.setMem_id(request.getParameter("id"));
		recruitVo.setRecruit_name(request.getParameter("title"));
		recruitVo.setRecruit_start(sdate);
		recruitVo.setRecruit_end(edate);
		recruitVo.setRecruit_skill(request.getParameter("skill"));
		recruitVo.setRecruit_duty(request.getParameter("duty"));
		recruitVo.setRecruit_spec(request.getParameter("spec"));
		recruitVo.setRecruit_qlt(request.getParameter("qlt"));
		recruitVo.setRecruit_bnf(request.getParameter("bnf"));
		recruitVo.setWork_num(Integer.parseInt(request.getParameter("pst")));
		recruitVo.setReg_num(Integer.parseInt(request.getParameter("reg")));
		recruitVo.setPaytype_name(request.getParameter("method"));
		IRecruitService service = RecruitServiceImpl.getInstance();
		
		service.insertRecruit(recruitVo);
		

		IPayService service1 = PayServiceImpl.getInstance();
		
		PayVO vo = new PayVO();
		vo.setMem_id(request.getParameter("id"));
		vo.setPay_cost(Integer.parseInt(request.getParameter("amount")));
		vo.setPaytype_name(request.getParameter("method"));
		
		service1.insertPay(vo);
		
	
	}
	
}
