package com.allianz.labportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allianz.labportal.dao.LabDaoImpl;
import com.allianz.labportal.model.Lab;

@Service("labServiceImpl")
public class LabServiceImpl implements LabService {
	
	@Autowired
	LabDaoImpl labDaoImpl;
	
	@Override
	@Transactional
	public void addLab(Lab lab) {
		labDaoImpl.addLab(lab);
	}

	@Override
	@Transactional
	public List<Lab> getLabList() {
		return labDaoImpl.getLabList();
	}

	@Override
	@Transactional
	public Lab getLabById(int id) {
		return labDaoImpl.getLabById(id);
	}

	@Override
	@Transactional
	public void updateLab(Lab lab) {
		labDaoImpl.updateLab(lab);
	}

	@Override
	@Transactional
	public void deleteLab(int id) {
		labDaoImpl.deleteLab(id);
	}

	@Override
	@Transactional
	public List<Lab> getLabListByCategory(int labCategory) {
		return labDaoImpl.getLabListByCategory(labCategory);
	}

	@Override
	@Transactional
	public int getLabCategoryByLabId(int labId) {
		return labDaoImpl.getLabCategoryByLabId(labId);
	}

}
