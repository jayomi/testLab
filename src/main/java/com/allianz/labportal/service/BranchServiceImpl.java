package com.allianz.labportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allianz.labportal.dao.BranchDaoImpl;
import com.allianz.labportal.model.Branch;

@Service("branchServiceImpl")
public class BranchServiceImpl implements BranchService {

	@Autowired
	BranchDaoImpl branchDaoImpl;
	
	@Override
	@Transactional
	public List<Branch> getBranchList() {
		return branchDaoImpl.getBranchList();
	}

	@Override
	@Transactional
	public void addBranch(Branch branch) {
		branchDaoImpl.addBranch(branch);
	}

	@Override
	@Transactional
	public void deleteBranch(int id) {
		branchDaoImpl.deleteBranch(id);
	}

	@Override
	public Branch getBranchbyId(int id) {
		return branchDaoImpl.getBranchbyId(id);
	}

	
}
