package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.CompanyVO;
import kr.or.ddit.commit.vo.FreedomVO;
import kr.or.ddit.commit.vo.MemberVO;
import kr.or.ddit.commit.vo.WorkerVO;

public interface IManagerDao {

	public Map<String, Integer> pageInfo(int page) throws SQLException;

	public List<MemberVO> selectByPage(Map<String, Integer> map) throws SQLException;

	 public int totalCount(String op, String txt) throws SQLException;

	public int deleteBoard(String id) throws SQLException;

	public List<MemberVO> searchMember(Map<String, Object> map) throws SQLException;
	
	 public int total() throws SQLException;
	 
	// 자세히보기
	  public WorkerVO detailWorker(String memId) throws SQLException; 
	  public CompanyVO detailCompany(String memId) throws SQLException; 
	  
}
