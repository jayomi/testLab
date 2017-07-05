package com.allianz.labportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allianz.labportal.dao.HeadTokenDaoImpl;
import com.allianz.labportal.model.HeadTokenInfo;
import com.allianz.labportal.model.User;

@Service("headTokenServiceImpl")
public class HeadTokenServiceImpl implements HeadTokenService {

	@Autowired
	HeadTokenDaoImpl headTokenDao;
	
	@Override
	@Transactional
	public List<HeadTokenInfo> getTokenList() {
		return headTokenDao.getTokenList();
	}

	@Override
	@Transactional
	public HeadTokenInfo getHeadTokenById(int id) {
		
		return headTokenDao.getHeadTokenById(id);
	}

	@Override
	@Transactional
	public HeadTokenInfo addToken(HeadTokenInfo token) {
		return headTokenDao.addToken(token);
	}

	@Override
	@Transactional
	public HeadTokenInfo updateHeadToken(HeadTokenInfo headToken,String labName, int pendingReportCount){
		return headTokenDao.updateHeadToken(headToken,labName,pendingReportCount);
	}

	@Override
	@Transactional
	public List<HeadTokenInfo> getTokenListByEmail(String email) {
		return headTokenDao.getTokenListByEmail(email);
	}
	
	@Override
	@Transactional
	public List<HeadTokenInfo> getTokenListByUser(String UserName,String tokenStatus) {
		return headTokenDao.getTokenListByUser(UserName,tokenStatus);
	}


	@Override
	@Transactional
	public List<HeadTokenInfo> getTokenListByBranch(String branch) {
		return headTokenDao.getTokenListByBranch(branch);
	}

	
	@Override
	@Transactional
	public HeadTokenInfo updateTokenDoctorAssignType(HeadTokenInfo headToken, String doctorStatus,User doctor,String tokenStatus,String comment) {
		return headTokenDao.updateTokenDoctorAssignType(headToken, doctorStatus,doctor,tokenStatus,comment);
	}

	@Override
	@Transactional
	public int countTokensbyStatus(String status) {
		return headTokenDao.countTokensbyStatus(status);
	}

	@Override
	@Transactional
	public List<HeadTokenInfo> getTokenListByTokenStatus(String tokenStatus) {
		return headTokenDao.getTokenListByTokenStatus(tokenStatus);
	}

	@Override
	@Transactional
	public List<HeadTokenInfo> getTokenListByTokenStatusAndBranch(String tokenStatus, String branch) {
		return headTokenDao.getTokenListByTokenStatusAndBranch(tokenStatus, branch);
	}

	@Override
	@Transactional
	public void updatePendingReportsFormLab(int headTokenId, int count) {
		headTokenDao.updatePendingReportsFormLab(headTokenId, count);
	}

	@Override
	@Transactional
	public void updateTokenStstus(int id, String status) {
		headTokenDao.updateTokenStstus(id, status);
	}

	@Override
	public HeadTokenInfo updateHeadTokenWithDoctorStatus(int id, String comment, String doctorStatus) {
		return headTokenDao.updateHeadTokenWithDoctorStatus(id, comment, doctorStatus);
	}

	@Override
	public HeadTokenInfo updateHeadTokenWithAdminStatus(int id, String comment, String tokenStatus) {
		return headTokenDao.updateHeadTokenWithAdminStatus(id, comment, tokenStatus);
	}

	@Override
	@Transactional
	public int getMaxRecorde() {
		return headTokenDao.getMaxRecorde();
	}

	@Override
	@Transactional
	public void updateToken(int tokenId, HeadTokenInfo headToken) {
		headTokenDao.updateToken(tokenId, headToken);
	}

	@Override
	@Transactional
	public List<HeadTokenInfo> getTokenListByTokenStatusAndLab(String tokenStatus, int labId) {
		return headTokenDao.getTokenListByTokenStatusAndLab(tokenStatus, labId);
	}

	@Override
	@Transactional
	public List<HeadTokenInfo> getTokenListByTokenStatusAndLabUploadStatus(String tokenStatus, int labId,
			String uploadStatus) {
		return headTokenDao.getTokenListByTokenStatusAndLabUploadStatus(tokenStatus, labId, uploadStatus);
	}

	@Override
	@Transactional
	public List<HeadTokenInfo> getTokenListByTokenStatusAndLabUploadStatus(String tokenStatus, String uploadStatus) {
		return headTokenDao.getTokenListByTokenStatusAndLabUploadStatus(tokenStatus,uploadStatus);
	}

	/*@Override
	@Transactional
	public List<HeadTokenInfo> getInitiallyAssignToLabTokenList(String tokenStatus, int labId, String uploadStatus) {
		return headTokenDao.getInitiallyAssignToLabTokenList(tokenStatus, labId, uploadStatus);
	}
*/
	@Override
	@Transactional
	public void updateTokenStstus(int id, String status, String comment) {
		headTokenDao.updateTokenStstus(id, status, comment);
		
	}

	@Override
	@Transactional
	public HeadTokenInfo updateTokenSRPAssignType(HeadTokenInfo headToken, String assignToSrpReport, User srp,
			String tokenStatus, String comment) {
		
		return headTokenDao.updateTokenSRPAssignType(headToken, assignToSrpReport, srp, tokenStatus, comment);
	}

	@Override
	@Transactional
	public HeadTokenInfo updateHeadTokenWithSRPStatus(int id, String comment, String tokenStatus) {
		return headTokenDao.updateHeadTokenWithSRPStatus(id, comment, tokenStatus);
	}

	@Override
	@Transactional
	public List<HeadTokenInfo> getCompleateTokenListBySRP(int srpId, String tokenStatus, String compleateStatus) {
		return headTokenDao.getCompleateTokenListBySRP(srpId,tokenStatus,compleateStatus);
	}

	@Override
	public List<HeadTokenInfo> getCompleateTokenListByDoctor(int doctorId, String tokenStatus, String compleateStatus) {
		return headTokenDao.getCompleateTokenListByDoctor(doctorId, tokenStatus, compleateStatus);
	}

	
}
