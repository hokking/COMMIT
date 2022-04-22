package kr.or.ddit.commit.dao;

import java.sql.SQLException;

import kr.or.ddit.commit.vo.PayVO;

public interface IPayDao {
	public void insertPay(PayVO vo) throws SQLException;
}
