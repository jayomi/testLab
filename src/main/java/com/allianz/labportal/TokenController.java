package com.allianz.labportal;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.allianz.labportal.main.EmailNotification;
import com.allianz.labportal.model.AssignToDoctor;
import com.allianz.labportal.model.AssignTolab;
import com.allianz.labportal.model.Branch;
import com.allianz.labportal.model.Department;
import com.allianz.labportal.model.HeadTokenInfo;
import com.allianz.labportal.model.Lab;
import com.allianz.labportal.model.Log;
import com.allianz.labportal.model.MedicalReports;
import com.allianz.labportal.model.SpecialMedicalReports;
import com.allianz.labportal.model.User;
import com.allianz.labportal.service.AssignToDoctorServiceImpl;
import com.allianz.labportal.service.BranchServiceImpl;
import com.allianz.labportal.service.DepartmentServiceImpl;
import com.allianz.labportal.service.EmailSendingServiceImpl;
import com.allianz.labportal.service.HeadTokenServiceImpl;
import com.allianz.labportal.service.LabServiceImpl;
import com.allianz.labportal.service.LogServiceImpl;
import com.allianz.labportal.service.MedicalReportServerImpl;
import com.allianz.labportal.service.TokenAssignToLabServiceImpl;



@Controller
@RequestMapping("/token")
public class TokenController {

	/*@Autowired
	TokenServiceImpl tokenServiceImpl;*/	
	/*@Autowired
	Token_UserServiceImpl tokenUserServiceImpl;	*/
	/*@Autowired
	Token_customeServiceImpl tokenCustomerServiceImpl;*/
	
	@Autowired
	HeadTokenServiceImpl headTokenService;
	@Autowired	
	TokenAssignToLabServiceImpl tokenAssignToLabServiceImpl;
	
	@Autowired
	AssignToDoctorServiceImpl assignToDoctorServiceImpl;
	
	@Autowired
	LogServiceImpl logServiceImpl;
	
	@Autowired
	MedicalReportServerImpl medicalReportServerImpl;
	
	@Autowired
	LabServiceImpl labServiceImpl;
	
