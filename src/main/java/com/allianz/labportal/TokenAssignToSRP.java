package com.allianz.labportal;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.allianz.labportal.model.AssignTolab;
import com.allianz.labportal.model.HeadTokenInfo;
import com.allianz.labportal.model.Log;
import com.allianz.labportal.model.UploadReportsFromLab;
import com.allianz.labportal.model.Uploadreportsfromdoctor;
import com.allianz.labportal.model.User;
import com.allianz.labportal.service.EmailSendingServiceImpl;
import com.allianz.labportal.service.HeadTokenServiceImpl;
import com.allianz.labportal.service.LogServiceImpl;
import com.allianz.labportal.service.UploadReportsFromLabServiceImpl;
import com.allianz.labportal.service.UserServiceImpl;

@Controller
@RequestMapping("/assigToSRP")
public class TokenAssignToSRP {

	private static final String UPLOADED_FOLDER = System.getProperty("user.home") + "\\Desktop\\upload\\DoctorReports";
	
	@Autowired
	HeadTokenServiceImpl headTokenServiceImpl;
	
	@Autowired
	UploadReportsFromLabServiceImpl uploadReportsFromLabServiceImpl;
	
	@Autowired
	UserServiceImpl userServiceImpl;
	
	@Autowired
	EmailSendingServiceImpl emailSendingServiceImpl;
	
	@Autowired
	LogServiceImpl logServiceImpl;
	
	@RequestMapping(value="/getViewReportPage/{id}",method=RequestMethod.GET)
	public ModelAndView viewUploadedReports(@PathVariable("id") int id,Model model,HttpServletRequest request){
			
		 
		//UploadReportsFromLab report = uploadReportsFromLabServiceImpl.getReportByTokenId(id);
		
		model.addAttribute("token", new HeadTokenInfo());
		model.addAttribute("assignToLab", new AssignTolab());		
		model.addAttribute("reportsFromLab", new UploadReportsFromLab());	
		
		HeadTokenInfo headToken = headTokenServiceImpl.getHeadTokenById(id);
		model.addAttribute("headTokenId", id);
		model.addAttribute("headToken", headToken);		
		
		
		try{
			
			List<String> fileNameList = new ArrayList<String>();			
			String srpAssignList = headToken.getAssignToSrpReport();
			if(srpAssignList != null || srpAssignList.length()!=0){
				fileNameList = Arrays.asList(srpAssignList.split(","));
			}		
		 
			model.addAttribute("fileNameList", fileNameList);
		
			
		}catch(Exception e){e.printStackTrace();}
		
		
		return new ModelAndView("/srpReports");
	}
	
	@RequestMapping(value="/changeStatus/{id}",method=RequestMethod.POST)
	public String changeDoctorStatus(@PathVariable("id") int id,Model model,@ModelAttribute("headToken") HeadTokenInfo headToken,HttpServletRequest request){
		
		String comment = headToken.getSrpComment();
		String tokenStatus = headToken.getTokenStatus();
		//headTokenServiceImpl.updateTokenStstus(id, tokenStatus, comment);
		headTokenServiceImpl.updateHeadTokenWithSRPStatus(id, comment, tokenStatus);
		HeadTokenInfo htoken = headTokenServiceImpl.getHeadTokenById(id);	
		
		//send email notification to H/O - UW
		String customerName = htoken.getCustomerName();		
		String nic = htoken.getNic();	
		String policyNo = htoken.getProposalNo();
		String srpName = htoken.getSrpName();
		
		int srpId = htoken.getSrpId();
		User srp = userServiceImpl.getUserById(srpId);
		
		String srpEmail = srp.getEmail();
		String srpContactNo = srp.getContactNo();
		
		//server
		
		String fromAddress = "AZhealthportal@allianz.lk"; //"labportal@allianz.lk";//lab.getEmail();
		String toAddress = "lifeservicing@allianz.lk"; //"jayomir@allianz.lk";//"lifeservicing@allianz.lk";
		String subject = "Medical Tests of Proposal/Policy No #: "+policyNo;
		//String cc = "LifeUnderwriting@allianz.lk";
		String ccListArray[] = {"LifeUnderwriting@allianz.lk","lifeclaims@allianz.lk"};
		String bcc = "jayomir@allianz.lk";
		
		
		//local
		
		/*String fromAddress = "AZhealthportal@allianz.lk"; //"labportal@allianz.lk";//lab.getEmail();
		String toAddress ="jayomir@allianz.lk";//"lifeservicing@allianz.lk";
		String subject = "Medical Tests of Proposal/Policy No #: "+policyNo;	
		String cc = "jayomi.rajapaksha@gmail.com";
		String bcc = "jayomir@allianz.lk";

		*/
		String msgBody = "<div>The following customer's reports are reviewed."+"</div><br/>"
				+ "<div>Customer Name : "+customerName+"</div>"					
				+ "<div>NIC : "+nic+"</div>"	
				+ "<div>Policy/Proposal No : "+policyNo+"</div>"
				+ "<div>From: "+srpName+"</div>"	
				+ "<div>Email: "+srpEmail+"</div>"
				+ "<div>Contact No : "+srpContactNo+"</div>";				
		
		//emailSendingServiceImpl.sendEmail(toAddress, fromAddress, subject, msgBody,cc,bcc);
		emailSendingServiceImpl.sendEmail(toAddress, fromAddress, subject, msgBody,ccListArray,bcc);
		
		//ending send- email
		
		
		//add log
		String logComment = "token assign to Head-office by "+request.getSession().getAttribute("loginUserName").toString()+".(from SRP).";
		logServiceImpl.addRecode(id, logComment);		
			 
		//return new ModelAndView("/doctor_dashbord");
		return "redirect:/dashbord/SRPDashboard/";
		
	}
	
