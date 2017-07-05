package com.allianz.labportal.dao;

import java.util.List;

import com.allianz.labportal.model.Branch;

public interface BranchDao {

	public List<Branch> getBranchList();
	public void addBranch(Branch branch);
	public void deleteBranch(int id);
	public Branch getBranchbyId(int id);
	
}
