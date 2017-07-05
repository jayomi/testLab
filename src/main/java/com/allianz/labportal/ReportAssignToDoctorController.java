package com.allianz.labportal;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.allianz.labportal.model.AssignToDoctor;
import com.allianz.labportal.model.AssignTolab;
import com.allianz.labportal.model.HeadTokenInfo;
import com.allianz.labportal.model.Lab;
import com.allianz.labportal.model.Log;
import com.allianz.labportal.model.UploadReportsFromLab;
import com.allianz.labportal.model.Uploadreportsfromdoctor;
import com.allianz.labportal.model.User;
import com.allianz.labportal.service.AssignToDoctorServiceImpl;
import com.allianz.labportal.service.EmailSendingServiceImpl;
import com.allianz.labportal.service.HeadTokenServiceImpl;
import com.allianz.labportal.service.LogServiceImpl;
import com.allianz.labportal.service.TokenAssignToLabServiceImpl;
import com.allianz.labportal.service.UploadReportsFromDoctorServiceImpl;
import com.allianz.labportal.service.UploadReportsFromLabServiceImpl;
import com.allianz.labportal.service.UserServiceImpl;

@Controller
@RequestMapping("/assignToDoctor")
public class ReportAssignToDoctorController {
	
	//private static final String UPLOADED_FOLDER = "C:\\Users\\jayomir\\Desktop\\upload\\DoctorReports";
	private static final String UPLOADED_FOLDER = System.getProperty("user.home") + "\\Desktop\\upload\\DoctorReports"; // C:\Users\jayomir/Desktop

	@Autowired
	HeadTokenServiceImpl headTokenServiceImpl;
	
	@Autowired
	AssignToDoctorServiceImpl assignToDoctorServiceImpl; 
	
	@Autowired	
	TokenAssignToLabServiceImpl tokenAssignToLabServiceImpl;
	
	@Autowired
	UploadReportsFromLabServiceImpl uploadReportsFromLabServiceImpl;
	
	@Autowired
	UploadReportsFromDoctorServiceImpl uploadReportsFromDoctorServiceImpl;
	
	@Autowired
	LogServiceImpl logServiceImpl;
	
	@Autowired
	EmailSendingServiceImpl emailSendingServiceImpl;
	
	@Autowired
	UserServiceImpl userServiceImpl;
	
