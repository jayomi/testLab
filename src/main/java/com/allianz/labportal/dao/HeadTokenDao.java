package com.allianz.labportal.dao;

import java.util.List;

import com.allianz.labportal.model.HeadTokenInfo;
import com.allianz.labportal.model.User;


public interface HeadTokenDao {

	public List<HeadTokenInfo> getTokenList();
	public HeadTokenInfo getHeadTokenById(int id);
	public int getMaxRecorde();
	public HeadTokenInfo addToken(HeadTokenInfo token);
	
	public void updateToken(int tokenId,HeadTokenInfo headToken);
	public HeadTokenInfo updateHeadToken(HeadTokenInfo headToken,String labName,int pendingReportCount);	
	public HeadTokenInfo updateTokenDoctorAssignType(HeadTokenInfo headToken,String assignToDoctorReport,User doctor,String tokenStatus,String comment);
	public HeadTokenInfo updateTokenSRPAssignType(HeadTokenInfo headToken,String assignToSrpReport,User srp,String tokenStatus,String comment);
	
	public void updatePendingReportsFormLab(int headToken,int count);
	
	public void updateTokenStstus(int id,String status);//updateLabCompleateStstus
	public void updateTokenStstus(int id,String status,String comment);
	
	public HeadTokenInfo updateHeadTokenWithDoctorStatus(int id,String comment,String doctorStatus);
	public HeadTokenInfo updateHeadTokenWithSRPStatus(int id,String comment,String tokenStatus);
	public HeadTokenInfo updateHeadTokenWithAdminStatus(int id,String comment,String tokenStatus);
	
	
	public List<HeadTokenInfo> getTokenListByEmail(String email);
	//public List<HeadTokenInfo> getTokenListByAssignType(String assignType,String email);
	public List<HeadTokenInfo> getTokenListByUser(String UserName,String tokenStatus);
	
	
	public List<HeadTokenInfo> getTokenListByBranch(String branch);	
	public int countTokensbyStatus(String status);
	public List<HeadTokenInfo> getTokenListByTokenStatus(String tokenStatus);	
	public List<HeadTokenInfo> getTokenListByTokenStatusAndBranch(String tokenStatus,String branch);
	public List<HeadTokenInfo> getTokenListByTokenStatusAndLab(String tokenStatus,int labId);
	public List<HeadTokenInfo> getTokenListByTokenStatusAndLabUploadStatus(String tokenStatus,int labId,String uploadStatus);
	public List<HeadTokenInfo> getTokenListByTokenStatusAndLabUploadStatus(String tokenStatus,String uploadStatus);
	//public List<HeadTokenInfo> getInitiallyAssignToLabTokenList(String tokenStatus,int labId,String uploadStatus);
	public List<HeadTokenInfo> getCompleateTokenListBySRP(int srpId,String tokenStatus,String compleateStatus);
	public List<HeadTokenInfo> getCompleateTokenListByDoctor(int doctorId,String tokenStatus,String compleateStatus);
	
}
