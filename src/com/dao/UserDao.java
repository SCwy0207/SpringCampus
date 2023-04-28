package com.dao;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import com.domain.User;
@Repository("userDao")
public class UserDao extends BaseDao{
	/**
	 * 登录
	 */
	public boolean login(User u){
		String sql = "select * from usertable where username=? and password=?";
		Object obj[] = {
					u.getUsername(),
					u.getPassword()
				};
		List<Map<String, Object>> list = findByParam(sql, obj);
		if(list.size() > 0){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 注册
	 */
	public boolean register(User u){
		String sql = "insert into usertable values(?,?)";
		Object obj[] = {
					u.getUsername(),
					u.getPassword()
				};
		return updateByParam(sql,obj);
	}
	
	/**
	 * 判断用户名是否存在
	 */
	public boolean isExit(User u){
		String sql = "select * from usertable where userName=?";
		Object obj[] = {
					u.getUsername()
				};
		List<Map<String, Object>> list = findByParam(sql, obj);
		if(list.size() > 0){
			return false;
		}else{
			return true;
		}
	}
	/**
	 * 修改密码
	 */
	public boolean updateUser(String username, String password){
		String sql = "update usertable set password=? where username=? ";
		Object obj[] = {
				password, 
				username
			};
		return updateByParam(sql,obj);
	}
}
