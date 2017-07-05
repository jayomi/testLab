package com.allianz.labportal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.allianz.labportal.model.HeadTokenInfo;

@Controller
@RequestMapping("log")
public class LogController {

	
	@RequestMapping(value="/addLog",method=RequestMethod.POST)
	public ModelAndView addLog(Model model){
		
		try{
			
			
		}catch(Exception e){e.printStackTrace();}
		
		return new ModelAndView("/createTokens");
	}
	
	
}
