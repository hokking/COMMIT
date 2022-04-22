package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.JobworkVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class JobworkDaoImpl implements IJobworkDao {
	private SqlMapClient smc;
	private static IJobworkDao dao;
	
	private JobworkDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IJobworkDao getInstance() {
		if(dao == null) dao = new JobworkDaoImpl();
		return dao;
	}

	@Override
	public List<JobworkVO> selectAllJobwork() throws SQLException {
		return smc.queryForList("jobwork.selectAllJobwork");
	}

}
