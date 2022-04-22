package kr.or.ddit.commit.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import kr.or.ddit.commit.service.IJoinService;
import kr.or.ddit.commit.service.JoinServiceImpl;
import kr.or.ddit.commit.vo.CompanyVO;
import kr.or.ddit.commit.vo.FileVO;
import kr.or.ddit.commit.vo.MemberVO;

@WebServlet("/companyInsert.do")
@MultipartConfig(
fileSizeThreshold = 1024 * 1024 * 10,
maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024 * 50
		
)
public class CompanyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uploadPath = "D:/A_TeachingMaterial/4.MiddleProject/workspace/CommitProject/WebContent/companylogo";
		MemberVO memvo = new MemberVO();
		memvo.setMem_id(request.getParameter("company_id"));
		memvo.setMem_pass(request.getParameter("company_pass"));
		memvo.setMem_num(2);
		String fileName = "";
		List<FileVO> fileList = new ArrayList<FileVO>();
		
		Part part = request.getPart("company_img");
		fileName = extractFileName(part);
			
		if(!"".equals(fileName)) {
			FileVO fileVo = new FileVO();
				
			fileVo.setFileName(fileName);
			fileVo.setFileSize((int)Math.ceil(part.getSize()/ 1024.0));
			try {
				part.write(uploadPath + File.separator + fileName);
				fileVo.setUploadStatus("Success");
				
			} catch (IOException e) {
				fileVo.setUploadStatus("Fail : " + e.getMessage());
			} 
			fileList.add(fileVo);	
		}
		System.out.println(part);
		request.setAttribute("uploadFileList", fileList);
		
		CompanyVO comvo = new CompanyVO();
		comvo.setMem_id(request.getParameter("company_id"));
		comvo.setCom_name(request.getParameter("company_name"));
		comvo.setCom_num(request.getParameter("company_registration"));
		comvo.setCom_url(request.getParameter("company_url"));
		comvo.setCom_tel(request.getParameter("company_tel"));
		comvo.setCom_ceo(request.getParameter("company_ceo"));
		comvo.setCom_job(request.getParameter("jobdiv"));
		comvo.setCom_div(request.getParameter("companydiv"));
		comvo.setCom_bir(request.getParameter("com_bir"));
		comvo.setCom_sales(request.getParameter("com_sales"));
		comvo.setCom_income(request.getParameter("com_income"));
		comvo.setCom_memnum(request.getParameter("com_memnum"));
		comvo.setCom_addr1(request.getParameter("sample6_address"));
		comvo.setCom_addr2(request.getParameter("sample6_detailAddress"));
		comvo.setCom_addnum(request.getParameter("sample6_postcode"));
		comvo.setCom_img(fileName);
		IJoinService service = JoinServiceImpl.getInstance();
		String mid = service.memberJoin(memvo);
		service.companyJoin(comvo);
		
		request.setAttribute("id", mid);
		request.getRequestDispatcher("join/result.jsp").forward(request, response);
		
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private String extractFileName(Part part) {
		String fileName = "";
		
		String contentDisposition = part.getHeader("content-disposition");
		String[] items = contentDisposition.split(";");
		for(String item : items) {
			if(item.trim().startsWith("filename")) {
				fileName = item.substring(item.indexOf("=") + 2, item.length()-1);
			}
		}
		
		
		return fileName;
	}

}
