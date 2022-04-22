package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.commit.vo.FreeRepleVO;


public interface IFreeRepleDao {
	
	// 자유게시판 댓글 리스트 
	public List<FreeRepleVO> selectAllFreeReple(int freedomnum) throws SQLException;

	// 자유게시판 댓글 작성
	public void insertFreeReple(FreeRepleVO vo) throws SQLException;
	
	// 댓글 삭제
	public int deleteFreeReple(int replenum) throws SQLException;
	   
   //댓글 수정 
    public int updateFreeReple(FreeRepleVO vo) throws SQLException;
 
	
}
