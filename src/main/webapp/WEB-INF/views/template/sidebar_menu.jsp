<%@page import="com.allianz.labportal.model.User"%>
<% 
try{
	
	if(request.getSession().getAttribute("loginUser")!=null){
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		int userType = loginUser.getUserTypeId();
		
		System.out.println("sidebar menu: loginUser: "+loginUser);
		System.out.println("sidebar menu: userType: "+userType);
		
		
		if(userType == 1){%> <!-- head-office	 -->
			<%@ include file="sidebar_menu_Admin.jsp"%>
			
			
		<%}else if(userType == 3){%> <!-- branch	 -->
			<%@ include file="sidebar_menu_Branch.jsp"%>
			
		<%}else if(userType == 4){%><!--  tab -->
			<%@ include file="sidebar_menu_tab_agent.jsp"%>
		<%}else if(userType == 6){%> <!-- lab -->
			<%@ include file="sidebar_menu_Lab.jsp"%>
		<%}else if(userType == 5){%> <!-- doctor -->
			<%@ include file="sidebar_menu_Doctor.jsp"%>
		<%}else if(userType == 8){%> <!-- SRP -->
			<%@ include file="sidebar_menu_SRP.jsp"%>
		<%}
	}
	
	
	
	
	
}catch(Exception e){
	e.printStackTrace();
}

%>