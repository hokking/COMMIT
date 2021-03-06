package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.dao.CompanyInfoDaoImpl;
import kr.or.ddit.commit.dao.ICompanyInfoDao;
import kr.or.ddit.commit.vo.CompanyVO;

public class CompanyInfoServiceImpl implements ICompanyInfoService{
	private ICompanyInfoDao dao;
	private static CompanyInfoServiceImpl service;
	
	private CompanyInfoServiceImpl() {
		dao = CompanyInfoDaoImpl.getInstance();
	}
	
	public static CompanyInfoServiceImpl getInstance() {
		if(service == null) service = new CompanyInfoServiceImpl();
		return service;
	}
	
	@Override
	public List<CompanyVO> companyInfoAll() {
		List<CompanyVO> list = null;
		try {
			list = dao.companyInfoAll();
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public CompanyVO companyDetail(String id) {
		CompanyVO cvo = null;
		try {
			cvo = dao.companyDetail(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cvo;
	}

	@Override
	public List<CompanyVO> searchCompany(String name) {
		List<CompanyVO> list = null;
		try {
			list = dao.searchCompany(name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int companyUpdate(Map<String, String> map) {
		int num = 0;
		try {
			num = dao.companyUpdate(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public int companyUpdatepass(Map<String, String> map) {
		int num = 0;
		try {
			num = dao.companyUpdatepass(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public String companyMap(String mem_id) {
		String addr = null;
		try {
			addr = dao.companyMap(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return addr;
	}

}