	@RequestMapping(value="/getLabReportsAdmin/{id}",method=RequestMethod.GET)
	public ModelAndView getLabReportsAdmin(@PathVariable("id") int id,Model model){
		
	
		
		model.addAttribute("token", new HeadTokenInfo());
		model.addAttribute("assignToLab", new AssignTolab());		
		model.addAttribute("reportsFromLab", new UploadReportsFromLab());		
		
		HeadTokenInfo headToken = headTokenServiceImpl.getHeadTokenById(id);
		model.addAttribute("headTokenId", id);
		model.addAttribute("headToken", headToken);
		try{
			List<String> fileNameList = new ArrayList<String>();
			
			String srpAssignList = headToken.getAssignToSrpReport();
			if(srpAssignList != null && !srpAssignList.isEmpty() && srpAssignList.length()!=0){ //*****************************
				fileNameList = Arrays.asList(srpAssignList.split(","));
			}	
			    
		   
			model.addAttribute("fileNameList", fileNameList);
			
		//get logs
			List<Log> logs = logServiceImpl.getLogs(id);
			model.addAttribute("logList", logs);
		
		}catch(Exception e){e.printStackTrace();}	
		
		
		return new ModelAndView("/assignedToSRP");
	}
	
	
	@RequestMapping(value="/getSRPReportsAdmin/{id}",method=RequestMethod.GET)
	public ModelAndView getDoctorReportsAdmin(@PathVariable("id") int id,Model model){
			
		UploadReportsFromLab report = new UploadReportsFromLab();
		report = uploadReportsFromLabServiceImpl.getReportByTokenId(id);
		
		model.addAttribute("token", new HeadTokenInfo());
		model.addAttribute("assignToLab", new AssignTolab());		
		model.addAttribute("reportsFromLab", new UploadReportsFromLab());
		model.addAttribute("reportsFromDoctor", new Uploadreportsfromdoctor());	
		model.addAttribute("assignToDoctor", new HeadTokenInfo());
		
		HeadTokenInfo headToken = headTokenServiceImpl.getHeadTokenById(id);
		model.addAttribute("headTokenId", id);
		model.addAttribute("headToken", headToken);		
		
		
		try{
			
			int tokenId = id;
			String filePath = null;
			filePath = report.getFilepath();
			List<String> fileNameList = new ArrayList<String>();
			if(filePath!=null){				
				
				File folder = new File(filePath);
				File[] listOfFiles = folder.listFiles();
				
				for (int i = 0; i < listOfFiles.length; i++) {
				      if (listOfFiles[i].isFile()) {
				    	  fileNameList.add(listOfFiles[i].getName());
				      } 
				}
				
			}	
			 
			model.addAttribute("fileNameList", fileNameList);			
			model.addAttribute("srpComment", headToken.getSrpComment());
			List<User> doctorList = userServiceImpl.getUserListByUserType(5);//doctor list
			model.addAttribute("doctorList", doctorList);
				
			
		}catch(Exception e){e.printStackTrace();}	
		
		
		return new ModelAndView("/fromSRP");
	}
	
