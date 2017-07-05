package com.allianz.labportal;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
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
import com.allianz.labportal.main.MySqlDirectCall;
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
import com.allianz.labportal.service.LabServiceImpl;
import com.allianz.labportal.service.LogServiceImpl;
import com.allianz.labportal.service.TokenAssignToLabServiceImpl;
import com.allianz.labportal.service.UploadReportsFromLabServiceImpl;
import com.allianz.labportal.service.UserServiceImpl;

@Controller
@RequestMapping("/assignToLab")
public class TokenAssignToLabCotroller {
	
	//private static final String UPLOADED_FOLDER = "C:\\Users\\jayomir\\Desktop\\upload";
	private static final String UPLOADED_FOLDER = System.getProperty("user.home") + "\\Desktop\\upload\\LabReports"; // C:\Users\jayomir/Desktop
	private static final String MER_Report_Path = System.getProperty("user.home") + "\\Desktop\\upload\\MERReport\\Medical Examiners Report.pdf";
	
	@Autowired	
	TokenAssignToLabServiceImpl tokenAssignToLabServiceImpl;
	
	@Autowired
	UploadReportsFromLabServiceImpl uploadReportsFromLabServiceImpl;
	
	@Autowired
	LogServiceImpl logServiceImpl;
	
	@RequestMapping(value="/getList",method=RequestMethod.GET)
	public void getTokenAssigToLabList(Model model){
		//model.addAttribute("assignToLab", new AssignTolab());
	}

	@RequestMapping(value="/getFileUploadPage/{id}",method=RequestMethod.GET)
	public ModelAndView getFileUpload(@PathVariable("id") int id,Model model){
		
		try{
			
			//String uploadedReports = directCall.getUploadedReportsByTokenId(id);
			String uploadedReports = uploadReportsFromLabServiceImpl.getUploadedReportsByTokenId(id);			
			
			HeadTokenInfo headToken = headTokenService.getHeadTokenById(id);
			
			String notUploadedReports = uploadReportsFromLabServiceImpl.getNotUploadedReportsByTokenId(id,headToken.getMedicalReports(),uploadedReports);
			
			
			if(notUploadedReports != null && !notUploadedReports.equals("not pending reports")){
				notUploadedReports = notUploadedReports.replaceAll("\\[", "").replaceAll("\\]","");	
			}			
			
		
			model.addAttribute("uploadedReports", uploadedReports);	
			model.addAttribute("notUploadedReports", notUploadedReports);
			
			//model.addAttribute("token", new HeadTokenInfo());
			//model.addAttribute("assignToLab", new AssignTolab());			
			model.addAttribute("reportsFromLab", new UploadReportsFromLab());			
			model.addAttribute("headTokenId", id);
			model.addAttribute("headToken", headToken);	
		}
		catch(Exception e){
		
			e.printStackTrace();}
		
		
		return new ModelAndView("/fileUpload");
	}
	
	@Autowired
	HeadTokenServiceImpl headTokenService;
	
