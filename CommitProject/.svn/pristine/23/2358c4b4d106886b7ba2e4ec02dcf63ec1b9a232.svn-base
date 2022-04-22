package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.IPayService;
import kr.or.ddit.commit.service.PayServiceImpl;
import kr.or.ddit.commit.vo.PayVO;

@WebServlet("/payInsert.do")
public class PayInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IPayService service = PayServiceImpl.getInstance();
		
		int time = Integer.parseInt(request.getParameter("time"));
		
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
		
		String date = formatDate.format(time);
		
		PayVO vo = new PayVO();
		vo.setMem_id(request.getParameter("id"));
		vo.setPay_cost(Integer.parseInt(request.getParameter("amount")));
		vo.setPaytype_name(request.getParameter("method"));
		vo.setPay_date(date);
		
		service.insertPay(vo);
		
	}

}
