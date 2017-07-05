package com.allianz.labportal;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.NamingException;
import javax.naming.ldap.LdapContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.allianz.labportal.main.ActiveDirectory;
import com.allianz.labportal.main.CheckPasswordExpirity;
import com.allianz.labportal.main.SHAHashingImpl;
import com.allianz.labportal.main.TabAgentImpl;
import com.allianz.labportal.model.AssignToDoctor;
import com.allianz.labportal.model.AssignTolab;
import com.allianz.labportal.model.HeadTokenInfo;
import com.allianz.labportal.model.RegisterUser;
import com.allianz.labportal.model.User;
import com.allianz.labportal.service.AssignToDoctorServiceImpl;
import com.allianz.labportal.service.HeadTokenServiceImpl;
import com.allianz.labportal.service.TokenAssignToLabServiceImpl;
import com.allianz.labportal.service.UserServiceImpl;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView getUserPage(Model model){
		model.addAttribute("loginUser",new User());
			
		return new ModelAndView("/home");
		
	}
	
	@Autowired
	UserServiceImpl userServiceImpl;
	
	@Autowired
	HeadTokenServiceImpl headTokenServiceImpl;
	
	@Autowired	
	TokenAssignToLabServiceImpl tokenAssignToLabServiceImpl;
	
	@Autowired
	AssignToDoctorServiceImpl assignToDoctorServiceImpl;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)	
	public ModelAndView getUser(@ModelAttribute("loginUser") User user, Model model,HttpServletRequest request, HttpServletResponse response){
		
		
		String redirectPage = "";
		String loginMsg="";
		try{			
		
			//String username = user.getUsername();
			//String password = user.getPassword();
			String username = request.getParameter("username").toString();
			String password = request.getParameter("password").toString();
			String agentCode = request.getParameter("AgentCode").toString();
			
			
			//System.out.println("user: "+username);
	
			try{
				
				if(username!=null  && !username.isEmpty() && password!=null && !password.isEmpty() ){
					
					LdapContext context = ActiveDirectory.getConnection(username, password);
					
					if(context!=null){				
						
						//check registered user
						User labUser = userServiceImpl.checkUserByUserName(username);//check user is exist on user table
						if(labUser!=null){
							
							//HttpSession hpsession = request.getSession(true);	
							request.getSession().setAttribute("loginUser", labUser);
							request.getSession().setAttribute("loginUserName", username);
							int userTypeId = labUser.getUserTypeId();
							
							request.getSession().setAttribute("log_userType", userTypeId);//headoffice/uw,tab,branch
						
							redirectPage = "redirect:/token/getTokens";
							
						}else{
							loginMsg = "Please register if you are not registered with us. Otherwise check your username and password again.";
							
							redirectPage =  "home";
						}
						
					}//--else{}
					
				}else if(agentCode!= null && !agentCode.isEmpty()){//agent login
					try{
						//check registered user
						User tabUser = userServiceImpl.checkUserByUserName(agentCode);//check user is exist on user table
						if(tabUser!=null){						
							
							request.getSession().setAttribute("loginUser", tabUser);
							String tabUserName = tabUser.getUsername();
							request.getSession().setAttribute("loginUserName", tabUserName);
							int userTypeId = tabUser.getUserTypeId();
							
							request.getSession().setAttribute("log_userType", userTypeId);//headoffice/uw,tab,branch
						
							TabAgentImpl agentImpl = new TabAgentImpl();
							int agentId = agentImpl.checkAgent(agentCode);
							if(agentId != 0){
								
								redirectPage = "redirect:/token/getTokens";
								
							}
							else{
								loginMsg = "Please check your agent code and try again.";
								redirectPage =  "/home";
							}
						}else{
							loginMsg = "Please check your agent code and try again.";
							redirectPage =  "/home";
						}
						
					}catch(Exception e){
						e.printStackTrace();
						redirectPage =  "/home";
						
					}
				}else{
					
					redirectPage =  "home";
				}			
				
				
				
			}catch(NamingException ex){
			//redirectPage =  "loginPage";	
			//If without AD user
				
				try{
					
					System.out.println(">>>>>>>>>>>>>Labportal:........>>>>>>>>>>>>>>>>>>NoN AD User ");
					
					//password encryption
					SHAHashingImpl hasingImpl = new SHAHashingImpl();
					String hashedPassword = hasingImpl.hashingString(password);
					
					//check user
					User loginUser = userServiceImpl.checkNonADUser(username,hashedPassword);
					if(loginUser!=null){
						
						//check password reset
						Date today = new Date();
						int loginUserId = loginUser.getId();
						Date lastModifyDate = userServiceImpl.getLastModifyDate(loginUserId);//password modify date
						Boolean userFirstLogin = userServiceImpl.getFirstLoginStatus(loginUserId);
						System.out.println("-------------------------- 1st login : "+userFirstLogin);
						CheckPasswordExpirity checkPasswordExpirity = new CheckPasswordExpirity();
						
						
						
						if(lastModifyDate != null){
							long dateCount = checkPasswordExpirity.checkDate(today, lastModifyDate);
							System.out.println("dateCount: "+dateCount);
							
							//first login
							if(userFirstLogin == false){//reset passwd
								model.addAttribute("passwordChangeMsg","Please reset your password for the Login.");
								redirectPage = "/changePassword";
							}
							
							//dateCount >=30, change password alert and redirect to home page, can not login
							else if(dateCount >= 30){
								model.addAttribute("passwordChangeMsg","Your Password is expired.Please reset your password.");
								redirectPage = "/changePassword";
							}else{
								//normally login to system
								
								//get User Type
								int loginUserType = loginUser.getUserTypeId();
								
								//String loginUserType= loginUser.getUserType().getType();
								System.out.println("login user type: NON AD User: "+ loginUserType);
								request.getSession().setAttribute("loginUser", loginUser);
								request.getSession().setAttribute("loginUserName", username);
								request.getSession().setAttribute("log_userType", loginUserType);
								
								if(loginUserType == 6){ //lab
								
									redirectPage = "redirect:/dashbord/labDashboard";
									
								}else if(loginUserType == 5){//doctor
									
									redirectPage = "redirect:/dashbord/doctorDashboard";
									
								}else if(loginUserType == 8){//srp
									
									redirectPage = "redirect:/dashbord/SRPDashboard";
								}						
								
							}
						}
						
					}else{
							loginMsg = "You are not a Valid User. Please check your username and password.";
							model.addAttribute("loginMsg", loginMsg);
							redirectPage =  "home";
							
					}
					
				}catch(Exception e){
					redirectPage =  "home";
					e.printStackTrace();
				}		
				
			//System.out.println("bbbbbbbbbbb");
			//model.addAttribute("errorMsg1","Either Your Username or Password is Incorrect. Plese check again.");
			//redirectPage =  "home";
		}		
	
		
		}catch(Exception e){
			redirectPage =  "home";
			e.printStackTrace();
		}
		
		model.addAttribute("loginMsg", loginMsg);
		//return new ModelAndView(redirectPage);
		return new ModelAndView(redirectPage);
		
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response){
		
		try{
			
			//HttpSession session = request.getSession(false);			
			//request.getSession().setAttribute("loginUserName",null);
			request.getSession().removeAttribute("loginUserName");	
			request.getSession().removeAttribute("loginUser");	
			
			request.getSession().invalidate();
			return "/home";
			
		}catch(Exception e){e.printStackTrace();
			return "/error";
		}
		
		
		//return "redirect:/home";
	}
	

}