	@RequestMapping(value="/getTokens", method=RequestMethod.GET)
	public ModelAndView getTokens(Model model,HttpServletRequest request){
		
		String redirectPage="";
		
		User loginUser =(User) request.getSession().getAttribute("loginUser");
		String loginUserEmail = loginUser.getEmail();		
		//loginUserEmail = "thiliniga@allianz.lk";
		String logInUserName = request.getSession().getAttribute("loginUserName").toString();
		//String logInUserType = loginUser.getUserType().getType();
		int userTypeId = loginUser.getUserTypeId();
		String logInUserBranch = loginUser.getBranch();
		
		List<HeadTokenInfo> tokenList = headTokenServiceImpl.getTokenList();
		List<HeadTokenInfo> toLab_tokenList = new ArrayList<HeadTokenInfo>();							
		List<HeadTokenInfo> fromLab_tokenList  = new ArrayList<HeadTokenInfo>();
		List<HeadTokenInfo> toDoctor_tokenList = new ArrayList<HeadTokenInfo>();
		List<HeadTokenInfo> fromDoctor_tokenList  = new ArrayList<HeadTokenInfo>();	
		List<HeadTokenInfo> toSRP_tokenList = new ArrayList<HeadTokenInfo>();
		List<HeadTokenInfo> fromSRP_tokenList  = new ArrayList<HeadTokenInfo>();		
		List<HeadTokenInfo> closed_tokenList  = new ArrayList<HeadTokenInfo>();	
		
		//if(logInUserType.equalsIgnoreCase("head office")){
		if(userTypeId == 1){//head office
			toLab_tokenList = headTokenServiceImpl.getTokenListByTokenStatus("toLab");							
			fromLab_tokenList = headTokenServiceImpl.getTokenListByTokenStatus("fromLab");
			toDoctor_tokenList = headTokenServiceImpl.getTokenListByTokenStatus("toDoctor");
			fromDoctor_tokenList = headTokenServiceImpl.getTokenListByTokenStatus("fromDoctor");
			toSRP_tokenList = headTokenServiceImpl.getTokenListByTokenStatus("toSRP");
			fromSRP_tokenList = headTokenServiceImpl.getTokenListByTokenStatus("fromSRP");
			closed_tokenList = headTokenServiceImpl.getTokenListByTokenStatus("closed");
			redirectPage = "viewTokens_Admin";
			
		}else if(userTypeId == 3){//branch
		//else if(logInUserType.equalsIgnoreCase("branch")){ //can only view token of that branch user's and branch agent's created tokens
			
						
			toLab_tokenList = headTokenService.getTokenListByTokenStatusAndBranch("toLab", logInUserBranch);
			model.addAttribute("BranchName", logInUserBranch);
			model.addAttribute("Count_AssignedToLab", toLab_tokenList.size());
			redirectPage = "/viewTokens_Branch";//viewTokens_Branch	
		
		}else if(userTypeId == 4){//tab user
		//else if(logInUserType.equalsIgnoreCase("tab")){ //tab agent
				
			toLab_tokenList = headTokenService.getTokenListByUser(logInUserName,"toLab");			
			redirectPage = "/viewTokens_Tab";//viewTokens_Tab	
		}
		
		
		
		//List<TokenCustomerInfo> token_customerInfoList = tokenCustomerServiceImpl.getToken_CustomerInfoList();	
				
		model.addAttribute("tokenList", tokenList);
		model.addAttribute("tokenCount", tokenList.size());
		model.addAttribute("Count_AssignedToLab", toLab_tokenList.size());
		model.addAttribute("Count_fromLab", fromLab_tokenList.size());
		model.addAttribute("Count_AssignedToDoctor",toDoctor_tokenList.size());	
		model.addAttribute("Count_fromDoctor",fromDoctor_tokenList.size());
		model.addAttribute("Count_toSRP",toSRP_tokenList.size());	
		model.addAttribute("Count_fromSRP",fromSRP_tokenList.size());		
		model.addAttribute("Count_closed",closed_tokenList.size());	
		
		model.addAttribute("token", new HeadTokenInfo());
		model.addAttribute("assignToLab", new AssignTolab());
		
		
		model.addAttribute("toLab_tokenList", toLab_tokenList);							
		model.addAttribute("fromLab_tokenList", fromLab_tokenList);		
		model.addAttribute("toDoctor_tokenList", toDoctor_tokenList);
		model.addAttribute("fromDoctor_tokenList", fromDoctor_tokenList);
		model.addAttribute("toSRP_tokenList", toSRP_tokenList);
		model.addAttribute("fromSRP_tokenList", fromSRP_tokenList);
		model.addAttribute("closed_tokenList", closed_tokenList);
		
		return new ModelAndView(redirectPage);
		
	}
	
	@Autowired
	HeadTokenServiceImpl headTokenServiceImpl;	
	
	@RequestMapping(value="/getLabTokens", method=RequestMethod.GET)
	public ModelAndView getLabTokens(Model model,HttpServletRequest request){
		
		List<HeadTokenInfo> toLab_tokenList  = new ArrayList<HeadTokenInfo>();
		
		try{
			User loginUser =(User) request.getSession().getAttribute("loginUser");
			int labId = loginUser.getLabId();
			//toLab_tokenList = headTokenServiceImpl.getTokenListByTokenStatus("toLab");
			toLab_tokenList = headTokenServiceImpl.getTokenListByTokenStatusAndLab("toLab", labId);
			model.addAttribute("Count_AssignedToLab", toLab_tokenList.size());
			model.addAttribute("toLab_tokenList", toLab_tokenList);
			
		}catch(Exception e){e.printStackTrace();}
		return new ModelAndView("/viewTokens_Lab");
	}
	
