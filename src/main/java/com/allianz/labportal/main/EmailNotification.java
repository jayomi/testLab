package com.allianz.labportal.main;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class EmailNotification{
	
	private MailSender mailSender;
	
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public void sendEmail(String policyNo, String customerName,String NIC,String AppoinmentDate,String AppointmentTime,String requestingReports,String labEmail,String[] allReports){
		

		  
		  try {
	            String host = "192.168.128.195";
	            final String user = "qportal";
	            final String password = "qportal@123";

	            String from = "qportal@allianz.lk";
	            String to = "gihanthanuja@gmail.com";//change accordingly  
	            
	            SimpleMailMessage message = new SimpleMailMessage();

	    		message.setFrom(from);
	    		message.setTo(to);
	    		message.setSubject("javatpoint");
	    		message.setText("This is simple program of sending email using JavaMail API");
	    		mailSender.send(message);

	            System.out.println("message sent successfully...");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }  
			
		}
	}
	
	


