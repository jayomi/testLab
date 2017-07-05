   <%@page import="com.allianz.labportal.model.User"%>

<%
   		try{
   			
   			String loginUserName = request.getSession().getAttribute("loginUserName").toString();
   			User loginUser = (User)request.getSession().getAttribute("loginUser");
   			
   			int userTypeId = loginUser.getUserTypeId();
   			if(userTypeId == 6){ //lab 
   		%>
   				<li class="nav-item start ">
                           <!--  <a href="javascript:;" class="nav-link nav-toggle"> -->
                           <a href="${pageContext.request.contextPath}/dashbord/labDashboard" class="nav-link nav-toggle">
                                <i class="icon-home"></i>
                                <span class="title">Dashboard</span>
                                <span class="arrow"></span>
                           </a>
                           
               </li>
                        
   			<% }if(userTypeId == 5){//doctor%>
   				<li class="nav-item start ">
               
                <a href="${pageContext.request.contextPath}/dashbord/doctorDashboard" class="nav-link nav-toggle">
                     <i class="icon-home"></i>
                     <span class="title">Dashboard</span>
                     <span class="arrow"></span>
                </a>
                
   			 </li>
   			<% }if(userTypeId == 8){//srp %>
   					<li class="nav-item start ">
               
                <a href="${pageContext.request.contextPath}/dashbord/SRPDashboard" class="nav-link nav-toggle">
                     <i class="icon-home"></i>
                     <span class="title">Dashboard</span>
                     <span class="arrow"></span>
                </a>
                
   			 </li>
   			<% }
   	%>
   	                           
   <li class="dropdown dropdown-user dropdown-dark">
    							
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <span class="username username-hide-on-mobile"> <%=loginUserName%> </span>
                                    <!-- DOC: Do not remove below empty space(&nbsp;) as its purposely used -->
                                    <img alt="" class="img-circle"/> </a>
                                  
                                <ul class="dropdown-menu dropdown-menu-default">
                               
                               <% if(userTypeId == 6 || userTypeId == 5 || userTypeId == 8){ %>
                               		 <li>
                                       <!--  <a data-toggle="modal" data-target="#changePasswordModal"> /labportal/login/logout
                                           <i class="fa fa-repeat" aria-hidden="true"></i>Change Password</a> -->
                                         <a href="${pageContext.request.contextPath}/user/changePassword"> <!-- /labportal/login/logout -->
                                           <i class="fa fa-repeat" aria-hidden="true"></i>Change Password</a>                                           
                                    </li>
                                  <%} %>  
                                    <li>
                                        <a href="${pageContext.request.contextPath}/login/logout"> <!-- /labportal/login/logout -->
                                            <i class="icon-key"></i> Log Out </a>
                                    </li>
                                </ul>
                            
                           
                        </li>
                         
       <%		
   		}catch(Exception e){e.printStackTrace();}
   %>