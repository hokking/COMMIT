package kr.or.ddit.commit.service;

import java.util.List;

import kr.or.ddit.commit.vo.JobapplyVO;
import kr.or.ddit.commit.vo.RecruitVO;
import kr.or.ddit.commit.vo.ResumeVO;
import kr.or.ddit.commit.vo.WorkerVO;

public interface IApplyResumeService {
	
	public void insertApply(JobapplyVO vo);
	
	public List<RecruitVO> selectApply(String mem_id);
	
	public List<RecruitVO> selectRecruit(String mem_id);
	
	public List<ResumeVO> selectApplicant(int recruit_num);

	public WorkerVO selectID(String mem_id);
	
}