	@RequestMapping(value="/add/{id}",method=RequestMethod.POST)
	/*public String assignToLab(@PathVariable("id") int id,@ModelAttribute("assignToDoctor") HeadTokenInfo assignToDoctor,Model model,HttpServletRequest request){*/
	public String assignToLab(@PathVariable("id") int id,Model model,HttpServletRequest request){
		
		try{
			
			String tokenStatus = request.getParameter("tokenStatus");
			
			
			model.addAttribute("assignToDoctor", new HeadTokenInfo());
			int tokenId = id;
			String comment="";
			
			HeadTokenInfo headToken = headTokenServiceImpl.getHeadTokenById(tokenId);			
			//String tokenStatus = assignToDoctor.getTokenStatus();
			String customerName = headToken.getCustomerName();
			String nic = headToken.getNic();			
			String proposalNo = headToken.getProposalNo();
			
			if(tokenStatus.equals("toDoctor")){
				
				//get Doctor
				//int doctorId = assignToDoctor.getDoctorId();
				int doctorId = Integer.parseInt(request.getParameter("doctorId"));
				User doctor = userServiceImpl.getUserById(doctorId);
				//String assignToDoctorReport = assignToDoctor.getAssignToDoctorReport();					
				String doctorReport[] =request.getParameterValues("assignToDoctorReport");
				String assignToDoctorReport = Arrays.asList(doctorReport).toString().replaceAll("\\[", "").replaceAll("\\]","");
				
				
				//send email notification to doctor
				
				//EmailNotification - server			
				
				 String fromAddress = "AZhealthportal@allianz.lk";
		         String toAddress = doctor.getEmail(); //doctor email
		         String subject = "Doctor Reviews for Medical Tests of Proposal #"+proposalNo+" of "+customerName;       
		         String ccListArray[] = {"LifeUnderwriting@allianz.lk","lifeservicing@allianz.lk","lifeclaims@allianz.lk"};		      
		         String bcc = "jayomir@allianz.lk";
				
				
		        //EmailNotification - local	 
				/*
				String fromAddress ="AZhealthportal@allianz.lk";
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
			         		+"<hr></br>"
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
			
			//----------------------
			if(tokenStatus.equals("toSRP") ){
				
				//get SRP
				//int srpId = assignToDoctor.getSrpId();//srp Id
				int srpId = Integer.parseInt(request.getParameter("srpId"));
				User srp = userServiceImpl.getUserById(srpId);
				//String assignToSrpReport = assignToDoctor.getAssignToSrpReport();	
				String srpReport[] = request.getParameterValues("assignToSrpReport");					
				String assignToSrpReport = Arrays.asList(srpReport).toString().replaceAll("\\[", "").replaceAll("\\]","");
						
				
				//send email notification to srp
				
				//EmailNotification - server			
				
				 String fromAddress ="AZhealthportal@allianz.lk";
		         String toAddress = srp.getEmail(); //srp email
		         String subject = "SRP Reviews for Medical Tests of Proposal #"+proposalNo+" of "+customerName;       
		         String ccListArray[] = {"LifeUnderwriting@allianz.lk","lifeservicing@allianz.lk","lifeclaims@allianz.lk"};		       
		         String bcc = "jayomir@allianz.lk";
				
				
		        //EmailNotification - local	 
				/*
				String fromAddress ="AZhealthportal@allianz.lk";
		         String toAddress ="jayomi.rajapaksha@gmail.com";// "gihanthanuja@gmail.com";
		         String subject = "SRP Reviews for Medical Tests of Proposal #"+proposalNo+" of "+customerName;
		         String ccListArray[] = {"jayomir@allianz.lk","jayomi.rajapaksha@gmail.com"};
		         String bcc = "jayomir@allianz.lk";
		       
		         */
		       
		        // String medicalReports = headToken.getMedicalReports();    
		        
		        String msgBody = "<div>Dear All, "+"</div><br/>"
			         		+ "<div>We have referred the medical reports of the above insured for underwriting assessment.</div>"
			         		
			         		+ "<div>Please send us your decision by assigning this request with your comments."+"</div>"		         		
			         		+ "<div>Visit <a href='http://azhealthportal.allianz.lk/'> Allianz Health Partner Portal </a></div>"
			         		+"<hr><br/>"
			         		+ "<div>Thanking You,"+"</div>"
			         		+ "<div>Allianz Life Insurance Lanka Limited"+"</div>";	         		
			         		     		
		         
		       //log comment
					String srpName = srp.getLabName()+srp.getFullName();
					comment = "Token assign to SRP:  "+srpName+" by "+request.getSession().getAttribute("loginUserName").toString();
					
		         
		        //update headtable		        	
		         headTokenServiceImpl.updateTokenSRPAssignType(headToken, assignToSrpReport, srp, tokenStatus, comment);
		          
		        //send email
				emailSendingServiceImpl.sendEmail(toAddress, fromAddress, subject, msgBody,ccListArray,bcc);
				
				//---end email notification to doctor
				
				
			}
			
			//--------------------
			
			
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
		//return new ModelAndView("/viewTokens_Admin");
		//return "redirect:/user/getUsers";
		return "redirect:/token/getTokens";//viewTokens_Admin
	}
	
	//goto view repors page
	@RequestMapping(value="/getViewReportPage/{id}",method=RequestMethod.GET)
	public ModelAndView viewUploadedReports(@PathVariable("id") int id,Model model,HttpServletRequest request){
			
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
			
			List<String> fileNameList = new ArrayList<String>();			
			String doctorAssignList = headToken.getAssignToDoctorReport();
			//if(doctorAssignList != null || doctorAssignList.length()!=0){
			if(doctorAssignList != null && doctorAssignList.length()!=0 && !doctorAssignList.isEmpty()){ 
				fileNameList = Arrays.asList(doctorAssignList.split(","));
			}	
			
		//	model.addAttribute("filePath", filePath);    
			model.addAttribute("fileNameList", fileNameList);
		
			
		}catch(Exception e){e.printStackTrace();}
		
		
		return new ModelAndView("/DoctorReports");
	}
	
