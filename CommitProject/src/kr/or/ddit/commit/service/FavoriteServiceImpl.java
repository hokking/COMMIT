package kr.or.ddit.commit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.dao.FavoriteDaoImpl;
import kr.or.ddit.commit.dao.IFavoriteDao;
import kr.or.ddit.commit.vo.FavoriteVO;
import sun.security.jca.GetInstance;

public class FavoriteServiceImpl implements IFavoriteService {
	
	private IFavoriteDao dao;
	private static FavoriteServiceImpl service;
	
	private FavoriteServiceImpl() {
		dao = FavoriteDaoImpl.getInstance();
	}
	
	public static IFavoriteService getInstance() {
		if(service == null) service = new FavoriteServiceImpl();
		
		return service;
	}
	
	
	@Override
	public List<FavoriteVO> getAllfav(String mem_id) {
		List<FavoriteVO> list = null;
		
		try {
			list = dao.getAllfav(mem_id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertfav(Map<String, String> map) {
		int inum = 0;
		
		try {
			inum = dao.insertfav(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return inum;
	}

	@Override
	public int deletefav(Map<String, String> map) {
		int dnum = 0;
		
		try {
			dnum = dao.deletefav(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dnum;
		
	}

	@Override
	public String recselect(int recno) {
		String title = null;
		
		try {
			title = dao.recselect(recno);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return title;
	}

	@Override
	public int favoriteTF(Map<String, String> map) {
		int num = 0;
		try {
			num = dao.favoriteTF(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public int favoriteinsert(Map<String, String> map) {
		int num = 0;
		try {
			num = dao.favoriteinsert(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public int favoriteTF2(String mem_id) {
		int num = 0;
		try {
			num= dao.favoriteTF2(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}

}
