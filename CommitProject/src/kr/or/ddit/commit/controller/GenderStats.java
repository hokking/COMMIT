package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.commit.service.IJobapplyService;
import kr.or.ddit.commit.service.JobapplyServiceImpl;
import kr.or.ddit.commit.vo.JobapplyVO;

@WebServlet("/genderStats.do")
public class GenderStats extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		JobapplyVO vo = new JobapplyVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		IJobapplyService service = JobapplyServiceImpl.getInstance();
		
		List<JobapplyVO> list = service.genderStats(vo);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("recruit/genderStats.jsp").forward(request, response);
		
	
	}

}
