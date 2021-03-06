package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.commit.vo.RecruitVO;
import kr.or.ddit.commit.vo.ResumeVO;

public interface IResumeDao{

	public int selectresume(String mem_id) throws SQLException;
	
	public int selectrecruit(String mem_id) throws SQLException;
	
	public void insertresume(ResumeVO vo) throws SQLException;
	
	public int updateresume(ResumeVO vo) throws SQLException;
	
	public List<ResumeVO> listresume(String mem_id) throws SQLException;
	
	public List<RecruitVO> listrecruit(String mem_id) throws SQLException;
	
	public ResumeVO detailresume(int resume_num) throws SQLException;
	
	public String userselect(String mem_id) throws SQLException;
	
	public void deleteresume(int resume_num) throws SQLException;
	
	public String conselect(String mem_id) throws SQLException;
}
