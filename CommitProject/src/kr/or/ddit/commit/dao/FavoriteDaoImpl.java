package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.FavoriteVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class FavoriteDaoImpl implements IFavoriteDao {
	
	private SqlMapClient smc;
	private static FavoriteDaoImpl dao;
	
	private FavoriteDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFavoriteDao getInstance() {
		if(dao == null) dao = new FavoriteDaoImpl();
		return dao;
	}
	
	
	@Override
	public List<FavoriteVO> getAllfav(String mem_id) throws SQLException {
		List<FavoriteVO> list = smc.queryForList("fav.getAllfav", mem_id);
		return list;
	}

	@Override
	public int insertfav(Map<String, String> map) throws SQLException {
		return (int) smc.insert("fav.insertfav", map);
	}

	@Override
	public int deletefav(Map<String, String> map) throws SQLException {
		return smc.delete("fav.deletefav", map);
	}

	@Override
	public String recselect(int recno) throws SQLException {
		return (String) smc.queryForObject("fav.recselect", recno);
	}

	@Override
	public int favoriteTF(Map<String, String> map) throws SQLException {
		return (int) smc.queryForObject("fav.favoriteTF", map);
	}

	@Override
	public int favoriteinsert(Map<String, String> map) throws SQLException {
		return (int) smc.insert("fav.favoriteinsert", map);
	}

	@Override
	public int favoriteTF2(String mem_id) throws SQLException {
		// TODO Auto-generated method stub
		return (int) smc.queryForObject("fav.favoriteTF2", mem_id);
	}

}
