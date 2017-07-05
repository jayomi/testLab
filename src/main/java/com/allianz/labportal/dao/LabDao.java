package com.allianz.labportal.dao;

import java.util.List;

import com.allianz.labportal.model.HeadTokenInfo;
import com.allianz.labportal.model.Lab;

public interface LabDao {
	
	public void addLab(Lab lab);
	public List<Lab> getLabList();
	public List<Lab> getLabListByCategory(int labCategory);
	public Lab getLabById(int id);
	public void updateLab(Lab lab);
	public void deleteLab(int id);
	public int getLabCategoryByLabId(int labId);

}
