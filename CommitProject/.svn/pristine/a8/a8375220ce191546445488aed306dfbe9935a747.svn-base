package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.commit.dao.IJoinDao;
import kr.or.ddit.commit.dao.JoinDaoImpl;
import kr.or.ddit.commit.vo.CompanyVO;
import kr.or.ddit.commit.vo.MemberVO;
import kr.or.ddit.commit.vo.WorkerVO;
import kr.or.ddit.commit.vo.ZipVO;

public class JoinServiceImpl implements IJoinService{
	private IJoinDao dao;
	private static JoinServiceImpl service;
	private JoinServiceImpl() {
		dao = JoinDaoImpl.getInstance();
	}
	
	public static JoinServiceImpl getInstance() {
		if(service == null) service = new JoinServiceImpl();
		return service;
	}

	@Override
	public String CheckId(String id) {
		String  checkid = null;
		try {
			checkid = dao.CheckId(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return checkid;
	}

	@Override
	public List<ZipVO> selectByDong(String dong) {
		List<ZipVO> list = null;
		try {
			list = dao.selectByDong(dong);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String memberJoin(MemberVO vo) {
		String id = null;
		try {
			id = dao.memberJoin(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return id;
	}

	@Override
	public String workerJoin(WorkerVO vo) {
		String id = null;
		try {
			id = dao.workerJoin(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return id;
	}

	@Override
	public String companyJoin(CompanyVO comvo) {
		String id = null;
		try {
			id = dao.companyJoin(comvo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}

}
