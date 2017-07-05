package com.allianz.labportal.dao;

import java.util.List;

import com.allianz.labportal.model.MedicalReports;
import com.allianz.labportal.model.SpecialMedicalReports;

public interface MedicalReportDao {

		public List<MedicalReports> getMedicalReportList();
		public List<SpecialMedicalReports> getSpecialMedicalReports();
}
