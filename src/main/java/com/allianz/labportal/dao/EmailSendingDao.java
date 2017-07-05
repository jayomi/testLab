package com.allianz.labportal.dao;

public interface EmailSendingDao {
	
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody,String[] ccListArray,String bcc);
	
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody,String cc,String bcc);
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody);
	//public void sendEmai(String customerName,String nic);

}
