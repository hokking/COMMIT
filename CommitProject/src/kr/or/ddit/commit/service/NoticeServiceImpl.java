package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.dao.INoticeDao;
import kr.or.ddit.commit.dao.NoticeDaoImpl;
import kr.or.ddit.commit.vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService {
	
	private INoticeDao dao;
	private static NoticeServiceImpl service;
	
	private NoticeServiceImpl() {
		dao = NoticeDaoImpl.getInstance();
	}
	
	public static NoticeServiceImpl getInstance() {
		if(service == null) service = new NoticeServiceImpl(); 
		
		return service;
	}

	@Override
	public int insertNotice(Map<String, String> map) {
		int inum = 0;
		
		try {
			inum = dao.insertNotice(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return inum;
	}

	@Override
	public int updateNotice(NoticeVO nvo) {
		int unum = 0;
		
		try {
			unum = dao.updateNotice(nvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return unum;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		int dnum = 0;
		
		try {
			dnum = dao.deleteNotice(noticeNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dnum;
	}

	@Override
	public int updateView(int noticeNo) {
		int uvnum = 0;
		
		try {
			uvnum = dao.updateView(noticeNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uvnum;
	}

	@Override
	public List<NoticeVO> getAllNotice(Map<String, Integer> map) {
		List<NoticeVO> allList = null;
		
		try {
			allList = dao.getAllNotice(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return allList;
	}

	@Override
	public NoticeVO selectNotice(int noticeNo) {
		NoticeVO sel = null;
		
		try {
			sel = dao.selectNotice(noticeNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sel;
	}

	@Override
	public int totalCount(){
		int totalCount = 0;
		
		try {
			totalCount = dao.totalCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}

	@Override
	public Map<String, Integer> pageInfo(int page) {
		//?????? ??? ?????? ????????????
		int count = this.totalCount();
		
		//??????????????? ????????? ??? ??????
		int perList = 10;
		
		//???????????? ????????? ????????? ???
		int perPage = 2;
		
		//?????? ????????? ??? : ?????? ??? ?????? /perList
		int totalPage = (int) Math.ceil((double)count/perList);
		
		//list??? ??????????????? ??? ??????
		int start = (page-1) * perList + 1;
		int end = start + perList - 1 ;
		if(end > count) end = count; //????????? ???????????? ???
		
		//?????????????????? ??? ?????????
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage -1;
		if(endPage>totalPage) endPage=totalPage;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("sp", startPage);
		map.put("ep", endPage);
		map.put("tp", totalPage);
		
		return map;
	}

}
