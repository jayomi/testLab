package com.allianz.labportal.dao;

import java.util.Date;
import java.util.List;

import com.allianz.labportal.model.User;

public interface UserDao {
	public List<User> getUsersList();
	public List<User> getUserListByUserType(int usertypeId);
	public User addUser(User user);
	public void updateUser(User user);
	public void deleteUser(int id);
	public User getUserById(int id);
	public User checkUserByUserName(String userName);
	public User checkUserByUserNameAndUserType(String userName,int userTypeId);
	public User checkNonADUser(String userName,String password);
	public String getUserType(String userName,String password);
	public String getUserType(String userName);
	public Date getLastModifyDate(int id);
	public Boolean getFirstLoginStatus(int id);
}
