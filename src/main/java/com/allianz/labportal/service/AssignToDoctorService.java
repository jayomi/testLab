package com.allianz.labportal.service;

import java.util.List;

import com.allianz.labportal.model.AssignToDoctor;

public interface AssignToDoctorService {
	
	public List <AssignToDoctor> getDoctorList();
	public AssignToDoctor addReportAssignToDoctor(AssignToDoctor assignToDoctor);
}
