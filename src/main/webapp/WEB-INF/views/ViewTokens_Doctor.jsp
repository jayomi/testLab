
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
																	<c:if test="${!empty doctorTokenList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			id="sample_3">
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					<th>ID</th>
																					<th>Token ID</th>
																					<th>Doctor</th>																				
																					<th>Status</th>
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
																						<td>${doctor.tokenId}</td>
																						<td>${doctor.doctor}</td>
																						
																						
																						<%-- <td><a href="mailto:shuxer@gmail.com">
																								${token.userEmail} </a></td> --%>
																						
																						
																						
																						<td><span
																							class="label label-sm label-success">
																								Assigned </span></td>
																								
																								<td><a
																							href="<c:url value='/assignToLab/getTokenInfo/${lab.tokenId}' />">View</a></td>
																								
																						
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
																			Lab Portal - Assign to Lab Tokens() </span>
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
																	<%-- <c:if test="${!empty labTokenList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			id="sample_3">
																			<thead>
																				<tr>
																					<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					<th>ID</th>
																					<th>Token ID</th>
																					<th>Lab</th>																				
																					<th>Status</th>
																					<th>View Token</th>
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
																						<td>${lab.tokenId}</td>
																						<td>${lab.labName}</td>
																						
																						
																						<td><a href="mailto:shuxer@gmail.com">
																								${token.userEmail} </a></td>
																						
																						
																						
																						<td><span
																							class="label label-sm label-success">
																								Assigned </span></td>
																								
																								<td><a
																							href="<c:url value='/token/getTokenInfo/${lab.tokenId}' />">View</a></td>
																								
																						
																					</tr>
																		</c:forEach>
																		
																		<% %>
																		
																			</tbody>
																		</table>
																	</c:if> --%>
																</div>
															</div>
															<!-- END EXAMPLE TABLE PORTLET-->
														</div>
													</div>
													
												</div>
												<!-- END CHANGE AVATAR TAB -->
												<!-- CHANGE PASSWORD TAB -->
												<div class="tab-pane" id="tab_1_3">
													<form action="#">
														<div class="form-group">
															<label class="control-label">Current Password</label> <input
																type="password" class="form-control" />
														</div>
														<div class="form-group">
															<label class="control-label">New Password</label> <input
																type="password" class="form-control" />
														</div>
														<div class="form-group">
															<label class="control-label">Re-type New Password</label>
															<input type="password" class="form-control" />
														</div>
														<div class="margin-top-10">
															<a href="javascript:;" class="btn green"> Change
																Password </a> <a href="javascript:;" class="btn default">
																Cancel </a>
														</div>
													</form>
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