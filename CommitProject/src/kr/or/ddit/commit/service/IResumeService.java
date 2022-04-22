package kr.or.ddit.commit.service;

import java.util.List;

import kr.or.ddit.commit.vo.RecruitVO;
import kr.or.ddit.commit.vo.ResumeVO;

public interface IResumeService {
	
	public int selectresume(String mem_id);
	
	public int selectrecruit(String mem_id);
	
	public void insertresume(ResumeVO vo);
	
	public int updateresume(ResumeVO vo);
	
	public List<ResumeVO> listresume(String mem_id);
	
	public List<RecruitVO> listrecruit(String mem_id);
	
	public ResumeVO detailresume(int resume_num);
	
	public String userselect(String mem_id);
	
	public String conselect(String mem_id);
	
	public void deleteresume(int resume_num);
	
	
	
}
