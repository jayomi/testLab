package com.allianz.labportal.service;

import com.allianz.labportal.model.Uploadreportsfromdoctor;

public interface UploadReportsFromDoctorService {

	public Uploadreportsfromdoctor addReports(Uploadreportsfromdoctor reportsFromDoctor);
	public Uploadreportsfromdoctor getReportByTokenId(int id);
}
