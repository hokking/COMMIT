package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.FreedomVO;
import kr.or.ddit.commit.vo.FreeRepleVO;

public interface IFreedomDao {

	   //게시글 리스트 	
	   public List<FreedomVO> selectAllFreeBoard() throws SQLException;
	   
	   //게시글 자세히보기
	   public FreedomVO selectOneFreeBoard(int freedomnum) throws SQLException; 

	   //게시글 작성
	   public void insertFreeboard(FreedomVO vo) throws SQLException;
	   
	   //게시글 검색(제목)
	   public List<FreedomVO> searchTitleFreeBoard(String title) throws SQLException;
	   
	   //게시글 검색(작성자)
	   public List<FreedomVO> searchMemIdFreeBoard(String memId) throws SQLException;
	   
	   //게시글 수정 
	   public int updateFreeBoard(FreedomVO vo) throws SQLException; // int 타입인 이유가 수정된 갯수라서	   
	  
	   //게시글 삭제 
	   public int deleteFreeBoard(int freedomnum) throws SQLException; //int freedomnum : 자유게시판 번호
	   
	   //태그 검색
	   public List<FreedomVO> searchTagFreeBoard(int tagnum) throws SQLException;

	   public int totalCount() throws SQLException;

	   public List<FreedomVO> selectByPage(Map<String, Integer> map) throws SQLException;

	   public List<FreedomVO> getAllFreedom(Map<String, Integer> map) throws SQLException;
	   
	   public int FreedomView(FreedomVO vo) throws SQLException;
}
