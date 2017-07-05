package com.allianz.labportal.dao;

import java.util.List;

import com.allianz.labportal.model.AssignToDoctor;

public interface AssignToDoctorDao {
	
	public List <AssignToDoctor> getDoctorList();
	public AssignToDoctor addReportAssignToDoctor(AssignToDoctor assignToDoctor);

}
