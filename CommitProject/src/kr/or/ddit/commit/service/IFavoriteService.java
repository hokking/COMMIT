package kr.or.ddit.commit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commit.vo.FavoriteVO;

public interface IFavoriteService {
	
	//관심공고 전체 출력
	public List<FavoriteVO> getAllfav(String mem_id);
	
	//관심공고 추가
	public int insertfav(Map<String, String> map);
	
	//관심공고 삭제
	public int deletefav(Map<String, String> map);
	
	//관심공고 제목
	public String recselect(int recno);	
	
	public int favoriteTF(Map<String, String> map);
	
	public int favoriteTF2(String mem_id);
	
	public int favoriteinsert(Map<String, String> map);

}
