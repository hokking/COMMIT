package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.RecruitVO;
import kr.or.ddit.commit.vo.ResumeVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class ResumeDaoImple implements IResumeDao{
	
	private SqlMapClient smc = null;
	private static ResumeDaoImple dao;
	
	private ResumeDaoImple() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IResumeDao getInstance() {
		if(dao == null) dao = new ResumeDaoImple();
		
		return dao;
	}
	

	@Override
	public int selectresume(String mem_id) throws SQLException {
		// TODO Auto-generated method stub
		return (int)smc.queryForObject("resume.selectresume", mem_id);
	}

	@Override
	public void insertresume(ResumeVO vo) throws SQLException {
		smc.insert("resume.insertresume", vo);
	}

	@Override
	public int updateresume(ResumeVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (int)smc.update("resume.updateresume", vo);
	}

	@Override
	public List<ResumeVO> listresume(String mem_id) throws SQLException {
		// TODO Auto-generated method stub
		
		List<ResumeVO> list = smc.queryForList("resume.listresume", mem_id);
		return list;
	}

	@Override
	public ResumeVO detailresume(int resume_num) throws SQLException {
		ResumeVO vo =(ResumeVO)smc.queryForObject("resume.detailresume", resume_num);
		return vo;
	}

	@Override
	public String userselect(String mem_id) throws SQLException {
		String name = (String)smc.queryForObject("resume.userselect", mem_id);
		return name;
	}

	@Override
	public void deleteresume(int resume_num) throws SQLException {
		smc.delete("resume.deleteresume", resume_num);
		
	}

	@Override
	public String conselect(String mem_id) throws SQLException {
		String name = (String)smc.queryForObject("resume.conselect", mem_id);
		return name;
	}

	@Override
	public int selectrecruit(String mem_id) throws SQLException {
	
		return (int)smc.queryForObject("resume.selectrecruit", mem_id);
	}

	@Override
	public List<RecruitVO> listrecruit(String mem_id) throws SQLException {
		List<RecruitVO> list = smc.queryForList("resume.listrecruit", mem_id);
		return list;
	}

	

}
