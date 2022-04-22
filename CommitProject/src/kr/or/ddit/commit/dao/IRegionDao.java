package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.commit.vo.RegionVO;

public interface IRegionDao {
	public List<RegionVO> selectAllRegion() throws SQLException;
}