	@Autowired
	AssignToDoctorServiceImpl assignToDoctorServiceImpl;
	
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ModelAndView assignToLab(@ModelAttribute("assignToLab") AssignTolab assignToLab,Model model,HttpServletRequest request){
		
		String redirectPage="";
		
		User loginUser =(User) request.getSession().getAttribute("loginUser");
		String loginUserEmail = loginUser.getEmail();		
		//loginUserEmail = "thiliniga@allianz.lk";
		String logInUserName = request.getSession().getAttribute("loginUserName").toString();
		int logInUserType = loginUser.getUserTypeId();
		String logInUserBranch = loginUser.getBranch();
		
		List<HeadTokenInfo> open_tokenList = new ArrayList<HeadTokenInfo>();
		//List<AssignTolab> labTokenList  = new ArrayList<AssignTolab>();
		List<HeadTokenInfo> labTokenList  = new ArrayList<HeadTokenInfo>();
		List<HeadTokenInfo> doctorTokenList = new ArrayList<HeadTokenInfo>();
		
		
		try{
			
			
			int tokenId = assignToLab.getTokenId();
			String labName = assignToLab.getLabName();
			HeadTokenInfo headToken = headTokenService.getHeadTokenById(tokenId);
			
			//get pending reports
			String uploadedReports = uploadReportsFromLabServiceImpl.getUploadedReportsByTokenId(tokenId);
			String notUploadedReports = uploadReportsFromLabServiceImpl.getNotUploadedReportsByTokenId(tokenId,headToken.getMedicalReports(),uploadedReports);
			
			int pendingReportCount = 0;
			if(notUploadedReports.length()!=0 && !notUploadedReports.equals("not pending reports")){
				List<String>pendingReportsList = Arrays.asList(notUploadedReports.split(","));				
				pendingReportCount = pendingReportsList.size();
			}
			
			headTokenService.updateHeadToken(headToken,labName,pendingReportCount);//also update token-status
			
			//System.out.println("assignToLab: "+assignToLab.getLabName());
			tokenAssignToLabServiceImpl.addTokenAssignToLab(assignToLab);
			
			if(logInUserType== 1){ //head office
				
				open_tokenList = headTokenService.getTokenListByTokenStatus("open");
				redirectPage = "/viewTokens_Admin";//viewTokens_Admin
				//labTokenList = tokenAssignToLabServiceImpl.getLabList();
				labTokenList = headTokenService.getTokenListByTokenStatus("lab");
				doctorTokenList = headTokenService.getTokenListByTokenStatus("doctor");
				model.addAttribute("Count_AssignedToLab", labTokenList.size());
				model.addAttribute("Count_AssignedToDoctor",doctorTokenList.size());
				
			}else if(logInUserType == 3){//branch //can only view token of that branch user's and branch agent's created tokens
				
				
				open_tokenList = headTokenService.getTokenListByTokenStatusAndBranch("toLab", logInUserBranch);
				redirectPage = "/viewTokens_Branch";//viewTokens_Branch	
				//labTokenList = tokenAssignToLabServiceImpl.getLabListByBranch(logInUserBranch);
				//labTokenList = headTokenService.getTokenListByTokenStatusAndBranch("lab", logInUserBranch);
				model.addAttribute("BranchName", logInUserBranch);
				model.addAttribute("Count_AssignedToLab", labTokenList.size());
			
			}else if(logInUserType == 4){ //tab agent
				
				open_tokenList = headTokenService.getTokenListByUser(logInUserName,"toLab");//check with token status
				redirectPage = "/viewTokens_Tab";//viewTokens_Tab
				//labTokenList = tokenAssignToLabServiceImpl.getLabListByEmail(loginUserEmail);
				//labTokenList = headTokenService.getTokenListByUser(logInUserName,"lab");
				
			}
			
			
			int openTokens = open_tokenList.size();		
			int labTokens = labTokenList.size();
			//List<TokenCustomerInfo> token_customerInfoList = tokenCustomerServiceImpl.getToken_CustomerInfoList();	
			model.addAttribute("assignToLab", new AssignTolab());		
			model.addAttribute("openTokens", openTokens);
			model.addAttribute("token", new HeadTokenInfo());
			model.addAttribute("tokenList", open_tokenList);		
			model.addAttribute("assignToLab", new AssignTolab());
			model.addAttribute("labTokenList", labTokenList);		
			model.addAttribute("doctorTokenList", doctorTokenList);
			//model.addAttribute("token_token_list", token_tokenInfoList);
			//return new ModelAndView("/viewTokens");
			
			
		}catch(Exception e){
			
			e.printStackTrace();
		}
		return new ModelAndView(redirectPage);
	}
	
