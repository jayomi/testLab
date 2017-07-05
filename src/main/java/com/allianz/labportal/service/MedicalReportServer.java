package com.allianz.labportal.service;

import java.util.List;

import com.allianz.labportal.model.MedicalReports;
import com.allianz.labportal.model.SpecialMedicalReports;

public interface MedicalReportServer {
	
	public List<MedicalReports> getMedicalReportList();
	public List<SpecialMedicalReports> getSpecialMedicalReports();
}
