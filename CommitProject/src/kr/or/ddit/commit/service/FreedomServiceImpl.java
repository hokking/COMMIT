package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.dao.FreedomDaoImpl;
import kr.or.ddit.commit.dao.IFreedomDao;
import kr.or.ddit.commit.vo.FreedomVO;

public class FreedomServiceImpl implements IFreedomService {

	private IFreedomDao dao;
	private static IFreedomService service; // 선언만
	
	private FreedomServiceImpl() { // 생성자 : private여서 외부에서 사용불가인데
		dao = FreedomDaoImpl.getDao();
	}
	
	public static IFreedomService getService() {
		// IFreedomServcie : 타입 (type)
		// getService : 메서드 이름 ( service를 가져온다), class 밖에서 service를 가져오도록 하는 메서드
		//생성자 : 여기서 외부에서 사용할 수 있도록 작업 ( public static : 고정해서 공유한다)
		if(service ==null) service = new FreedomServiceImpl(); 
		// 생성자를 만들면서 FreedomService 클래스의 내용을 밖에서 사용할 수 있게 한다.
		
		return service; // 타입으로 반환
		
	}
	
	@Override
	public List<FreedomVO> selectAllFreeBoard() {
		List<FreedomVO> list = null;
		
		try {
			list = dao.selectAllFreeBoard();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertFreeboard(FreedomVO vo) {
		
		try {
			dao.insertFreeboard(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public FreedomVO selectOneFreeBoard(int freedomnum){
		FreedomVO vo = null;
		
		try {
			vo = dao.selectOneFreeBoard(freedomnum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public List<FreedomVO> searchTitleFreeBoard(String title) {
		List<FreedomVO> list = null;
		try {
			list = dao.searchTitleFreeBoard(title);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<FreedomVO> searchMemIdFreeBoard(String memId) {
		List<FreedomVO> list = null;
		try {
			list = dao.searchMemIdFreeBoard(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int updateFreeBoard(FreedomVO vo) {
		int num = 0;
		
		try {
			num = dao.updateFreeBoard(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public int deleteFreeboard(int freedomnum) {
		int num = 0;
		
		try {
			num = dao.deleteFreeBoard(freedomnum);
		} catch (SQLException e) {	
			e.printStackTrace();
		}
		
		return num;
	}

	@Override
	public List<FreedomVO> searchTagFreeBoard(int tagnum) {
		List<FreedomVO> list = null;
		
		try {
			list = dao.searchTagFreeBoard(tagnum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Map<String, Integer> pageInfo(int page) {

		//전체글갯수 가져오기 
		 int count = this.totalCount();
		
		//한페이지당 출력 글 갯수 
		int perList = 5;
		
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

	@Override
	public int totalCount() {
		int  count = 0;
		
		try {
			count = dao.totalCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public List<FreedomVO> selectByPage(Map<String, Integer> map) {
		List<FreedomVO>  list = null;
		
		try {
			list = dao.selectByPage(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<FreedomVO> getAllFreedom(Map<String, Integer> map) {
		List<FreedomVO> allList = null;
		
		try {
			allList = dao.getAllFreedom(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allList;
	}

	@Override
	public int FreedomView(FreedomVO vo) {
		int num = 0;
		try {
			num = dao.FreedomView(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}

	
	
	
}
