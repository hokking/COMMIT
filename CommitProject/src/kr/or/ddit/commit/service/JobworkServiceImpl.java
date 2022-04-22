package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.commit.dao.IJobworkDao;
import kr.or.ddit.commit.dao.JobworkDaoImpl;
import kr.or.ddit.commit.vo.JobworkVO;

public class JobworkServiceImpl implements IJobworkService {
	private IJobworkDao dao;
	private static IJobworkService service;
	
	private JobworkServiceImpl() {
		dao = JobworkDaoImpl.getInstance();
	}
	
	public static IJobworkService getInstance() {
		if(service == null) service = new JobworkServiceImpl();
		return service;
	}

	@Override
	public List<JobworkVO> selectAllJobwork() {
		List<JobworkVO> list = null;
		try {
			list = dao.selectAllJobwork();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
