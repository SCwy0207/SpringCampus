package com.service;
import java.util.List;
import java.util.Map;
import com.domain.Card;
public interface CardsService {
	List<Map<String, Object>> query(String userName);
	List<Map<String, Object>>  queryByPage(int pageCur, String userName);
	boolean add(Card card, String newFileName, String userName);
	boolean update(Card card, String newFileName);
	Map<String, Object> selectACard(String id);
	boolean deleteAcard(String id);
	boolean deleteCards(String[] id);
}
