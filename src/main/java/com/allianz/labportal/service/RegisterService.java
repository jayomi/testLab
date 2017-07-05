package com.allianz.labportal.service;

import java.util.List;

import com.allianz.labportal.model.Register;
import com.allianz.labportal.model.RegisterUser;

public interface RegisterService {

	public Register addUser(Register user);
	public RegisterUser checkUserByUserName(String userName);
	public List<Register> getRequestUserList(byte accessType,String userType);
	public void acceptUser(int id);
}
