package com.allianz.labportal.dao;

import com.allianz.labportal.model.UploadReportsFromLab;

public interface UploadReportsFromLabDao {
	
	public String getUploadedReportsByTokenId(int id);
	//public String getNotUploadedReportsByTokenId(int id,String requestReoports);
	public String getNotUploadedReportsByTokenId(int id,String requestReoports,String uploadReports);
	public UploadReportsFromLab addReports(UploadReportsFromLab reportsFromLab);
	public UploadReportsFromLab getReportByTokenId(int id);
	public void updateReportsByTokenId(int id,String reports);
	public void updateReport_CountsByTokenId(int id,int uploadCount,int pendingCount);
	public void updateLabCompleteStatus(int tokenId,String status);

}
