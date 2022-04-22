package kr.or.ddit.commit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.commit.vo.MemberVO;

public class SessionLogin {
	private static SessionLogin sl;
	
	private SessionLogin() {
		
	}
	
	public static SessionLogin getInstance() {
		if(sl == null) sl = new SessionLogin();
		return sl;
	}
	
	public void slogin(MemberVO mvo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("loginMember", mvo);
	}
	
}
