package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.IRecruitService;
import kr.or.ddit.commit.service.RecruitServiceImpl;
import kr.or.ddit.commit.vo.RecruitVO;

@WebServlet("/recruitFilter.do")
public class RecruitFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String[] rarr = request.getParameterValues("rarr[]");
		String[] jarr = request.getParameterValues("jarr[]");
		String filt = request.getParameter("filt");
		
		IRecruitService service = RecruitServiceImpl.getInstance();
		List<RecruitVO> list = new ArrayList<RecruitVO>();
		List<RecruitVO> list2 = new ArrayList<RecruitVO>();
		RecruitVO vo = new RecruitVO();
		Map<String, Integer> map = new HashMap<String, Integer>();
		if(rarr != null && jarr == null) { // 지역만 선택됐을 경우
			if(filt.equals("인기순")) {
				for(String s : rarr) {
					list2 = service.selectRegRecruitPop(Integer.parseInt(s));
					for(RecruitVO v : list2) {
						list.add(v);
					}
				}
			} else {
				for(String s : rarr) {
					list2 = service.selectRegRecruitNew(Integer.parseInt(s));
					for(RecruitVO v : list2) {
						list.add(v);
					}
				}
			}
		} else if(rarr == null && jarr != null) { // 포지션만 선택됐을 경우
			if(filt.equals("인기순")) {
				for(String s : jarr) {
					list2 = service.selectJobRecruitPop(Integer.parseInt(s));
					for(RecruitVO v : list2) {
						list.add(v);
					}
				}
			} else {
				for(String s : jarr) {
					list2 = service.selectJobRecruitNew(Integer.parseInt(s));
					for(RecruitVO v : list2) {
						list.add(v);
					}
				}
			}
			
		} else if(rarr == null && jarr == null) { // 전체 선택이거나 아무것도 선택하지 않을 경우
			if(filt.equals("인기순")) {
				list = service.selectAllRecruitPop();
			} else {
				list = service.selectAllRecruitNew();
			}
			
		} else { // 지역과 포지션 둘 다 선택될 경우
			if(filt.equals("인기순")) {
				for(String r : rarr) {
					map.put("reg_num", Integer.parseInt(r));
					for(String j : jarr) {
						map.put("work_num", Integer.parseInt(j));
						list2 = service.selectRJRecruitPop(map);
						for(RecruitVO v : list2) {
							list.add(v);
						}
					}
				}
			} else {
				for(String r : rarr) {
					map.put("reg_num", Integer.parseInt(r));
					for(String j : jarr) {
						map.put("work_num", Integer.parseInt(j));
						list2 = service.selectRJRecruitNew(map);
						for(RecruitVO v : list2) {
							list.add(v);
						}
					}
				}
				
			}
			
		}
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("recruit/recruitList.jsp").forward(request, response);
		
		
	}

}
