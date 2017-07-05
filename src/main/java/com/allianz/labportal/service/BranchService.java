package com.allianz.labportal.service;

import java.util.List;

import com.allianz.labportal.model.Branch;

public interface BranchService {

	public List<Branch> getBranchList();
	public void addBranch(Branch branch);
	public void deleteBranch(int id);
	public Branch getBranchbyId(int id);
}
