package com.allianz.labportal.dao;

import java.util.List;
import com.allianz.labportal.model.AssignTolab;


public interface TokenAssignToLabDao {

	public List<AssignTolab> getLabList();
	public List<AssignTolab> getLabListByEmail(String email);
	public List<AssignTolab> getLabListByBranch(String branch);
	public AssignTolab addTokenAssignToLab(AssignTolab assignToLab);
	
}