	@RequestMapping(value="/getDoctorTokens",method=RequestMethod.GET)
	public ModelAndView getDoctorTokens(Model model){
		
		List<HeadTokenInfo> toDoctor_tokenList = new ArrayList<HeadTokenInfo>();
		try{
			toDoctor_tokenList = headTokenServiceImpl.getTokenListByTokenStatus("toDoctor");								
			model.addAttribute("Count_AssignedToDoctor", toDoctor_tokenList.size());
			model.addAttribute("toDoctor_tokenList", toDoctor_tokenList);
		}catch(Exception e){
			e.printStackTrace();
		}
		return new ModelAndView("ViewTokens_Doctor");
	}
	
	@Autowired
	BranchServiceImpl branchServiceImpl;
	@Autowired
	DepartmentServiceImpl departmentServiceImpl;
	@RequestMapping(value="/createToken",method=RequestMethod.GET)
	public ModelAndView createTokenPage(Model model){
		
		try{
			
			List<MedicalReports> medicalReportList = medicalReportServerImpl.getMedicalReportList();//all items	
			model.addAttribute("medicalReportList", medicalReportList);			
			model.addAttribute("token", new HeadTokenInfo());
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return new ModelAndView("/createTokens");
	}
	
	@RequestMapping(value="/getTokenInfo/{id}",method=RequestMethod.GET)
	public ModelAndView getToken(@PathVariable("id") int id, Model model){
		
		model.addAttribute("token", new HeadTokenInfo());
		model.addAttribute("assignToLab", new AssignTolab());
		HeadTokenInfo headToken = headTokenService.getHeadTokenById(id);
		model.addAttribute("headTokenId", id);
		model.addAttribute("headToken", headToken);
		
		//get logs
		List<Log> logs = logServiceImpl.getLogs(id);
		model.addAttribute("logList", logs);
		
		return new ModelAndView("/headToken");
	}
	
	@RequestMapping(value="/getLabAssignedTokenInfo/{id}",method=RequestMethod.GET)
	public ModelAndView getLabAssignedToken(@PathVariable("id") int id, Model model){
		
		model.addAttribute("token", new HeadTokenInfo());
		model.addAttribute("assignToLab", new AssignTolab());
		HeadTokenInfo headToken = headTokenService.getHeadTokenById(id);
		model.addAttribute("headTokenId", id);
		model.addAttribute("headToken", headToken);
		
		//get logs
		List<Log> logs = logServiceImpl.getLogs(id);
		model.addAttribute("logList", logs);
		
		return new ModelAndView("/LabAssignedToken");
	}
	
	@Autowired
	EmailSendingServiceImpl emailSendingServiceImpl;
	
	@RequestMapping(value="/addToken",method=RequestMethod.POST)
	public String addToken(@ModelAttribute("token") HeadTokenInfo token,Model model, HttpServletRequest request){
		
		try{
			
			//login user
			User user = (User) request.getSession().getAttribute("loginUser");
			String loginUser = user.getFullName();
			String branch = user.getBranch();
			
			token.setCreatedBy(loginUser);
			token.setBranch(branch);
			token.setTokenStatus("toLab");
			token.setCreatedDate(new Date());		
			
			
			//set lab name
			int labId = token.getLabId();	
			Lab lab = labServiceImpl.getLabById(labId);
			String labName = lab.getAddress(); // registred user lab name
			token.setLabName(labName);
			token.setLastResponse(new Date());
			token.setLastMessage("Token Assigned to Lab: "+labName);
			
			headTokenService.addToken(token);
			
			//add log
			int maxTokenId = headTokenService.getMaxRecorde();			
			String comment = "token created by "+request.getSession().getAttribute("loginUserName").toString()+". and assign token to lab: "+token.getLabName();
			logServiceImpl.addRecode(maxTokenId, comment);
			
			//send Email 
		    
			String customerName = token.getCustomerName();
			String nic = token.getNic();
			String AppoinmentDate = token.getAppointmentDate();
			String AppoinmentTime = token.getAppointmentTime();
			String proposalNo = token.getProposalNo();
			
			//String medicalReports = token.getMedicalReports();
			String labEmail = lab.getEmail();
			String labAddress = lab.getAddress();			
			String division = lab.getDivision();
			
			if(division == null || division.isEmpty() ){
				division = " - ";
			}
			
			String portalUrl = "http://azhealthportal.allianz.lk/";
			URI uri = new URI(portalUrl);
			String hostName = uri.getHost();
			hostName = "http://"+hostName;
			
			
			
			//EmailNotification - server			
			
			String fromAddress = "AZhealthportal@allianz.lk";//"labportal@allianz.lk"; 
	         String toAddress = labEmail; //"gihanthanuja@gmail.com";
	         String subject = "Appointment for Medical Tests of Proposal #"+proposalNo;       
	         String ccListArray[] = {"LifeUnderwriting@allianz.lk","lifeservicing@allianz.lk","lifeclaims@allianz.lk"};
	        // String cc = "lifeservicing@allianz.lk";
	         String bcc = "jayomir@allianz.lk";
			
			
			
	        //EmailNotification - local	 
			/*
			String fromAddress = "AZhealthportal@allianz.lk"; //"labportal@allianz.lk";
	         String toAddress ="jayomi.rajapaksha@gmail.com";// "gihanthanuja@gmail.com";
	         String subject = "Appointment for Medical Tests of Proposal #"+proposalNo;	        
	        // String ccListArray[] = {"gihanthanuja@gmail.com","jayomir@allianz.lk"};
	         String ccListArray[] = {"jayomir@allianz.lk","jayomi.rajapaksha@gmail.com"};
	         String bcc = "jayomir@allianz.lk";
	      */
	         
	       
	         String medicalReports = token.getMedicalReports();
	         String setdata = "";      
	         if(medicalReports != null){
	        	 String[] htmlCon = medicalReports.split(","); 	        	
		         for(int i = 0; i < htmlCon.length; i++){
		        	setdata = setdata +"<li>"+"" +htmlCon[i] + "</li>";			        	
		         }
	         }
	         
	         if(setdata.isEmpty()) setdata="N/A";
	        
	         
	         String specialReports = token.getSpecialMedicalReports();
	         String special = "";
	         if(specialReports!=null){
	        	 String[] specialRe = specialReports.split(",");	
	        	 
	 	         for(int i=0;i<specialRe.length;i++){
	 	        	 special = special+"<li>"+""+specialRe[i]+"</li>";
	 	        	
	 	         }
	         }
	         
	         if(special.isEmpty()) special="N/A";
	       
	         String otherReports = token.getOtherMedicalReports();
	         String other="";
	         if(otherReports!=null && !otherReports.isEmpty()){
	        	 String[] otherRe = otherReports.split(",");
	        	
	        	 for(int i=0; i<otherRe.length;i++){
	        		 other = other+"<li>"+""+otherRe[i]+"</li>";
	        		
	        	 }
	         }
	         
	         if(other.isEmpty()) other = "N/A";         
	         
	         String msgBody = "<div><b>Customer Name: "+customerName+"</b></div>"
	        		 + "<div>NIC: "+nic+"</div>"
		         		+"<div>Appointment Date: "+AppoinmentDate+"</div>"
		         		+"<div>Appointment Time: "+AppoinmentTime+"</div>"
		         		+"<div>Branch: "+division+"</div>"
		         		+"<div>Lab: "+labAddress+"</div>"
		         		+ "<hr><br/>"
		         		
		         		+ "<div>Please perform the below medical tests.</div>"
		         		+ ""
		         		+ "<table style='border: 1px solid black;'>"
		         		+ "<thead>"
		         		+ "<th style='border: 1px solid black;'>Standard Medical Reports</th>"
		         		+ "<th style='border: 1px solid black;'>Special Medical Reports</th>"
		         		+ "<th style='border: 1px solid black;'>Other Medical Reports</th>"
		         		+ "</thead>"
		         		+ "<tbody>"
		         			+"<tr>"
		         			+ "<td style='border: 1px solid black;'><ol type='1'>"+setdata+"</ol></td>"
		         			+ "<td style='border: 1px solid black;'><ol type='1'>"+special+"</ol></td>"
		         			+ "<td style='border: 1px solid black;'><ol type='1'>"+other+"</ol></td>"
		         			+ "</tr>"
		         			+ "</tbody>"
		         			+ "</table>"
		         		+ "<div>Important : "+"</div>"
		         		+ ""
		         		+ "<ol type='1'>"
		         		+ "<li> Verify the identification of the customer(Name and NIC)"+"</li>"
		         		+ "<li> Upload the medical reports to Allianz Health Partner Portal,<b><a href='http://azhealthportal.allianz.lk/'>"+hostName+"</a></b></li>"
		         		+ "</ol>"	         		
		         		+ "</br>"      		
		         		+ "<div>Allianz Life Insurance Lanka Ltd.</div>"
		         	
		         		+ "<div>This is a System generated request. Signature not required.</div>";  
	         
	            
			emailSendingServiceImpl.sendEmail(toAddress, fromAddress, subject, msgBody,ccListArray,bcc);
	        // emailSendingServiceImpl.sendEmail(toAddress, fromAddress, subject, msgBody);
			
		}catch(Exception e){e.printStackTrace();}		
		//return new ModelAndView("/token/createToken");
		return "redirect:/token/createToken";
	}
	
@RequestMapping(value="/closedToken/{id}",method=RequestMethod.POST)	
public String changeDoctorStatus(@PathVariable("id") int id,Model model,@ModelAttribute("headToken") HeadTokenInfo headToken,HttpServletRequest request){
		try{
			String comment = headToken.getAdminComment();
			String tokenStatus = headToken.getTokenStatus();
			headToken.getCompleteStatusDoctor();			
			headTokenServiceImpl.updateTokenStstus(id, tokenStatus, comment);
			
			//add log
			String logComment = "Token closed by "+request.getSession().getAttribute("loginUserName").toString();
			logServiceImpl.addRecode(id, logComment);
			
			
		}catch(Exception e){e.printStackTrace();}
		
		//return new ModelAndView("/viewTokens_Admin");
		return "redirect:/token/getTokens";
		
	}
	
	@RequestMapping(value="/editToken/{id}",method=RequestMethod.GET)
	public ModelAndView editTokenPage(@PathVariable("id") int id, Model model){
		
		model.addAttribute("token", new HeadTokenInfo());
		model.addAttribute("assignToLab", new AssignTolab());
		HeadTokenInfo headToken = headTokenService.getHeadTokenById(id);
		List<MedicalReports> medicalReportList = medicalReportServerImpl.getMedicalReportList();//all items	
		List<String> medicalReports = new ArrayList<String>();
		for(MedicalReports report : medicalReportList ){
			medicalReports.add(report.getReportName());
		}
		
		
		//-----------------------------------------------------
		String reportList = medicalReports.toString();
		//get ckeck/selected reports
		String selectList = headToken.getMedicalReports();
		String allList[] = reportList.replaceAll("\\[", "").replaceAll("\\]","").split(",");
		List<String> notSelectedList= new ArrayList<String>();
		
		 
		if(selectList!=null){
			String selectListArray[] = selectList.split(",");
			for (String str : allList) {
				str = str.trim();
				Boolean status = true;
				for(String s : selectListArray){
					s = s.trim();
					if(s.equals(str)){
						status = false;
						break;
					}
				}
				if(status){
					notSelectedList.add(str);
				}
			}
		}	
		
		//-------------------------------------------------------	
		//special medical reports
		List<SpecialMedicalReports> specialReportsList = medicalReportServerImpl.getSpecialMedicalReports();
		List<String> specialReports = new ArrayList<String>();
		for(SpecialMedicalReports report : specialReportsList){
			specialReports.add(report.getReportName());
		}
		
		//selected special medical reports
		String all_specialReports = specialReports.toString();
		String selected_specialReports = headToken.getSpecialMedicalReports();
		String allSpecialReports[] = all_specialReports.replaceAll("\\[", "").replaceAll("\\]","").split(",");
		List<String> not_selectedSpecialReports = new ArrayList<String>();
		
		if(selected_specialReports!=null){
			String selectedSpecialListArray[] = selected_specialReports.split(",");
			for (String str : allSpecialReports) {
				str = str.trim();
				Boolean status = true;
				for(String s : selectedSpecialListArray){
					s = s.trim();
					if(s.equals(str)){
						status = false;
						break;
					}
				}
				if(status){
					not_selectedSpecialReports.add(str);
				}
			}
		}	
		
		//get Lab List
		List<Lab> labList = labServiceImpl.getLabList();	
		
		model.addAttribute("headTokenId", id);
		model.addAttribute("headToken", headToken);
		
		model.addAttribute("updateToken", new HeadTokenInfo() );
		model.addAttribute("selected_medicalReports", selectList);//aaa,bbb,ccc
		model.addAttribute("notselected_medicalReports", notSelectedList);//array list
		model.addAttribute("selected_specialReports", selected_specialReports);
		model.addAttribute("notselected_specialReports", not_selectedSpecialReports);
		//model.addAttribute("labNameList", labNameList);
		model.addAttribute("labList", labList);
		
		return new ModelAndView("/editToken");
	}
	 
	
	@RequestMapping(value="/updateToken/{id}",method=RequestMethod.POST)
	public ModelAndView updateToken(@PathVariable("id") int id,@ModelAttribute("updateToken") HeadTokenInfo token,Model model, HttpServletRequest request){
		
		try{
			
			model.addAttribute("assignToLab", new AssignTolab());
			//login user
			User user = (User) request.getSession().getAttribute("loginUser");			
			String branch = user.getBranch();		
			token.setBranch(branch);
			token.setTokenStatus("toLab");
			
			int labId = token.getLabId();			
			Lab lab = labServiceImpl.getLabById(labId);
			String labName = lab.getLabName(); // registred user lab name
			token.setLabName(labName);
			token.setCreatedDate(new Date());			
			
			headTokenService.updateToken(id, token);
			
			//add logs					
			String comment = "token updated by "+request.getSession().getAttribute("loginUserName").toString()+". ";
			logServiceImpl.addRecode(id, comment);			
			
			model.addAttribute("token", new HeadTokenInfo());
			
			model.addAttribute("headTokenId", id);
			model.addAttribute("headToken", token);
			
			//get logs
			List<Log> logs = logServiceImpl.getLogs(id);
			model.addAttribute("logList", logs);
			
			
			
		}catch(Exception e){e.printStackTrace();}
		return new ModelAndView("/headToken");
	}
	
	//getLab List by category
	@RequestMapping(value="/getLabListByCategory/{categoryId}",method=RequestMethod.GET)
	public void getLabListByCategory(@PathVariable("categoryId") int categoryId,HttpServletResponse response,HttpServletRequest request){
		
		try {
			List<Lab> labList = labServiceImpl.getLabListByCategory(categoryId);
			
			PrintWriter out = response.getWriter();
			String x = "<option>"+"- Select - "+"</option>";			
			
			for (Lab lab : labList) {
				x = x + "<option value="+lab.getId()+">"+lab.getLabName()+", "+lab.getAddress() +"</option>";
			}
			
			
	       out.write(x);
	       
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
		
	}
	
	
	
	
}
