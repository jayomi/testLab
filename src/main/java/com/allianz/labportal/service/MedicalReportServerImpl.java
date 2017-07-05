package com.allianz.labportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allianz.labportal.dao.MedicalReportDaoImpl;
import com.allianz.labportal.model.MedicalReports;
import com.allianz.labportal.model.SpecialMedicalReports;

@Service("medicalReportServerImpl")
public class MedicalReportServerImpl implements MedicalReportServer {

	@Autowired
	MedicalReportDaoImpl medicalReportDao;
	
	@Override
	@Transactional
	public List<MedicalReports> getMedicalReportList() {
		return medicalReportDao.getMedicalReportList();
	}

	@Override
	@Transactional
	public List<SpecialMedicalReports> getSpecialMedicalReports() {
		return medicalReportDao.getSpecialMedicalReports();
	}

}
