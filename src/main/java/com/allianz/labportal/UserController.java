package com.allianz.labportal;


import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.allianz.labportal.main.SHAHashingImpl;
import com.allianz.labportal.model.Branch;
import com.allianz.labportal.model.Lab;
import com.allianz.labportal.model.RegisterUser;
import com.allianz.labportal.model.User;
import com.allianz.labportal.model.UserType;
import com.allianz.labportal.service.BranchServiceImpl;
import com.allianz.labportal.service.EmailSendingServiceImpl;
import com.allianz.labportal.service.LabServiceImpl;
import com.allianz.labportal.service.UserServiceImpl;
import com.allianz.labportal.service.UserTypeServiceImpl;

import ch.qos.logback.core.net.SyslogOutputStream;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserServiceImpl userServiceImpl;
	
	@Autowired
	LabServiceImpl labServiceImpl;
	
	@Autowired
	BranchServiceImpl branchServiceImpl;
	
	@Autowired
    UserTypeServiceImpl userTypeServiceImpl;

	// @RequestMapping(value="/user/getUsers",method = RequestMethod.GET)
	@RequestMapping(value = "/getUsers", method = RequestMethod.GET)
	public String getUserList(Model model) {
		/*
		//All user list
		List<User> listOfUsers = userServiceImpl.getUsersList();		
		model.addAttribute("user", new User());
		model.addAttribute("listOfUsers", listOfUsers);
		*/
		
		
		/*admin/head office UW users: user-type=1
		 * branch users: user-type=3
		 * tab users: user-type=4
		 * lab users: 6
		 * doctors: 5
		 * */
		try{
			List<User> headOfficeList = userServiceImpl.getUserListByUserType(1);
			List<User> BranchUserList = userServiceImpl.getUserListByUserType(3);
			List<User> TabAgentList = userServiceImpl.getUserListByUserType(4);
			List<User> LabUserList = userServiceImpl.getUserListByUserType(6);
			List<User> doctorList = userServiceImpl.getUserListByUserType(5);
			List<User> srpList = userServiceImpl.getUserListByUserType(8);
			
			model.addAttribute("user", new User());
			model.addAttribute("editUser",new User());
			model.addAttribute("resetPasswdUser",new User());
			
			model.addAttribute("headOfficeList", headOfficeList);
			model.addAttribute("BranchUserList", BranchUserList);
			model.addAttribute("TabAgentList", TabAgentList);
			model.addAttribute("LabUserList", LabUserList);
			model.addAttribute("doctorList", doctorList);
			model.addAttribute("srpList", srpList);
			
			
			model.addAttribute("Count_headOfficeUser", headOfficeList.size());
			model.addAttribute("Count_BranchUser", BranchUserList.size());
			model.addAttribute("Count_TabAgent", TabAgentList.size());
			model.addAttribute("Count_LabUser", LabUserList.size());
			model.addAttribute("Count_doctorList", doctorList.size());
			model.addAttribute("Count_srpList", srpList.size());
			
			//branch list
			List<Branch> branchList = branchServiceImpl.getBranchList();
			model.addAttribute("branchList",branchList);
			
			//get Lab List
			List<Lab> labList = labServiceImpl.getLabList();
			model.addAttribute("labList", labList);	
			
		}catch(Exception e){e.printStackTrace();}
		
		return "users";
	}

	@RequestMapping(value ="/updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("editUser") User editUser, Model model) {
		try{
			System.out.println("Update User: >>>>>>>>>"+editUser.getUsername());
			
			userServiceImpl.updateUser(editUser);
		}catch(Exception e){e.printStackTrace();}
		
		return "redirect:/user/getUsers";
	}

	
	@RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.POST)
	public void deleteCountry(@PathVariable("id") int id, Model model,HttpServletResponse response) {
		try{
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			model.addAttribute("user", new User());
			userServiceImpl.deleteUser(id);			
			out.write("1");
			
		}catch(Exception e){e.printStackTrace();}
		
	}

	
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user,Model model) {
		String addUserStatus =null;
		try{
			//check user exist - user name is Unique, cannot exist duplicate usernames
			String newUserName = user.getUsername();
			User checkUser = userServiceImpl.checkUserByUserName(newUserName);
			if(checkUser == null){//can add
				
				int userTypeId = user.getUserTypeId();
				if(userTypeId == 2 || userTypeId == 5 || userTypeId==6 || userTypeId==8){//want to hash passwd
					//password encryption
					SHAHashingImpl hasingImpl = new SHAHashingImpl();
					String hashedPassword = hasingImpl.hashingString(user.getPassword());
					user.setPassword(hashedPassword);
					user.setPasswordModifyDate(new Date());
				}
				
				if(userTypeId == 1){//head office user				
					user.setBranch("Head-Office");
				}if(userTypeId == 6){//lab user
					
					Lab userLab = labServiceImpl.getLabById(user.getLabId());
					user.setLabName(userLab.getLabName());
				}if(userTypeId == 8){//srp user
				
					user.setLabName("SRP");
				}
				
				user.setCreatedDate(new Date());
				
				userServiceImpl.addUser(user);
				addUserStatus = "Sucessfully added new user.";
				
			}else{//user alreay exist
				
				addUserStatus = "This User alreay exist. Please give a another userName.";
			}
			
			
			
		}catch(Exception e){e.printStackTrace();}
		return "redirect:/user/getUsers?addUserStatus="+addUserStatus;
	}
	
	@RequestMapping(value="/getEditUser/{userId}",method=RequestMethod.GET)
	public void getEditUser(@PathVariable("userId") int userId, HttpServletResponse response){
		
		try{
			
			PrintWriter out = response.getWriter();
			User user = userServiceImpl.getUserById(userId);
			response.setContentType("application/json");
			JSONObject job = new JSONObject();
			
			job.put("id",user.getId());			
			job.put("userName", user.getUsername());
			job.put("password", user.getPassword());			
			job.put("fullName", user.getFullName());
			job.put("email", user.getEmail());
			job.put("nic", user.getNic());
			job.put("contactNo", user.getContactNo());
			job.put("userTypeId", user.getUserTypeId());		
			job.put("branch", user.getBranch());
			job.put("labId",user.getLabId());
			job.put("userCreatedDate",user.getCreatedDate());
			job.put("passwordModifyDate",user.getPasswordModifyDate());
			job.put("first_login_status", user.isFirstLoginStatus());
			
			if(user.getLabId() !=null){//only lab user
				//lab categary
				int labCategory = labServiceImpl.getLabCategoryByLabId(user.getLabId());
				job.put("labCategory",labCategory);
				
			}
			
			
			out.write(job.toString());
			
		}catch(Exception e){e.printStackTrace();}
		
		
	}
	
	//get  reset password user	
	@RequestMapping(value="/passwordResetUser/{userId}",method=RequestMethod.GET)
	public void getPasswordResetUser(@PathVariable("userId") int userId, HttpServletResponse response){
		
		try{
			
			PrintWriter out = response.getWriter();
			User user = userServiceImpl.getUserById(userId);
			response.setContentType("application/json");
			JSONObject job = new JSONObject();
			
			//job.put("resetPaswdUser", user);
			job.put("id",user.getId());			
			//job.put("userName", user.getUsername());
			job.put("password", user.getPassword());		
			/*job.put("userCreatedDate",user.getCreatedDate());
			job.put("passwordModifyDate",user.getPasswordModifyDate());
			job.put("first_login_status", user.isFirstLoginStatus());	*/	
			
			out.write(job.toString());
			
		}catch(Exception e){e.printStackTrace();}
		
		
	}
	
	
	@RequestMapping(value="/passwordGenerator",method=RequestMethod.GET)
	public void passwordGenerator(HttpServletResponse response,HttpServletRequest request){
		
		 String userName="";
		 
		try{
			 final String CHAR_LIST = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";				 
			 final int RANDOM_STRING_LENGTH = 6;
			 Random randomGenerator = new Random();
					
			 char[] text = new char[RANDOM_STRING_LENGTH];
			    for (int i = 0; i < RANDOM_STRING_LENGTH; i++)
			    {
			        text[i] = CHAR_LIST.charAt(randomGenerator.nextInt(CHAR_LIST.length()));
			    }
			
			    userName = new String(text);			   
			    PrintWriter out = response.getWriter();
			    out.write(userName);
			    
			    //out.print(userName);
			
		}catch(Exception e){e.printStackTrace();}
		//return userName;
	}
	
	
	
	@RequestMapping(value="changePassword/{userId}",method=RequestMethod.POST)
	public void changePassword(@PathVariable("userId") int userId,HttpServletRequest request,HttpServletResponse response){
		
		String message = "";
		
		try{		
			 PrintWriter out = response.getWriter();
			 response.setContentType("text/html");
				User user = userServiceImpl.getUserById(userId);
				User loginUser = (User)request.getSession().getAttribute("loginUser"); 
				String currentPassword = loginUser.getPassword();//hashing value
				
				String userInput_CurrentPasswd = request.getParameter("currentPassword");
				System.out.println("userInput_CurrentPasswd: "+ userInput_CurrentPasswd);
				
				//hasing
				SHAHashingImpl hashingImple = new SHAHashingImpl();
				String hashed_userInput_CurrentPasswd = hashingImple.hashingString(userInput_CurrentPasswd);
				
				
				String userInput_newPasswd = request.getParameter("newPassword");
				
				//check current passwd is correct
				if(currentPassword.equals(hashed_userInput_CurrentPasswd)){
					//change passsword to new one
					//hashing new one
					String newPassword = hashingImple.hashingString(userInput_newPasswd);
					loginUser.setPassword(newPassword);
					loginUser.setPasswordModifyDate(new Date());
					userServiceImpl.updateUser(loginUser);
				
					/*message = "redirect:/login/";*/
					message ="1";// "Successfully Changed Password.";
				}else{
					
					/*message = "redirect:/dashbord/labDashboard";*/
					message="2";//"Incorrect current password. Try again.";
				}
				out.write(message);
				
						
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	
	//get changePassword page
	@RequestMapping(value="/changePassword",method=RequestMethod.GET)
	public ModelAndView getDashboardPage(Model model){	
		
		return new ModelAndView("/changePassword");
	}
	
	@RequestMapping(value="changeUserPassword",method=RequestMethod.POST)
	public ModelAndView changePassword(Model model,HttpServletRequest request,HttpServletResponse response){
		String redirectPage="";		
		
		try{		
			 
				String userName = request.getParameter("username");
				String currentPassword = request.getParameter("currentPassword");
				String newPassword = request.getParameter("newPassword");
				
				
				//password encryption
				SHAHashingImpl hasingImpl = new SHAHashingImpl();
				String hashedPassword = hasingImpl.hashingString(currentPassword);
				
				//check user
				User loginUser = userServiceImpl.checkNonADUser(userName,hashedPassword);
				if(loginUser!=null){
					
					//change passsword to new one
					//hashing new one
					String newHashPassword = hasingImpl.hashingString(newPassword);
					loginUser.setPassword(newHashPassword);
					loginUser.setPasswordModifyDate(new Date());
					loginUser.setFirstLoginStatus(true);
					userServiceImpl.updateUser(loginUser);
					model.addAttribute("passwordChangeMsg","Successfully changed password.");
					redirectPage = "home";
					
				}else{
					model.addAttribute("passwordChangeMsg","Your are entering incorrect values.Please try again.");
					//redirect to changePassword page					
					redirectPage = "/changePassword";
					
				}				
					
		}catch(Exception e){
			e.printStackTrace();
		}
		return new ModelAndView(redirectPage);
		
		
	}
	
	@Autowired
	EmailSendingServiceImpl emailSendingServiceImpl;
	
	//re-set Password
	@RequestMapping(value="resetPsWdUser",method=RequestMethod.POST)
	public String resetPassword(Model model,@ModelAttribute("resetPasswdUser") User user){
		try{
			
			int resetUserId = user.getId();
			String newPasswd = user.getPassword();			
			
			//password encryption/hashing
			SHAHashingImpl hasingImpl = new SHAHashingImpl();
			String hashedPassword = hasingImpl.hashingString(newPasswd);
		
			User reSetUser = userServiceImpl.getUserById(resetUserId);
			reSetUser.setPassword(hashedPassword);
			reSetUser.setCreatedDate(new Date());
			reSetUser.setPasswordModifyDate(new Date());
			reSetUser.setFirstLoginStatus(false);
			userServiceImpl.updateUser(reSetUser);
			
			//send email to user
			String emailAddress = reSetUser.getEmail();
			
			//EmailNotification - server			
			
			String fromAddress = "AZhealthportal@allianz.lk";//"labportal@allianz.lk"; 
	         String toAddress = emailAddress; //"gihanthanuja@gmail.com";
	         String subject = "Reset Password";       
	         String ccListArray[] = {"LifeUnderwriting@allianz.lk","lifeservicing@allianz.lk","lifeclaims@allianz.lk"};
	        // String cc = "lifeservicing@allianz.lk";
	         String bcc = "jayomir@allianz.lk";
				
			
	        //EmailNotification - local	 
			/*
			String fromAddress = "AZhealthportal@allianz.lk"; //"labportal@allianz.lk";
	         String toAddress ="jayomi.rajapaksha@gmail.com";// "gihanthanuja@gmail.com";
	         String subject = "Reset Password";		        
	         String ccListArray[] = {"jayomir@allianz.lk","jayomi.rajapaksha@gmail.com"};
	         String bcc = "jayomir@allianz.lk";
	         */
	         
	         String msgBody = "<div></div>"	        		 
		         		+"<div>Your password has been changed successfully.Your current password is : <b>"+newPasswd+"</b></div>"		         		
		         		+ "<hr><br/>"		         		
		         		+ "<div>Please login and change your password.</div>"		         		        		
		         		+ "</br>"      		
		         		+ "<div>Allianz Life Insurance Lanka Ltd.</div>"		         	
		         		+ "<div>This is a System generated request. Signature not required.</div>"; 	         
	            
			emailSendingServiceImpl.sendEmail(toAddress, fromAddress, subject, msgBody,ccListArray,bcc);
	        // emailSendingServiceImpl.sen
	      
	         
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/user/getUsers";
	}
	
	@RequestMapping(value="requestNewPassword",method=RequestMethod.POST)
	public ModelAndView requestNewPassword(HttpServletRequest request){
		
		try{
			
			String userName = request.getParameter("username");//username/email
			System.out.println("userName:****************** "+userName);
			//send email
			
			//EmailNotification - server			
			
			String fromAddress = "AZhealthportal@allianz.lk"; //"labportal@allianz.lk";
	         String toAddress ="LifeUnderwriting@allianz.lk";// "gihanthanuja@gmail.com";
	         String subject = "Requesting to Reset Password";		        
	         String ccListArray[] = {"lifeservicing@allianz.lk","lifeclaims@allianz.lk"};
	         String bcc = "jayomir@allianz.lk";
					
			
	        //EmailNotification - local	 
			
			/*String fromAddress = "AZhealthportal@allianz.lk"; //"labportal@allianz.lk";
	         String toAddress ="jayomir@allianz.lk";// "gihanthanuja@gmail.com";
	         String subject = "Requesting to Reset Password";		        
	         String ccListArray[] = {"jayomir@allianz.lk","jayomi.rajapaksha@gmail.com"};
	         String bcc = "jayomir@allianz.lk";
	         */
	         
	         String msgBody = "<div></div>"
	        		 
		         		+"<div>I am requesting to reset the password in AzHealth Partner Portal.</div>"
		         		+ "<br/>"
		         		+ "<div>Email/Username: <b><a href='mailto:"+userName+"'>"+userName+"</a></b></div>"
		         		
		         		+ "<br/>";
	         
			emailSendingServiceImpl.sendEmail(toAddress, fromAddress, subject, msgBody,ccListArray,bcc);
	        // emailSendingServiceImpl.sen
	      
		}catch(Exception e){
			e.printStackTrace();
		}
		return new ModelAndView("home");
	}
	

	@RequestMapping(value="/requestPasswordPage",method=RequestMethod.GET)
	public ModelAndView requestPasswordPage(Model model){
		
			return new ModelAndView("/requestPassword");
		
	}
	
}
