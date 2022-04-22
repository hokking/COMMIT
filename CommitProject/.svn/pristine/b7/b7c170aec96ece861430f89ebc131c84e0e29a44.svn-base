package kr.or.ddit.commit.service;

import kr.or.ddit.commit.dao.ILoginDao;
import kr.or.ddit.commit.dao.LoginDaoImpl;
import kr.or.ddit.commit.vo.MemberVO;

public class LoginServiceImpl implements ILoginService {
	
	private ILoginDao dao;
	
	private static LoginServiceImpl service;
	
	private LoginServiceImpl() {
		dao = LoginDaoImpl.getInstance();
	}
	
	public static LoginServiceImpl getInstance() {
		if(service==null) service = new LoginServiceImpl();
		
		return service;
	}
	

	@Override
	public MemberVO getLoginMember(MemberVO memvo) {
		return dao.getLoginMember(memvo);
	}

}
