package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.NoticeVO;

public interface INoticeDao {

	//게시글 전체 출력
	public List<NoticeVO> getAllNotice(Map<String, Integer> map) throws SQLException;

	//게시글 상세조회
	public NoticeVO selectNotice(int noticeNo) throws SQLException;
	
	//게시글 작성
	public int insertNotice(Map<String, String> map) throws SQLException;
	
	//게시글 수정
	public int updateNotice(NoticeVO nvo) throws SQLException;
	
	//게시글 삭제
	public int deleteNotice(int noticeNo) throws SQLException;
	
	//조회수 증가
	public int updateView(int noticeNo) throws SQLException;
	
	//전체 글 갯수 가져오기
	public int totalCount() throws SQLException;
}
