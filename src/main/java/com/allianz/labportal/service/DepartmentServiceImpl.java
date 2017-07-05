package com.allianz.labportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allianz.labportal.dao.DepartmentDaoImpl;
import com.allianz.labportal.model.Department;

@Service("departmentServiceImpl")
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	DepartmentDaoImpl departmentDao;
	
	@Override
	@Transactional
	public List<Department> getDepartmentList() {
		
		return departmentDao.getDepartmentList();
	}

}
