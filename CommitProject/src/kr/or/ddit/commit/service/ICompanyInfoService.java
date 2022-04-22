package kr.or.ddit.commit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.CompanyVO;

public interface ICompanyInfoService {

	public List<CompanyVO> companyInfoAll();
	
	public CompanyVO companyDetail(String id);
	
	public List<CompanyVO> searchCompany(String name);
	
	public int companyUpdate(Map<String, String> map);
	public int companyUpdatepass(Map<String, String> map);
	
	public String companyMap(String mem_id);
}
