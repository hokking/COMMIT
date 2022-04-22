package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.RegionVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class RegionDaoImpl implements IRegionDao {
	private SqlMapClient smc;
	private static IRegionDao dao;
	
	private RegionDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IRegionDao getInstance() {
		if(dao == null) dao = new RegionDaoImpl();
		return dao;
	}

	@Override
	public List<RegionVO> selectAllRegion() throws SQLException {
		return smc.queryForList("region.selectAllRegion");
	}
	
	
}
