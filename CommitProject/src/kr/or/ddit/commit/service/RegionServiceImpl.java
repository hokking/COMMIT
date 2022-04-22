package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.commit.dao.IRegionDao;
import kr.or.ddit.commit.dao.RegionDaoImpl;
import kr.or.ddit.commit.vo.RegionVO;

public class RegionServiceImpl implements IRegionService {
	private IRegionDao dao;
	private static IRegionService service;
	
	private RegionServiceImpl() {
		dao = RegionDaoImpl.getInstance();
	}
	
	public static IRegionService getInstance() {
		if(service == null) service = new RegionServiceImpl();
		return service;
	}

	@Override
	public List<RegionVO> selectAllRegion() {
		List<RegionVO> list = null;
		try {
			list = dao.selectAllRegion();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
}
