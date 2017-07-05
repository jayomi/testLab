package com.allianz.labportal.service;

import java.util.List;

import com.allianz.labportal.model.Lab;

public interface LabService {
	public void addLab(Lab lab);
	public List<Lab> getLabList();
	public List<Lab> getLabListByCategory(int labCategory);
	public Lab getLabById(int id);
	public void updateLab(Lab lab);
	public void deleteLab(int id);
	public int getLabCategoryByLabId(int labId);
}
