package com.allianz.labportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allianz.labportal.dao.AssignToDoctorDaoImpl;
import com.allianz.labportal.model.AssignToDoctor;

@Service("AssignToDoctorServiceImpl")
public class AssignToDoctorServiceImpl implements AssignToDoctorService {
	
	@Autowired
	AssignToDoctorDaoImpl assignToDoctorDaoImpl;
	
	@Override
	@Transactional
	public AssignToDoctor addReportAssignToDoctor(AssignToDoctor assignToDoctor) {
		return assignToDoctorDaoImpl.addReportAssignToDoctor(assignToDoctor);
	}

	@Override
	@Transactional
	public List<AssignToDoctor> getDoctorList() {
		return assignToDoctorDaoImpl.getDoctorList();
	}

}
