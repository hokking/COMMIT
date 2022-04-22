package kr.or.ddit.commit.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.PayVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class PayDaoImpl implements IPayDao {
	private SqlMapClient smc;
	private static IPayDao dao;
	
	private PayDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IPayDao getInstance() {
		if(dao == null) dao = new PayDaoImpl();
		return dao;
	}

	@Override
	public void insertPay(PayVO vo) throws SQLException {
		smc.insert("pay.insertPay", vo);
	}
	
	
}
