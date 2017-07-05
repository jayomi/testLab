package com.allianz.labportal;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.allianz.labportal.model.AssignToDoctor;
import com.allianz.labportal.model.AssignTolab;
import com.allianz.labportal.model.HeadTokenInfo;
import com.allianz.labportal.model.User;
import com.allianz.labportal.service.AssignToDoctorServiceImpl;
import com.allianz.labportal.service.HeadTokenServiceImpl;
import com.allianz.labportal.service.TokenAssignToLabServiceImpl;

@Controller
@RequestMapping("dashbord")
public class DashboardController {

	@Autowired
	HeadTokenServiceImpl headTokenServiceImpl;
	
	@RequestMapping(value="/getPage",method=RequestMethod.GET)
	public ModelAndView getDashboardPage(Model model){
		/*List<HeadTokenInfo> tokenList = new ArrayList<HeadTokenInfo>();
		try{
			
			tokenList = headTokenServiceImpl.getTokenList();
			int openTokens = headTokenServiceImpl.countTokensbyStatus("open");
			int labTokens = headTokenServiceImpl.countTokensbyStatus("lab");
			int doctorTokens = headTokenServiceImpl.countTokensbyStatus("doctor");
			model.addAttribute("openTokens", openTokens);
			model.addAttribute("labTokens", labTokens);
			model.addAttribute("doctorTokens", doctorTokens);
			model.addAttribute("tokenList", tokenList);
			model.addAttribute("tokenCount", tokenList.size());
			
		}catch(Exception e){e.printStackTrace();}
		
		return new ModelAndView("/dashbord");*/
		
		return new ModelAndView("/test");
	}
	
	@Autowired	
	TokenAssignToLabServiceImpl tokenAssignToLabServiceImpl;
	
	@RequestMapping(value="/labDashboard",method=RequestMethod.GET)
	public ModelAndView getLabDashboard(Model model,HttpServletRequest request){
		List<HeadTokenInfo> toLab_tokenList  = new ArrayList<HeadTokenInfo>();
		List<HeadTokenInfo> assigntoHOFromLab_tokenList  = new ArrayList<HeadTokenInfo>();
		
		try{
			
			User loginUser =(User) request.getSession().getAttribute("loginUser");
			int labId = loginUser.getLabId();
			//toLab_tokenList = headTokenServiceImpl.getTokenListByTokenStatus("toLab");		
			toLab_tokenList = headTokenServiceImpl.getTokenListByTokenStatusAndLab("toLab", labId);
			
			//assignto h/o list
			assigntoHOFromLab_tokenList = headTokenServiceImpl.getTokenListByTokenStatusAndLabUploadStatus("toLab", labId, "compleate");
			assigntoHOFromLab_tokenList.addAll(headTokenServiceImpl.getTokenListByTokenStatusAndLabUploadStatus("toLab", labId, "pending"));
			
			model.addAttribute("Count_AssignedToLab", toLab_tokenList.size());
			model.addAttribute("toLab_tokenList", toLab_tokenList);
			
			model.addAttribute("Count_assigntoHOFromLab_tokenList", assigntoHOFromLab_tokenList.size());
			model.addAttribute("assigntoHOFromLab_tokenList", assigntoHOFromLab_tokenList);
			
			
		}catch(Exception e){e.printStackTrace();}
		
		return new ModelAndView("/lab_dashbord");		
	}
	
	@Autowired
	AssignToDoctorServiceImpl assignToDoctorServiceImpl;
	
	@RequestMapping(value="/doctorDashboard",method=RequestMethod.GET)
	public ModelAndView getDoctorDashboard(Model model,HttpServletRequest request){
		
		List<HeadTokenInfo> toDoctor_tokenList = new ArrayList<HeadTokenInfo>();
		List<HeadTokenInfo> assigntoHO_tokenList  = new ArrayList<HeadTokenInfo>();
		
		try{
			toDoctor_tokenList = headTokenServiceImpl.getTokenListByTokenStatus("toDoctor");
			
			User loginUser =(User) request.getSession().getAttribute("loginUser");
			int doctorId = loginUser.getId();
			//assignto h/o list
			assigntoHO_tokenList = headTokenServiceImpl.getCompleateTokenListByDoctor(doctorId, "toDoctor","compleate");
			
			model.addAttribute("Count_AssignedToDoctor", toDoctor_tokenList.size());
			model.addAttribute("Count_assigntoHO_tokenList",assigntoHO_tokenList.size());
			model.addAttribute("toDoctor_tokenList", toDoctor_tokenList);
			model.addAttribute("assigntoHO_tokenList", assigntoHO_tokenList);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return new ModelAndView("/doctor_dashbord");
	}
	
	@RequestMapping(value="/SRPDashboard",method=RequestMethod.GET)
	public ModelAndView getReInsuranceDashboard(Model model,HttpServletRequest request){
		
		List<HeadTokenInfo> toSRP_tokenList = new ArrayList<HeadTokenInfo>();
		List<HeadTokenInfo> assigntoHO_tokenList  = new ArrayList<HeadTokenInfo>();
		
		try{
			toSRP_tokenList = headTokenServiceImpl.getTokenListByTokenStatus("toSRP");
			
			User loginUser =(User) request.getSession().getAttribute("loginUser");
			int srpId = loginUser.getId();
			
			//assignto h/o list
			assigntoHO_tokenList = headTokenServiceImpl.getCompleateTokenListBySRP(srpId, "toSRP", "compleate");
							
			
			model.addAttribute("Count_toSRP",toSRP_tokenList.size());
			model.addAttribute("Count_assigntoHO_tokenList",assigntoHO_tokenList.size());
			model.addAttribute("toSRP_tokenList", toSRP_tokenList);
			model.addAttribute("assigntoHO_tokenList", assigntoHO_tokenList);
			
		}catch(Exception e){e.printStackTrace();}
		return new ModelAndView("SRP_dashbord");
	}
	
}
