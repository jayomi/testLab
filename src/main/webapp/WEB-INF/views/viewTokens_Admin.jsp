
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
 <%@include file="template/template_style.jsp" %>
</head>
<!-- END HEAD -->

<body
	class="page-container-bg-solid page-header-fixed page-sidebar-closed-hide-logo page-md">

	<h2>Dashboard...........</h2>
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
						<li class="separator hide"></li>
						<!-- BEGIN NOTIFICATION DROPDOWN -->
						<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->


						<%--  <%@ include file="template/notification_dropdown.jsp" %>   --%>

						<!-- END NOTIFICATION DROPDOWN -->
						<li class="separator hide"></li>
						<!-- BEGIN INBOX DROPDOWN -->
						<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->

						<%--    <%@ include file="template/inbox_dropdown.jsp" %>   --%>

						<!-- END INBOX DROPDOWN -->
						<li class="separator hide"></li>
						<!-- BEGIN TODO DROPDOWN -->
						<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->

						<%--     <%@ include file="template/todo_dropdown.jsp" %> --%>


						<!-- END TODO DROPDOWN -->
						<!-- BEGIN USER LOGIN DROPDOWN -->
						<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->

						<%@ include file="template/user_login.jsp"%>

						<!-- END USER LOGIN DROPDOWN -->
						<!-- BEGIN QUICK SIDEBAR TOGGLER -->

						<!-- END QUICK SIDEBAR TOGGLER -->
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
			
			<div class="page-sidebar navbar-collapse collapse">
				

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
				<div class="page-head">
					<!-- BEGIN PAGE TITLE -->
				<!-- 	<div class="page-title">
						<h1>
							New Token Profile | Open Tokens <small></small>
						</h1>
					</div> -->
					<!-- END PAGE TITLE -->
				
				</div>
				<!-- END PAGE HEAD-->
				<!-- BEGIN PAGE BREADCRUMB -->
				
				<!-- END PAGE BREADCRUMB -->
				<!-- BEGIN PAGE BASE CONTENT -->
				<div class="row">
					<div class="col-md-12">
						
						<!-- BEGIN PROFILE CONTENT -->
						<div class="profile-content">
							<div class="row">
								<div class="col-md-12">
									<div class="portlet light bordered">
										<div class="portlet-title tabbable-line">
											<div class="caption caption-md">
												<i class="icon-globe theme-font hide"></i> <span
													class="caption-subject font-blue-madison bold uppercase">Profile
													Account</span>
											</div>
											<ul class="nav nav-tabs">
												<!-- <li class="active"><a href="#tab_1_1" data-toggle="tab">Opened</a></li> -->
												<li class="active"><a href="#tab_1_2" data-toggle="tab">Assigned To Lab<span style="color: #3f6df2;"><i class="fa fa-flask" aria-hidden="true"></i></span> ( ${Count_AssignedToLab} )</a></li>
												<li><a href="#tab_1_3" data-toggle="tab">Lab Reports<span style="color: #f261db;"><i class="fa fa-upload" aria-hidden="true"></i></span> ( ${Count_fromLab} )</a></li>
												<li><a href="#tab_1_4" data-toggle="tab">Assigned To Doctor<span style="color: #ecae1ae6;"><i class="fa fa-user-md" aria-hidden="true"></i></span> ( ${Count_AssignedToDoctor} )</a></li>
												<li><a href="#tab_1_5" data-toggle="tab">Doctor Reviews<span style="color: #2d9586;"><i class="fa fa-file-text" aria-hidden="true"></i></span> ( ${Count_fromDoctor} )</a></li>	
												<li><a href="#tab_1_6" data-toggle="tab">To SRP<span style="color: #2d9586;"><i class="fa fa-file-text" aria-hidden="true"></i></span> (  ${Count_toSRP} )</a></li>	
												<li><a href="#tab_1_7" data-toggle="tab">SRP Reviews<span style="color: #2d9586;"><i class="fa fa-file-text" aria-hidden="true"></i></span> (  ${Count_fromSRP} )</a></li>											
												<li><a href="#tab_1_8" data-toggle="tab">Closed ( ${Count_closed} )</a></li>
											</ul>
										</div>
										<div class="portlet-body">
											<div class="tab-content">
											
												<!-- PERSONAL INFO TAB -->
												<div class="tab-pane active" id="tab_1_2">


													<div class="row">
														<div class="col-md-12">
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			Lab Portal - Assinged to Lab Tokens(${Count_AssignedToLab})</span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	
																	<c:if test="${!empty toLab_tokenList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			id="sample_1">
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					<th>Token ID</th>
																					<th>Created Date</th>
																					<th>Created By</th>
																					<th>Branch</th>
																					<th>Customer</th>
																					<th>Proposal No</th>																																										
																					<th>Lab</th>
																					<th>Edit</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																				<c:forEach items="${toLab_tokenList}" var="token">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>																					
																						
																						<td>
																						<a	href="<c:url value='/token/getTokenInfo/${token.id}' />"><span
																							class="label label-sm label-success"><i class="fa fa-hand-o-right" aria-hidden="true"></i>
																							00${token.id}</span></a></td>																						
																						<td>${token.createdDate}</td>
																						<td>${token.createdBy}</td>
																						<td>${token.branch}</td>
																						<td>${token.customerName}</td>																						
																						<td><span class="proposalNocolumn">${token.proposalNo}</span></td>
																						<td>${token.labName}</td>
																						<td>
																						<a	href="<c:url value='/token/editToken/${token.id}' />" title="Edit"><span><i class="fa fa-pencil-square" aria-hidden="true"></i></span></a>
																						</td>	
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
												<!-- END PERSONAL INFO TAB -->
												<!-- CHANGE AVATAR TAB -->
												<div class="tab-pane" id="tab_1_3">
													
													<div class="row">
														<div class="col-md-12">
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			Lab Portal - Lab Reports(${Count_fromLab}) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	
																	<c:if test="${!empty fromLab_tokenList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			id="sample_2">
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					
																					<th>Token ID</th>
																					<th>Created Date</th>
																					<th>Created By</th>
																					<th>Branch</th>
																					<th>Customer</th>
																					<th>Proposal No</th>																																										
																					<th>Lab</th>																																									
																					<th>Token Status</th>
																					<th>Report Status</th>																					
																					
																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																				<c:forEach items="${fromLab_tokenList}" var="lab">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>																				
																						<td>${lab.id}</td>
																						<td>${lab.createdDate}</td>																		
																					
																						<td>${lab.createdBy}</td>
																						<td>${lab.branch}</td>
																						<td>${lab.customerName}</td>																						
																						<td>${lab.proposalNo}</td>
																						<td>${lab.labName}</td>																						
																						
																																											
																						<td><a href="<c:url value='/token/getLabAssignedTokenInfo/${lab.id}' />">
																						<span class="label label-sm label-success">${lab.tokenStatus} </span></a></td>
																						<td>
																							<c:if test="${lab.completeStatusLab ne 'compleate'}"><a href="<c:url value='/assignToLab/getViewReportPage/${lab.id}' />"><span class="label label-sm label-success">Pending reports </span></a></c:if>
																							<c:if test="${lab.completeStatusLab == 'compleate'}"><a href="<c:url value='/assignToLab/getViewReportPage/${lab.id}' />"><span class="label label-sm label-success">complete reports </span></a></c:if>
																						</td>																								
																						
																						
																						
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
												<!-- END CHANGE AVATAR TAB -->
												<!-- CHANGE PASSWORD TAB -->
												<div class="tab-pane" id="tab_1_4">
													
													<div class="row">
														<div class="col-md-12">
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			Doctor Portal - Assigned to Doctor Tokens(${Count_AssignedToDoctor} ) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	
																	<c:if test="${!empty toDoctor_tokenList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			id="sample_3"> <!-- id="sample_2" -->
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					
																					
																					<th>Token ID</th>
																					<th>Created Date</th>											
																					<th>Created By</th>
																					<th>Branch</th>
																					<th>Customer</th>
																					<th>Proposal No</th>																																										
																					<th>Lab</th>																																																						
																					<th>View Token</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																				<c:forEach items="${toDoctor_tokenList}" var="doctor">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>																					
																						
																						<td>${doctor.id}</td>																						
																						<td>${doctor.createdDate}</td>														
																						<td>${doctor.createdBy}</td>
																						<td>${doctor.branch}</td>
																						<td>${doctor.customerName}</td>																						
																						<td>${doctor.proposalNo}</td>
																						<td>${doctor.labName}</td>																			
																															
																						<td><a
																							href="<c:url value='/assignToDoctor/getLabReportsAdmin/${doctor.id}' />">View Reports</a></td>		
																						
																						
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
												<!-- END CHANGE PASSWORD TAB -->
												<!-- PRIVACY SETTINGS TAB -->
												<div class="tab-pane" id="tab_1_5">
																	
													<div class="row">
														<div class="col-md-12">
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			Doctor Portal - Doctor Reviews Tokens(${Count_fromDoctor} ) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
														
																	<c:if test="${!empty fromDoctor_tokenList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			> <!-- id="sample_2" -->
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					
																					<th>ID</th>																					
																					<th>Created Date</th>											
																					<th>Created By</th>
																					<th>Branch</th>
																					<th>Customer</th>
																					<th>Proposal No</th>																																										
																					<th>Lab</th>																																										
																																																													
																					<th>View Token</th>
																					
																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																				<c:forEach items="${fromDoctor_tokenList}" var="doctor">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>																				
																						
																																												
																						<td>${doctor.id}</td>																						
																						<td>${doctor.createdDate}</td>																													
																						<td>${doctor.createdBy}</td>
																						<td>${doctor.branch}</td>
																						<td>${doctor.customerName}</td>																						
																						<td>${doctor.proposalNo}</td>
																						<td>${doctor.labName}</td>	
																																				
																						<td><a
																							href="<c:url value='/assignToDoctor/getDoctorReportsAdmin/${doctor.id}' />">View Reports</a></td>		
																						
																						
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
												<!-- END PRIVACY SETTINGS TAB -->
												
												<!-- start tab 6 -->
												
												<div class="tab-pane" id="tab_1_6">
																	
													<div class="row">
														<div class="col-md-12">
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			SRP Portal - SRP Reviews Tokens(${Count_toSRP} ) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
														
																	<c:if test="${!empty toSRP_tokenList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			> <!-- id="sample_2" -->
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					
																					
																					<th>Token ID</th>
																					<th>Created Date</th>											
																					<th>Created By</th>
																					<th>Branch</th>
																					<th>Customer</th>
																					<th>Proposal No</th>																																										
																					<th>Lab</th>																																																						
																					<th>View Token</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																				<c:forEach items="${toSRP_tokenList}" var="doctor">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>																					
																						
																						<td>${doctor.id}</td>																						
																						<td>${doctor.createdDate}</td>														
																						<td>${doctor.createdBy}</td>
																						<td>${doctor.branch}</td>
																						<td>${doctor.customerName}</td>																						
																						<td>${doctor.proposalNo}</td>
																						<td>${doctor.labName}</td>																			
																															
																						<td>
																					 <a
																							href="<c:url value='/assigToSRP/getLabReportsAdmin/${doctor.id}' />">View Reports</a></td>
																							
																							
																						
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
												<!-- end tab 6 -->
												<!-- start tab 7 -->
													<div class="tab-pane" id="tab_1_7">
																	
													<div class="row">
														<div class="col-md-12">
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			 SRP Reviews Tokens(${Count_fromSRP} ) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
														
																	<c:if test="${!empty fromSRP_tokenList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			> <!-- id="sample_2" -->
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					
																					<th>ID</th>																					
																					<th>Created Date</th>											
																					<th>Created By</th>
																					<th>Branch</th>
																					<th>Customer</th>
																					<th>Proposal No</th>																																										
																					<th>Lab</th>																																										
																																																													
																					<th>View Token</th>
																					
																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																				<c:forEach items="${fromSRP_tokenList}" var="doctor">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>																				
																						
																																												
																						<td>${doctor.id}</td>																						
																						<td>${doctor.createdDate}</td>																													
																						<td>${doctor.createdBy}</td>
																						<td>${doctor.branch}</td>
																						<td>${doctor.customerName}</td>																						
																						<td>${doctor.proposalNo}</td>
																						<td>${doctor.labName}</td>	
																																				
																						<td><a
																							href="<c:url value='/assigToSRP/getSRPReportsAdmin/${doctor.id}' />">View Reports</a></td>		
																						
																						
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
												<!-- start tab 7 -->
												
												<!-- tab 8 -->
													
												<div class="tab-pane" id="tab_1_8">
																	
													<div class="row">
														<div class="col-md-12">
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			Lab Portal - Closed Tokens(${Count_closed} ) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
														
																	<c:if test="${!empty closed_tokenList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			> <!-- id="sample_2" -->
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					
																					<th>Token ID</th>																																			
																					<th>Created Date</th>											
																					<th>Created By</th>
																					<th>Branch</th>
																					<th>Customer</th>
																					<th>Proposal No</th>																																										
																					<th>Lab</th>																																						
																					<th>View Token</th>
																					
																					
																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																				<c:forEach items="${closed_tokenList}" var="token">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>																					
																						
																						<td>${token.id}</td>																						
																						<td>${token.createdDate}</td>
																						
																																																		
																						<td>${token.createdBy}</td>
																						<td>${token.branch}</td>
																						<td>${token.customerName}</td>																						
																						<td>${token.proposalNo}</td>
																						<td>${token.labName}</td>
																																				
																						<td><a
																							href="<c:url value='/token/getTokenInfo/${token.id}' />">View</a></td>		
																						
																						
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
											
												<!-- end tab 8 -->
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
              	$(function(){
              		console.log("start")
              		console.log($("#addTokenForm").serialize());
              		$("#addTokenForm").submit(function(){
              			console.log("Submit");
                  		$.ajax({
                  			url : "/AZHealthPortal/token/addToken",
                  			data : $("#addTokenForm").serialize(),
                  			type : "POST",
                  			success :function(data, status, exp){
                  				alert(status);
                  			},error :function(data, status, exp){
                  				alert(status);
                  			}
                  		});
              		});
              	});
              </script>
</body>
</html>