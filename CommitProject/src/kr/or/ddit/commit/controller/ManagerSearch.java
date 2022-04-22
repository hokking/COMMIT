package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.FreedomServiceImpl;
import kr.or.ddit.commit.service.IFreedomService;
import kr.or.ddit.commit.service.IManagerService;
import kr.or.ddit.commit.service.ManagerServiceImpl;
import kr.or.ddit.commit.vo.MemberVO;

@WebServlet("/managerSearch.do")
public class ManagerSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
		String search_MemNum = request.getParameter("option");
		String search_MemId = request.getParameter("text");
	

//		System.out.println(search_MemId + "(으)로 검색한 회원입니다.");
		
		int  spage = 1;
		String  page = request.getParameter("page");
		if(page!=null) {
			spage =Integer.parseInt(page);
		}
		
		//1. service객체 
		IManagerService  service = ManagerServiceImpl.getService();
		
		//2. service 메소드 호출  - pageIngo(spage)
		//spage에 따라 start, end, startPage , endPage, totalPage값 구하기 
		Map<String,	Integer>  map = service.pageInfo(spage,search_MemNum,search_MemId );
		List<MemberVO> list = null;
		
		
		System.out.println("\n\nsearch_memId : " + search_MemId);
		if(search_MemId!=null) {
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("mem_num", search_MemNum);
			map2.put("mem_id", search_MemId);
			map2.put("start", map.get("start"));
			map2.put("end", map.get("end"));
			list = service.searchMember(map2);
		}else {
			list = service.selectByPage(map);
		}
		
		System.out.println("\n\nlist.size() : " + list.size());
		
		//3. 결과값 저장  - list, startPage , endPage, totalPage
		request.setAttribute("list", list);
		request.setAttribute("tpage",map.get("tpage") );// totalPage
		request.setAttribute("spage",map.get("spage") );// startPage
		request.setAttribute("epage",map.get("epage") );// endPage
		
		//4. 응답결과생성 - json - jsp로 위임 -forword
		request.getRequestDispatcher("manager/list.jsp").forward(request, response);
		
		
	}		

}
