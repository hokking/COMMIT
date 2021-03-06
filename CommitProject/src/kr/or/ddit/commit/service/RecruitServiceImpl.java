package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.dao.IRecruitDao;
import kr.or.ddit.commit.dao.RecruitDaoImpl;
import kr.or.ddit.commit.vo.RecruitVO;

public class RecruitServiceImpl implements IRecruitService{
	private IRecruitDao dao;
	private static IRecruitService service;
	
	private RecruitServiceImpl() {
		dao = RecruitDaoImpl.getInstance();
	}
	
	public static IRecruitService getInstance() {
		if(service == null) service = new RecruitServiceImpl();
		return service;
	}

	@Override
	public List<RecruitVO> selectAllRecruitPop() {
		List<RecruitVO> list = null;
		try {
			list = dao.selectAllRecruitPop();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<RecruitVO> selectAllRecruitNew() {
		List<RecruitVO> list = null;
		try {
			list = dao.selectAllRecruitNew();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public RecruitVO selectRecruit(int recruitNum) {
		RecruitVO vo = null;
		try {
			vo = dao.selectRecruit(recruitNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public void insertRecruit(RecruitVO vo) {
		try {
			dao.insertRecruit(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<RecruitVO> selectRegRecruitPop(int regNum) {
		List<RecruitVO> list = null;
		try {
			list = dao.selectRegRecruitPop(regNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<RecruitVO> selectRegRecruitNew(int regNum) {
		List<RecruitVO> list = null;
		try {
			list = dao.selectRegRecruitNew(regNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<RecruitVO> selectJobRecruitPop(int workNum) {
		List<RecruitVO> list = null;
		try {
			list = dao.selectJobRecruitPop(workNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<RecruitVO> selectJobRecruitNew(int workNum) {
		List<RecruitVO> list = null;
		try {
			list = dao.selectJobRecruitNew(workNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<RecruitVO> selectRJRecruitPop(Map<String, Integer> map) {
		List<RecruitVO> list = null;
		try {
			list = dao.selectRJRecruitPop(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<RecruitVO> selectRJRecruitNew(Map<String, Integer> map) {
		List<RecruitVO> list = null;
		try {
			list = dao.selectRJRecruitNew(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateRecruit(RecruitVO vo) {
		try {
			dao.updateRecruit(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public String selectRegion(int regNum) {
		String name = null;
		try {
			name = dao.selectRegion(regNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public void updateViews(int recruitNum) {
		try {
			dao.updateViews(recruitNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteRecruit(int recruitNum) {
		try {
			dao.deleteRecruit(recruitNum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<RecruitVO> searchRecruit(String data) {
		List<RecruitVO> list = null;
		try {
			list = dao.searchRecruit(data);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateImg(String rimg) {
		try {
			dao.updateImg(rimg);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
