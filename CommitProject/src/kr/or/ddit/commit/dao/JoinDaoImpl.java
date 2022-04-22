package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.CompanyVO;
import kr.or.ddit.commit.vo.MemberVO;
import kr.or.ddit.commit.vo.WorkerVO;
import kr.or.ddit.commit.vo.ZipVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class JoinDaoImpl implements IJoinDao{
	private SqlMapClient client = null;
	private static IJoinDao dao;
	
	private JoinDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IJoinDao getInstance() {
		if(dao == null) dao = new JoinDaoImpl();
		return dao;
	}

	@Override
	public String CheckId(String id) throws SQLException {
		return (String) client.queryForObject("join.checkId", id);
	}

	@Override
	public List<ZipVO> selectByDong(String dong) throws SQLException {
		return client.queryForList("join.selectByDong", dong);
	}

	@Override
	public String memberJoin(MemberVO vo) throws SQLException {
		return (String) client.insert("join.memberJoin", vo);
	}

	@Override
	public String workerJoin(WorkerVO vo) throws SQLException {
		return (String)client.insert("join.workerJoin", vo);
	}

	@Override
	public String companyJoin(CompanyVO comvo) throws SQLException {
		return (String)client.insert("join.companyJoin", comvo);
	}

}