	@RequestMapping(value="/getTokenInfo/{id}",method=RequestMethod.GET)
	public ModelAndView getToken(@PathVariable("id") int id, Model model){
		
		try{
			model.addAttribute("token", new HeadTokenInfo());
			model.addAttribute("assignToLab", new AssignTolab());
			model.addAttribute("reportsFromLab", new UploadReportsFromLab());
			HeadTokenInfo headToken = headTokenService.getHeadTokenById(id);
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
		
		return new ModelAndView("/labToken");		
		
		//---------------
	
	}
	
	
	@RequestMapping(value="/getAssigToHOTokenInfo/{id}",method=RequestMethod.GET)
	public ModelAndView getAssigToHOTokenInfo(@PathVariable("id") int id, Model model){
		
		try{
			model.addAttribute("token", new HeadTokenInfo());
			model.addAttribute("assignToLab", new AssignTolab());
			model.addAttribute("reportsFromLab", new UploadReportsFromLab());
			HeadTokenInfo headToken = headTokenService.getHeadTokenById(id);
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
		
		return new ModelAndView("/labToken_AssigntoHO");		
		
		//---------------
	
	}
	
	
	@SuppressWarnings("finally")
	@RequestMapping(value="/addReports/{id}",method=RequestMethod.POST)
	public String uploadMedicalReports(@PathVariable("id") int id,@RequestParam("files") MultipartFile[] files,@ModelAttribute("reportsFromLab") UploadReportsFromLab reportsFromLab,Model model){
		
	
		//MySqlDirectCall directCall = new MySqlDirectCall();
		
		try{
			
			model.addAttribute("reportsFromLab", new UploadReportsFromLab());
			int tokenId = id;
			HeadTokenInfo headToken = headTokenService.getHeadTokenById(tokenId);	
			//HeadTokenInfo headToken = directCall.getheadTokenbyId(tokenId);
			String requestReoports = headToken.getMedicalReports();
			
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
		        	System.out.println("E1");
		            e.printStackTrace();
		        }

		    }
			
			 //save report path in db
			String report_path = UPLOADED_FOLDER+"\\"+tokenId;
			reportsFromLab.setFilepath(report_path);			
			reportsFromLab.setLabName(headToken.getLabName());
			
			
			String uploadedReports = uploadReportsFromLabServiceImpl.getUploadedReportsByTokenId(id);			
			if(uploadedReports == null){				
				
				
				uploadReportsFromLabServiceImpl.addReports(reportsFromLab);	//first	
				//update upload report count and pending report count
				
				uploadedReports = uploadReportsFromLabServiceImpl.getUploadedReportsByTokenId(id);
				
				String notUploadedReports = uploadReportsFromLabServiceImpl.getNotUploadedReportsByTokenId(id,requestReoports,uploadedReports);
				
				List<String> uploadReportsList = Arrays.asList(uploadedReports.split(","));	
				List<String>pendingReportsList = new ArrayList<String>();
				int pendingReportCount= 0;
				int uploadReportCount = uploadReportsList.size();
				if(notUploadedReports!= null && !notUploadedReports.isEmpty() && !notUploadedReports.equals("not pending reports") ){					
					pendingReportsList = Arrays.asList(notUploadedReports.split(","));
					pendingReportCount = pendingReportsList.size();
				}
				
				uploadReportsFromLabServiceImpl.updateReport_CountsByTokenId(id,uploadReportCount,pendingReportCount);
				headTokenService.updatePendingReportsFormLab(id,pendingReportCount);
				//directCall.updatePendingReportsFromLab(id, pendingReportCount);
			
				
			}else{//update
				
				try{
					
						//update recode							
						uploadedReports = uploadedReports +","+reportsFromLab.getReport();
						uploadReportsFromLabServiceImpl.updateReportsByTokenId(id,uploadedReports);
						System.out.println("After Update reportsFromLab with upload reportes....: >>>>>>>>>" );
						
							
						String notUploadedRep = uploadReportsFromLabServiceImpl.getNotUploadedReportsByTokenId(id,requestReoports,uploadedReports);						
						
						int uploadReport_Count = 0; int pendingReport_Count = 0;
						if(uploadedReports!=null){							
							
							List<String> uploadReports_List = Arrays.asList(uploadedReports.split(","));				
							uploadReport_Count = uploadReports_List.size();
						}
						if(notUploadedRep!=null && !notUploadedRep.equals("not pending reports")){//notUploadedRep.length()!=0 || 
							
							List<String>pendingReports_List = Arrays.asList(notUploadedRep.split(","));
							pendingReport_Count = pendingReports_List.size();
						}
						
						//directCall.updateReport_CountsByTokenId(tokenId, uploadReport_Count,pendingReport_Count);
						uploadReportsFromLabServiceImpl.updateReport_CountsByTokenId(id,uploadReport_Count,pendingReport_Count);
						
						
						if(pendingReport_Count == 0){
							uploadReportsFromLabServiceImpl.updateLabCompleteStatus(id, "compleate");
						}
						
						//update head token pending reports count from lab						
						headTokenService.updatePendingReportsFormLab(id,pendingReport_Count);						
						//directCall.updatePendingReportsFromLab(id,pendingReport_Count);					
						
						
				}catch(Exception e){
					
					e.printStackTrace();				
					
				}
				
			}
			
		}catch(Exception e){			
			e.printStackTrace();
		}
		
		//return "redirect:/dashbord/labDashboard";
		return "redirect:/assignToLab/getFileUploadPage/"+id;
		
	}
	
	@Autowired
	UserServiceImpl userServiceImpl;
	
