package kr.or.ddit.commit.service;

import java.util.List;

import kr.or.ddit.commit.vo.JobworkVO;

public interface IJobworkService {
	public List<JobworkVO> selectAllJobwork();
}
