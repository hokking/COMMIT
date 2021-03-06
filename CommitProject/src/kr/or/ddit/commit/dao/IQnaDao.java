package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.QnaVO;

public interface IQnaDao {
	
	//게시글 리스트
	public List<QnaVO> selectByPage(Map<String, Integer> map) throws SQLException;
	
	//전체 글 갯수 가져오기
	public int totalCount() throws SQLException;
	
	//게시글 작성
	public int insertQna(Map<String, String> map) throws SQLException;
	
	//게시글 수정
	public int updateQna(QnaVO vo) throws SQLException;
	
	//게시글 삭제
	public int deleteQna(int no) throws SQLException;
	
	//게시글 상세조회
	public QnaVO readQna(int no) throws SQLException;
	

}