	@RequestMapping(value="/getViewReportPage/{id}",method=RequestMethod.GET)
	public ModelAndView viewUploadedReports(@PathVariable("id") int id,Model model){
		
		try{
			HeadTokenInfo headToken = headTokenService.getHeadTokenById(id);
			model.addAttribute("headTokenId", id);
			model.addAttribute("headToken", headToken);	
			
			model.addAttribute("token", new HeadTokenInfo());
			model.addAttribute("assignToLab", new AssignTolab());		
			model.addAttribute("reportsFromLab", new UploadReportsFromLab());
			model.addAttribute("assignToDoctor", new HeadTokenInfo());	
			
			List<User> doctorList = userServiceImpl.getUserListByUserType(5);//doctor list
			model.addAttribute("doctorList", doctorList);
			List<User> reInsuranceList = userServiceImpl.getUserListByUserType(8);//reInsurance
			model.addAttribute("reInsuranceList", reInsuranceList);
			
			String labStatus = headToken.getCompleteStatusLab();
			model.addAttribute("reportStatus", labStatus);
			
			List<String> fileNameList = new ArrayList<String>();		
			if(labStatus==null){labStatus = "pending reports";}
			if(labStatus.equals("compleate")|| labStatus.equals("pending") ){		

				UploadReportsFromLab report = new UploadReportsFromLab();
				report = uploadReportsFromLabServiceImpl.getReportByTokenId(id);
				
				try{
					
					int tokenId = id;
					String filePath = null;
					
					if(report!=null){
						
						filePath = report.getFilepath();
						
						if(filePath!=null){				
							
							File folder = new File(filePath);
							File[] listOfFiles = folder.listFiles();
							
							for (int i = 0; i < listOfFiles.length; i++) {
							      if (listOfFiles[i].isFile()) {
							    	  fileNameList.add(listOfFiles[i].getName());
							      } 
							}
							
						}	
					}
				  
					model.addAttribute("fileNameList", fileNameList);
				}catch(Exception e){e.printStackTrace();}
				
				
				String requestReoports = headToken.getMedicalReports();
				String uploadedReports = uploadReportsFromLabServiceImpl.getUploadedReportsByTokenId(id);
				String notUploadedReports = uploadReportsFromLabServiceImpl.getNotUploadedReportsByTokenId(id,requestReoports,uploadedReports);
				
				if(notUploadedReports!= null && !notUploadedReports.equals("not pending reports")){
					notUploadedReports = notUploadedReports.replaceAll("\\[", "").replaceAll("\\]","");	
				}
				
				//model.addAttribute("uploadedReports", uploadedReports);	
				model.addAttribute("notUploadedReports", notUploadedReports);

			}
			
		}catch(Exception e){e.printStackTrace();}
			
		
		return new ModelAndView("/viewReports");
	}
	
