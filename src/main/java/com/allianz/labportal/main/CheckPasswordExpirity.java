package com.allianz.labportal.main;

import java.util.Date;
import java.util.concurrent.TimeUnit;



public class CheckPasswordExpirity {
	
	public long checkDate(Date today, Date lastModifyDate){
		long difference_days = 0;
		try{
			
			long diff = today.getTime() - lastModifyDate.getTime();
			difference_days = TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
			
			
		}catch(Exception e){
			e.printStackTrace();			
		}
		return difference_days;
		   
	}

}
