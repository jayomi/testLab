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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMethodMappingNamingStrategy;

import com.allianz.labportal.model.Branch;
import com.allianz.labportal.model.Lab;
import com.allianz.labportal.model.User;
import com.allianz.labportal.service.BranchServiceImpl;
import com.allianz.labportal.service.LabServiceImpl;

@Controller
@RequestMapping("lab")
public class LabController { //

	@Autowired
	LabServiceImpl labServiceImpl;
	
	@Autowired
	BranchServiceImpl branchServiceImpl;
		
	@RequestMapping(value="/createLab",method=RequestMethod.GET)
	public String registerUser(Model model){
		model.addAttribute("addLab", new Lab());
		List<Branch> branchList = branchServiceImpl.getBranchList();
		model.addAttribute("branchList",branchList);
		return "/createLab";
		
	}
	
	@RequestMapping(value="addLab",method=RequestMethod.POST)
	public String addLab(@ModelAttribute("addLab")Lab lab,Model model){
		
		try{
			labServiceImpl.addLab(lab);
			List<Branch> branchList = branchServiceImpl.getBranchList();
			model.addAttribute("branchList",branchList);
			model.addAttribute("addLab", new Lab());
			
		}catch(Exception e){e.printStackTrace();}
		return "redirect:/lab/labManagement";
		
	}
	
	@RequestMapping(value="/labManagement",method=RequestMethod.GET)
	public String labManagement(@ModelAttribute("addLab")Lab lab, Model model){
		try{
			
			/*labCategory = 1 ----> Labs&Hospital
			 * labCategory = 2 -----> Doctor - labs
			 * 
			 *
			 * */
					
			/*List<Lab> labList = labServiceImpl.getLabList();//all labs			
			int labCount = labList.size();	// count of all labs
			*/
			
			List<Lab> labs_Hospital_List = labServiceImpl.getLabListByCategory(1);//labs& hospital
			List<Lab> doctor_list = labServiceImpl.getLabListByCategory(2);//doctos as lab
			
			model.addAttribute("labs_Hospital_List",labs_Hospital_List);//Asiri_labList
			model.addAttribute("doctor_list",doctor_list);//Hemas_labList
			
			model.addAttribute("labCount",labs_Hospital_List.size());//Asiri_labCount
			model.addAttribute("doctor_labCount",doctor_list.size());//Hemas_labCount
			
			
			model.addAttribute("editLab",new Lab());
			List<Branch> branchList = branchServiceImpl.getBranchList();
			model.addAttribute("branchList",branchList);
			
		}catch(Exception e){e.printStackTrace();}
		
		return "/viewLabs";
		
	}
	
	@RequestMapping(value="/updateLab",method=RequestMethod.POST)
	public String updateLab(@ModelAttribute("editLab")Lab editLab,Model model){//editLab
		
		try{			
			
			labServiceImpl.updateLab(editLab);
						
		}catch(Exception e){e.printStackTrace();}
		
		return "redirect:/lab/labManagement";
		
	}
	
	@RequestMapping(value = "/deleteLab/{id}", method = RequestMethod.GET)
	public String deleteCountry(@PathVariable("id") int id, Model model) {
		
		labServiceImpl.deleteLab(id);
		return "redirect:/lab/labManagement";

	}
	
	@RequestMapping(value="/getEditLab/{id}",method=RequestMethod.GET)
	public void getEditLab(@PathVariable("id") int id,HttpServletResponse response){
		
		try{
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			
			Lab lab = labServiceImpl.getLabById(id);
			JSONObject job = new JSONObject();
			job.put("id",lab.getId());
			
			job.put("labCategory", lab.getLabCategory());
			job.put("labName", lab.getLabName());
			job.put("district", lab.getDistrict());
			job.put("branch", lab.getBranch());
			job.put("division", lab.getDivision());
			job.put("address", lab.getAddress());
			job.put("email", lab.getEmail());
			job.put("contactNo", lab.getContactNo());
			job.put("contactNo2", lab.getContactNo2());
			job.put("contactNo3", lab.getContactNo3());
			job.put("fax", lab.getFax());
			
			out.write(job.toString());
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
}
