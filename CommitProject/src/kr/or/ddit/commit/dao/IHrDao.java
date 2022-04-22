package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.HrVO;

public interface IHrDao {
	//인재풀 전체 출력
	public List<HrVO> getAllhr() throws SQLException;
	
	//인재풀 상세조회	
	public HrVO detailhr(int no) throws SQLException;
	
	//인재풀 지역필터 출력
	public List<HrVO> selectReghr(String resume_area) throws SQLException;

	//인재풀 직무 필터 출력
	public List<HrVO> selectJobhr(String resume_job) throws SQLException;
	
	//인재풀 지역 직무 필터 출력
	public List<HrVO> selectRJhr(Map<String, String> map) throws SQLException;

}
