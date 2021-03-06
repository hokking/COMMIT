package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.FreedomVO;

public interface IFreedomService {

	   //게시글 리스트 	
	   public List<FreedomVO> selectAllFreeBoard();
	   	   
	   //게시글 자세히보기
	   public FreedomVO selectOneFreeBoard (int freedomnum); 

	   //게시글 작성
	   public void insertFreeboard(FreedomVO vo);
	   
	   //게시글 검색(제목)
	   public List<FreedomVO> searchTitleFreeBoard(String title);
	   
	   //게시글 검색(작성자)
	   public List<FreedomVO> searchMemIdFreeBoard(String memId);

	   //게시글 수정 
	   public int updateFreeBoard(FreedomVO vo);	   
	  
	   //게시글 삭제 
	   public int deleteFreeboard(int freedomnum); //int freedomnum : 자유게시판 번호
	   	   
	   //태그 검색
	   public List<FreedomVO> searchTagFreeBoard(int tagnum);

	   public int totalCount();
	   //페이징
	   public Map<String, Integer> pageInfo(int page);
	 
	   public List<FreedomVO> selectByPage(Map<String, Integer>  map);

	   public List<FreedomVO> getAllFreedom(Map<String, Integer> map);
	   
	   public int FreedomView(FreedomVO vo);
}
