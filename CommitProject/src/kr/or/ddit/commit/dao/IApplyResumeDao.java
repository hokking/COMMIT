package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.commit.vo.JobapplyVO;
import kr.or.ddit.commit.vo.RecruitVO;
import kr.or.ddit.commit.vo.ResumeVO;
import kr.or.ddit.commit.vo.WorkerVO;

public interface IApplyResumeDao {
	
	public void insertApply(JobapplyVO vo) throws SQLException;
	
	public List<RecruitVO> selectApply(String mem_id) throws SQLException;
	
	public List<RecruitVO> selectRecruit(String mem_id) throws SQLException;
	
	public List<ResumeVO> selectApplicant(int recruit_num) throws SQLException;
	
	public WorkerVO selectID(String mem_id) throws SQLException;
	
}
