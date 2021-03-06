package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.NoticeVO;

public interface INoticeService {
	
	//게시글 리스트 출력
	public List<NoticeVO> getAllNotice(Map<String, Integer> map);
	
	//게시글 상세조회
	public NoticeVO selectNotice(int noticeNo);
	
	//게시글 작성
	public int insertNotice(Map<String, String> map);
	
	//게시글 수정
	public int updateNotice(NoticeVO nvo);
	
	//게시글 삭제
	public int deleteNotice(int noticeNo);
	
	//조회수 증가
	public int updateView(int noticeNo);
	
	//전체 글 갯수 가져오기
	public int totalCount();
	
	//pageing 처리
	public Map<String, Integer> pageInfo(int page);

}
