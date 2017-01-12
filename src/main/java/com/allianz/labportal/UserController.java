package com.allianz.labportal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allianz.labportal.model.User;

import com.allianz.labportal.service.UserServiceImpl;


@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired	
	UserServiceImpl userServiceImpl;
	
	//@RequestMapping(value="/user/getUsers",method = RequestMethod.GET)
	@RequestMapping(value="/getUsers",method = RequestMethod.GET)
	public String getUserList(Model model){
		List<User> listOfUsers = userServiceImpl.getUsersList();
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+listOfUsers.size());
		model.addAttribute("user", new User());
		model.addAttribute("listOfUsers", listOfUsers);
				
		return "users";
	}
	
	@RequestMapping(value = "/updateUser/{id}", method = RequestMethod.GET)
	public String updateUser(@PathVariable("id") int id,User user) {	
		
		userServiceImpl.updateUser(user);		
		return "redirect:/users";
	}


	//@RequestMapping(value = "/user/deleteUser/{id}", method = RequestMethod.GET)
	@RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.GET)
	public String deleteCountry(@PathVariable("id") int id , Model model) {
		model.addAttribute("user",new User());
		userServiceImpl.deleteUser(id);
		return "users";	

	}
	
	//@RequestMapping(value="/user/addUser",method= RequestMethod.POST)
	@RequestMapping(value="/addUser",method= RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user){
		System.out.println("?????????????"+user.getUserId());
		if(user.getUserId() == null){
			userServiceImpl.addUser(user);
		}
		
		return "users";
	}
	
}