	@RequestMapping(value="/assignToDoctor/{id}",method=RequestMethod.POST)
	public String assignToDoctor(@PathVariable("id") int id,@ModelAttribute("assignToDoctor") HeadTokenInfo assignToDoctor,Model model,HttpServletRequest request){
	
		try{
			
		
			model.addAttribute("assignToDoctor", new HeadTokenInfo());
			int tokenId = id;
			String comment="";
			
			HeadTokenInfo headToken = headTokenServiceImpl.getHeadTokenById(tokenId);			
			String tokenStatus = assignToDoctor.getTokenStatus();
			String customerName = headToken.getCustomerName();
			String nic = headToken.getNic();			
			String proposalNo = headToken.getProposalNo();
			
			if(tokenStatus.equals("toDoctor")){
				
				//get Doctor
				int doctorId = assignToDoctor.getDoctorId();				
				User doctor = userServiceImpl.getUserById(doctorId);
				String assignToDoctorReport = assignToDoctor.getAssignToDoctorReport();					
				
				
				//send email notification to doctor
				
				//EmailNotification - server			
				
				 String fromAddress = "AZhealthportal@allianz.lk";
		         String toAddress = doctor.getEmail(); //doctor email
		         String subject = "Doctor Reviews for Medical Tests of Proposal #"+proposalNo+" of "+customerName;       
		         String ccListArray[] = {"LifeUnderwriting@allianz.lk","lifeservicing@allianz.lk","lifeclaims@allianz.lk"};
		        // String cc = "lifeservicing@allianz.lk";
		         String bcc = "jayomir@allianz.lk";
				
				
		        //EmailNotification - local	 
				
				/*String fromAddress = "AZhealthportal@allianz.lk";
		         String toAddress ="jayomi.rajapaksha@gmail.com";// "gihanthanuja@gmail.com";
		         String subject = "Doctor Reviews for Medical Tests of Proposal #"+proposalNo+" of "+customerName;      
		        // String ccListArray[] = {"gihanthanuja@gmail.com","jayomir@allianz.lk"};
		         String ccListArray[] = {"jayomir@allianz.lk","jayomi.rajapaksha@gmail.com"};
		         String bcc = "jayomir@allianz.lk";
		       */
		         
		       
		        // String medicalReports = headToken.getMedicalReports();    
		        
		         String msgBody = "<div>Dear Doctor, "+"</div><br/>"
			         		+ "<div>We refer the above named client’s medical report/s for your assessment.</div>"
			         		
			         		+ "<div>Kindly send us your opinion by assigning this request with your comments."+"</div>"		         		
			         		+ "<div>Visit <a href='http://azhealthportal.allianz.lk/'> Allianz Health Partner Portal </a></div>"
			         		+"<hr><br/>"
			         		+ "<div>Thanking You,"+"</div>"
			         		+ "<div>Allianz Life Insurance Lanka Limited"+"</div>";	         		
			         		     		
		         
		       //log comment
					String doctorName = doctor.getLabName()+doctor.getFullName();
					comment = "Token assign to doctor:  "+doctorName+" by "+request.getSession().getAttribute("loginUserName").toString();
					
		         
		        //update headtable
		         headTokenServiceImpl.updateTokenDoctorAssignType(headToken,assignToDoctorReport,doctor,tokenStatus,comment);	
		          
		        //send email
				emailSendingServiceImpl.sendEmail(toAddress, fromAddress, subject, msgBody,ccListArray,bcc);
				
				//---end email notification to doctor
				
				
			}
			
			if(tokenStatus.equals("closed")){
				
				
				
				//String adminComment = assignToDoctor.getAdminComment();
				String adminComment = request.getParameter("adminComment");
				headTokenServiceImpl.updateTokenStstus(id, "closed",adminComment);
				comment = "Token closed by "+request.getSession().getAttribute("loginUserName").toString();
			}
			
			logServiceImpl.addRecode(id, comment);
			}catch(Exception e){
				
				e.printStackTrace();
			}
			
			return "redirect:/token/getTokens";//viewTokens_Admin
				
		
	}
	
	
	
