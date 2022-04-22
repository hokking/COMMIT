package kr.or.ddit.commit.controller;

import java.io.File;
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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.or.ddit.commit.service.IRecruitService;
import kr.or.ddit.commit.service.RecruitServiceImpl;
import kr.or.ddit.commit.vo.FileVO;
import kr.or.ddit.commit.vo.MemberVO;

@WebServlet("/recruitUpdateImg.do")
public class RecruitUpdateImg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
		
		String uploadPath = "D:/A_TeachingMaterial/4.MiddleProject/workspace/CommitProject/WebContent/recruitImg";
		String fileName = "";
		List<FileVO> fileList = new ArrayList<FileVO>();
	
		Part part = request.getPart("img");
		fileName = extractFileName(part);
		System.out.println(part);
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
		
		request.setAttribute("uploadFileList", fileList);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("recruit_img", fileName);
		IRecruitService service = RecruitServiceImpl.getInstance();
		
		service.updateImg(fileName);
	
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
