package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.commit.vo.JobworkVO;

public interface IJobworkDao {
	public List<JobworkVO> selectAllJobwork() throws SQLException;
}
