package kr.or.ddit.commit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commit.service.IJoinService;
import kr.or.ddit.commit.service.JoinServiceImpl;
import kr.or.ddit.commit.vo.ZipVO;


/**
 * Servlet implementation class ZipSearch
 */
@WebServlet("/ZipSearch.do")
public class ZipSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ZipSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String dong = request.getParameter("dong");
		IJoinService service = JoinServiceImpl.getInstance();
		List<ZipVO> list = service.selectByDong(dong);
		request.setAttribute("aaaa", list);
		//4. jsp로 forward
		request.getRequestDispatcher("join/zipcode.jsp").forward(request, response);
	}

}
