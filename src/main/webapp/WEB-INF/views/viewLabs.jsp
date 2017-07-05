
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
												<li class="active"><a href="#tab_1_2" data-toggle="tab">Labs&Hospital<span style="color: #3f6df2;"><i class="fa fa-plus-square" aria-hidden="true"></i></span> ( ${labCount} )</a></li>
												<li><a href="#tab_1_3" data-toggle="tab">Doctors<span style="color: #f261db;"><i class="fa fa-plus-square" aria-hidden="true"></i></span> ( ${doctor_labCount} )</a></li>
												<%-- <li><a href="#tab_1_4" data-toggle="tab">Durdan's<span style="color: #ecae1ae6;"><i class="fa fa-plus-square" aria-hidden="true"></i></span> ( ${Durden_labCount} )</a></li>
												<li><a href="#tab_1_5" data-toggle="tab">Other<span style="color: #2d9586;"><i class="fa fa-plus-square" aria-hidden="true"></i></span> ( ${Other_labCount} )</a></li>	 --%>						
												
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
																			Lab Portal - Labs & Hospital (${labCount})</span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	
																<div class="table-toolbar">
																	<div class="row">
																		<div class="col-md-6">
																			<div class="btn-group">
																				<button id="sample_editable_1_new"
																					class="btn sbold green" data-toggle="modal"
																					data-target="#addLabModal">
																					Add New <i class="fa fa-plus"></i>
																				</button>
																			</div>
																		</div>
																	</div>
																</div>
																	
																	<c:if test="${!empty labs_Hospital_List}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			id="sample_1">
																			<thead>
																				<tr>
																				<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					
																					<th>Lab</th>
																					<th>Branch</th>
																					<th>Address</th>
																					<th>Email</th>
																					<th>Contact No</th>
																					<th>Edit</th>												
																					<th>Delete</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																				<c:forEach items="${labs_Hospital_List}" var="lab">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>																					
																						
																																				
																						<td>${lab.labName}</td>
																						<td>${lab.branch}</td>																			
																						<td>${lab.address}</td>
																						<td>${lab.email }</td>
																						<td>${lab.contactNo}</td>																						
																						
																																										
																						<%-- <td><a
																							href="<c:url value='/assignToLab/getTokenInfo/${lab.id}' />">View</a></td> --%>
																						<td>
																						
																						<a data-toggle="modal" data-target="#labModal"
																							class="Editbtn label label-sm label-success" labId="${lab.id}" labName="${lab.labName}" email="${lab.email}"
																							labAddress="${lab.address}" branch="${lab.branch}" contactNo="${lab.contactNo}"
																							 title="Edit"><span><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
																							</a>		
																						</td>
																						<td>
																						<a href="<c:url value='/lab/deleteLab/${lab.id}' />" title="Delete"><i class="fa fa-trash" style="color:red;" aria-hidden="true"></i></a>
																						
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
																			Lab Portal - Doctor Labs(${doctor_labCount}) </span>
																	</div>
																	
																</div>
																<div class="portlet-body">
																	
																	<c:if test="${!empty doctor_list}">
																		<table
																			class="table table-striped table-bordered table-hover table-checkable order-column"
																			id="sample_3">
																			<thead>
																				<tr>
																				<th><input type="checkbox"
																						class="group-checkable"
																						data-set="#sample_1 .checkboxes" /></th>
																					
																					<th>Lab</th>
																					<th>Branch</th>
																					<th>Address</th>
																					<th>Email</th>
																					<th>Contact No</th>
																					<th>Edit</th>												
																					<th>Delete</th>
																				</tr>
																			</thead>
																			<tbody>
																			
																			<%  %>
																			
																			<c:forEach items="${doctor_list}" var="lab">
																					<tr class="odd gradeX">
																						<td><input type="checkbox" class="checkboxes"
																							value="1" /></td>																					
																						
																						<td>${lab.labName}</td>
																						<td>${lab.branch}</td>																			
																						<td>${lab.address}</td>
																						<td>${lab.email }</td>
																						<td>${lab.contactNo}</td>																						
																						
																																										
																						<%-- <td><a
																							href="<c:url value='/assignToLab/getTokenInfo/${lab.id}' />">View</a></td> --%>
																						<td>
																						
																						<a data-toggle="modal" data-target="#labModal"
																							class="Editbtn label label-sm label-success" labId="${lab.id}" labName="${lab.labName}" email="${lab.email}" labType="${lab.labType}"
																							labCategory="${lab.labCategory}" labAddress="${lab.address}" branch="${lab.branch}" contactNo="${lab.contactNo}"
																							 title="Edit"><span><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
																							</a>		
																						</td>
																						<td>
																						<a href="<c:url value='/lab/deleteLab/${lab.id}' />" title="Delete"><i class="fa fa-trash" style="color:red;" aria-hidden="true"></i></a>
																						
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
		