	@RequestMapping(value="/downloadReport/{name}/{tokenId}",method=RequestMethod.GET)
	public ModelAndView downloadReports(@PathVariable("tokenId") int id,@PathVariable("name")String reportName,Model model,HttpServletResponse response){
		try{
			
			
			model.addAttribute("reportsFromLab", new UploadReportsFromLab());	
			model.addAttribute("assignToDoctor", new AssignToDoctor());
			UploadReportsFromLab report = new UploadReportsFromLab();
			report = uploadReportsFromLabServiceImpl.getReportByTokenId(id);
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
		
		return new ModelAndView("/viewReports");
	}
	
	//downloadMERReport
	@RequestMapping(value="/downloadMERReport/",method=RequestMethod.GET)
	public ModelAndView downloadMERReports(Model model,HttpServletResponse response){
		try{
			
			
			model.addAttribute("reportsFromLab", new UploadReportsFromLab());	
			model.addAttribute("assignToDoctor", new AssignToDoctor());
			
			
			File file = new File(MER_Report_Path);//MER_Report_Path
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
		
		return new ModelAndView("/viewReports");
	}
	//-----------------------------------
	
	@Autowired
	EmailSendingServiceImpl emailSendingServiceImpl;
	
	@Autowired
	LabServiceImpl labServiceImpl;
	
	@RequestMapping(value="/assignToHO/{id}",method=RequestMethod.POST)
	public void tokenAssignToHeadOffice(@PathVariable("id") int id,Model model,HttpServletRequest request,HttpServletResponse response){
		try{
			
			
			//update status of upload reports from lab
			//uploadReportsFromLabServiceImpl.updateLabCompleteStatus(id, "compleate");
			
			HeadTokenInfo headToken = headTokenService.getHeadTokenById(id);		
			String requestReoports = headToken.getMedicalReports();
			
			
			String uploadedReports = uploadReportsFromLabServiceImpl.getUploadedReportsByTokenId(id);	
			String notUploadedRep = uploadReportsFromLabServiceImpl.getNotUploadedReportsByTokenId(id,requestReoports,uploadedReports);						
			int pendingReport_Count = 0;

			if(notUploadedRep!=null && !notUploadedRep.equals("not pending reports")){//notUploadedRep.length()!=0 || 
										
			List<String>pendingReports_List = Arrays.asList(notUploadedRep.split(","));
			pendingReport_Count = pendingReports_List.size();
			}	
			
			
			String comment ="";
			int labId = headToken.getLabId();
			Lab lab = labServiceImpl.getLabById(labId);
			String labName =lab.getLabName();
			String labAddress = lab.getAddress();
			
			if(pendingReport_Count == 0){
				 comment = "Assigned token to Head Office with compleate medical reports from "+labName+", "+labAddress+" by "+request.getSession().getAttribute("loginUserName").toString();
			}else {
				//pending
				comment = "Assigned token to Head Office with pending medical reports from "+labName+", "+labAddress+" by "+request.getSession().getAttribute("loginUserName").toString();
				
			}
			
			//headTokenService.updateTokenStstus(id, "fromLab");
			headTokenService.updateTokenStstus(id, "fromLab", comment);
			
			//add logs			
			logServiceImpl.addRecode(id, comment);
			
			//send email to head-office
			
			String customerName = headToken.getCustomerName();
			String requestingReports = headToken.getMedicalReports()+headToken.getSpecialMedicalReports()+headToken.getOtherMedicalReports();
			String nic = headToken.getNic();	
			String policyNo = headToken.getProposalNo();
			
			String labEmail = lab.getEmail();			
			String labContactNo = lab.getContactNo();
			
			//server
			
			String fromAddress = "AZhealthportal@allianz.lk";
			String toAddress = "lifeservicing@allianz.lk"; //"jayomir@allianz.lk";//"lifeservicing@allianz.lk";
			String subject = "Medical Tests of Proposal/Policy No #: "+policyNo;
			String ccListArray[] = {"LifeUnderwriting@allianz.lk","lifeclaims@allianz.lk"};
			String bcc = "jayomir@allianz.lk";
			
			
			//local
			/*
			String fromAddress = "AZhealthportal@allianz.lk";
			String toAddress ="jayomir@allianz.lk";//"lifeservicing@allianz.lk";
			String subject = "Medical Tests of Proposal/Policy No #: "+policyNo;	
			String cc = "jayomi.rajapaksha@gmail.com";
			String bcc = "jayomir@allianz.lk";
		*/
			
			String msgBody = "<div>The following customer's reports are uploaded."+"</div><br/>"
					+ "<div>Customer Name : "+customerName+"</div>"					
					+ "<div>NIC : "+nic+"</div>"					
					+ "<div>From: "+labName+" - "+labAddress+"</div>"
					+ "<div>Email: "+labEmail+"</div>"
					+ "<div>Contact No : "+labContactNo+"</div>";
					
			//emailSendingServiceImpl.sendEmail(toAddress, fromAddress, subject, msgBody);
			emailSendingServiceImpl.sendEmail(toAddress, fromAddress, subject, msgBody,ccListArray,bcc);
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.write("1");
			 
			
		}catch(Exception e){
			e.printStackTrace();
		}
		//return new ModelAndView("lab_dashbord");
	}
	
	
	@RequestMapping(value="/deleteLabReport/{name}/{tokenId}",method=RequestMethod.GET)
	public void deleteLabReport(@PathVariable("tokenId") int id,@PathVariable("name")String reportName,Model model,HttpServletRequest request,HttpServletResponse response){
		try{
			
			
		
			UploadReportsFromLab reports  = uploadReportsFromLabServiceImpl.getReportByTokenId(id);
			
			String filePath = reports.getFilepath();			
			
		
			
			if(filePath!=null){				
				
				File folder = new File(filePath);
				File[] listOfFiles = folder.listFiles();
				
				for (int i = 0; i < listOfFiles.length; i++) {
				      if (listOfFiles[i].isFile()) {				    
				    	
				    	  String filename = listOfFiles[i].getName();//MER.PDF				    	 
				    	  String[] splitArray =filename.split("\\.(?=[^\\.]+$)");		    	 
				    	
				    	  if(reportName.equals(splitArray[0])){
				    		 
				    		  File file = new File(filePath+"/"+filename); 
				    		  file.delete();
				  			
				    	  }
				      } 
				}
				
			}
			
				
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.write("1");
			
			
		}catch(Exception e){e.printStackTrace();}
		//return "redirect:/assignToDoctor/getViewReportPage/"+id;
		
		
	}
	
}
