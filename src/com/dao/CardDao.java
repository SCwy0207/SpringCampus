package com.dao;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import com.domain.Card;
@Repository("cardDao")
public class CardDao extends BaseDao{
	/**
	 * 查询用户下所有名片信息
	 */
	public List<Map<String, Object>> query(String userName) {
		String sql = " select * from cardinfo where userName=? ";
		Object obj[] = {userName};
		return findByParam(sql, obj);
	}
	/**
	 * 分页查询用户下名片信息
	 */
	public List<Map<String, Object>>  queryByPage(int pageCur, String userName){
		String sql = " select id,name, "
				+ "   telephone,email, company, post, address, logo "
				+ "  from cardinfo  where userName=? limit ?,? ";
		Object obj[] = {userName, (pageCur-1)*10, 10};
		return findByParam(sql, obj);
	}
	/**
	 * 添加名片信息 
	 */
	public boolean add(Card card, String newFileName, String userName){
		//其中ID为自增
		String sql = "insert into cardinfo values(null,?,?,?,?,?,?,?,?)";
		//数组元素与问号对应
		Object obj[] = {
			card.getName(),
			card.getTelephone(),
			card.getEmail(),
			card.getCompany(),
			card.getPost(),
			card.getAddress(),
			newFileName,
			userName
		};
		return updateByParam(sql, obj);
	}
	/**
	 *修改名片
	 */
	public boolean update(Card card, String newFileName) {
		String sql = "update cardinfo set "
				+ " name=?,"
				+ " telephone=?,"
				+ " email=?,"
				+ " company=?,"
				+ " post=?,"
				+ " address=? ";
		ArrayList<Object> al = new ArrayList<Object>();
		al.add(card.getName());
		al.add(card.getTelephone());
		al.add(card.getEmail());
		al.add(card.getCompany());
		al.add(card.getPost());
		al.add(card.getAddress());
		//修改了图片
		if(newFileName.length() > 0){
			sql = sql + ", logo=? ";
			al.add(newFileName);
		}
		al.add(card.getId());
		sql = sql + " where id=? ";
		return updateByParam(sql, al.toArray());
	}
	/**
	 * 查询一个名片
	 */
	public Map<String, Object> selectACard(String id) {
		String sql = " select * from cardinfo where id = ? ";
		Object obj[] = {id};
		return findByParam(sql, obj).get(0);
	}
	/**
	 * 删除一个名片
	 */
	public boolean deleteAcard(String id){
		String sql = " delete from cardinfo where id = ? ";
		Object obj[] = {id};
		return updateByParam(sql, obj);
	}
	/**
	 * 删除多个名片
	 */
	public boolean deleteCards(String[] id){
		String sql = "delete from cardinfo where id in ( ";
		for (int i = 0; i < id.length - 1; i++) {
			sql = sql + id[i] + ",";
		}
		sql = sql + id[id.length - 1] + " )";
		return updateByParam(sql, null);
	}
}