package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.commit.vo.CompanyVO;
import kr.or.ddit.commit.vo.MemberVO;
import kr.or.ddit.commit.vo.WorkerVO;
import kr.or.ddit.commit.vo.ZipVO;

public interface IJoinDao {
	public String CheckId(String id) throws SQLException;
	
	public List<ZipVO> selectByDong(String dong) throws SQLException;
	
	public String memberJoin(MemberVO vo) throws SQLException;
	
	public String workerJoin(WorkerVO vo) throws SQLException;

	public String companyJoin(CompanyVO comvo) throws SQLException;
}
