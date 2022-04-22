package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.Map;

import org.apache.catalina.tribes.membership.MemberImpl;

import kr.or.ddit.commit.dao.IMemberDao;
import kr.or.ddit.commit.dao.MemberDaoImpl;
import kr.or.ddit.commit.vo.WorkerVO;

public class MemberServiceImpl implements IMemberService{
	private IMemberDao dao;
	private static IMemberService service;
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}

	@Override
	public WorkerVO workerDetail(String id) {
		WorkerVO wvo = null;
		try {
			wvo = dao.workerDetail(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return wvo;
	}

	@Override
	public int workerUpdate(Map<String, String> map) {
		int num = 0;
		try {
			num = dao.workerUpdate(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public int workerUpdatepass(Map<String, String> map) {
		int num = 0;
		try {
			num = dao.workerUpdatepass(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}

}
