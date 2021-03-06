package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.commit.dao.INoticeDao;
import kr.or.ddit.commit.dao.IResumeDao;
import kr.or.ddit.commit.dao.ResumeDaoImple;
import kr.or.ddit.commit.vo.RecruitVO;
import kr.or.ddit.commit.vo.ResumeVO;

public class ResumeServiceImple implements IResumeService{

	private IResumeDao dao;
	private static ResumeServiceImple service;
	
	private ResumeServiceImple() {
		dao = ResumeDaoImple.getInstance();
	}
	
	public static ResumeServiceImple getInstance() {
		if(service == null) service = new ResumeServiceImple(); 
		
		return service;
	}
	
	@Override
	public int selectresume(String mem_id) {
		int rs = 0;
		try {
			rs = dao.selectresume(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	@Override
	public void insertresume(ResumeVO vo) {
		try {
			dao.insertresume(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public int updateresume(ResumeVO vo) {
		int rs=0;
		try {
			rs = dao.updateresume(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	@Override
	public List<ResumeVO> listresume(String mem_id) {
		 List<ResumeVO> list = null;
		 try {
			list = dao.listresume(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ResumeVO detailresume(int resume_num) {
		ResumeVO vo = null;
		try {
			vo = (ResumeVO)dao.detailresume(resume_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public String userselect(String mem_id) {
		String name = null;
		try {
			name = dao.userselect(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public void deleteresume(int resume_num) {
		try {
			dao.deleteresume(resume_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public String conselect(String mem_id) {
		String name = null;
		try {
			name = dao.conselect(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public int selectrecruit(String mem_id) {
		int cnt = 0;
		try {
			cnt= dao.selectrecruit(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt ;
	}

	@Override
	public List<RecruitVO> listrecruit(String mem_id) {
		List<RecruitVO> list = null;
		try {
			list = dao.listrecruit(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
