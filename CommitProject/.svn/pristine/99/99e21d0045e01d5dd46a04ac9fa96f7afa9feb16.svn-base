package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.NoticeVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class NoticeDaoImpl implements INoticeDao {
	
	private SqlMapClient smc = null;
	private static NoticeDaoImpl dao;
	
	private NoticeDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static INoticeDao getInstance() {
		if(dao == null) dao = new NoticeDaoImpl();
		
		return dao;
	}
	
	@Override
	public int insertNotice(Map<String, String> map) throws SQLException {
		return (int) smc.insert("notice.insertNotice", map);
	}

	@Override
	public int updateNotice(NoticeVO nvo) throws SQLException {
		return smc.update("notice.updateNotice", nvo);
	}

	@Override
	public int deleteNotice(int noticeNo) throws SQLException {
		return smc.delete("notice.deleteNotice", noticeNo);
	}

	@Override
	public int updateView(int noticeNo) throws SQLException {
		return smc.update("notice.updateView", noticeNo);
	}

	@Override
	public List<NoticeVO> getAllNotice(Map<String, Integer> map) throws SQLException {
		List<NoticeVO> allList = smc.queryForList("notice.getAllNotice", map);
		return allList;
	}

	@Override
	public NoticeVO selectNotice(int noticeNo) throws SQLException {
		NoticeVO selList = (NoticeVO) smc.queryForObject("notice.selectNotice", noticeNo);
		return selList;
	}

	@Override
	public int totalCount() throws SQLException {
		int totalCount = (int) smc.queryForObject("notice.totalCount");
		return totalCount;
	}

}
