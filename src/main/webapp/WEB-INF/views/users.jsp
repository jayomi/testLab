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
												<li class="active"><a href="#tab_1_1" data-toggle="tab">Head Office ( ${Count_headOfficeUser} )
														</a></li>
												<li><a href="#tab_1_2" data-toggle="tab">Branches ( ${Count_BranchUser} )
														</a></li>
												<li><a href="#tab_1_3" data-toggle="tab">Tab Agents ( ${Count_TabAgent} )
														</a></li>
												<li><a href="#tab_1_4" data-toggle="tab">Lab Users ( ${Count_LabUser} )
														</a></li>
												<li><a href="#tab_1_5" data-toggle="tab">Doctors ( ${Count_doctorList} )
														</a></li>
												<li><a href="#tab_1_6" data-toggle="tab">SRP ( ${Count_srpList} )
														</a></li>
														
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
																			Lab Portal Users - Life UW/HeadOffice/Admin</span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	<div class="table-toolbar">
																		<div class="row">
																			<div class="col-md-8">
																				<div class="btn-group">
																					<button id="sample_editable_1_new"
																						class="addUserModalBtn btn sbold green" data-toggle="modal"
																						data-target="#addUserModal">
																						Add New <i class="fa fa-plus"></i>
																					</button>
																					
																					<a class="btn sbold green" style="margin-left: 15px;" href="${pageContext.request.contextPath}/register/getUsers">
																						Registered Users <i class="fa fa-plus"></i>
																					</a>
																					
																					<%if(request.getParameter("addUserStatus") != null){%>
																						<label style="color: red; padding-left: 10px;"><%=request.getParameter("addUserStatus")%></label>
																					<%} %>
																					
																				</div>
																			
																			</div>
																		</div>
																	</div>
																	<c:if test="${!empty headOfficeList}">
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
																					<th>Username</th>
																					<th>Email</th>
																					
																					<!--  <th> Points </th> -->
																					<th>Joined</th>
																					<th>Status</th>
																					<th>Edit</th>
																					<th>Delete</th>
																				</tr>
																			</thead>
																			<tbody>
																				<c:forEach items="${headOfficeList}" var="user">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>
																						<td>${user.id}</td>
																						<td>${user.fullName}</td>
																						<td>${user.username}</td>
																						<td><a href="mailto:${user.email}">
																								${user.email} </a></td>	
																						
																						<!--  <td> 120 </td> -->
																						<td class="center">${user.createdDate}</td>
																						<td><span
																							class="label label-sm label-success">
																								Approved </span></td> 
																						<td><a data-toggle="modal" data-target="#editUserModal" id="editUser" userId="${user.id}"
																							title="Edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
																							
																							
																						<td><a class="deleteUserBtn" userId="${user.id}" userName="${user.fullName}"
																							 title="Delete"><i class="fa fa-trash" style="color:red;" aria-hidden="true"></i></a></td>
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
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			Lab Portal - Branch Users(${Count_BranchUser}) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	
																	<c:if test="${!empty BranchUserList}">
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
																					<th>Username</th>
																					<th>Email</th>																					
																					<th>Branch </th>
																					<th>Joined</th>
																					
																					<th>Edit</th>
																					<th>Delete</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																			<c:forEach items="${BranchUserList}" var="user">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>
																						<td>${user.id}</td>
																						<td>${user.fullName}</td>
																						<td>${user.username}</td>
																						<td><a href="mailto:${user.email}">
																								${user.email} </a></td>	
																						
																						<td> ${user.branch}</td>
																						<td class="center">${user.createdDate}</td>
																						
																						<td><a data-toggle="modal" data-target="#editUserModal" id="editUser" userId="${user.id}"
																							 title="Edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
																							
																						<td><a
																							class="deleteUserBtn" userId="${user.id}" userName="${user.fullName}" title="Delete"><i class="fa fa-trash" style="color:red;" aria-hidden="true"></i></a></td>
																					</tr>
																				</c:forEach>
																		
																		<% %>
																		
																			</tbody>
																		</table>
																	</c:if>
																</div>
															</div>
															<!-- END EXAMPLE TABLE PORTLET-->
														</div>
													</div>
													
												</div>
												<!-- end branch user -->
												<!-- start tab agent -->
													<div class="tab-pane" id="tab_1_3">
													
													<div class="row">
														<div class="col-md-12">
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
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
																						<td><a href="mailto:${user.email}">
																								${user.email} </a></td>																							
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
															<!-- END EXAMPLE TABLE PORTLET-->
														</div>
													</div>
													
												</div>
												<!-- end tab agent -->
												<!-- start lab user -->
												<div class="tab-pane" id="tab_1_4">
													
													<div class="row">
														<div class="col-md-12">
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			Lab Portal -Lab Uses(${Count_LabUser}) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	
																	<c:if test="${!empty LabUserList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			id="sample_1">
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					<th>ID</th>
																					<th>Lab </th> 
																					<th>Address</th>
																					<th>Username/Email</th>
																					<!-- <th>Email</th>	 -->																				
																					<th>Joined</th>																				
																					<th>Edit</th>
																					<th>Reset<br/>Password</th>
																					<th>Delete</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																			<c:forEach items="${LabUserList}" var="user">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>
																						<td>${user.id}</td>
																						<td>${user.labName} </td>
																						<td>${user.fullName}</td>
																					<%-- 	<td>${user.username}</td> --%>
																						<td><a href="mailto:${user.email}">
																								${user.email} </a></td>																						
																						
																						<td class="center">${user.createdDate} </td>
																						
																						<td><a data-toggle="modal" data-target="#editUserModal" id="editUser" userId="${user.id}"
																							title="Edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
																						
																						<td><a data-toggle="modal" data-target="#ResetpasswdModal" id="ResetpasswdUser" userId="${user.id}"
																							title="Reset Password"><i class="fa fa-pencil-square" aria-hidden="true"></i></a></td>	
																							
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
															<!-- END EXAMPLE TABLE PORTLET-->
														</div>
													</div>
													
												</div>
												<!-- end lab user list -->
												
												<!-- start doctor list -->
												<div class="tab-pane" id="tab_1_5">
													
													<div class="row">
														<div class="col-md-12">
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			Lab Portal - Doctors(${Count_doctorList}) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	
																	<c:if test="${!empty doctorList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			id="sample_2">
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					<th>ID</th>
																					<th>Name</th>
																					<th>Address</th>
																					<!-- <th>Username</th> -->
																					<th>Username/Email</th>																					
																					<th>Edit</th>
																					<th>Reset<br/>Password</th>
																					<th>Delete</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																			<c:forEach items="${doctorList}" var="user">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>
																						<td>${user.id}</td>
																						<td>${user.labName}</td>
																						<td>${user.fullName}</td>
																						<%-- <td>${user.username}</td> --%>
																						<td><a href="mailto:${user.email}">
																								${user.email} </a></td>
																						
																						<%-- <td> ${user.branch}</td>
																						<td class="center">${user.createdDate}</td> --%>
																						
																						<td><a data-toggle="modal" data-target="#editUserModal" id="editUser" userId="${user.id}"
																							 title="Edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
																						
																						
																						<td><a data-toggle="modal" data-target="#ResetpasswdModal" id="ResetpasswdUser" userId="${user.id}"
																							title="Reset Password"><i class="fa fa-pencil-square" aria-hidden="true"></i></a></td>	
																								
																							
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
															<!-- END EXAMPLE TABLE PORTLET-->
														</div>
													</div>
													
												</div>
												<!-- end doctor list -->
												
												<!-- start srp list -->
												
												<div class="tab-pane" id="tab_1_6">
													
													<div class="row">
														<div class="col-md-12">
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			Lab Portal - SRPs (${Count_srpList}) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	
																	<c:if test="${!empty srpList}">
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
																					<th>Username/Email</th>
																				 	<!-- <th>Email</th> 	 -->																			
																					<th>Edit</th>
																					<th>Reset<br/>Password</th>
																					<th>Delete</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																			<c:forEach items="${srpList}" var="user">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>
																						<td>${user.id}</td>
																						<td>${user.fullName}</td>
																					<%-- 	<td>${user.username}</td> --%>
																						<td><a href="mailto:${user.email}">
																								${user.email} </a></td>
																						
																						<%-- <td> ${user.branch}</td>
																						<td class="center">${user.createdDate}</td> --%>
																						
																						<td><a data-toggle="modal" data-target="#editUserModal" id="editUser" userId="${user.id}"
																							 title="Edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
																						
																						<td><a data-toggle="modal" data-target="#ResetpasswdModal" id="ResetpasswdUser" userId="${user.id}"
																							title="Reset Password"><i class="fa fa-pencil-square" aria-hidden="true"></i></a></td>	
																							
																							
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
															<!-- END EXAMPLE TABLE PORTLET-->
														</div>
													</div>
													
												</div>
												
												<!-- end srp list -->
											
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

	<!-- start add user modal -->


	<div id="addUserModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		class="modal fade purple">


	<form:form class="form-horizontal" method="post" modelAttribute="user"
			action="/AZHealthPortal/user/addUser" id="addUserForm">
	<%-- <form:form class="form-horizontal" modelAttribute="registerUser" method="POST" action="/AZHealthPortal/register/addUser" id="form_sample_2"> --%>
			
			<div class="modal-dialog">
				<div class="modal-content panel-primary purple">
					<div class="modal-header panel-heading purple">
						<button id="" type="button" data-dismiss="modal"
							aria-hidden="true" class="close">×</button>
						<h4 id="myModalLabel" class="modal-title">
							New User Info
							<%-- <input type="hidden" value="<%=request.getParameter("selected_formName")%>" name="formName"> --%>

						</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-lg-12">

								<div class="form-group  margin-top-20">
                                     <label class="control-label col-md-3">Full Name
                                         <span class="required"> * </span>
                                     </label>
                                     <div class="col-md-4">
                                         <div class="input-icon right">
                                             <i class="fa"></i>
                                             <form:input path="fullName" type="text" class="form-control" name="name" required="required"/> </div>
                                     </div>
                                  </div>
                                    <div class="form-group">
                                           <label class="control-label col-md-3">Email
                                               <span class="required"> * </span>
                                           </label>
                                           <div class="col-md-4">
                                               <div class="input-icon right">
                                                   <i class="fa"></i>
                                                   <form:input path="email" type="text" class="form-control" name="email" required="required" /> </div>
                                        </div>
                                   	</div>
                                       <div class="form-group  margin-top-20">
                                                <label class="control-label col-md-3">NIC
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <form:input path="nic" type="text" class="form-control" name="name2" required="required" /> </div>
                                                </div>
                                      </div>
                                      
                                         <div class="form-group  margin-top-20">
                                                <label class="control-label col-md-3">Contact No                                                   
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <form:input path="contactNo" type="text" class="form-control" name="name2" required="required" /> </div>
                                                </div>
                                      </div>
                                      
                                         
                                             <div class="form-group">
                                                <label class="control-label col-md-3">User Type
                                                    <span class="required"> * </span>
                                                </label>
                                                
                                                    
                                                <div class="col-md-4">
                                                    <form:select id="userType" class="form-control select2me" name="options2"  path="userTypeId" required="required">
                                                    
                                                        <form:option value="">-Select-</form:option>                                                      
                                                        <form:option value="1">Head Office/UW</form:option>
                                                        <form:option value="3">Branch</form:option>
                                                        <form:option value="4">Tab Agent</form:option>
                                                        <form:option value="5">Doctor</form:option>
                                                        <form:option value="6">Lab</form:option>
                                                        <form:option value="8">SRP</form:option>
                                                       <%--  <form:option value="2">User</form:option> --%>
                                                       
                                                    </form:select>
                                                </div>
                                            </div>                                           
                                           
                                           
                                            <div class="form-group" id="selectBranchDiv" hidden="hidden">
                                                <label class="control-label col-md-3">Select Your Branch
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <form:select id="selectBranch" class="form-control select2me" name="options2"  path="branch">
                                                        <form:option value="">-Select-</form:option>
			                                            <c:forEach items="${branchList}" var="branch">	                 	
												        <form:option value="${branch.branchName}">${branch.branchName}</form:option>	                  
												        </c:forEach>			                                        
                                                    </form:select>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group" id="selectLab" hidden="hidden">
                                                <label class="control-label col-md-3">Select Lab
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                	<select id="labCategory" class="form-control">
                                             			<option>- Select -</option>
                                             			<option value="1">Hospital&Labs</option>
                                             			<option value="2">Doctor</option>
                                             			
                                             		</select>
                                                </div>
                                                
                                                <div class="col-md-4">
                                                    <form:select id="LabList" class="form-control select2me" name="options2" path="labId">
                                                        <form:option value="">-Select-</form:option>
			                                          	<c:forEach items="${labList}" var="lab">	
			                                           	<form:option value="${lab.id}">${lab.address}</form:option>									                       
												        </c:forEach>
			                                       
                                                    </form:select>
                                                </div>
                                            </div>
                                             
                                             <p class="hint"> Enter your account details below: </p>
                                             
                                             <div class="form-group  margin-top-20">
                                                <label class="control-label col-md-3">Username
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <form:input id="addUserName" path="username" type="text" class="form-control" name="name" required="required" /> </div>
                                                </div>
                                            </div>
                                             
                                              <div class="form-group  margin-top-20" id="password" hidden="hidden">
                                                <label class="control-label col-md-3">Password
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <form:input path="password" type="text" class="password1 form-control" name="password" />
                                                        <button type="button" class="passwdGenerator btn btn-default">Create Password</button>
                                                    </div>
                                                </div>
                                            </div> 
									
 									</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
						<button type="submit" class="btn btn-primary" value="Save changes"
							id="modal_saveFormBtn" name="modal_saveFormBtn">Save</button>
					</div>
				</div>
			</div>
		</form:form>
	</div>

	<!-- end add user modal -->
	
	<!-- edit user modal -->
			
	<div id="editUserModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
		<form:form id="editUserForm" class="form-horizontal" modelAttribute="editUser" method="POST" action="/AZHealthPortal/user/updateUser" >
		<div class="modal-dialog">
			<div class="modal-content panel-primary">
				<div class="modal-header panel-heading">
					<button id="" type="button" data-dismiss="modal" aria-hidden="true"
						class="close">×</button>
					<h4 id="myModalLabel" class="modal-title">Edit User
					<%-- <input type="hidden" value="<%=request.getParameter("selected_formName")%>" name="formName"> --%>
					
					</h4>
				</div>
				<div class="modal-body">
					<div class="row">
					<div class="col-lg-12">
											
							<div class="col-lg-12">
								<form:input path="id" type="hidden" id="editModal_UserId" value=""></form:input>
								<form:input path="firstLoginStatus" type="hidden" id="editModal_firstLoginStatus" value=""></form:input>								
							</div>							
							<br><br>
							<!-- 2017-02-20 09:57:15 -->
							<%-- <div class="form-group">
                              <label class="col-lg-2 control-label">Created Date : </label>
							  <div class="col-lg-10">
							<fmt:formatDate value="" pattern="yyyy-MM-dd" var="createdDate"/>
							<form:input path="createdDate" value="${vacancyDate}"/>
							 </div>
                           </div> --%>
                           
                           
							<div class="form-group">
                              <label class="col-lg-2 control-label">Full Name : </label>
                              <div class="col-lg-10">
                               <%--  <form:input id="modal_labName" type="text" placeholder="form name" path="labName"
									class="form-control"></form:input> --%>
								<form:input id="editModal_fullName" type="text" placeholder="fullName" path="fullName"
									class="form-control"></form:input>
                              </div>
                           </div>
                           
							<div class="form-group">
                              <label class="col-lg-2 control-label">User Name: </label>
                              <div class="col-lg-10">
                               <%--  <form:input id="modal_labName" type="text" placeholder="form name" path="labName"
									class="form-control"></form:input> --%>
								<form:input id="editModal_userName" type="text" placeholder="username" path="username"
									class="form-control"></form:input>
                              </div>
                           </div>
                           
                           <div class="form-group" hidden="hidden" id="edit_Passwd">
                              <label class="col-lg-2 control-label">Password: </label>
                              <div class="col-lg-10">
                               <%--  <form:input id="modal_labName" type="text" placeholder="form name" path="labName"
									class="form-control"></form:input> --%>
								<form:input id="editModal_password" type="password" placeholder="Password" path="password"
									class="password1 form-control"></form:input>
								<!-- password re-set button -->
								 <!-- <button type="button" class="passwdGenerator btn btn-default">Create new Password</button> -->	
								
                              </div>
                           </div>
                           
                           <div class="form-group">
                              <label class="col-lg-2 control-label">Email: </label>
                              <div class="col-lg-10">
                               <%--  <form:input id="modal_labName" type="text" placeholder="form name" path="labName"
									class="form-control"></form:input> --%>
								<form:input id="editModal_userEmail" type="text" placeholder="user Email" path="email"
									class="form-control"></form:input>
                              </div>
                           </div>
                           
                           <div class="form-group">
                              <label class="col-lg-2 control-label">NIC: </label>
                              <div class="col-lg-10">
                               <%--  <form:input id="modal_labName" type="text" placeholder="form name" path="labName"
									class="form-control"></form:input> --%>
								<form:input id="editModal_nic" type="text" placeholder="NIC" path="nic"
									class="form-control"></form:input>
                              </div>
                           </div>
                           
                           <div class="form-group">
                              <label class="col-lg-2 control-label">Contact No: </label>
                              <div class="col-lg-10">
                               <%--  <form:input id="modal_labName" type="text" placeholder="form name" path="labName"
									class="form-control"></form:input> --%>
								<form:input id="editModal_contactNo" type="text" placeholder="Contact No" path="contactNo"
									class="form-control"></form:input>
                              </div>
                           </div>
                           
                           
                           <div class="form-group">
                              <label class="control-label col-md-3">User Type
                                  
                              </label>
                                 <div class="col-md-4">
                                     <form:select id="editModal_userType" class="form-control select2me" name="options2" path="userTypeId">
                                         <form:option value="">-Select-</form:option>
                                         <form:option value="1">Head Office/UW</form:option>
                                         <form:option value="3">Branch</form:option>
                                         <form:option value="4">Tab Agent</form:option>
                                         <form:option value="5">Doctor</form:option>
                                         <form:option value="6">Lab</form:option>
                                         <form:option value="8">SRP</form:option>
                                       <%--   <form:option value="2">User</form:option> --%>                                        
                                     </form:select>
                                  </div>
                            </div>   
                              
                              <div class="form-group" id="editModal_selectBranch" hidden="hidden">
                                 <label class="control-label col-md-3">Select Your Branch
                                           <span class="required"> * </span>
                                 </label>
                                  <div class="col-md-4">
                                   <form:select id="editModal_BranchList" class="form-control select2me" name="options2"  path="branch">
                                     <form:option value="">-Select-</form:option>
                                     <c:forEach items="${branchList}" var="branch">	                 	
			       						 <form:option value="${branch.branchName}">${branch.branchName}</form:option>	                  
			        				</c:forEach>
                                   
                                  </form:select>
                                 </div>
                            </div>
                            
                            <div class="form-group" id="editModal_selectLab" hidden="hidden">
                                <label class="control-label col-md-3">Select Lab
                                    <span class="required"> * </span>
                                </label>
                                <div class="col-md-4">
                                	<form:select id="editModal_labCategory" class="form-control" path="labName">
                             			<form:option value="0">- Select -</form:option>
                             			<form:option value="Asiri Laboratory">Asiri Laboratory</form:option>
                             			<form:option value="Hemas Laboratory">Hemas Laboratory</form:option>
                             			<form:option value="Durden's Laboratory">Durden's Laboratory</form:option>
                             		</form:select>
                                </div>
                                       
                                <div class="col-md-4">
                                    <form:select id="editModal_LabList" class="form-control select2me" name="options2" path="labId">
                                        <form:option value="">-Select-</form:option>
			                             	<c:forEach items="${labList}" var="lab">	
			                              	<form:option value="${lab.id}">${lab.address}</form:option>									                       
						       				 </c:forEach>
                                 	</form:select>
                               </div>
                           </div>
                                            
                           
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
					<button type="submit" class="btn btn-primary" value="Save changes">Save changes</button>
				</div>
			</div>
		</div>
		</form:form>
	</div>
	
	<!-- end edit user modal -->
	
	<!-- start password reset modal -->
	
	<div id="ResetpasswdModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
		<form:form id="ResetpasswdUserForm" class="form-horizontal" modelAttribute="resetPasswdUser" method="POST" action="/AZHealthPortal/user/resetPsWdUser" >
		<div class="modal-dialog">
			<div class="modal-content panel-primary">
				<div class="modal-header panel-heading">
					<button id="" type="button" data-dismiss="modal" aria-hidden="true"
						class="close">×</button>
					<h4 id="myModalLabel" class="modal-title">Edit User
					
					
					</h4>
				</div>
				
				<div class="modal-body">
					<div class="row">
					<div class="col-lg-12">
											
							<div class="col-lg-12">
								<form:input path="id" type="hidden" id="resetPswd_UserId" value=""></form:input>
								<form:input path="firstLoginStatus" type="hidden" id="editModal_firstLoginStatus" value=""></form:input>								
							</div>							
							
                           <div class="form-group" id="edit_Passwd">
                              <label class="col-lg-2 control-label">Current Password: </label>
                              <div class="col-lg-10">
                              
								<form:input id="resetPasswdUser_password" type="password" placeholder="Password" path="password"
									class="password1 form-control"></form:input>
								<!-- password re-set button -->
								<br/>
								<br/>
								  <button type="button" class="passwdGenerator btn btn-default">Create new Password</button>	
								
                              </div>
                           </div>
                           
						</div>
					</div>
				</div>
              	 
              	 
				<div class="modal-footer">
					<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
					<button type="submit" class="btn btn-primary" value="Save changes">Reset Password</button>
				</div>
			</div>
		</div>
		</form:form>
	</div>
	
	<!-- end password reset modal -->

 <!-- BEGIN SCRIPT -->
                <%-- <%@include file="scripts.jsp" %>  --%>
               <%@include file="template/template_script.jsp" %>  
                
       <!-- END SCRIPT -->

	<script type="text/javascript">
              	/* $(function(){
              		console.log("start")
              		console.log($("#addUserForm").serialize());
              		$("#addUserForm").submit(function(){
              			console.log("Submit");
                  		$.ajax({
                  			url : "/AZHealthPortal/user/addUser",
                  			data : $("#addUserForm").serialize(),
                  			type : "POST",
                  			success :function(data, status, exp){
                  				alert(status);
                  			},error :function(data, status, exp){
                  				alert(status);
                  			}
                  		});
              		});
              	});
              	 */
              	 
