package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.CompanyVO;

public interface ICompanyInfoDao {
	
	public List<CompanyVO> companyInfoAll() throws SQLException;
	
	public CompanyVO companyDetail(String id) throws SQLException;
	
	public List<CompanyVO> searchCompany(String name) throws SQLException;
	
	public int companyUpdate(Map<String, String> map) throws SQLException;
	public int companyUpdatepass(Map<String, String> map) throws SQLException;
	
	public String companyMap(String mem_id) throws SQLException;
}
