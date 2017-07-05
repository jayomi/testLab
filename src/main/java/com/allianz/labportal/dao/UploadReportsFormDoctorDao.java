package com.allianz.labportal.dao;



import com.allianz.labportal.model.Uploadreportsfromdoctor;

public interface UploadReportsFormDoctorDao {
	
	
	public Uploadreportsfromdoctor addReports(Uploadreportsfromdoctor reportsFromDoctor);
	public Uploadreportsfromdoctor getReportByTokenId(int id);

}
