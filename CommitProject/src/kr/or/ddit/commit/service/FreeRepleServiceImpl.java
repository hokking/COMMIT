package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.commit.dao.FreeRepleDaoImpl;
import kr.or.ddit.commit.dao.IFreeRepleDao;
import kr.or.ddit.commit.vo.FreeRepleVO;

public class FreeRepleServiceImpl implements IFreeRepleService{

	private IFreeRepleDao dao;
	private static IFreeRepleService service;
	
	public FreeRepleServiceImpl() {
		dao = FreeRepleDaoImpl.getDao();
	}	
	
	public static IFreeRepleService getService() {
		if(service == null) service = new FreeRepleServiceImpl();
		return service;
	}
	
	@Override
	public List<FreeRepleVO> selectAllFreeReple(int freedomnum) {
		List<FreeRepleVO> list = null;
		
		try {
			list = dao.selectAllFreeReple(freedomnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertFreeReple(FreeRepleVO vo) {
		
		try {
			dao.insertFreeReple(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int deleteFreeReple(int replenum) {
		int num = 0;
		
		try {
			num = dao.deleteFreeReple(replenum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return num;

	}

	@Override
	public int updateFreeReple(FreeRepleVO vo) {
		int num = 0;
		
		try {
			num = dao.updateFreeReple(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	
	

}
