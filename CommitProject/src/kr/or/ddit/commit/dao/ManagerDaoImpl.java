package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.CompanyVO;
import kr.or.ddit.commit.vo.FreedomVO;
import kr.or.ddit.commit.vo.MemberVO;
import kr.or.ddit.commit.vo.WorkerVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class ManagerDaoImpl implements IManagerDao{
	
	private SqlMapClient client;
	private static IManagerDao dao;

	public ManagerDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IManagerDao getDao() {
		if(dao==null) dao = new ManagerDaoImpl();
		return dao;
	}
	
	@Override
	public Map<String, Integer> pageInfo(int spage) {
		return null;
	}

	@Override
	public List<MemberVO> selectByPage(Map<String, Integer> map) throws SQLException {
		return client.queryForList("manager.selectByPage", map);
	}

	@Override
	public int totalCount(String op, String txt) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("op",op);
		map.put("txt",txt);
		return (int) client.queryForObject("manager.totalCount", map);
		
	}

	@Override
	public int deleteBoard(String id) throws SQLException {
		return client.delete("manager.deleteBoard", id);
	}

	@Override
	public List<MemberVO> searchMember(Map<String, Object> map) throws SQLException {
		return client.queryForList("manager.searchMember", map);
	}

	@Override
	public int total() throws SQLException {
		return (int)client.queryForObject("manager.total");
	}

	@Override
	public WorkerVO detailWorker(String memId) throws SQLException {
		return (WorkerVO) client.queryForObject("manager.detailWorker", memId);
	}

	@Override
	public CompanyVO detailCompany(String memId) throws SQLException {
		return (CompanyVO) client.queryForObject("manager.detailCompany", memId);
	}



}
