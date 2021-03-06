package kr.or.ddit.commit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.FavoriteVO;

public interface IFavoriteDao {
	
	//관심공고 전체 출력
	public List<FavoriteVO> getAllfav(String mem_id) throws SQLException;
	
	//관심공고 추가
	public int insertfav(Map<String, String> map) throws SQLException;
	
	//관심공고 삭제
	public int deletefav(Map<String, String> map) throws SQLException;
	
	//관심공고 제목
	public String recselect(int recno) throws SQLException;
	
	public int favoriteTF(Map<String, String> map) throws SQLException;
	
	public int favoriteTF2(String mem_id) throws SQLException;
	
	public int favoriteinsert(Map<String, String> map) throws SQLException;
	
}
