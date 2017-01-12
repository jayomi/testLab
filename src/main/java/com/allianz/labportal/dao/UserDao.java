package com.allianz.labportal.dao;

import java.util.List;

import com.allianz.labportal.model.User;

public interface UserDao {
	public List<User> getUsersList();
	public User addUser(User user);
	public void updateUser(User user);
	public void deleteUser(int id);
}
