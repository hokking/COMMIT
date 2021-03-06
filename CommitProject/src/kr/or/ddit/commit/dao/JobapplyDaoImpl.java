package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.JobapplyVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class JobapplyDaoImpl implements IJobapplyDao {
	private SqlMapClient smc;
	private static IJobapplyDao dao;
	
	private JobapplyDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IJobapplyDao getInstance() {
		if(dao == null) dao = new JobapplyDaoImpl();
		return dao;
	}

	@Override
	public List<JobapplyVO> genderStats(JobapplyVO vo) throws SQLException {
		return smc.queryForList("jobapply.genderStats", vo);
	}

	@Override
	public List<JobapplyVO> ageStats(JobapplyVO vo) throws SQLException {
		return smc.queryForList("jobapply.ageStats", vo);
	}

	@Override
	public int selectRecruit2(JobapplyVO vo) throws SQLException {
		return (int) smc.queryForObject("jobapply.selectRecruit2", vo);
	}
	
	
}