<!--Start  Add Lab modal -->
			
	<div id="addLabModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		class="modal fade purple">

			 <form:form class="form-horizontal" modelAttribute="addLab" method="POST" action="/AZHealthPortal/lab/addLab" id="form_sample_2">
			 
			<div class="modal-dialog">
				<div class="modal-content panel-primary purple">
					<div class="modal-header panel-heading purple">
						<button id="" type="button" data-dismiss="modal"
							aria-hidden="true" class="close">×</button>
						<h4 id="myModalLabel" class="modal-title">
							New Lab Info
							<%-- <input type="hidden" value="<%=request.getParameter("selected_formName")%>" name="formName"> --%>

						</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-lg-12">
							
								<div class="form-group  margin-top-20">
                                    <label class="control-label col-md-3">Laboratory Type :
                                        <span class="required"> * </span>
                                    </label>
                                    <div class="col-md-4">
                                        <form:select id="selectBranch" class="form-control select2me" name="options2" path="labCategory" required="required">
                                           <form:option value="">-Select-</form:option>                                                          	
									        <form:option value="1">Hospitals & Labs</form:option>	                  
									       	<form:option value="2">Doctor</form:option>
									       	                                     
                                       </form:select> 
                                    </div>
                                </div>
							
								<div class="form-group  margin-top-20">
                                    <label class="control-label col-md-3">Laboratory/Doctor Name :
                                        <span class="required"> * </span>
                                    </label>
                                    <div class="col-md-4">
                                        <div class="input-icon right">
                                            <i class="fa"></i>
                                            <form:input path="labName" type="text" class="form-control" name="name" required="required"/> </div>
                                    </div>
                                </div>
                                
                                
                                            <div class="form-group" id="selectBranch">
                                                <label class="control-label col-md-3">Location/Division: 
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <form:select id="selectBranch" class="form-control select2me" name="options2"  path="branch" required="required">
                                                        <form:option value="">-Select-</form:option>
			                                            <c:forEach items="${branchList}" var="branch">	                 	
												        <form:option value="${branch.branchName}">${branch.branchName}</form:option>	                  
												        </c:forEach>
			                                         <%-- <form:option value="Option 4">Option 4</form:option> --%>
                                                    </form:select>
                                                </div>
                                            </div>
                                            
                                             <div class="form-group  margin-top-20">
                                                <label class="control-label col-md-3">Address :
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <form:input path="address" type="text" class="form-control" name="name2" required="required" /> </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group  margin-top-20">
                                                <label class="control-label col-md-3">Email :
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <form:input path="email" type="email" class="form-control" name="name2" required="required" /> </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group  margin-top-20">
                                                <label class="control-label col-md-3">Contact No 1 : 
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <form:input path="contactNo" type="text" class="form-control" name="name" required="required"/> </div>
                                                </div>
                                            </div>
                                           
                                            <div class="form-group  margin-top-20">
                                                <label class="control-label col-md-3">Contact No 2 : 
                                                    
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <form:input path="contactNo2" type="text" class="form-control" name="name"/> </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group  margin-top-20">
                                                <label class="control-label col-md-3">Fax : 
                                                 
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <form:input path="fax" type="text" class="form-control" name="name" /> </div>
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
		<!-- End Add lab modal -->
		
		
		<!-- Edit Lab Modal -->
		<div id="labModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
		<form:form class="form-horizontal" modelAttribute="editLab" method="POST" action="/AZHealthPortal/lab/updateLab" >
		<div class="modal-dialog">
			<div class="modal-content panel-primary">
				<div class="modal-header panel-heading">
					<button id="" type="button" data-dismiss="modal" aria-hidden="true"
						class="close">×</button>
					<h4 id="myModalLabel" class="modal-title">Edit Lab
					<%-- <input type="hidden" value="<%=request.getParameter("selected_formName")%>" name="formName"> --%>
					
					</h4>
				</div>
				<div class="modal-body">
					<div class="row">
					<div class="col-lg-12">
											
							<div class="col-lg-12">
								<form:input path="id" type="hidden" id="modal_labId" value=""></form:input>
								<form:input path="labCategory" type="hidden" id="modal_labCategory" value=""></form:input>
								<%-- <form:input path="labType" type="hidden" id="modal_labType" value=""></form:input> --%>
							</div>
							<br><br>
							
							<div class="form-group">
                              <label class="col-lg-2 control-label">Lab Name: </label>
                              <div class="col-lg-10">
                                <form:input id="modal_labName" type="text" placeholder="form name" path="labName"
									class="form-control"></form:input>
                              </div>
                           </div>
                           
                           <div class="form-group">
                              <label class="col-lg-2 control-label">Address: </label>
                              <div class="col-lg-10">
                                <form:input id="modal_labAddress"  type="text" placeholder="address" path="address"
									class="form-control"></form:input>
                              </div>
                           </div>
                            <div class="form-group">
                              <label class="col-lg-2 control-label">District: </label>
                              <div class="col-lg-10">
                                <form:input id="modal_labDistrict"  type="text" placeholder="district" path="district"
									class="form-control"></form:input>
                              </div>
                           </div>
                           
                           <div class="form-group">
                              <label class="col-lg-2 control-label">Branch: </label>
                              <div class="col-lg-10">
                               
									 <form:select id="modal_labBranch" class="form-control" path="branch">
                                         <option value="">-Select-</option>
                                         <c:forEach items="${branchList}" var="branch">	                 	
							        	<form:option value="${branch.branchName}">${branch.branchName}</form:option>	                  
							        	</c:forEach>
                                      
                                     </form:select>
                                     
                              </div>
                           </div>
                           
                            <div class="form-group">
                              <label class="col-lg-2 control-label">Division : </label>
                              <div class="col-lg-10">
                                <form:input id="modal_labDivision"  type="text" placeholder="division" path="division"
									class="form-control"></form:input>
                              </div>
                           </div>
                           
                           
                            <div class="form-group">
                              <label class="col-lg-2 control-label">Email: </label>
                              <div class="col-lg-10">
                                <form:input id="modal_labEmail"  type="text" placeholder="contact no" path="email"
									class="form-control"></form:input>
									
                              </div>
                           </div>
                           
                            <div class="form-group">
                              <label class="col-lg-2 control-label">Contact No: </label>
                              <div class="col-lg-10">
                                <form:input id="modal_labContactNo"  type="text" placeholder="contact no" path="contactNo"
									class="form-control"></form:input>
									
                              </div>
                           </div>
                            <div class="form-group">
                              <label class="col-lg-2 control-label">Contact No: </label>
                              <div class="col-lg-10">
                                <form:input id="modal_labContactNo2"  type="text" placeholder="contact no" path="contactNo2"
									class="form-control"></form:input>
                              </div>
                           </div>
                           
                           <div class="form-group">
                              <label class="col-lg-2 control-label">Contact No: </label>
                              <div class="col-lg-10">
                                <form:input id="modal_labContactNo3"  type="text" placeholder="contact no" path="contactNo3"
									class="form-control"></form:input>
                              </div>
                           </div>
                           
                           <div class="form-group">
                              <label class="col-lg-2 control-label">Fax: </label>
                              <div class="col-lg-10">
                                <form:input id="modal_labFax"  type="text" placeholder="Fax" path="fax"
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
	<!-- end lab modal -->
		<!-- end -->
		
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
              	
              	
              	$(document).on('click', '.Editbtn', function() {        		
            		
              		var labId = $(this).attr("labId");
              		
              		var query = "/AZHealthPortal/lab/getEditLab/"+ labId;
        			
                    $.get(query,function(data,status){
                    	 var json = JSON.stringify(data);
                    	 
                    	$('#modal_labId').val(data.id);                    	                   	
                    	$('#modal_labCategory').val(data.labCategory);
                   		$('#modal_labName').val(data.labName);
                   		$('#modal_labAddress').val(data.address);
                   		$('#modal_labDistrict').val(data.district);
                   		$('#modal_labBranch').val(data.branch);
                   		$('#modal_labDivision').val(data.division);
                   		$('#modal_labEmail').val(data.email);                   		
                   		$('#modal_labContactNo').val(data.contactNo);             		
                   		$('#modal_labContactNo2').val(data.contactNo2);
                   		$('#modal_labContactNo3').val(data.contactNo3);
                   		$('#modal_labFax').val(data.fax);
                    	 
                    });
                    
                    
              		/* var labName = $(this).attr("labName");
              		var labAddress = $(this).attr("labAddress");
              		var branch = $(this).attr("branch");
              		var email = $(this).attr("email");
              		var contactNo = $(this).attr("contactNo"); */
              		
              		
            	
            	  });
            	
              	
              </script>
</body>
</html>