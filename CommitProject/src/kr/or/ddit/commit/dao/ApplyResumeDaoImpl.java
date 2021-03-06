package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.JobapplyVO;
import kr.or.ddit.commit.vo.RecruitVO;
import kr.or.ddit.commit.vo.ResumeVO;
import kr.or.ddit.commit.vo.WorkerVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class ApplyResumeDaoImpl implements IApplyResumeDao{
	private SqlMapClient smc = null;
	private static ApplyResumeDaoImpl dao;
	
	private ApplyResumeDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ApplyResumeDaoImpl getInstance() {
		if(dao == null) dao = new ApplyResumeDaoImpl();
		return dao;
	}

	@Override
	public void insertApply(JobapplyVO vo) throws SQLException {
		smc.insert("jobapply.insertApply", vo);
	}

	@Override
	public List<RecruitVO> selectApply(String mem_id) throws SQLException {
		return smc.queryForList("jobapply.selectApply", mem_id);
	}

	@Override
	public List<RecruitVO> selectRecruit(String mem_id) throws SQLException {
		return smc.queryForList("jobapply.selectRecruit", mem_id);
	}

	@Override
	public List<ResumeVO> selectApplicant(int recruit_num) throws SQLException {
		return smc.queryForList("jobapply.selectApplicant", recruit_num);
	}

	@Override
	public WorkerVO selectID(String mem_id) throws SQLException {
		return (WorkerVO) smc.queryForObject("jobapply.selectID", mem_id);
	}

}
