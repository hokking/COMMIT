package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.dao.FreedomDaoImpl;
import kr.or.ddit.commit.dao.IManagerDao;
import kr.or.ddit.commit.dao.ManagerDaoImpl;
import kr.or.ddit.commit.vo.CompanyVO;
import kr.or.ddit.commit.vo.FreedomVO;
import kr.or.ddit.commit.vo.MemberVO;
import kr.or.ddit.commit.vo.WorkerVO;

public class ManagerServiceImpl implements IManagerService{
	
	private IManagerDao dao;
	private static IManagerService service;
	
	public ManagerServiceImpl() {
		dao = ManagerDaoImpl.getDao();
	}

	public static IManagerService getService() {
		if(service == null) service = new ManagerServiceImpl();
		return service;
	}

	@Override
	public Map<String, Integer> pageInfo(int page,String op, String txt) {
		int count = 0;
		
		//전체글갯수 가져오기 
		if(op != null && txt != null) {
			count = this.totalCount(op, txt);
		}else {
			count = this.total();
		}
		//한페이지당 출력 글 갯수 
		int perList = 5;
		
		//한화면에 출력할 페이지수 
		int perPage = 2;
		
		//전체페이지수 - 전체글갯수 / perList
		int totalPage = (int)Math.ceil((double)count / perList);
				
		//list의 시작번호와 끝번호1~3 . 4~6, 7~9 ~~~~~~ 16~18  19~20
		int start = (page-1)  * perList + 1;
		int end = start + perList -1;
		if(end > count) end = count;
		
		//시작페이지와 끝페이지 1~2 3~4  5~6 7~7
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage  + perPage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
	    Map<String, Integer>  map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("spage", startPage);
		map.put("epage", endPage);
		map.put("tpage", totalPage);
		
		return map;
	}

	public int totalCount(String op, String txt) {
		int  count = 0;
		
		try {
			count = dao.totalCount(op, txt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
	
	

	@Override
	public List<MemberVO> selectByPage(Map<String, Integer> map) {
	List<MemberVO>  list = null;
		
		try {
			list = dao.selectByPage(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int deleteBoard(String id) {
		int  res = 0;
		
		try {
			res = dao.deleteBoard(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return res;
	}

	@Override
	public List<MemberVO> searchMember(Map<String, Object> map) {
		List<MemberVO>  list = null;
		
		try {
			list = dao.searchMember(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int total() {
		int  count = 0;
		
		try {
			count = dao.total();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public WorkerVO detailWorker(String memId) {
		WorkerVO vo = null;
		
		try {
			vo = dao.detailWorker(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public CompanyVO detailCompany(String memId) {
		CompanyVO vo = null;
		
		try {
			vo = dao.detailCompany(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public Map<String, Integer> pageInfo(int page) {
		//전체글갯수 가져오기 
		 int count = this.total();
		
		//한페이지당 출력 글 갯수 
		int perList = 3;
		
		//한화면에 출력할 페이지수 
		int perPage = 2;
		
		//전체페이지수 - 전체글갯수 / perList
		int totalPage =   (int)Math.ceil((double)count / perList);
				
		//list의 시작번호와 끝번호1~3 . 4~6, 7~9 ~~~~~~ 16~18  19~20
		int start = (page-1)  * perList + 1;
		int end = start + perList -1;
		if(end > count) end = count;
		
		//시작페이지와 끝페이지 1~2 3~4  5~6 7~7
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage  + perPage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
	    Map<String, Integer>  map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("spage", startPage);
		map.put("epage", endPage);
		map.put("tpage", totalPage);
		
		return map;
	}







}
