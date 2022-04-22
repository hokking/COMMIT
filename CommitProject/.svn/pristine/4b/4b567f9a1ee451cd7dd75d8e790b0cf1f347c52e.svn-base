package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.commit.dao.ApplyResumeDaoImpl;
import kr.or.ddit.commit.dao.IApplyResumeDao;
import kr.or.ddit.commit.vo.JobapplyVO;
import kr.or.ddit.commit.vo.RecruitVO;
import kr.or.ddit.commit.vo.ResumeVO;
import kr.or.ddit.commit.vo.WorkerVO;

public class ApplyResumeServiceImpl implements IApplyResumeService{
	private IApplyResumeDao dao;
	private static IApplyResumeService service;
	
	private ApplyResumeServiceImpl() {
		dao = ApplyResumeDaoImpl.getInstance();
	}
	
	public static IApplyResumeService getInstance() {
		if(service == null) service = new ApplyResumeServiceImpl();
		return service;
	}
	
	
	@Override
	public void insertApply(JobapplyVO vo) {
		try {
			dao.insertApply(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<RecruitVO> selectApply(String mem_id) {
		List<RecruitVO> list = null;
		try {
			list = dao.selectApply(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<RecruitVO> selectRecruit(String mem_id) {
		List<RecruitVO> list = null;
		try {
			list = dao.selectRecruit(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ResumeVO> selectApplicant(int recruit_num) {
		List<ResumeVO> list = null;
		try {
			list = dao.selectApplicant(recruit_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public WorkerVO selectID(String mem_id) {
		WorkerVO name = null;
		try {
			name = dao.selectID(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}

}
