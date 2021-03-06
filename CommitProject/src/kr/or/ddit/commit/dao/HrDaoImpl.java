package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.HrVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class HrDaoImpl implements IHrDao {
	
	private SqlMapClient smc;
	private static HrDaoImpl dao;
	
	private HrDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IHrDao getInstance() {
		if (dao == null) dao = new HrDaoImpl();
		
		return dao;
	}

	@Override
	public List<HrVO> getAllhr() throws SQLException {
		List<HrVO> list = smc.queryForList("hr.getAllhr");
		return list;
	}

	@Override
	public HrVO detailhr(int no) throws SQLException {
		return (HrVO) smc.queryForObject("hr.detailhr", no);
	}

	@Override
	public List<HrVO> selectReghr(String resume_area) throws SQLException {
		return smc.queryForList("hr.selectReghr", resume_area);
	}

	@Override
	public List<HrVO> selectJobhr(String resume_job) throws SQLException {
		return smc.queryForList("hr.selectJobhr", resume_job);
	}

	@Override
	public List<HrVO> selectRJhr(Map<String, String> map) throws SQLException {
		return smc.queryForList("hr.selectRJhr", map);
	}

}
