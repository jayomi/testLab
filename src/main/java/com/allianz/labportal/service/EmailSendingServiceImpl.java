package com.allianz.labportal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allianz.labportal.dao.EmailSendingDaoImpl;

@Service("emailSendingServiceImpl")
public class EmailSendingServiceImpl implements EmailSendingService {
	
	@Autowired
	EmailSendingDaoImpl emailSendingDaoImpl;
	
	@Override
	@Transactional
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody,String[] ccListArray,String bcc) {
		emailSendingDaoImpl.sendEmail(toAddress, fromAddress, subject, msgBody,ccListArray,bcc);
	}

	@Override
	@Transactional
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody, String cc, String bcc) {
		emailSendingDaoImpl.sendEmail(toAddress, fromAddress, subject, msgBody, cc, bcc);
	}

	@Override
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody) {
		emailSendingDaoImpl.sendEmail(toAddress, fromAddress, subject, msgBody);
		
	}
	
	

}
