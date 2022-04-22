package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.QnaVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class QnaDaoImpl implements IQnaDao {
	
	private SqlMapClient smc;
	private static QnaDaoImpl dao;
	
	private QnaDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IQnaDao getInstance() {
		if(dao == null) dao =  new QnaDaoImpl();
		
		return dao;
	}

	@Override
	public List<QnaVO> selectByPage(Map<String, Integer> map) throws SQLException {
		List<QnaVO> list =  smc.queryForList("Qna.selectByPage", map);
		return list;
	}

	@Override
	public int totalCount() throws SQLException {
		int totalCount = (int) smc.queryForObject("Qna.totalCount");
		return totalCount;
	}

	@Override
	public int insertQna(Map<String, String> map) throws SQLException {
		return (int) smc.insert("Qna.insertQna", map);
	}

	@Override
	public int updateQna(QnaVO vo) throws SQLException {
		return smc.update("Qna.updateQna", vo);
	}

	@Override
	public int deleteQna(int no) throws SQLException {
		return smc.delete("Qna.deleteQna", no);
	}

	@Override
	public QnaVO readQna(int no) throws SQLException {
		return (QnaVO) smc.queryForObject("Qna.readQna", no);
	}

}
