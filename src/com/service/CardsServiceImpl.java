package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CardDao;
import com.domain.Card;
@Service
@Transactional
//加上注解@Transactional,就可以指定这个类需要受Spring的事务管理，
//注意@Transactional只能针对public属性范围内的方法添加
public class CardsServiceImpl implements CardsService{
	@Autowired
	private CardDao cardDao;
	/**
	 * 查询用户下所有名片信息
	 */
	@Override
	public List<Map<String, Object>> query(String userName) {
		return cardDao.query(userName);
	}
	/**
	 * 分页查询用户下名片信息
	 */
	@Override
	public List<Map<String, Object>>  queryByPage(int pageCur, String userName){
		return cardDao.queryByPage(pageCur, userName);
	}
	/**
	 *给某用户添加他的名片
	 */
	//Spring默认只对RuntimeException进行回滚,当然我们可可以修改Spring的默认配置,当发生RuntimeException我们也可以不让他进行事务回滚 
    //只需要加上一个@Transactional(noRollbackFor=RuntimeException.class)，不回滚
	@Override
	//@Transactional(noRollbackFor=RuntimeException.class) 
	public boolean add(Card card, String newFileName, String userName) {
		//测试事务处理
		//String ids[]={"14","15","16","17","18"};
		//cardDao.deleteCards(ids);
		cardDao.add(card, newFileName, userName);
		//如果添加失败（比如，可以手动设置主键重复），delete数据会恢复，进行了事务回滚。
		return true;
	}
	/**
	 * 查询一个名片
	 */
	@Override
	public Map<String, Object> selectACard(String id) {
		return cardDao.selectACard(id);
	}
	/**
	 * 删除一个名片
	 */
	@Override
	public boolean deleteAcard(String id) {
		return cardDao.deleteAcard(id);
	}
	/**
	 * 删除多个名片
	 */
	@Override
	public boolean deleteCards(String[] id) {
		return cardDao.deleteCards(id);
	}
	/**
	 *修改名片
	 */
	@Override
	public boolean update(Card card, String newFileName) {
		return cardDao.update(card, newFileName);
	}

}
