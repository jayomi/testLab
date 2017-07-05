package com.allianz.labportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allianz.labportal.dao.RegisterDaoImpl;
import com.allianz.labportal.model.Register;
import com.allianz.labportal.model.RegisterUser;

@Service("registerServiceImpl")
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	RegisterDaoImpl registerDaoImpl;
	
	@Override
	@Transactional
	public Register addUser(Register user) {
		
		return registerDaoImpl.addUser(user);
		
	}

	@Override
	public RegisterUser checkUserByUserName(String userName) {
		return registerDaoImpl.checkUserByUserName(userName);
	}

	@Override
	@Transactional
	public List<Register> getRequestUserList(byte accessType,String userType) {
		return registerDaoImpl.getRequestUserList(accessType,userType);
	}

	@Override
	@Transactional
	public void acceptUser(int id) {
		registerDaoImpl.acceptUser(id);
	}

}
