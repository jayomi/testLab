package com.allianz.labportal;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allianz.labportal.model.Branch;
import com.allianz.labportal.model.User;
import com.allianz.labportal.service.BranchServiceImpl;

@Controller
@RequestMapping("location")
public class LocationController {
	
	@Autowired
	BranchServiceImpl branchServiceImpl;
	
	@RequestMapping(value="/locationManagement",method=RequestMethod.GET)
	public String locationManagement(Model model){
		
		try{
			
			List<Branch> branchList = branchServiceImpl.getBranchList();
			model.addAttribute("branchList",branchList);
			model.addAttribute("countBranch", branchList.size());
			model.addAttribute("branch", new Branch());
			model.addAttribute("editBranch", new Branch());
			//editBranch
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/locations";
	}
	
	@RequestMapping(value="addLocation",method=RequestMethod.POST)
	public String addLocation(@ModelAttribute("branch") Branch branch){
		try{
			branchServiceImpl.addBranch(branch);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/location/locationManagement";		
	}
	
	@RequestMapping(value="deleteLocation/{id}",method=RequestMethod.GET)
	public String deleteLocation(@PathVariable("id") int id){
		
		try{
			branchServiceImpl.deleteBranch(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/location/locationManagement";	
		
	}
	
	@RequestMapping(value="/getEditBranch/{branchId}",method=RequestMethod.GET)
	public void getEditBranch(@PathVariable("branchId") int branchId, HttpServletResponse response){
		
		try{
			
			PrintWriter out = response.getWriter();
			Branch branch = branchServiceImpl.getBranchbyId(branchId);
			response.setContentType("application/json");
			JSONObject job = new JSONObject();
			
			//job.put("id",branch.getId());			
			job.put("branchName", branch.getBranchName());	
			out.write(job.toString());
			
		}catch(Exception e){e.printStackTrace();}
		
		
	}

}
