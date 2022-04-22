package kr.or.ddit.commit.service;

import java.util.List;

import kr.or.ddit.commit.vo.CompanyVO;
import kr.or.ddit.commit.vo.MemberVO;
import kr.or.ddit.commit.vo.WorkerVO;
import kr.or.ddit.commit.vo.ZipVO;

public interface IJoinService {
	public String CheckId(String id);

	public List<ZipVO> selectByDong(String dong);
	
	public String memberJoin(MemberVO vo);
	
	public String workerJoin(WorkerVO vo);

	public String companyJoin(CompanyVO comvo);
}
