
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
			<!-- BEGIN PAGE ACTIONS -->
			<!-- DOC: Remove "hide" class to enable the page header actions -->


			<%-- <%@ include file="template/page_action.jsp"%> --%>

			<!-- END PAGE ACTIONS -->
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
					<div class="page-title">
						<h1>
							New Token Profile | Open Tokens <small></small>
						</h1>
					</div>
					<!-- END PAGE TITLE -->
				
				</div>
				<!-- END PAGE HEAD-->
				<!-- BEGIN PAGE BREADCRUMB -->
				<ul class="page-breadcrumb breadcrumb">
					<li><a href="index.html">Home</a> <i class="fa fa-circle"></i>
					</li>
					<li><span class="active">Tokens</span></li>
				</ul>
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
												<li class="active"><a href="#tab_1_1" data-toggle="tab">Open</a></li>
												<li><a href="#tab_1_2" data-toggle="tab">Assign To Lab</a></li>
												<li><a href="#tab_1_3" data-toggle="tab">Assign To Doctor</a></li>
												<li><a href="#tab_1_4" data-toggle="tab">Closed</a></li>
											</ul>
										</div>
										<div class="portlet-body">
											<div class="tab-content">
												<!-- PERSONAL INFO TAB -->
												<div class="tab-pane active" id="tab_1_1">


													<div class="row">
														<div class="col-md-12">
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			Lab Portal - Open Tokens(${openTokens})</span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	<div class="table-toolbar">
																		<div class="row">
																			<div class="col-md-6">
																				<div class="btn-group">
																					<!-- <button id="sample_editable_1_new"
																						class="btn sbold green" data-toggle="modal"
																						data-target="#addUserModal">
																						Add New <i class="fa fa-plus"></i>
																					</button> -->


																				</div>
																			</div>
																			<div class="col-md-6">
																				<div class="btn-group pull-right">
																					<button
																						class="btn green  btn-outline dropdown-toggle"
																						data-toggle="dropdown">
																						Tools <i class="fa fa-angle-down"></i>
																					</button>
																					<ul class="dropdown-menu pull-right">
																						<li><a href="javascript:;"> <i
																								class="fa fa-print"></i> Print
																						</a></li>
																						<li><a href="javascript:;"> <i
																								class="fa fa-file-pdf-o"></i> Save as PDF
																						</a></li>
																						<li><a href="javascript:;"> <i
																								class="fa fa-file-excel-o"></i> Export to Excel
																						</a></li>
																					</ul>
																				</div>
																			</div>
																		</div>
																	</div>
																	<c:if test="${!empty tokenList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			id="sample_1">
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					<th>ID</th>
																					<th>Date</th>
																					<th>Token Category</th>
																					<th>From</th>
																					<th>Priority</th>
																					<th>Assign To</th>
																					<th>Branch</th>
																					<th>Division</th>
																					<th>Status</th>
																					<th>View</th>
																					<!-- <th>Edit</th>
																					<th>Delete</th> -->


																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																				<c:forEach items="${tokenList}" var="token">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>																					
																						
																						<td>${token.id}</td>
																						<td>2017-01-23</td>
																						<td>${token.tokenCategory}</td>
																						<td>${token.userFullName}</td>
																						<td>${token.priority}</td>
																						<td>${token.assignTo}</td>
																						<td>${token.branch}</td>
																						<td>${token.division}</td>
																						
																						<%-- <td><a href="mailto:shuxer@gmail.com">
																								${token.userEmail} </a></td> --%>
																						
																						
																						
																						<td><span
																							class="label label-sm label-success">
																								Assigned To Lab</span></td>
																								
																								<td><a
																							href="<c:url value='/token/getTokenInfo/${token.id}' />">View</a></td>
																								
																						<%-- <td><a
																							href="<c:url value='token/updateUser/${token.id}' />">Edit</a></td>
																						<td><a
																							href="<c:url value='/token/deleteUser/${token.id}' />">Delete</a></td> --%>
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
												<div class="tab-pane" id="tab_1_2">
													
													<div class="row">
														<div class="col-md-12">
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			Lab Portal - Assign to Lab Tokens(${Count_AssignedToLab}) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	<div class="table-toolbar">
																		<div class="row">
																			<div class="col-md-6">
																				<div class="btn-group">
																					<!-- <button id="sample_editable_1_new"
																						class="btn sbold green" data-toggle="modal"
																						data-target="#addUserModal">
																						Add New <i class="fa fa-plus"></i>
																					</button> -->


																				</div>
																			</div>
																			<div class="col-md-6">
																				<div class="btn-group pull-right">
																					<button
																						class="btn green  btn-outline dropdown-toggle"
																						data-toggle="dropdown">
																						Tools <i class="fa fa-angle-down"></i>
																					</button>
																					<ul class="dropdown-menu pull-right">
																						<li><a href="javascript:;"> <i
																								class="fa fa-print"></i> Print
																						</a></li>
																						<li><a href="javascript:;"> <i
																								class="fa fa-file-pdf-o"></i> Save as PDF
																						</a></li>
																						<li><a href="javascript:;"> <i
																								class="fa fa-file-excel-o"></i> Export to Excel
																						</a></li>
																					</ul>
																				</div>
																			</div>
																		</div>
																	</div>
																	<c:if test="${!empty labTokenList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			id="sample_3">
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					
																					<th>Token ID</th>
																					<th>Lab</th>																				
																					<th>Token Status</th>
																					<th>Report Status</th>																					
																					<th>View Token</th>
																					<th>View Reports</th>
																					<!-- <th>Edit</th>
																					<th>Delete</th> -->


																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																				<c:forEach items="${labTokenList}" var="lab">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>																				
																						
																						<td>${lab.id}</td>																						
																						<td>${lab.labName}</td>																						
																						<td><span class="label label-sm label-success">${lab.tokenStatus} </span></td>
																						<td>
																							<c:if test="${lab.completeStatusLab ne 'compleate'}"><span class="label label-sm label-success">Pending reports </span></c:if>
																							<c:if test="${lab.completeStatusLab == 'compleate'}"><span class="label label-sm label-success">complete reports </span></c:if>
																						</td>																								
																						<td><a
																							href="<c:url value='/token/getLabAssignedTokenInfo/${lab.id}' />">View</a></td>
																						<td><a
																							href="<c:url value='/assignToLab/getViewReportPage/${lab.id}' />">Reports</a></td>		
																						
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
												<div class="tab-pane" id="tab_1_3">
													
													<div class="row">
														<div class="col-md-12">
															<!-- BEGIN EXAMPLE TABLE PORTLET-->
															<div class="portlet light bordered">
																<div class="portlet-title">
																	<div class="caption font-dark">
																		<i class="icon-settings font-dark"></i> <span
																			class="caption-subject bold uppercase">
																			Doctor Portal - Assign to Doctor Tokens(${Count_AssignedToDoctor} ) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	<div class="table-toolbar">
																		<div class="row">
																			<div class="col-md-6">
																				<div class="btn-group">
																					<!-- <button id="sample_editable_1_new"
																						class="btn sbold green" data-toggle="modal"
																						data-target="#addUserModal">
																						Add New <i class="fa fa-plus"></i>
																					</button> -->


																				</div>
																			</div>
																			<div class="col-md-6">
																				<div class="btn-group pull-right">
																					<button
																						class="btn green  btn-outline dropdown-toggle"
																						data-toggle="dropdown">
																						Tools <i class="fa fa-angle-down"></i>
																					</button>
																					<ul class="dropdown-menu pull-right">
																						<li><a href="javascript:;"> <i
																								class="fa fa-print"></i> Print
																						</a></li>
																						<li><a href="javascript:;"> <i
																								class="fa fa-file-pdf-o"></i> Save as PDF
																						</a></li>
																						<li><a href="javascript:;"> <i
																								class="fa fa-file-excel-o"></i> Export to Excel
																						</a></li>
																					</ul>
																				</div>
																			</div>
																		</div>
																	</div>
																	<c:if test="${!empty doctorTokenList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			id="sample_2">
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					
																					<th>Token ID</th>
																					<th>Doctor</th>																				
																					<th>Report Status</th>																																										
																					<th>View Token</th>
																					
																					<!-- <th>Edit</th>
																					<th>Delete</th> -->


																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																				<c:forEach items="${doctorTokenList}" var="doctor">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>																					
																						
																						<td>${doctor.id}</td>																						
																						<td>${doctor.doctorName}</td>																						
																						
																						<%-- <td><a href="mailto:shuxer@gmail.com">
																								${token.userEmail} </a></td> --%>																				
																						
																						
																						<td><span
																							class="label label-sm label-success">
																								Assigned </span></td>																
																						<td><a
																							href="<c:url value='/assignToDoctor/getViewReportPage/${doctor.id}' />">View Reports</a></td>		
																						
																						
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
												<div class="tab-pane" id="tab_1_4">
													<form action="#">
														<table class="table table-light table-hover">
															<tr>
																<td>Anim pariatur cliche reprehenderit, enim
																	eiusmod high life accusamus..</td>
																<td><label class="uniform-inline"> <input
																		type="radio" name="optionsRadios1" value="option1" />
																		Yes
																</label> <label class="uniform-inline"> <input
																		type="radio" name="optionsRadios1" value="option2"
																		checked /> No
																</label></td>
															</tr>
															<tr>
																<td>Enim eiusmod high life accusamus terry
																	richardson ad squid wolf moon</td>
																<td><label class="uniform-inline"> <input
																		type="checkbox" value="" /> Yes
																</label></td>
															</tr>
															<tr>
																<td>Enim eiusmod high life accusamus terry
																	richardson ad squid wolf moon</td>
																<td><label class="uniform-inline"> <input
																		type="checkbox" value="" /> Yes
																</label></td>
															</tr>
															<tr>
																<td>Enim eiusmod high life accusamus terry
																	richardson ad squid wolf moon</td>
																<td><label class="uniform-inline"> <input
																		type="checkbox" value="" /> Yes
																</label></td>
															</tr>
														</table>
														<!--end profile-settings-->
														<div class="margin-top-10">
															<a href="javascript:;" class="btn red"> Save Changes
															</a> <a href="javascript:;" class="btn default"> Cancel </a>
														</div>
													</form>
												</div>
												<!-- END PRIVACY SETTINGS TAB -->
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
		<div class="page-footer-inner">
			2014 &copy; Metronic by keenthemes. <a
				href="http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes"
				title="Purchase Metronic just for 27$ and get lifetime updates for free"
				target="_blank">Purchase Metronic!</a>
		</div>
		<div class="scroll-to-top">
			<i class="icon-arrow-up"></i>
		</div>
	</div>
	<!-- END FOOTER -->

	<!-- start add token modal -->


	<div id="addTokenModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		class="modal fade purple">


		<%-- <form:form class="form-horizontal" method="post" modelAttribute="token"
			action="/AZHealthPortal/token/addToken" id="addTokenForm">
			<div class="modal-dialog">
				<div class="modal-content panel-primary purple">
					<div class="modal-header panel-heading purple">
						<button id="" type="button" data-dismiss="modal"
							aria-hidden="true" class="close">×</button>
						<h4 id="myModalLabel" class="modal-title">
							New Token Info
							<input type="hidden" value="<%=request.getParameter("selected_formName")%>" name="formName">

						</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-lg-12">

								<div class="col-lg-12">
									<input type="hidden" id="modal_cloneFormId"
										name="modal_cloneFormId" value="">
									<!-- <input type="hidden" id="modal_rowIndex" name="modal_rowIndex" value="" > -->
								</div>
								<br>
								<br>

								<div class="form-group">

									<label class="col-md-3 control-label">Token Name: </label>
									<div class="col-md-9">
										<form:input path="username" type="text" class="form-control"
											placeholder="Username"></form:input>
									</div>
								</div>

								  <div class="form-group">
									<label class="col-md-3 control-label">Password</label>
									<div class="col-md-9">
										<div class="input-group">
											<form:input path="password" type="password"
												class="form-control" placeholder="Password"></form:input>
											<span class="input-group-addon"> <i class="fa fa-user"></i>
											</span>
										</div>
									</div>
								</div>  

								 <div class="form-group">
									<label class="col-md-3 control-label">Email Address</label>
									<div class="col-md-9">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="fa fa-envelope"></i>
											</span>
											<form:input path="email" type="email" class="form-control"
												placeholder="Email Address"></form:input>
										</div>
									</div>
								</div>
								
								<div class="form-group">

									<label class="col-md-3 control-label">First Name: </label>
									<div class="col-md-9">
										<form:input path="firstName" type="text" class="form-control"
											placeholder="First Name"></form:input>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label">Last Name: </label>
									<div class="col-md-9">
										<form:input path="lastName" type="text" class="form-control"
											placeholder="Last Name"></form:input>
									</div>
								</div>
								
								<div class="form-group">
									
									<div class="col-md-9">
										<form:input path="createdDate" type="hidden" class="form-control"
											placeholder="date" value="<% new Date();%>"></form:input>
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
		</form:form> --%>
	</div>

	<!-- end add token modal -->

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