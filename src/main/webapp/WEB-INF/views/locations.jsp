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
													class="caption-subject font-blue-madison bold uppercase">Location/Division
													</span>
											</div>
											<ul class="nav nav-tabs">
												<li class="active"><a href="#tab_1_1" data-toggle="tab">Branch/Location/Division ( ${countBranch} )
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
																			Lab Portal Branch/Location/Division</span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	<div class="table-toolbar">
																		<div class="row">
																			<div class="col-md-6">
																				<div class="btn-group">
																					<button id="sample_editable_1_new"
																						class="addUserModalBtn btn sbold green" data-toggle="modal"
																						data-target="#addUserModal">
																						Add New <i class="fa fa-plus"></i>
																					</button>
																				</div>
																			</div>
																		</div>
																	</div>
																	<c:if test="${!empty branchList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_2"
																			>
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					<th>ID</th>
																					<th>Location/Division</th>																				
																					<th>Edit</th>
																					<th>Delete</th>
																				</tr>
																			</thead>
																			<tbody>
																				<c:forEach items="${branchList}" var="branch">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>
																						<td>${branch.id}</td>
																						<td>${branch.branchName}</td>
																						
																						
																						<td><a data-toggle="modal" data-target="#editBranchModal" id="editBranch" branchId="${branch.id}"
																							title="Edit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
																							
																							
																						<td><a
																							href="<c:url value='/location/deleteLocation/${branch.id}' />" title="Delete"><i class="fa fa-trash" style="color:red;" aria-hidden="true"></i></a></td>
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
												
												<!-- end branch user -->
												<!-- start tab agent -->
													
												<!-- end tab agent -->
												<!-- start lab user -->
													
												<!-- end lab user list -->
												
												<!-- start doctor list -->
												
												<!-- end doctor list -->
											
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


	<form:form class="form-horizontal" method="post" modelAttribute="branch"
			action="/AZHealthPortal/location/addLocation" id="addUserForm">
	<%-- <form:form class="form-horizontal" modelAttribute="registerUser" method="POST" action="/AZHealthPortal/register/addUser" id="form_sample_2"> --%>
			
			<div class="modal-dialog">
				<div class="modal-content panel-primary purple">
					<div class="modal-header panel-heading purple">
						<button id="" type="button" data-dismiss="modal"
							aria-hidden="true" class="close">×</button>
						<h4 id="myModalLabel" class="modal-title">
							New Location
							<%-- <input type="hidden" value="<%=request.getParameter("selected_formName")%>" name="formName"> --%>

						</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-lg-12">

								 <div class="form-group">
                                        <label class="control-label col-md-3">Location/Division:
                                           <span class="required">*</span></label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                     <i class="fa"></i>
                                                     <form:input path="branchName" type="text" class="form-control" name="name2" required="required" /></div>
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
			
	<div id="editBranchModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
		<form:form id="editBranchForm" class="form-horizontal" modelAttribute="editBranch" method="POST" action="/AZHealthPortal/user/updateUser" >
		<div class="modal-dialog">
			<div class="modal-content panel-primary">
				<div class="modal-header panel-heading">
					<button id="" type="button" data-dismiss="modal" aria-hidden="true"
						class="close">×</button>
					<h4 id="myModalLabel" class="modal-title">Edit Branch
					<%-- <input type="hidden" value="<%=request.getParameter("selected_formName")%>" name="formName"> --%>
					
					</h4>
				</div>
				<div class="modal-body">
					<div class="row">
					<div class="col-lg-12">
											
							<div class="col-lg-12">
								<form:input path="id" type="hidden" id="editModal_UserId" value=""></form:input>								
							</div>							
							<br><br>
							
                           
							<div class="form-group">
                              <label class="col-lg-2 control-label">Location/Division : </label>
                              <div class="col-lg-10">
                              
								 <form:input id="editModal_BranchName" type="text" placeholder="BranchName" path="branchName"
									class="form-control"></form:input>
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

 <!-- BEGIN SCRIPT -->
                <%-- <%@include file="scripts.jsp" %>  --%>
               <%@include file="template/template_script.jsp" %>  
                
       <!-- END SCRIPT -->

	<script type="text/javascript">
      
              	 
//$(document).ready(function(){ 
              	
              	$(document).on('click','.addUserModalBtn', function(){
              		
              		$("form").trigger("reset");
              		
              	});
              	         	 
              	 $(document).on('click', '#editBranch', function () {	
            		
              		$('#editBranchForm')[0].reset();
              		
              		var branchId = $(this).attr('branchId');
              		          		
              		
            			var query = "/AZHealthPortal/location/getEditBranch/"+ branchId;
            			
                         $.get(query,function(data,status){
                     
                          // var json = JSON.parse(data);
                          var json = JSON.stringify(data);                  
                         		
                        	   $('#editModal_BranchName').val(data.branchName);                        	 
                        	                    	 
                        
                       
                         });   
                 });
              	 
         
 
                

              </script>
</body>
</html>