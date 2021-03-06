package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.RecruitVO;

public interface IRecruitDao {
	// 채용공고 전체 출력 인기순
	public List<RecruitVO> selectAllRecruitPop() throws SQLException;

	// 채용공고 전체 출력 최신순
	public List<RecruitVO> selectAllRecruitNew() throws SQLException;
	
	// 채용공고 지역 필터 출력 인기순
	public List<RecruitVO> selectRegRecruitPop(int regNum) throws SQLException;

	// 채용공고 지역 필터 출력 최신순
	public List<RecruitVO> selectRegRecruitNew(int regNum) throws SQLException;
	
	// 채용공고 일 필터 출력 인기순
	public List<RecruitVO> selectJobRecruitPop(int workNum) throws SQLException;

	// 채용공고 일 필터 출력 최신순
	public List<RecruitVO> selectJobRecruitNew(int workNum) throws SQLException;
	
	// 채용공고 지역일 필터 출력 인기순
	public List<RecruitVO> selectRJRecruitPop(Map<String, Integer> map) throws SQLException;

	// 채용공고 지역일 필터 출력 최신순
	public List<RecruitVO> selectRJRecruitNew(Map<String, Integer> map) throws SQLException;
	
	// 지역 이름 출력
	public String selectRegion(int regNum) throws SQLException;
	
	// 채용공고 선택한거 출력
	public RecruitVO selectRecruit(int recruitNum) throws SQLException;
	
	// 메인에서 채용공고명으로 검색
	public List<RecruitVO> searchRecruit(String data) throws SQLException;
	
	// 채용공고 등록
	public void insertRecruit(RecruitVO vo) throws SQLException;
	
	// 채용공고 등록시 이미지 등록
	public void updateImg(String rimg) throws SQLException;

	// 채용공고 수정
	public void updateRecruit(RecruitVO vo) throws SQLException;
	
	// 조회수
	public void updateViews(int recruitNum) throws SQLException;
	
	// 공고 삭제
	public void deleteRecruit(int recruitNum) throws SQLException;
	
}
