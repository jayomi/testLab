package com.allianz.labportal.service;

public interface EmailSendingService {
	
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody,String[] ccListArray,String bcc);
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody,String cc,String bcc);
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody);
	
}
