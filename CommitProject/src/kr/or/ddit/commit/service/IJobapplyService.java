package kr.or.ddit.commit.service;

import java.util.List;

import kr.or.ddit.commit.vo.JobapplyVO;

public interface IJobapplyService {
	public List<JobapplyVO> genderStats(JobapplyVO vo);
	
	public List<JobapplyVO> ageStats(JobapplyVO vo);

	
	public int selectRecruit2(JobapplyVO vo);
}
