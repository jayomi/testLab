package com.allianz.labportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allianz.labportal.dao.TokenAssignToLabDaoImpl;
import com.allianz.labportal.model.AssignTolab;

@Service("tokenAssignToLabServiceImpl")
public class TokenAssignToLabServiceImpl implements TokenAssignToLabService {

	@Autowired
	TokenAssignToLabDaoImpl tokenAssignToLabDaoImpl;
	
	@Override
	@Transactional
	public List<AssignTolab> getLabList() {
		return tokenAssignToLabDaoImpl.getLabList();
	}

	@Override
	@Transactional
	public AssignTolab addTokenAssignToLab(AssignTolab assignToLab) {
		return tokenAssignToLabDaoImpl.addTokenAssignToLab(assignToLab);
	}

	@Override
	@Transactional
	public List<AssignTolab> getLabListByEmail(String email) {
		return tokenAssignToLabDaoImpl.getLabListByEmail(email);
	}

	@Override
	@Transactional
	public List<AssignTolab> getLabListByBranch(String branch) {
		return tokenAssignToLabDaoImpl.getLabListByBranch(branch);
	}

}