	//--------------------------------------------------------------------------
	@RequestMapping(value="/tokenAssignToSRP/{id}",method=RequestMethod.POST)
	public String assignToSRP(@PathVariable("id") int id,@ModelAttribute("headToken") HeadTokenInfo hToken,Model model,HttpServletRequest request){
	
		try{
			
		
			model.addAttribute("hToken", new HeadTokenInfo());
			int tokenId = id;
			String comment="";
			
			HeadTokenInfo headToken = headTokenServiceImpl.getHeadTokenById(tokenId);			
			String tokenStatus = hToken.getTokenStatus();
			String customerName = headToken.getCustomerName();
			String nic = headToken.getNic();			
			String proposalNo = headToken.getProposalNo();
			
			if(tokenStatus.equals("toSRP")){
				
				//get SRP
				int srpId = hToken.getSrpId();				
				User srp = userServiceImpl.getUserById(srpId);
				String assignToSrpReport = hToken.getAssignToSrpReport();				
				
				
				//send email notification to SRP
				
				//EmailNotification - server			
				
				 String fromAddress = "AZhealthportal@allianz.lk";
		         String toAddress = srp.getEmail(); //srp email
		         String subject = "SRP Reviews for Medical Tests of Proposal #"+proposalNo+" of "+customerName;       
		         String ccListArray[] = {"LifeUnderwriting@allianz.lk","lifeservicing@allianz.lk","lifeclaims@allianz.lk"};		      
		         String bcc = "jayomir@allianz.lk";
				
				
		        //EmailNotification - local	 
				/*
				 String fromAddress = "AZhealthportal@allianz.lk";
		         String toAddress ="jayomi.rajapaksha@gmail.com";// "gihanthanuja@gmail.com";
		         String subject = "SRP Reviews for Medical Tests of Proposal #"+proposalNo+" of "+customerName;      
		        // String ccListArray[] = {"gihanthanuja@gmail.com","jayomir@allianz.lk"};
		         String ccListArray[] = {"jayomir@allianz.lk","jayomi.rajapaksha@gmail.com"};
		         String bcc = "jayomir@allianz.lk";
		       */
		         
		         String msgBody = "<div>Dear All, "+"</div><br/>"
			         		+ "<div>We have referred the medical reports of the above insured for underwriting assessment.</div>"
			         		
			         		+ "<div>Please send us your decision by assigning this request with your comments."+"</div>"		         		
			         		+ "<div>Visit <a href='http://azhealthportal.allianz.lk/'> Allianz Health Partner Portal </a></div>"
			         		+"<hr></br>"
			         		+ "<div>Thanking You,"+"</div>"
			         		+ "<div>Allianz Life Insurance Lanka Limited"+"</div>";	     		
			         		     		
		         
		       
		         //log comment
					String srpName = srp.getLabName()+srp.getFullName();
					comment = "Token assign to SRP:  "+srpName+" by "+request.getSession().getAttribute("loginUserName").toString();
					
		         
					 //update headtable		        	
			         headTokenServiceImpl.updateTokenSRPAssignType(headToken, assignToSrpReport, srp, tokenStatus, comment);
			          
			        //send email
					emailSendingServiceImpl.sendEmail(toAddress, fromAddress, subject, msgBody,ccListArray,bcc);
					
					//---end email notification to srp
				
				
			}
			
			if(tokenStatus.equals("closed")){		
				
				//String adminComment = assignToDoctor.getAdminComment();
				String adminComment = request.getParameter("adminComment");
				headTokenServiceImpl.updateTokenStstus(id, "closed",adminComment);
				comment = "Token closed by "+request.getSession().getAttribute("loginUserName").toString();
			}
			
			logServiceImpl.addRecode(id, comment);
			
			}catch(Exception e){
				
				e.printStackTrace();
			}
			
			return "redirect:/token/getTokens";//viewTokens_Admin
				
		
	}
	//-------------------------------------------------------------------------------------
	
	@RequestMapping(value="/getAssigToHOTokenInfo/{id}",method=RequestMethod.GET)
	public ModelAndView getAssigToHOTokenInfo(@PathVariable("id") int id, Model model){
		
		try{
			model.addAttribute("token", new HeadTokenInfo());
			model.addAttribute("assignToLab", new AssignTolab());
			model.addAttribute("reportsFromLab", new UploadReportsFromLab());
			HeadTokenInfo headToken = headTokenServiceImpl.getHeadTokenById(id);
			model.addAttribute("headTokenId", id);
			model.addAttribute("headToken", headToken);
			

			
			String uploadedReports = uploadReportsFromLabServiceImpl.getUploadedReportsByTokenId(id);
			String notUploadedReports = uploadReportsFromLabServiceImpl.getNotUploadedReportsByTokenId(id,headToken.getMedicalReports(),uploadedReports);	
			
			
			if(notUploadedReports!= null && !notUploadedReports.equals("not pending reports")){
				notUploadedReports = notUploadedReports.replaceAll("\\[", "").replaceAll("\\]","");	
			}
				
			
			model.addAttribute("uploadedReports", uploadedReports);	
			model.addAttribute("notUploadedReports", notUploadedReports);
			
			//get logs
			List<Log> logs = logServiceImpl.getLogs(id);
			model.addAttribute("logList", logs);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return new ModelAndView("/srp_AssigntoHO");		
		
		//---------------
	
	}
	
}
