package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.commit.dao.IJobapplyDao;
import kr.or.ddit.commit.dao.JobapplyDaoImpl;
import kr.or.ddit.commit.vo.JobapplyVO;

public class JobapplyServiceImpl implements IJobapplyService {
	private IJobapplyDao dao;
	private static IJobapplyService service;
	
	private JobapplyServiceImpl() {
		dao = JobapplyDaoImpl.getInstance();
	}
	
	public static IJobapplyService getInstance() {
		if(service == null) service = new JobapplyServiceImpl();
		return service;
	}

	@Override
	public List<JobapplyVO> genderStats(JobapplyVO vo) {
		List<JobapplyVO> list = null;
		try {
			list = dao.genderStats(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<JobapplyVO> ageStats(JobapplyVO vo) {
		List<JobapplyVO> list = null;
		try {
			list = dao.ageStats(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int selectRecruit2(JobapplyVO vo) {
		int num = 0;
		try {
			num = dao.selectRecruit2(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return num;
	}
}
