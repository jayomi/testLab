package com.allianz.labportal.dao;

import java.util.Properties;



import org.springframework.beans.factory.annotation.Autowired;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Repository;

@Repository
public class EmailSendingDaoImpl implements EmailSendingDao {

	@Autowired
	private MailSender mailSender;
	
	@Override
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody, String[] ccListArray,String bcc) {
	
		/*SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(fromAddress);
		message.setTo(toAddress);
		message.setCc(ccListArray);
		message.setBcc(bcc);
		message.setSubject(subject);		
		message.setText(msgBody);		
		mailSender.send(message);*/
		
		 MimeMessage mimeMessage  = ((JavaMailSender) mailSender).createMimeMessage();
		   try{
				MimeMessageHelper message  = new MimeMessageHelper(mimeMessage , true,"UTF-8");

				message.setFrom(fromAddress);
				message.setTo(toAddress);
				message.setCc(ccListArray);
				message.setBcc(bcc);
				message.setSubject(subject);		
				message.setText(msgBody,true);

			
				((JavaMailSender) mailSender).send(mimeMessage);
				
		     }catch(Exception e){
		    	 e.printStackTrace();
		     }


	}

	@Override
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody, String cc, String bcc) {
		/*SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(fromAddress);
		message.setTo(toAddress);
		message.setCc(cc);
		message.setBcc(bcc);
		message.setSubject(subject);		
		message.setText(msgBody);
		mailSender.send(message);*/

		 MimeMessage mimeMessage  = ((JavaMailSender) mailSender).createMimeMessage();
		   try{
				MimeMessageHelper message  = new MimeMessageHelper(mimeMessage , true,"UTF-8");

				message.setFrom(fromAddress);
				message.setTo(toAddress);
				message.setCc(cc);
				message.setBcc(bcc);
				message.setSubject(subject);		
				message.setText(msgBody,true);

			
				((JavaMailSender) mailSender).send(mimeMessage);
				
		     }catch(Exception e){
		    	 e.printStackTrace();
		     }

	}

	@Override
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody) {
		/*SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(fromAddress);
		message.setTo(toAddress);		
		message.setSubject(subject);		
		message.setText(msgBody);
		mailSender.send(message);*/
		
		 MimeMessage mimeMessage  = ((JavaMailSender) mailSender).createMimeMessage();
		   try{
				MimeMessageHelper message  = new MimeMessageHelper(mimeMessage , true,"UTF-8");

				message.setFrom(fromAddress);
				message.setTo(toAddress);				
				message.setSubject(subject);		
				message.setText(msgBody,true);

			
				((JavaMailSender) mailSender).send(mimeMessage);
				
	     }catch(Exception e){
	    	 e.printStackTrace();
	     }
	}

	
}
