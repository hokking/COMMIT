package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.FreedomVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class FreedomDaoImpl implements IFreedomDao{
	
	private SqlMapClient client;
	private static IFreedomDao dao;
	
	public FreedomDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFreedomDao getDao() {
		if(dao == null) dao = new FreedomDaoImpl();
		return dao;
	}

	@Override
	public List<FreedomVO> selectAllFreeBoard() throws SQLException {
		return client.queryForList("freedom.selectAllFreeBoard");
	}

	@Override
	public FreedomVO selectOneFreeBoard(int freedomnum) throws SQLException {
		return (FreedomVO) client.queryForObject("freedom.selectOneFreeBoard", freedomnum);
	}

	@Override
	public void insertFreeboard(FreedomVO vo) throws SQLException {
		client.insert("freedom.insertFreeBoard",vo);
	}

	@Override
	public List<FreedomVO> searchTitleFreeBoard(String title) throws SQLException {
		return client.queryForList("freedom.searchTitleFreeBoard", title);
	}

	@Override
	public List<FreedomVO> searchMemIdFreeBoard(String memId) throws SQLException {
		return client.queryForList("freedom.searchMemIdFreeBoard", memId);
	}

	@Override
	public int updateFreeBoard(FreedomVO vo) throws SQLException {
		return client.update("freedom.updateFreeBoard", vo);
	}
	// 성공하면 1이상 실패하면 0

	@Override
	public int deleteFreeBoard(int freedomnum) throws SQLException {
		return client.delete("freedom.deleteFreeBoard", freedomnum);
	}

	@Override
	public List<FreedomVO> searchTagFreeBoard(int tagnum) throws SQLException {
		return client.queryForList("freedom.searchTagFreeBoard", tagnum);
	}

	

	@Override
	public List<FreedomVO> selectByPage(Map<String, Integer> map) throws SQLException {
			return client.queryForList("freedom.selectByPage", map);
	}

	@Override
	public List<FreedomVO> getAllFreedom(Map<String, Integer> map) throws SQLException {
		return client.queryForList("freedom.getAllFreedom", map);
	}

	@Override
	public int totalCount() throws SQLException {
		return (int) client.queryForObject("freedom.totalCount");
	}

	@Override
	public int FreedomView(FreedomVO vo) throws SQLException {
		return client.update("freedom.FreedomView", vo);
	}

	


}
