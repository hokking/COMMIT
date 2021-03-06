package kr.or.ddit.commit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.HrVO;

public interface IHrService {
	
	public List<HrVO> getAllhr();
	
	public HrVO detailhr(int no);	
	
	//인재풀 지역필터 출력
	public List<HrVO> selectReghr(String resume_area);

	//인재풀 직무 필터 출력
	public List<HrVO> selectJobhr(String resume_job);
	
	//인재풀 지역 직무 필터 출력
	public List<HrVO> selectRJhr(Map<String, String> map);	
	
}
