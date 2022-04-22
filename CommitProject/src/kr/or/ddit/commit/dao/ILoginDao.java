package kr.or.ddit.commit.dao;

import kr.or.ddit.commit.vo.MemberVO;

public interface ILoginDao {
	
	public MemberVO getLoginMember(MemberVO memvo);

}