	@RequestMapping(value="/getLabReportsAdmin/{id}",method=RequestMethod.GET)
	public ModelAndView getLabReportsAdmin(@PathVariable("id") int id,Model model){
		
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
			List<String> fileNameList = new ArrayList<String>();
			
			String doctorAssignList = headToken.getAssignToDoctorReport();
			if(doctorAssignList != null || doctorAssignList.length()!=0){
				fileNameList = Arrays.asList(doctorAssignList.split(","));
			}	
			    
		//	model.addAttribute("filePath", filePath);    
			model.addAttribute("fileNameList", fileNameList);
			
		//get logs
			List<Log> logs = logServiceImpl.getLogs(id);
			model.addAttribute("logList", logs);
		
		}catch(Exception e){e.printStackTrace();}	
		
		
		return new ModelAndView("/assignedToDoctor");
	}
	
	
	@RequestMapping(value="/getDoctorReportsAdmin/{id}",method=RequestMethod.GET)
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
				
			model.addAttribute("doctorComment", headToken.getDoctorComment());
			
			List<User> srpList = userServiceImpl.getUserListByUserType(8);//srp list
			model.addAttribute("srpList", srpList);
				
			
		}catch(Exception e){e.printStackTrace();}	
		
		
		return new ModelAndView("/fromDoctor");
	}
	
	@RequestMapping(value="/addReports/{id}",method=RequestMethod.POST)
	public String uploadMedicalReports(@PathVariable("id") int id,@RequestParam("files") MultipartFile[] files,@ModelAttribute("reportsFromDoctor") Uploadreportsfromdoctor reportsFromDoctor,Model model){
		
		try{
			
			model.addAttribute("reportsFromDoctor", new Uploadreportsfromdoctor());
			int tokenId = id;
			HeadTokenInfo headToken = headTokenServiceImpl.getHeadTokenById(tokenId);			
			
			
			for (MultipartFile file : files) {

		        if (file.isEmpty()) {
		            continue; //next pls
		        }
		        try {

		            byte[] bytes = file.getBytes();	
		            String filename = file.getOriginalFilename();		           
		           
		            // File dir = new File(UPLOADED_FOLDER + File.separator + filename);
		            File outputdir = new File(UPLOADED_FOLDER + "\\"+tokenId);
					if (!outputdir.exists())
						outputdir.mkdirs();	                 

		            FileOutputStream fout=new FileOutputStream(UPLOADED_FOLDER+"\\"+tokenId+"/"+filename); 
		            fout.write(bytes);    
		            fout.close();            
		         //save report path in db		            
		            
		        } catch (IOException e) {
		            e.printStackTrace();
		        }

		    }
			 //save report path in db
			String report_path = UPLOADED_FOLDER+"\\"+tokenId;
			reportsFromDoctor.setFilepath(report_path);			
			reportsFromDoctor.setDoctorName("Dr.Prasad Soyasa");
			
			 
			 Uploadreportsfromdoctor report = uploadReportsFromDoctorServiceImpl.getReportByTokenId(id);
			 if(report==null){
				 uploadReportsFromDoctorServiceImpl.addReports(reportsFromDoctor);
			 }
			
			//-----------------------------
			List<HeadTokenInfo> doctorTokenList = new ArrayList<HeadTokenInfo>();
			
				doctorTokenList = headTokenServiceImpl.getTokenListByTokenStatus("doctor");
				int doctorTokens = doctorTokenList.size();
				model.addAttribute("TokenCount", doctorTokens);
				model.addAttribute("doctorTokenList", doctorTokenList);		 
			
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		//return new ModelAndView("/doctor_dashbord");
		return "redirect:/assignToDoctor/getViewReportPage/"+id;
		
	}
	
	@RequestMapping(value="/changeStatus/{id}",method=RequestMethod.POST)
	public String changeDoctorStatus(@PathVariable("id") int id,Model model,@ModelAttribute("headToken") HeadTokenInfo headToken,HttpServletRequest request){
		
		String comment = headToken.getDoctorComment();
		//headToken.getCompleteStatusDoctor();
		headTokenServiceImpl.updateHeadTokenWithDoctorStatus(id,comment,"compleate");
		HeadTokenInfo htoken = headTokenServiceImpl.getHeadTokenById(id);	
		
		//send email notification to H/O - UW
		String customerName = htoken.getCustomerName();		
		String nic = htoken.getNic();	
		String policyNo = htoken.getProposalNo();
		String doctorName = htoken.getDoctorName();
		
		int doctorId = htoken.getDoctorId();
		User doctor = userServiceImpl.getUserById(doctorId);
		
		String doctorEmail = doctor.getEmail();
		String doctorContactNo = doctor.getContactNo();
		
		//server
		
		String fromAddress = "AZhealthportal@allianz.lk";
		String toAddress = "lifeservicing@allianz.lk"; //"jayomir@allianz.lk";//"lifeservicing@allianz.lk";
		String subject = "Medical Tests of Proposal/Policy No #: "+policyNo;
		String ccListArray[] = {"LifeUnderwriting@allianz.lk","lifeclaims@allianz.lk"};
		String bcc = "jayomir@allianz.lk";
		
		
		//local
		
		/*String fromAddress = "AZhealthportal@allianz.lk";
		String toAddress ="jayomir@allianz.lk";//"lifeservicing@allianz.lk";
		String subject = "Medical Tests of Proposal/Policy No #: "+policyNo;	
		String cc = "jayomi.rajapaksha@gmail.com";
		String bcc = "jayomir@allianz.lk";
	*/
		
		String msgBody = "<div>The following customer's reports are reviewed."+"</div><br/>"
				+ "<div>Customer Name : "+customerName+"</div>"					
				+ "<div>NIC : "+nic+"</div>"	
				+ "<div>Policy/Proposal No : "+policyNo+"</div>"
				+ "<div>From: "+doctorName+"</div>"	
				+ "<div>Email: "+doctorEmail+"</div>"
				+ "<div>Contact No : "+doctorContactNo+"</div>";
				
		//emailSendingServiceImpl.sendEmail(toAddress, fromAddress, subject, msgBody);
		emailSendingServiceImpl.sendEmail(toAddress, fromAddress, subject, msgBody,ccListArray,bcc);
		
		//ending send- email
		
		
		//add log
		String logComment = "token assign to Head-office by "+request.getSession().getAttribute("loginUserName").toString()+".(from Doctor).";
		logServiceImpl.addRecode(id, logComment);		
			 
		//return new ModelAndView("/doctor_dashbord");
		return "redirect:/dashbord/doctorDashboard/";
		
	}
	
	@RequestMapping(value="/downloadDoctorReport/{name}/{tokenId}",method=RequestMethod.GET)
	public void downloadDoctorReport(@PathVariable("tokenId") int id,@PathVariable("name")String reportName,Model model,HttpServletResponse response){
		try{
			
			
			Uploadreportsfromdoctor report = new Uploadreportsfromdoctor();
			report = uploadReportsFromDoctorServiceImpl.getReportByTokenId(id);
			String filePath = report.getFilepath();
			
			File file = new File(filePath+"/"+reportName);
	        InputStream is = new FileInputStream(file);
	 
	        // MIME type of the file
	        response.setContentType("application/octet-stream");
	        // Response header
	        response.setHeader("Content-Disposition", "attachment; filename=\""
	                + file.getName() + "\"");
	        // Read from the file and write into the response
	        OutputStream os = response.getOutputStream();
	        byte[] buffer = new byte[1024];
	        int len;
	        while ((len = is.read(buffer)) != -1) {
	            os.write(buffer, 0, len);
	        }
	        os.flush();
	        os.close();
	        is.close();
	        
			
		}catch(Exception e){e.printStackTrace();}
		
		//return new ModelAndView("/viewReports");///getViewReportPage/{id}
		//return "redirect:/assignToDoctor/getViewReportPage/"+id;
	}
	
	@RequestMapping(value="/deleteDoctorReport/{name}/{tokenId}",method=RequestMethod.GET)
	public void deleteDoctorReport(@PathVariable("tokenId") int id,@PathVariable("name")String reportName,Model model,HttpServletRequest request,HttpServletResponse response){
		try{
			
			Uploadreportsfromdoctor report = new Uploadreportsfromdoctor();
			report = uploadReportsFromDoctorServiceImpl.getReportByTokenId(id);
			String filePath = report.getFilepath();
			
			File file = new File(filePath+"/"+reportName);
			file.delete();
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.write("1");
			
			
		}catch(Exception e){e.printStackTrace();}
		//return "redirect:/assignToDoctor/getViewReportPage/"+id;
		
		
	}
	
	//get doctor list/srp list
	@RequestMapping(value="/getListByCategory/{categoryId}",method=RequestMethod.GET)
	public void getLabListByCategory(@PathVariable("categoryId") int categoryId,HttpServletResponse response,HttpServletRequest request){
		
		try {
			List<User> assignList = userServiceImpl.getUserListByUserType(categoryId);
			
			PrintWriter out = response.getWriter();
			String x = "<option>"+"- Select - "+"</option>";
			
			for (User user : assignList) {
				x = x + "<option class='assignRepor' value="+user.getId()+">"+user.getLabName()+", "+user.getFullName() +"</option>";
			}		
			
	       out.write(x);
	       
		} catch (IOException e) {
			e.printStackTrace();
		} 
	
	}
	
	@RequestMapping(value="/getAssigToHOTokenInfo/{id}",method=RequestMethod.GET)
	public ModelAndView getAssigToHOTokenInfo(@PathVariable("id") int id, Model model){
		
		try{
			model.addAttribute("token", new HeadTokenInfo());
			model.addAttribute("assignToLab", new AssignTolab());
			//model.addAttribute("reportsFromLab", new UploadReportsFromLab());
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
		
		return new ModelAndView("/DoctorToken_AssigntoHO");		
		
		//---------------
	
	}
	
}
