package com.allianz.labportal;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.allianz.labportal.model.Register;
import com.allianz.labportal.service.RegisterServiceImpl;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	RegisterServiceImpl registerServiceImpl;
	
	@RequestMapping(value="/getRegisterPage",method=RequestMethod.GET)
	public ModelAndView getRegisterPage(Model model){
		
		model.addAttribute("RegisterUserRequest", new Register());
		return new ModelAndView("register");
	}
	
	@RequestMapping(value="/requestUser",method=RequestMethod.POST)
	public String requestUser(@ModelAttribute("RegisterUserRequest") Register requestUser,Model model){
			
		try{
			System.out.println("********************Register User");
			//System.out.println("********************Register User"+requestUser.getName()+requestUser.getEmail());
			Date currentDate = new Date();
			requestUser.setDate(currentDate);
			requestUser.setAccessType((byte) 0);
			registerServiceImpl.addUser(requestUser);
			
			
			
		}catch(Exception e){e.printStackTrace();}
		return "redirect:/register/getRegisterPage";
	}
	
	@RequestMapping(value="getUsers", method=RequestMethod.GET)
	public String getUsers(Model model){
		try{
			
			List<Register> lab_requestList = registerServiceImpl.getRequestUserList((byte)0,"medicalUser");
			List<Register> doctor_requestList = registerServiceImpl.getRequestUserList((byte)0,"doctor");
			model.addAttribute("requestUserList_lab", lab_requestList);
			model.addAttribute("requestUserListCount_lab", lab_requestList.size());
			model.addAttribute("requestUserList_doctor", doctor_requestList);
			model.addAttribute("requestUserListCount_doctor", doctor_requestList.size());
			
			
			
		}catch(Exception e){e.printStackTrace();}
		return "RegisteringUsers";
	}
	
	@RequestMapping(value="/acceptUser/{id}",method=RequestMethod.POST)
	public void deleteUser(@PathVariable("id") int id,Model model,HttpServletResponse response){
		
		try{
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			//model.addAttribute("",)
			registerServiceImpl.acceptUser(id);
			out.write("1");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}

}
