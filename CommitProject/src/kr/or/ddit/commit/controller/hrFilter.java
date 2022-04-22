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

import kr.or.ddit.commit.service.HrServiceImpl;
import kr.or.ddit.commit.service.IHrService;
import kr.or.ddit.commit.vo.HrVO;

@WebServlet("/hrFilter.do")
public class hrFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public hrFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String[] rarr = request.getParameterValues("rarr[]");
		String[] jarr = request.getParameterValues("jarr[]");
	
		IHrService service = HrServiceImpl.getInstance();
		List<HrVO> list1 = new ArrayList<HrVO>();
		List<HrVO> list2 = new ArrayList<HrVO>();
		
		HrVO vo = new HrVO();
		
		Map<String, String> map = new HashMap<String, String>();
		
		//지역만 선택했을 때
		if(rarr != null && jarr == null) {
			for(String res : rarr) {
				list2 = service.selectReghr(res);
				for(HrVO hvo : list2) {
					list1.add(hvo);
				}
			} //직무만 선택했을 때
		} else if(rarr == null && jarr != null) {
			for(String res : jarr) {
				list2 = service.selectJobhr(res);
				for(HrVO hvo : list2) {
					list1.add(hvo);
				}
			} // 지역, 직무 둘 다 선택하거나 아무것도 선택하지 않았을 때
		} else if(rarr == null && jarr == null) {
			list1 = service.getAllhr();
		} else { //지역, 직무 둘 다 선택했을 때
			for(String reg : rarr) {
				map.put("resume_area", reg);
				for(String job : jarr) {
					map.put("resume_job", job);
					list2 = service.selectRJhr(map);
					for(HrVO v : list2) {
						list1.add(v);
					}
				}
			}
		}
		
		request.setAttribute("list", list1);
		request.getRequestDispatcher("hr/hrList.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
