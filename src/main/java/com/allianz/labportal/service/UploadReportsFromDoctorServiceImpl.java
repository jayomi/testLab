package com.allianz.labportal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allianz.labportal.dao.UploadReportsFormDoctorDaoImpl;
import com.allianz.labportal.model.Uploadreportsfromdoctor;

@Service("uploadReportsFromDoctorServiceImpl")
public class UploadReportsFromDoctorServiceImpl implements UploadReportsFromDoctorService {
	
	@Autowired
	UploadReportsFormDoctorDaoImpl uploadReportsFormDoctorDaoImpl;
	
	@Override
	@Transactional
	public Uploadreportsfromdoctor addReports(Uploadreportsfromdoctor reportsFromDoctor) {
		// TODO Auto-generated method stub
		return uploadReportsFormDoctorDaoImpl.addReports(reportsFromDoctor);
	}

	@Override
	@Transactional
	public Uploadreportsfromdoctor getReportByTokenId(int id) {
		return uploadReportsFormDoctorDaoImpl.getReportByTokenId(id);
	}

}
