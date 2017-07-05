<%@page import="com.allianz.labportal.service.RegisterServiceImpl"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.allianz.labportal.model.UserType"%>
<%@page import="com.allianz.labportal.service.UserTypeServiceImpl"%>
<%@page import="com.allianz.labportal.service.UserServiceImpl"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
 <%@include file="template/template_style.jsp" %>
</head>
<!-- END HEAD -->

<body
	class="page-container-bg-solid page-header-fixed page-sidebar-closed-hide-logo page-md">

	<h2>Dashboard</h2>
	<!-- <a href="user/getUsers">Get Users</a><br> -->

	<%-- <a href="${pageContext.request.contextPath}/user/getUsers">Get Users</a> --%>

	<!-- BEGIN HEADER -->
	<div class="page-header navbar navbar-fixed-top">
		<!-- BEGIN HEADER INNER -->
		<div class="page-header-inner ">
		
			<!-- BEGIN LOGO -->
				<%@include file="template/logo.jsp" %>
			<!-- END LOGO -->
			
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<a href="javascript:;" class="menu-toggler responsive-toggler"
				data-toggle="collapse" data-target=".navbar-collapse"> </a>
			<!-- END RESPONSIVE MENU TOGGLER -->
		
			<!-- BEGIN PAGE TOP -->
			<div class="page-top">
				<!-- BEGIN HEADER SEARCH BOX -->
				<!-- DOC: Apply "search-form-expanded" right after the "search-form" class to have half expanded search box -->
				
				<!-- END HEADER SEARCH BOX -->
				<!-- BEGIN TOP NAVIGATION MENU -->
				<div class="top-menu">
					<ul class="nav navbar-nav pull-right">			
						
						<!-- BEGIN USER LOGIN DROPDOWN -->
						<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->

						<%@ include file="template/user_login.jsp"%>

						<!-- END USER LOGIN DROPDOWN -->
						
					</ul>
				</div>
				<!-- END TOP NAVIGATION MENU -->
			</div>
			<!-- END PAGE TOP -->
		</div>
		<!-- END HEADER INNER -->
	</div>
	<!-- END HEADER -->
	<!-- BEGIN HEADER & CONTENT DIVIDER -->
	<div class="clearfix"></div>
	<!-- END HEADER & CONTENT DIVIDER -->
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar-wrapper">
			<!-- BEGIN SIDEBAR -->
			<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
			<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
			<div class="page-sidebar navbar-collapse collapse">
				<!-- BEGIN SIDEBAR MENU -->
				<!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
				<!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
				<!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
				<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
				<!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
				<!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->


				<%@ include file="template/sidebar_menu.jsp"%>

				<!-- END SIDEBAR MENU -->
			</div>
			<!-- END SIDEBAR -->
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<!-- BEGIN CONTENT BODY -->
			<div class="page-content">
				<!-- BEGIN PAGE HEAD-->
				
				<!-- END PAGE HEAD-->
				
				<!-- BEGIN PAGE BASE CONTENT -->
				<div class="row">
					<div class="col-md-12">
						<!-- BEGIN PROFILE SIDEBAR -->

						<!-- END BEGIN PROFILE SIDEBAR -->
						<!-- BEGIN PROFILE CONTENT -->
						<div class="profile-content">
							<div class="row">
								<div class="col-md-12">
									<div class="portlet light bordered">
										<div class="portlet-title tabbable-line">
											<div class="caption caption-md">
												<i class="icon-globe theme-font hide"></i> <span
													class="caption-subject font-blue-madison bold uppercase">User's Personal
													Account</span>
											</div>
											<ul class="nav nav-tabs">
												<li class="active"><a href="#tab_1_1" data-toggle="tab">Doctors ( ${requestUserListCount_doctor} )
														</a></li>
												<li><a href="#tab_1_2" data-toggle="tab">Labs ( ${requestUserListCount_lab} )
														</a></li>
												<%-- <li><a href="#tab_1_3" data-toggle="tab">Tab Agents ( ${Count_TabAgent} )
														</a></li>
												<li><a href="#tab_1_4" data-toggle="tab">Lab Users ( ${Count_LabUser} )
														</a></li>
												<li><a href="#tab_1_5" data-toggle="tab">Doctors ( ${Count_doctorList} )
														</a></li>
												<li><a href="#tab_1_6" data-toggle="tab">SRP ( ${Count_srpList} )
														</a></li> --%>
														
											</ul>
										</div>
										<div class="portlet-body">
											<div class="tab-content">
												<!-- PERSONAL INFO TAB -->
												<!--start head office/admin -->
												<div class="tab-pane active" id="tab_1_1">
													<div class="row">
														<div class="col-md-12">
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			Lab Portal Users - Registered - Doctor</span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	<div class="table-toolbar">
																		<div class="row">
																			<div class="col-md-8">
																				<div class="btn-group">
																					
																					
																					
																				</div>
																			
																			</div>
																		</div>
																	</div>
																	<c:if test="${!empty requestUserList_doctor}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			>
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					<th>ID</th>
																					<th>Full name</th>
																					<th>DOB</th>
																					<th>Email</th>
																					<th>Status</th>
																				
																					
																					
																				</tr>
																			</thead>
																			<tbody>
																				<c:forEach items="${requestUserList_doctor}" var="user">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>
																						<td>${user.id}</td>
																						<td>${user.doctorName}</td>
																						<td>${user.dob}</td>
																						<td><a href="mailto:shuxer@gmail.com">
																								${user.doctorEmail} </a></td>
																						
																						<td><a class="acceptBtn" userId="${user.id}" userName="${user.doctorName}"
																							 title="Accept">Accept</a></td>
																					
																						</tr>
																				</c:forEach>
																			</tbody>
																		</table>
																	</c:if>
																</div>
															</div>
															<!-- END EXAMPLE TABLE PORTLET-->
														</div>
													</div>
												</div>
												<!-- end head office/admin -->
												
												<!-- start branch user  <div class="tab-pane" id="tab_1_2">-->
												
												<div class="tab-pane" id="tab_1_2">
													
													<div class="row">
														<div class="col-md-12">
															
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			Lab Portal - Users(${requestUserListCount_lab}) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	
																	<c:if test="${!empty requestUserList_lab}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			id="sample_2">
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					<th>ID</th>
																					<th>Full name</th>
																					<th>Address</th>
																					<th>Email</th>																					
																					<th>Telephone </th>
																					<th>Status</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																			<c:forEach items="${requestUserList_lab}" var="user">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>
																						<td>${user.id}</td>
																						<td>${user.labName}</td>
																						<td>${user.labAddress}</td>
																						<td><a href="mailto:shuxer@gmail.com">
																								${user.labEmail} </a></td>
																						
																						<td> ${user.labTelephone}</td>
																						<td><a class="acceptBtn" userId="${user.id}" userName="${user.labName}"
																							 title="Accept">Accept</a></td>
																							 
																					</tr>
																				</c:forEach>
																		
																		<% %>
																		
																			</tbody>
																		</table>
																	</c:if>
																</div>
															</div>
															
														</div>
													</div>
													
												</div>
												
												
												<!-- end branch user -->
												<!-- start tab agent -->
													<!-- <div class="tab-pane" id="tab_1_3">
													
													<div class="row">
														<div class="col-md-12">
														
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			Lab Portal - Tab Agents(${Count_TabAgent}) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	
																	<c:if test="${!empty TabAgentList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			id="sample_3">
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					<th>ID</th>
																					<th>Full name</th>
																					<th>Username</th>
																					<th>Email</th>																					
																					<th>Branch</th>
																					<th>Joined</th>																					
																					<th>Edit</th>
																					<th>Delete</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																			<c:forEach items="${TabAgentList}" var="user">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>
																						<td>${user.id}</td>
																						<td>${user.fullName}</td>
																						<td>${user.username}</td>
																						<td>${user.email}</td>																						
																						<td> ${user.branch}</td>
																						<td class="center">${user.createdDate}</td>
																						
																						<td><a data-toggle="modal" data-target="#editUserModal" id="editUser" userId="${user.id}"
																							 title="Edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
																							
																						<td><a class="deleteUserBtn" userId="${user.id}" userName="${user.fullName}"
																							 title="Delete"><i class="fa fa-trash" style="color:red;" aria-hidden="true"></i></a></td>
																					</tr>
																				</c:forEach>
																		
																		<% %>
																		
																			</tbody>
																		</table>
																	</c:if>
																</div>
															</div>
															
														</div>
													</div>
													
												</div> -->
												<!-- end tab agent -->
												
											
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- END PROFILE CONTENT -->
					</div>
				</div>
				<!-- END PAGE BASE CONTENT -->
			</div>
			<!-- END CONTENT BODY -->
		</div>
		<!-- END CONTENT -->
		<!-- BEGIN QUICK SIDEBAR -->
				<%-- <%@ include file="template/quick_sideBar.jsp" %> --%>
		<!-- END QUICK SIDEBAR -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="page-footer">
		    <%@include file="template/footer.jsp" %>  
		<div class="scroll-to-top">
			<i class="icon-arrow-up"></i>
		</div>
	</div>
	<!-- END FOOTER -->



 <!-- BEGIN SCRIPT -->
                <%-- <%@include file="scripts.jsp" %>  --%>
               <%@include file="template/template_script.jsp" %>  
                
       <!-- END SCRIPT -->

	<script type="text/javascript">
               
		$(document).on('click', '.acceptBtn', function() {        		
            		
              		var userId = $(this).attr("userId");
              		var userName = $(this).attr("userName");
              		            		
              		if (confirm('Are you sure you want to accept this ,'+userName+'?')) { 
              			
              		  $.ajax({
                        	type: 'POST',
                        	url:  "/AZHealthPortal/register/acceptUser/"+ userId, /*url:  "/AZHealthPortal/user/deleteUser/"+ userId,*/                        		                         	           	
                        	cache:false, 
                        	data: {"userId": userId},                        	
                        	success: function(data,status, exp){           		
                        		
                        		if(data == '1'){
                        			alert("Successfully accepted.");
                        			location.href = "/AZHealthPortal/register/getUsers";
                        		}else{
                        			alert("Try again.");
                        			location.href = "/AZHealthPortal/register/register";
                        		}               		
                        	},
                        	 error:function(data, status, exp){
                        		
                        		//alert(status);
                             }                        	
                        });               		  	
              		}            			
            	
            	  });
 
                

              </script>
</body>
</html>