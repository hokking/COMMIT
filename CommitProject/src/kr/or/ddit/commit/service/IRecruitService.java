package kr.or.ddit.commit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.RecruitVO;

public interface IRecruitService {
	
	public List<RecruitVO> selectAllRecruitPop();

	public List<RecruitVO> selectAllRecruitNew();
	
	public List<RecruitVO> selectRegRecruitPop(int regNum);
	
	public List<RecruitVO> selectRegRecruitNew(int regNum);
	
	public List<RecruitVO> selectJobRecruitPop(int workNum);

	public List<RecruitVO> selectJobRecruitNew(int workNum);
	
	public List<RecruitVO> selectRJRecruitPop(Map<String, Integer> map);

	public List<RecruitVO> selectRJRecruitNew(Map<String, Integer> map);
	
	public String selectRegion(int regNum);
	
	public RecruitVO selectRecruit(int recruitNum);
	
	public List<RecruitVO> searchRecruit(String data);
	
	public void updateImg(String rimg);
	
	public void insertRecruit(RecruitVO vo);
	
	public void updateRecruit(RecruitVO vo);
	
	public void updateViews(int recruitNum);
	
	public void deleteRecruit(int recruitNum);
}
