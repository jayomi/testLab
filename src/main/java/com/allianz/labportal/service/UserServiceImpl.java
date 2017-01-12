package com.allianz.labportal.service;

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

	
	
	

}
