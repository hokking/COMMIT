package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.commit.vo.WorkerVO;

public interface IMemberDao {
	public WorkerVO workerDetail(String id) throws SQLException;
	public int workerUpdate(Map<String, String> map) throws SQLException;
	public int workerUpdatepass(Map<String, String> map) throws SQLException;
}
