package com.allianz.labportal.service;

import java.util.Date;
import java.util.List;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allianz.labportal.dao.UserDao;
import com.allianz.labportal.dao.UserDaoImpl;
import com.allianz.labportal.model.User;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	@Autowired
	UserDaoImpl userDao;
	
	@Override
	@Transactional
	public List<User> getUsersList() {
		// TODO Auto-generated method stub
		return userDao.getUsersList();
	}

	@Override
	@Transactional
	public void updateUser(User user) {
		userDao.updateUser(user);
		
	}

	@Override
	@Transactional
	public void deleteUser(int id) {
		userDao.deleteUser(id);
		
	}

	@Override
	@Transactional
	public User addUser(User user) {
		return userDao.addUser(user);
	}

	@Override
	@Transactional
	public User checkUserByUserName(String userName) {
		return userDao.checkUserByUserName(userName);
	}

	@Override
	@Transactional
	public User checkNonADUser(String userName, String password) {
		return userDao.checkNonADUser(userName, password);
	}

	@Override
	@Transactional
	public String getUserType(String userName, String password) {
		return userDao.getUserType(userName, password);
	}

	@Override
	@Transactional
	public String getUserType(String userName) {
		return userDao.getUserType(userName);
	}

	@Override
	@Transactional
	public User getUserById(int id) {
		return userDao.getUserById(id);
	}

	@Override
	@Transactional
	public List<User> getUserListByUserType(int usertypeId) {
		return userDao.getUserListByUserType(usertypeId);
	}

	@Override
	@Transactional
	public Date getLastModifyDate(int id) {
		return userDao.getLastModifyDate(id);
	}

	@Override
	@Transactional
	public User checkUserByUserNameAndUserType(String userName, int userTypeId) {
		return userDao.checkUserByUserNameAndUserType(userName,userTypeId);
	}

	@Override
	@Transactional
	public Boolean getFirstLoginStatus(int id) {
		return userDao.getFirstLoginStatus(id);
	}

	
	
	

}
