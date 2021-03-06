package kr.or.ddit.commit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.QnaVO;

public interface IQnaService {

	//게시글 전체 출력
	public List<QnaVO> selectByPage(Map<String, Integer> map);
	
	//전체 글 갯수 가져오기
	public int totalCount();
	
	//게시글 작성
	public int insertQna(Map<String, String> map);
	
	//게시글 수정
	public int updateQna(QnaVO vo);
	
	//게시글 삭제
	public int deleteQna(int no);
	
	//게시글 상세조회
	public QnaVO readQna(int no);
	
	//pageing 처리
	public Map<String, Integer> pageInfo(int page);
	
	
}
