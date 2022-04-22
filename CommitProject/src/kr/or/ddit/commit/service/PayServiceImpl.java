package kr.or.ddit.commit.service;

import java.sql.SQLException;

import kr.or.ddit.commit.dao.IPayDao;
import kr.or.ddit.commit.dao.PayDaoImpl;
import kr.or.ddit.commit.vo.PayVO;

public class PayServiceImpl implements IPayService {
	private IPayDao dao;
	private static IPayService service;
	
	private PayServiceImpl() {
		dao = PayDaoImpl.getInstance();
	}
	
	public static IPayService getInstance() {
		if(service == null) service = new PayServiceImpl();
		return service;
	}

	@Override
	public void insertPay(PayVO vo) {
		try {
			dao.insertPay(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
