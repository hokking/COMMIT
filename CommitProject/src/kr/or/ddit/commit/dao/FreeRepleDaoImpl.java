package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.FreeRepleVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class FreeRepleDaoImpl implements IFreeRepleDao{

	private SqlMapClient client;
	private static IFreeRepleDao dao;
	
	public FreeRepleDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFreeRepleDao getDao() {
		if(dao ==null) dao = new FreeRepleDaoImpl();
		return dao;
	}

	@Override
	public List<FreeRepleVO> selectAllFreeReple(int freedomnum) throws SQLException {
		return client.queryForList("freeReple.selectAllFreeReple",freedomnum);
	}

	@Override
	public void insertFreeReple(FreeRepleVO vo) throws SQLException {
		client.insert("freeReple.insertFreeReple", vo);
		
	}

	@Override
	public int deleteFreeReple(int replenum) throws SQLException {
		return client.delete("freeReple.deleteFreeReple", replenum);
	}

	@Override
	public int updateFreeReple(FreeRepleVO vo) throws SQLException {
		return client.update("freeReple.updateFreeReple", vo);
	}
	
	

}
