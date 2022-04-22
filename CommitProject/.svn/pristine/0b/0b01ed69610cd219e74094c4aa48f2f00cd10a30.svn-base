package kr.or.ddit.commit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.dao.IQnaDao;
import kr.or.ddit.commit.dao.QnaDaoImpl;
import kr.or.ddit.commit.vo.QnaVO;

public class QnaServiceImpl implements IQnaService {
	
	private IQnaDao dao;
	private static QnaServiceImpl service;
	
	private QnaServiceImpl() {
		dao = QnaDaoImpl.getInstance();
	}
	
	public static IQnaService getInstance() {
		if(service == null) service = new QnaServiceImpl();
		
		return service;
	}

	@Override
	public List<QnaVO> selectByPage(Map<String, Integer> map) {
		List<QnaVO> list = null;
		
		try {
			list = dao.selectByPage(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int totalCount() {
		int count = 0;
		
		try {
			count = dao.totalCount();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int insertQna(Map<String, String> map) {
		int inum = 0;
		
		try {
			inum = dao.insertQna(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return inum;
	}

	@Override
	public int updateQna(QnaVO vo) {
		int unum = 0;
		
		try {
			unum = dao.updateQna(vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return unum;
	}

	@Override
	public int deleteQna(int no) {
		int dnum = 0;
		
		try {
			dao.deleteQna(no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dnum;
	}

	@Override
	public QnaVO readQna(int no) {
		QnaVO read = null;
		
		try {
			read = dao.readQna(no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return read;
	}

	@Override
	public Map<String, Integer> pageInfo(int page) {
		//전체 글 갯수 가져오기
		int count = this.totalCount();
		
		//한페이지 당 출력할 글 개수
		int perList = 10;
		
		//한화면에 출력할 페이지 수
		int perPage  = 2;
		
		//전체 페이지 수  : 전체 글갯수/perList
		int totalPage = (int) Math.ceil((double)count/perList);
		
		//list의 시작번호와 끝 번호
		int start = (page-1) * perList + 1;
		int end = start + perList - 1;
		if(end > count) end = count; //마지막 페이지가 끝
		
		//시작페이지와 끝 페이지
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		if(endPage>totalPage) endPage = totalPage;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("sp", startPage);
		map.put("ep", endPage);
		map.put("tp", totalPage);
		
		return map;
	}

}
