package kr.or.ddit.commit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.dao.HrDaoImpl;
import kr.or.ddit.commit.dao.IHrDao;
import kr.or.ddit.commit.vo.HrVO;

public class HrServiceImpl implements IHrService {
	
	private IHrDao dao;
	private static HrServiceImpl service;
	
	private HrServiceImpl() {
		dao = HrDaoImpl.getInstance();
	}
	
	public static IHrService getInstance() {
		if(service == null) service = new HrServiceImpl();
		
		return service;
	}
	

	@Override
	public List<HrVO> getAllhr() {
		List<HrVO> list = null;
		
		try {
			list = dao.getAllhr();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public HrVO detailhr(int no) {
		HrVO detail = null;
		
		try {
			detail = dao.detailhr(no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return detail;
	}

	@Override
	public List<HrVO> selectReghr(String resume_area) {
		List<HrVO> list = null;
		
		try {
			list = dao.selectReghr(resume_area);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<HrVO> selectJobhr(String resume_job) {
		List<HrVO> list = null;
		
		try {
			list = dao.selectJobhr(resume_job);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<HrVO> selectRJhr(Map<String, String> map) {
		List<HrVO> list = null;
		
		try {
			list = dao.selectRJhr(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
