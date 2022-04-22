package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.CompanyVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class CompanyInfoDaoImpl implements ICompanyInfoDao{
	private SqlMapClient client = null;
	private static ICompanyInfoDao dao;
	
	private CompanyInfoDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ICompanyInfoDao getInstance() {
		if(dao == null) dao = new CompanyInfoDaoImpl();
		return dao;
	}
	
	
	@Override
	public List<CompanyVO> companyInfoAll() throws SQLException {
		return client.queryForList("company.companyInfoAll");
	}

	@Override
	public CompanyVO companyDetail(String id) throws SQLException {
		return (CompanyVO) client.queryForObject("company.companyDetail", id);
	}

	@Override
	public List<CompanyVO> searchCompany(String name) throws SQLException {
		return client.queryForList("company.searchCompany", name);
	}

	@Override
	public int companyUpdate(Map<String, String> map) throws SQLException {
		return client.update("company.companyUpdate", map);
	}

	@Override
	public int companyUpdatepass(Map<String, String> map) throws SQLException {
		return client.update("company.companyUpdatepass", map);
	}

	@Override
	public String companyMap(String mem_id) throws SQLException {
		return (String) client.queryForObject("company.companyMap", mem_id);
	}

}
