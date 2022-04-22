package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.WorkerVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class MemberDaoImpl implements IMemberDao{
	private SqlMapClient client = null;
	private static IMemberDao dao;
	
	private MemberDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberDao getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		return dao;
	}
	
	
	
	@Override
	public WorkerVO workerDetail(String id) throws SQLException {
		return (WorkerVO) client.queryForObject("worker.workerDetail", id);
	}

	@Override
	public int workerUpdate(Map<String, String> map) throws SQLException {
		return client.update("worker.workerUpdate", map);
	}

	@Override
	public int workerUpdatepass(Map<String, String> map) throws SQLException {
		return client.update("worker.workerUpdatepass", map);
	}

}