//$(document).ready(function(){ 
				
              	$(document).on('click','.addUserModalBtn', function(){
              		
              		$("form").trigger("reset");
              		$("#selectBranchDiv").hide();
        			$("#password").hide();
        			$("#selectLab").hide();
              	});
              	
              	$(document).on('change', '#userType', function () {	
            		var option = $('#userType').find('option:selected').val();
            		
            		
            		if(option == "3"){//branch
            			
            			$("#selectBranchDiv").show();
            			$("#password").hide();
            			$("#selectLab").hide();
            			
            			$("#selectBranch").attr("required","required");
            			$(".password1").removeAttr("required");
            			$("#labCategory").removeAttr("required");
            			$("#LabList").removeAttr("required");
            			
            			
            			
            		}
            		else if(option == "4"){//tab agent
            			$("#password").hide();
            			//$(".password1").show();
            			$("#selectBranchDiv").show();
            			$("#selectLab").hide();            			
            			
            			$(".password1").removeAttr("required");
            			$("#selectBranch").attr("required","required");
            			$("#labCategory").removeAttr("required");
            			$("#LabList").removeAttr("required");
            			
            		}
            		else if(option == "1"){
            			$("#selectBranchDiv").hide();
            			$("#password").hide();
            			$("#selectLab").hide();
            			
            			$("#selectBranch").removeAttr("required");
            			$(".password1").removeAttr("required");
            			$("#labCategory").removeAttr("required");
            			$("#LabList").removeAttr("required");
            			
            		}
            		
            		else if(option == "5"){//doctor
            			$('#addUserName').val('');
            			$('.password1').val('');
            			$("#selectBranchDiv").hide();
            			$("#password").show();
            			$("#selectLab").hide();
            			
            			
            			$("#selectBranch").removeAttr("required");
            			$(".password1").attr("required","required");
            			$("#labCategory").removeAttr("required");
            			$("#LabList").removeAttr("required");
            			
            			
            		}
            		
            		else if(option == "6"){//lab
            			$('#addUserName').val('');
            			$('.password1').val('');
            			$("#selectBranchDiv").hide();
            			$("#password").show();
            			$("#selectLab").show();
            			
            			$("#selectBranch").removeAttr("required");
            			$(".password1").attr("required","required");
            			$("#labCategory").attr("required","required");
            			$("#LabList").attr("required","required");
            			
            			
            		}else if(option == "8"){//re-Insurer
            			$('#addUserName').val('');
           			 	$('.password1').val('');
	           			$("#selectBranchDiv").hide();
	           			$("#password").show();
	           			$("#selectLab").hide();
	           			
	           			$("#selectBranch").removeAttr("required");
	           			$(".password1").attr("required","required");
	           			$("#labCategory").removeAttr("required");
            			$("#LabList").removeAttr("required");
	           			
            		}else{
            			$('.password1').val('');
            			$('#addUserName').val('');
            			$("#selectBranchDiv").hide();
            			$("#password").hide();
            			$("#selectLab").hide();
            			
            			$("#selectBranch").removeAttr("required");
            			$(".password1").removeAttr("required");
            			$("#labCategory").removeAttr("required");
            			$("#LabList").removeAttr("required");
            			
            		}
            		
            	});
              	            	 
              	 $(document).on('click', '#editUser', function () {	
            		
              		$('#editUserForm')[0].reset();
              		
              		var userId = $(this).attr('userId');
              		//$('#editUserForm').trigger('reset');              		
              		
            			var query = "/AZHealthPortal/user/getEditUser/"+ userId;
            			
                         $.get(query,function(data,status){
                     
                          // var json = JSON.parse(data);
                          var json = JSON.stringify(data);
                         
                           var userTypeId = data.userTypeId;
                           
                           if(userTypeId == 5 || userTypeId == 6 || userTypeId == 8){//lab or doctor or reinsure
                        	   $("#edit_Passwd").show();
                        	   $('#editModal_password').val(data.password);
                        	   $('#editModal_selectLab').show();
                        	   $('#editModal_labCategory').val(data.labCategory);                        	   
                        	   $('#editModal_LabList').val(data.labId);
                        	   $('#editModal_selectBranch').hide();
                        	   $('#editModal_firstLoginStatus').val(data.first_login_status);
                        	   //first_login_status
                        	   
                           }      
                         
                          
 						if(userTypeId == 3){//branch
                        	   
                        	   $('#editModal_BranchList').val(data.branch);                        	  
                        	   $('#editModal_selectLab').hide();
                        	   $('#editModal_selectBranch').show();
                        	   $("#edit_Passwd").hide();
                           }
 						if(userTypeId == 1){//head office
 							 $('#editModal_selectBranch').hide();
 							 $('#editModal_selectLab').hide();
 							 $("#edit_Passwd").hide();
 						}
                         
                           $('#editModal_UserId').val(data.id);
                           $('#editModal_fullName').val(data.fullName);
                           $('#editModal_userName').val(data.userName);                          
                           $('#editModal_userEmail').val(data.email); 
                           $('#editModal_nic').val(data.nic);
                           $('#editModal_contactNo').val(data.contactNo);
                           $('#editModal_userType').val(data.userTypeId);
                         //  userCreatedDate
                        // $('fmt:formatDate').val(data.userCreatedDate);                       
                          
                         });   
                 });
              	 
              	
              	$(document).on('click','.passwdGenerator',function(){
              		
              		var query = "/AZHealthPortal/user/passwordGenerator";
              		$.get(query,function(data,status){
              			//var randomPasswd = data.userName;
              			alert('Please remember your new password for future loggin: '+data);
              			$('.password1').val(data);
              		});
              		
              	});
              	
                $(document).on('change', '#labCategory', function () {	
           			var option = $('#labCategory').find('option:selected').val();
           			
           			if(option == "1" || option=="2" || option=="3"){
           				           				
           				var query = "/AZHealthPortal/token/getLabListByCategory/"+ option;
                        $.get(query,function(data,status){
                           
                           
                          var $select = $('#LabList');
                          $select.empty();
                          $('#LabList').append(data);
                        
                        });     
           			}
                	
                });
                
				$(document).on('click', '.deleteUserBtn', function() {        		
            		
              		var userId = $(this).attr("userId");
              		var userName = $(this).attr("userName");
              		            		
              		if (confirm('Are you sure you want to delete user,'+userName+'?')) {              			
              			
              		
              			
              		  $.ajax({
                        	type: 'POST',
                        	url:  "/AZHealthPortal/user/deleteUser/"+ userId,	                         	           	
                        	cache:false, 
                        	data: {"userId": userId},                        	
                        	success: function(data,status, exp){           		
                        		
                        		if(data == '1'){
                        			alert("Successfully delete User.");
                        			location.href = "/AZHealthPortal/user/getUsers";
                        		}else{
                        			alert("Try again.");
                        			location.href = "/AZHealthPortal/user/getUsers";
                        		}               		
                        	},
                        	 error:function(data, status, exp){
                        		
                        		//alert(status);
                             }
                        	
                        }); 
              		  	
              		}
            			
            	
            	  });
				
				//password reset
				$(document).on('click', '#ResetpasswdUser', function () {	
            		
					
              		$('#ResetpasswdUserForm')[0].reset();
              		
              		var userId = $(this).attr('userId');
              		         		
              			var query = "/AZHealthPortal/user/passwordResetUser/"+ userId;
            			//var query = "/AZHealthPortal/user/getEditUser/"+ userId;
            			
                         $.get(query,function(data,status){                     
                        
                          var json = JSON.stringify(data);                 
                           
                           //lab or doctor or reinsure
                        	  $('#resetPswd_UserId').val(userId);
                        	   $('#resetPasswdUser_password').val(data.password);                	                     	   
                        	   $('#editModal_firstLoginStatus').val(data.first_login_status);
                        	   //first_login_status
                        	   
                               
                         
                         });   
                 });
 
                
//});//end document.ready
              </script>
</body>
</html>