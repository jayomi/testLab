package com.allianz.labportal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allianz.labportal.dao.UserTypeDaoImpl;
import com.allianz.labportal.model.UserType;

@Service("userTypeServiceImpl")
public class UserTypeServiceImpl implements UserTypeService {

	@Autowired
	UserTypeDaoImpl userTypeDaoImpl;
	
	@Override
	@Transactional
	public UserType getUserTypeById(int id) {
		return userTypeDaoImpl.getUserTypeById(id);
	}

}
