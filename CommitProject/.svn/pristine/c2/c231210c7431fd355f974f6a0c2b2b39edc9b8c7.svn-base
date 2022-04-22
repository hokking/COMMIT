package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.CompanyVO;
import kr.or.ddit.commit.vo.FreedomVO;
import kr.or.ddit.commit.vo.MemberVO;
import kr.or.ddit.commit.vo.WorkerVO;

public interface IManagerService {

	public Map<String, Integer> pageInfo(int page,String op, String txt);

	public List<MemberVO> selectByPage(Map<String, Integer> map);

	public int deleteBoard(String id);

	public int totalCount(String op, String txt);

	public List<MemberVO> searchMember(Map<String, Object> map);
	
	public int total();

	// 자세히보기
	  public WorkerVO detailWorker(String memId) ; 
	  public CompanyVO detailCompany(String memId) ;

	public Map<String, Integer> pageInfo(int spage);
}
