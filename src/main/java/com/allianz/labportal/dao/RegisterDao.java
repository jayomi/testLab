package com.allianz.labportal.dao;

import java.util.List;

import com.allianz.labportal.model.Register;
import com.allianz.labportal.model.RegisterUser;

public interface RegisterDao {
	
	public Register addUser(Register user);
	public List<Register> getRequestUserList(byte accessType,String userType);
	public RegisterUser checkUserByUserName(String userName);
	public void acceptUser(int id);
	

}
