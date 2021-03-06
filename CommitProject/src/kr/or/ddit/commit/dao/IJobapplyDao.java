package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.commit.vo.JobapplyVO;

public interface IJobapplyDao {
	public List<JobapplyVO> genderStats(JobapplyVO vo) throws SQLException;
	
	public List<JobapplyVO> ageStats(JobapplyVO vo) throws SQLException;
	
	public int selectRecruit2(JobapplyVO vo) throws SQLException;
}
