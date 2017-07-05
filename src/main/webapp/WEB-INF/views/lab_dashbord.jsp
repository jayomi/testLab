
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
												
												<li class="active"><a href="#tab_1_2" data-toggle="tab">Open<span style="color: #3f6df2;"><i class="fa fa-flask" aria-hidden="true"></i></span> ( ${Count_AssignedToLab} )</a></li>
												<li><a href="#tab_1_3" data-toggle="tab">Compleated/Assign To HO<span style="color: #f261db;"><i class="fa fa-upload" aria-hidden="true"></i></span> ( ${Count_assigntoHOFromLab_tokenList} )</a></li>
												
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
																			Lab Portal - Assign to Lab Tokens( ${Count_AssignedToLab} )</span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	
																	<c:if test="${!empty toLab_tokenList}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			id="sample_3">
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
																					<th>NIC NO</th>
																					<th>Proposal No</th>												
																					<th>Report Status</th>
																					<th>#</th>

																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																				<c:forEach items="${toLab_tokenList}" var="lab">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>																					
																						
																						<td>
																						<span class="label label-sm label-success">
																						<a href="<c:url value='/assignToLab/getTokenInfo/${lab.id}' />">${lab.id}</a></span></td>																						
																						<td>${lab.createdDate}</td>
																						
																						
																						<td>${lab.createdBy}</td>
																						<td>${lab.branch}</td>
																						<td>${lab.customerName}</td>
																						<td>${lab.nic}</td>																						
																						<td>${lab.proposalNo}</td>
																						
																						<td>
																						
																					<c:if test="${lab.pendingReportCountFromLab gt 0}">
																						<span class="label label-sm label-success">Pending reports </span>
																					</c:if>
																					<c:if test="${lab.pendingReportCountFromLab lt 1}">
																						<span class="label label-sm label-success">complete reports </span>
																					</c:if>
																					
																					</td>																							
																						<%-- <td><a
																							href="<c:url value='/assignToLab/getTokenInfo/${lab.id}' />">View</a></td> --%>
																						<td><a
																							 class="assignToHO label label-sm label-success" tokenId="${lab.id}" customerName="${lab.customerName}">Assign To H.Office</a></td>		
																						
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
																			Lab Portal - Assign to H/O - Lab Tokens( ${Count_assigntoHOFromLab_tokenList } ) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	
																	<c:if test="${!empty assigntoHOFromLab_tokenList}">
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
																					<th>NIC NO</th>
																					<th>Proposal No</th>												
																					<th>Report Status</th>
																				

																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																				<c:forEach items="${assigntoHOFromLab_tokenList}" var="lab">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>																					
																						
																						<td>
																						<span class="label label-sm label-success">
																						<a href="<c:url value='/assignToLab/getAssigToHOTokenInfo/${lab.id}' />">${lab.id}</a></span></td>																						
																						<td>${lab.createdDate}</td>
																						
																						
																						<td>${lab.createdBy}</td>
																						<td>${lab.branch}</td>
																						<td>${lab.customerName}</td>
																						<td>${lab.nic}</td>																						
																						<td>${lab.proposalNo}</td>
																						
																						<td>
																						
																					<c:if test="${lab.pendingReportCountFromLab gt 0}">
																						<span class="label label-sm label-success">Pending reports </span>
																					</c:if>
																					<c:if test="${lab.pendingReportCountFromLab lt 1}">
																						<span class="label label-sm label-success">complete reports </span>
																					</c:if>
																					
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
											
												
												<!-- END CHANGE PASSWORD TAB -->
												<!-- PRIVACY SETTINGS TAB -->
										
												<!-- END PRIVACY SETTINGS TAB -->
												
												<!-- tab 6 -->
													
											
											
												<!-- end tab 6 -->
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
              	/* $(function(){
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
              	}); */
              	$( document ).ready(function() {
              	    $('.page-content-wrapper .page-content ').removeClass();
              	   
              	  	 
              	});
              	
              	$(document).on('click', '.assignToHO', function() {        		
            		
              		var tokenId = $(this).attr("tokenId");
              		//var customerName = $(this).attr("customerName");
            		
            		if (confirm('We confirm that we have checked the NIC of the person who has presented him/her self for medical examination')) {
            			
            			if (confirm('Are you sure you want assign token to head office?')) {
               		  $.ajax({
                          	type: 'POST',
                          	url: '/AZHealthPortal/assignToLab/assignToHO/'+tokenId,	                         	           	
                          	cache:false,                          
                          	success: function(data,status, exp){           		
                          		
                          		//alert(data);
                          		if(data == "1"){
                          			alert("Token Assiged to HeadOffice.");
                          		}
                          		location.href = "/AZHealthPortal/dashbord/labDashboard"; 		
                          	},
                          	 error:function(data, status, exp){
                               }
                          });  
            	   		} 
            		}	
            	
            	  });
            	
              	$(document).on('click','.changePasswdBtn', function(){              		
              		
              		if (confirm('Are you sure you want to change password ?')) {              			
              			//var userId = $(this).attr('userId');
              			var userId = $('#changedPassWdId').val();
              			
              			var newPassword = $("#newPassword").val();
              			var currentPassword = $('#currentPassword').val();
              			
              		  $.ajax({
                        	type: 'POST',
                        	url:  "/AZHealthPortal/user/changePassword/"+ userId,	                         	           	
                        	cache:false, 
                        	data: {"newPassword": newPassword,"currentPassword": currentPassword},                        	
                        	success: function(data,status, exp){           		
                        		//alert('data:'+data)
                        		if(data == '1'){
                        			alert("Successfully Changed Password.");
                        			location.href = "/AZHealthPortal/login/";
                        		}else{
                        			alert("Incorrect current password. Try again.");
                        			location.href = "/AZHealthPortal/dashbord/labDashboard";
                        		}               		
                        	},
                        	 error:function(data, status, exp){
                        		
                        		alert(status);
                             }
                        	
                        }); 
              		  	
              		}
              		
              	})
              	
              </script>
</body>
</html>