package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.commit.vo.RecruitVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class RecruitDaoImpl implements IRecruitDao {
	private SqlMapClient smc;
	private static IRecruitDao dao;
	
	private RecruitDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IRecruitDao getInstance() {
		if(dao == null) dao = new RecruitDaoImpl();
		return dao;
	}

	@Override
	public List<RecruitVO> selectAllRecruitPop() throws SQLException {
		return smc.queryForList("recruit.selectAllRecruitPop");
	}

	@Override
	public List<RecruitVO> selectAllRecruitNew() throws SQLException {
		return smc.queryForList("recruit.selectAllRecruitNew");
	}


	@Override
	public List<RecruitVO> selectRegRecruitPop(int regNum) throws SQLException {
		return smc.queryForList("recruit.selectRegRecruitPop", regNum);
	}

	@Override
	public List<RecruitVO> selectRegRecruitNew(int regNum) throws SQLException {
		return smc.queryForList("recruit.selectRegRecruitNew", regNum);
	}

	@Override
	public List<RecruitVO> selectJobRecruitPop(int workNum) throws SQLException {
		return smc.queryForList("recruit.selectJobRecruitPop", workNum);
	}

	@Override
	public List<RecruitVO> selectJobRecruitNew(int workNum) throws SQLException {
		return smc.queryForList("recruit.selectJobRecruitNew", workNum);
	}

	@Override
	public List<RecruitVO> selectRJRecruitPop(Map<String, Integer> map) throws SQLException {
		return smc.queryForList("recruit.selectRJRecruitPop", map);
	}

	@Override
	public List<RecruitVO> selectRJRecruitNew(Map<String, Integer> map) throws SQLException {
		return smc.queryForList("recruit.selectRJRecruitNew", map);
	}

	@Override
	public RecruitVO selectRecruit(int recruitNum) throws SQLException {
		return (RecruitVO)smc.queryForObject("recruit.selectRecruit", recruitNum);
	}
	
	@Override
	public void insertRecruit(RecruitVO vo) throws SQLException {
		smc.insert("recruit.insertRecruit", vo);
		
	}

	@Override
	public void updateRecruit(RecruitVO vo) throws SQLException {
		smc.update("recruit.updateRecruit", vo);
		
	}

	@Override
	public String selectRegion(int regNum) throws SQLException {
		return (String)smc.queryForObject("recruit.selectRegion", regNum);
	}

	@Override
	public void updateViews(int recruitNum) throws SQLException {
		smc.update("recruit.updateViews", recruitNum);
	}

	@Override
	public void deleteRecruit(int recruitNum) throws SQLException {
		smc.delete("recruit.deleteRecruit", recruitNum);
	}

	@Override
	public List<RecruitVO> searchRecruit(String data) throws SQLException {
		return smc.queryForList("recruit.searchRecruit", data);
	}

	@Override
	public void updateImg(String rimg) throws SQLException {
		smc.update("recruit.updateImg", rimg);
		
	}

}
