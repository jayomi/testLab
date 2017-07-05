package com.allianz.labportal.service;

import java.util.List;

import com.allianz.labportal.model.AssignTolab;

public interface TokenAssignToLabService {
	public List<AssignTolab> getLabList();
	public List<AssignTolab> getLabListByEmail(String email);
	public List<AssignTolab> getLabListByBranch(String branch);
	public AssignTolab addTokenAssignToLab(AssignTolab assignToLab);
}
