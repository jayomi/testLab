package com.allianz.labportal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allianz.labportal.dao.UploadReportsFromLabDaoImpl;
import com.allianz.labportal.model.UploadReportsFromLab;

@Service("uploadReportsFromLabServiceImpl")
public class UploadReportsFromLabServiceImpl implements UploadReportsFromLabService {

	@Autowired
	UploadReportsFromLabDaoImpl uploadReportsFromLabDaoImpl;
	
	@Override
	@Transactional
	public UploadReportsFromLab addReports(UploadReportsFromLab reportsFromLab) {
		return uploadReportsFromLabDaoImpl.addReports(reportsFromLab);
	}

	@Override
	@Transactional
	public String getUploadedReportsByTokenId(int id) {
		return uploadReportsFromLabDaoImpl.getUploadedReportsByTokenId(id);
	}

	@Override
	@Transactional
	public String getNotUploadedReportsByTokenId(int id,String requestReoports,String uploadReports) {
		return uploadReportsFromLabDaoImpl.getNotUploadedReportsByTokenId(id,requestReoports,uploadReports);
	}

	@Override
	@Transactional
	public UploadReportsFromLab getReportByTokenId(int id) {
		return uploadReportsFromLabDaoImpl.getReportByTokenId(id);
	}

	@Override
	@Transactional
	public void updateReportsByTokenId(int id, String reports) {
		uploadReportsFromLabDaoImpl.updateReportsByTokenId(id,reports);
		
	}

	@Override
	@Transactional
	public void updateReport_CountsByTokenId(int id, int uploadCount, int pendingCount) {
		uploadReportsFromLabDaoImpl.updateReport_CountsByTokenId(id, uploadCount, pendingCount);
		
	}

	@Override
	@Transactional
	public void updateLabCompleteStatus(int tokenId, String status) {
		uploadReportsFromLabDaoImpl.updateLabCompleteStatus(tokenId,status);
	}

}
