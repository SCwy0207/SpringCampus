package com.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.UserDao;
import com.domain.User;
//注解为一个服务
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	/**
	 * 登录
	 */
	@Override
	public boolean login(User u) {
		return userDao.login(u);
	}
	/**
	 * 注册
	 */
	@Override
	public boolean register(User u) {
		return userDao.register(u);
	}
	/**
	 * 判断用户名是否存在
	 */
	@Override
	public boolean isExit(User u) {
		return userDao.isExit(u);
	}
	/**
	 * 修改密码
	 */
	@Override
	public boolean updateUser(String username, String password) {
		return userDao.updateUser(username, password);
	}
	
}
