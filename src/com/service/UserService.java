package com.service;
import com.domain.User;
public interface UserService {
	boolean login(User u);
	boolean register(User u);
	boolean isExit(User u);
	boolean updateUser(String username , String password);
}
