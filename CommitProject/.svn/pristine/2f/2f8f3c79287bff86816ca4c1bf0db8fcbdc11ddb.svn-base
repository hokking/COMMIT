package kr.or.ddit.commit.dao;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.MemberVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class LoginDaoImpl implements ILoginDao{

	private SqlMapClient smc = null;
	
	private static LoginDaoImpl dao;
	
	private LoginDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static LoginDaoImpl getInstance() {
		if(dao == null) dao = new LoginDaoImpl();
		
		return dao;
	}
	
	

	@Override
	public MemberVO getLoginMember(MemberVO memvo) {
		MemberVO member = new MemberVO();
		
		try {
			member = (MemberVO) smc.queryForObject("login.getLoginMember", memvo);
		} catch (Exception e) {
			member = null;
		}
		return member;
	}
}
