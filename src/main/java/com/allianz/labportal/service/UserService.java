package com.allianz.labportal.service;

import java.util.List;

import com.allianz.labportal.model.User;

public interface UserService {
	
	public List<User> getUsersList();
	public User addUser(User user);
	public void updateUser(User user);
	public void deleteUser(int id);
	
}
