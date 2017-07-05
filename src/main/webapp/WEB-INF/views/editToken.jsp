<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
             <meta charset="utf-8" />
        <title>Lab Portal</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        
        <%@include file="styles.jsp" %>        
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
        
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-editable/bootstrap-editable/css/bootstrap-editable.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-editable/inputs-ext/address/address.css" rel="stylesheet" type="text/css" />
        
        <!--BEGIN date/time picker -->
               <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/clockface/css/clockface.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="${pageContext.request.contextPath}/resources/assets/global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="${pageContext.request.contextPath}/resources/assets/layouts/layout4/css/layout.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/layouts/layout4/css/themes/light.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <link href="${pageContext.request.contextPath}/resources/assets/layouts/layout4/css/custom.min.css" rel="stylesheet" type="text/css" />
        <!-- END date/time picker -->
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
				<div class="page-head">
					<!-- BEGIN PAGE TITLE -->
					<div class="page-title">
						<h1>
							Token Profile Id: ${ headTokenId }
						</h1>
					</div>
					<!-- END PAGE TITLE -->
					<!-- BEGIN PAGE TOOLBAR -->

				<%-- 	<%@ include file="template/page_toolbar.jsp"%> --%>

					<!-- END PAGE TOOLBAR -->
				</div>
				<!-- END PAGE HEAD-->
				<!-- BEGIN PAGE BREADCRUMB -->
				
				<!-- END PAGE BREADCRUMB -->
				<!-- BEGIN PAGE BASE CONTENT -->
			
					
						<!-- BEGIN PROFILE SIDEBAR -->
								
					<div class="portlet-body">
					 <form:form role="form" method="post" action="/AZHealthPortal/token/updateToken/${headTokenId}" modelAttribute="updateToken">
                            <div class="row">
                                <div class="col-md-12">
                                	
                                    <table id="user" class="table table-bordered table-striped">
                                        <tbody>                                           
                                            
                                            <tr>
                                                <td>Created By : <form:input path="createdBy" type="text" class="form-control" readOnly="readOnly" value="${headToken.createdBy}"></form:input></td>
                                                <td>
                                                   Created Date:  <input path="createdDate" type="text" class="form-control" readOnly="readOnly" value="${headToken.createdDate}"></input>
                                                  <%--  Created Date:  <form:input type="text" path="createdDate" class="form-control" readOnly="readOnly" value="${headToken.createdDate}"></form:input> --%> <!-- date type not assign to text -->
                                                </td>
                                               	<td>Branch: <form:input path="branch" type="text" class="form-control" readOnly="readOnly" value="${headToken.branch}"></form:input></td>
                                            </tr>
                                            
                                             <tr>
                                                <td colspan="2" style="background-color: #d6dbdb;"> Customer Informations: </td>
                                              </tr>
                                           
                                             <tr>
                                                <td> Customer Name: <span style="color: red;">*</span>
                                                 <form:input path="customerName" type="text" placeholder="Customer Name" class="form-control" required="required" value="${headToken.customerName}"></form:input>
                                                 </td>
                                                <td>
                                                   NIC: <span style="color: red;">*</span>
                                               		<form:input path="nic" type="text" placeholder="NIC No" class="form-control" required="required" value="${headToken.nic}" ></form:input>
                                                </td>
                                               	 <td> Policy/Proposal No: <span style="color: red;">*</span> 
                                               	 <form:input path="proposalNo" type="text" placeholder="Doe" class="form-control" required="required" value="${headToken.proposalNo}"></form:input>
                                               	 </td>
                                               	 
                                            </tr>
                                            
                                          
                                            
                                            <tr>
                                                <td colspan="2" style="background-color: #d6dbdb;"> Report Details : </td>
                                            </tr>
                                              
                                            <tr>
                                                <td> Report Category: <span style="color: red;">*</span> </td>
                                                <td>
                                                    <%-- <form:input path="tokenCategory" type="text" placeholder="Token Category" class="form-control" ></form:input> --%> 
                                                	 
                                                	 <form:select path="reportCategory" required="required" id="medical_report" class="form-control">
	                                                        <option>-select-</option>
	                                                        <c:if test="${headToken.reportCategory == 'Standard Medical Reports'}">
                                                	 			<form:option value="Standard Medical Reports" selected="selected">Standard Medical Reports</form:option>
                                                	 			<form:option value="Special Medical Reports">Special Medical Reports</form:option>
	                                                        	<form:option value="Other Medical Reports">Other</form:option>
                                                	 		</c:if>
                                                	 		<c:if test="${headToken.reportCategory == 'Special Medical Reports'}">
                                                	 			<form:option value="Standard Medical Reports">Standard Medical Reports</form:option>
                                                	 			<form:option value="Special Medical Reports" selected="selected">Special Medical Reports</form:option>
	                                                        	<form:option value="Other Medical Reports">Other</form:option>
                                                	 		</c:if>
                                                	 		<c:if test="${headToken.reportCategory == 'Other Medical Reports'}">
                                                	 			<form:option value="Standard Medical Reports">Standard Medical Reports</form:option>
                                                	 			<form:option value="Special Medical Reports">Special Medical Reports</form:option>
	                                                        	<form:option value="Other Medical Reports" selected="selected">Other</form:option>
                                                	 		</c:if>                                                	 		
	                                                                                                   	                                                       
	                                                    </form:select>
                                                </td>
                                                
                                            </tr>
                                             
                                            <tr>
                                                <td colspan="2" style="background-color: #d6dbdb;"> Medical Reports Informations: </td>
                                             </tr>
                                            
                                             </tbody>
                                          </table>
                                          
                                         
                                           	
                                           	  <!-- start 1nd hidden table --> 
                                            <table id="Standard_Medical_Reports" class="table table-bordered table-striped" >
                                        		<th>Standard Medical Reports</th>
                                        		<tbody>
                                        		
                                        		<c:if test="${!empty selected_medicalReports}">
													<c:forEach var="i" items="${selected_medicalReports}" varStatus="status">
													<tr>																																					
													
														<td><label><form:checkbox path="medicalReports" value="${i}" checked="checked" ></form:checkbox><c:out value="${i}" /></label></td>											
													</tr> 
													</c:forEach>
												</c:if>
												
												<c:if test="${!empty notselected_medicalReports}">
													<c:forEach var="i" items="${notselected_medicalReports}" varStatus="status">
													<tr> 																																					
													
														<td><label><form:checkbox path="medicalReports" value="${i}"></form:checkbox><c:out value="${i}" /></label></td>											
													</tr> 
													</c:forEach>
												</c:if>
											
                                            </tbody>
                                           </table>
                                            <!-- end 1nd hidden table --> 
                                           
                                           
                                             
                                             	 <!-- start 2nd hidden table --> 
                                             	 <table id="special_medical_reports" class="table table-bordered table-striped" >
	                                        		<th>Special Medical Reports</th>
	                                        		<tbody>
	                                           
	                                           	<c:if test="${!empty selected_specialReports}">
													<c:forEach var="i" items="${selected_specialReports}" varStatus="status">
													<tr>																																					
													
														<td><label><form:checkbox path="medicalReports" value="${i}" checked="checked" ></form:checkbox><c:out value="${i}" /></label></td>											
													</tr> 
													</c:forEach>
												</c:if>
												
												<c:if test="${!empty notselected_specialReports}">
													<c:forEach var="i" items="${notselected_specialReports}" varStatus="status">
													<tr> 																																					
													
														<td><label><form:checkbox path="medicalReports" value="${i}"></form:checkbox><c:out value="${i}" /></label></td>											
													</tr> 
													</c:forEach>
												</c:if>
	                                            	
	                                           		</tbody>
                                         		 </table> 
                                          		 <!-- end 2nd hidden table -->                                          		                                                                                     	 
                                          
                                          
                                          <!-- start 3nd hidden table --> 
                                             <table id="Other_Medical_Reports" class="table table-bordered table-striped">
                                        		<th>Other Medical Reports</th>
                                        		<tbody>
                                        			<tr>
		                                                <td style="width:15%">Reports Name:</td>
		                                                <td style="width:50%">
                                                    	 <%-- <form:textarea path="specialMedicalReports" type="text" placeholder="Special reports" class="form-control"><c:out value="${headToken.otherMedicalReports}"/></form:textarea> --%>
                                                    	<%-- <c:out value="${headToken.otherMedicalReports}"/> --%>
                                                    	 <form:input path="specialMedicalReports" type="text" placeholder="Special reports" class="form-control" value="${headToken.otherMedicalReports}" ></form:input> 
                                                    	
                                                </td>                                               
                                            </tr> 
                                        		</tbody>
                                        		</table>
                                         <!-- end 3rd hidden table -->
                                         
                                                                              
                                           <table id="user" class="table table-bordered table-striped">
                                        	<tbody>
                                           	 <tr>
                                                <td colspan="2" style="background-color: #d6dbdb;"> Lab: </td>
                                             </tr>
                                             
                                              <tr>
                                             	<td>Lab Category: </td>
                                             	<td>
                                             		<select id="labCategory" class="form-control">
                                             			<option>- Select -</option>
                                             			<option value="1">Asiri Laboratory</option>
                                             			<option value="2">Hemas Laboratory</option>
                                             			<option value="3">Durden's Laboratory</option>
                                             		</select>
                                             	</td>
                                             </tr>
                                             
                                          
                                          	<tr>
                                                 <td> Assign To Lab: <span style="color: red;">*</span>  </td>
                                               	 <td>
                                                   <form:select path="labId" required="required" id="selectlab" class="form-control select2me">
                                                   	<form:option value="">- Select -</form:option>
		                                               <c:if test="${!empty labList}">
															<c:forEach var="i" items="${labList}" varStatus="status">
																
																 <c:if test="${i.id == headToken.labId}">
																 	<form:option value="${i.id}" selected="selected">${i.labName}</form:option>
																 </c:if>
																  <c:if test="${i.id ne headToken.labId}">
																  	<form:option value="${i.id}">${i.labName}</form:option>
																  </c:if>
															</c:forEach>
														</c:if>
                                               	</form:select>
                                               	</td>
                          	
                                            </tr>
                                            
                                            <tr>
                                                <td> Priority Level: </td>
                                                <td>
                                                    <%-- <form:input path="priority" type="text" placeholder="Priority" class="form-control" ></form:input> --%>
                                                	 
                                                	 <c:if test="${!empty headToken.priority}">
                                                	 	<form:select path="priority">
                                                	 	 <c:if test="${headToken.priority == 'low'}">
                                                	 	 	
														 	<form:option value="low" selected="selected">Low</form:option>
														 	 <form:option value="normal">Normal</form:option>
	                                                         <form:option value="high">High</form:option>
	                                                         <form:option value="emergency">Emergency</form:option>
	                                                        
														 </c:if>
														 <c:if test="${headToken.priority == 'normal'}">
														 	<form:option value="low">Low</form:option>
														 	 <form:option value="normal" selected="selected">Normal</form:option>
	                                                         <form:option value="high">High</form:option>
	                                                         <form:option value="emergency">Emergency</form:option>	
														 </c:if>
														  <c:if test="${headToken.priority == 'high'}">
														 	<form:option value="low">Low</form:option>
														 	 <form:option value="normal" >Normal</form:option>
	                                                         <form:option value="high" selected="selected">High</form:option>
	                                                         <form:option value="emergency">Emergency</form:option>	
														 </c:if>
														  <c:if test="${headToken.priority == 'emergency'}">
														 	<form:option value="low">Low</form:option>
														 	 <form:option value="normal" >Normal</form:option>
	                                                         <form:option value="high">High</form:option>
	                                                         <form:option value="emergency" selected="selected">Emergency</form:option>	
														 </c:if>
														 </form:select>	 
                                                	 </c:if>
                                                	  <c:if test="${empty headToken.priority}">
                                                	  		<form:select path="priority">
		                                                        <form:option value="">- Select -</form:option>
		                                                        <form:option value="low">Low</form:option>
		                                                        <form:option value="normal">Normal</form:option>
		                                                        <form:option value="high">High</form:option>
		                                                        <form:option value="emergency">Emergency</form:option>	                                                        	                                                       
	                                                		</form:select>
                                                	  </c:if>
                                                	 
                                                	 
                                                	 
                                                </td>                                      
                                                
                                            </tr>
                                            
                                          
                                          <tr>
                                                <td colspan="2" style="background-color: #d6dbdb;"> Appointment Date/Time : </td>
                                             </tr>
                                          <tr>
                                          	<td> Appointment Date: 
                                          		<div class="input-group input-medium date date-picker" data-date-format="dd-mm-yyyy" data-date-start-date="+0d">
                                                    <form:input path="appointmentDate" type="text" placeholder="Appointment Date" class="form-control" value="${headToken.appointmentDate}" ></form:input>
                                                	 <span class="input-group-btn"><button class="btn default" type="button">
                                                       <i class="fa fa-calendar"></i>
                                                      </button>
                                                     </span>
                                                </div>
                                          	</td>
                                                <td>
                                                	Appointment Time:
                                                	 <div class="input-group input-medium">
                                                    <form:input path="appointmentTime" type="text" placeholder="Appointment Time" class="form-control timepicker timepicker-default" value="${headToken.appointmentTime}"></form:input>
                                                	 <span class="input-group-btn"><button class="btn default" type="button">
                                                       <i class="fa fa-clock-o"></i>
                                                      </button>
                                                     </span>
                                                </div>   
                                                </td>
                                          </tr>
                                          
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            
                            <div class="row">  
                           
                                <div class="col-md-12">
                                <div class="col-md-9">								
									</div>
									
                                    <table id="user" class="table table-bordered table-striped">
                                        <tbody>
                                          
                                            <tr>
                                                <td style="width:15%">Comment:  </td>
                                                <td style="width:50%">
                                                    <form:textarea path="tokenCreateComment" type="text" class="tokenCreateComment form-control"  placeholder="${headToken.tokenCreateComment}"></form:textarea>
                                               		
                                                </td>                                               
                                            </tr> 
                                            <tr>
                                                <td style="width:15%">Special Instructions to Lab:  </td>
                                                <td style="width:50%">
                                                    <form:textarea path="specialInstructions" type="text" placeholder="${headToken.specialInstructions}" class="form-control"></form:textarea>
                                                </td>                                               
                                            </tr> 
                                           	<tr>
                                                <td style="width:15%">Remarks:  </td>
                                                <td style="width:50%">
                                                    <form:textarea path="remarks" type="text" placeholder="${headToken.remarks}" class="form-control"></form:textarea>
                                                </td>                                               
                                            </tr> 
                                                                          
                                        </tbody>
                                    </table>
                                    
                                    
                              
                            </div>
                           
                            </div>
                            
                            <button type="submit" class="btn btn-primary" value="Save">Save</button>
							 
							 <input type="reset" value="Reset!" class="addTokenBtn btn btn-primary">
							 
                          </form:form>
                        </div>
								
						<!-- END BEGIN PROFILE SIDEBAR -->
						<!-- BEGIN PROFILE CONTENT -->
					
		<!-- END CONTENT -->
	</div>
	</div></div>
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
             
                
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js" type="text/javascript"></script>      
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/moment.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery.mockjax.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-editable/bootstrap-editable/js/bootstrap-editable.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-editable/inputs-ext/address/address.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-editable/inputs-ext/wysihtml5/wysihtml5.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-typeahead/bootstrap3-typeahead.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        
        <!-- Date/time picker -->
      
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/clockface/js/clockface.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="${pageContext.request.contextPath}/resources/assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath}/resources/assets/pages/scripts/components-date-time-pickers.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        
		<!-- End date time picker --> 
		       
        
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath}/resources/assets/pages/scripts/form-editable.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <script src="${pageContext.request.contextPath}/resources/assets/layouts/layout4/scripts/layout.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/layouts/layout4/scripts/demo.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
      	<script src="${pageContext.request.contextPath}/resources/assets/pages/scripts/form-validation.min.js" type="text/javascript"></script>
       <!-- END SCRIPT -->
       
       <script type="text/javascript">
       $(document).on('change', '#medical_report', function () {	
   		var option = $('#medical_report').find('option:selected').val();
   		
	   		if(option == "Standard Medical Reports"){ 			
	   			
	   			$("#Standard_Medical_Reports").show();
	   			//$("#Special_Medical_Reports").hide();
	   			/* $("#password").hide();
	   			$("#selectLab").hide(); */
	   			
	   		}
	   		if(option == "Special Medical Reports"){
	   			
	   			$("#special_medical_reports").show();
	   		}
	   		if(option == "Other Medical Reports"){
	   			
	   			$("#Other_Medical_Reports").show();
	   		}
       });
       
     //labCategory
       $(document).on('change', '#labCategory', function () {	
  			var option = $('#labCategory').find('option:selected').val();
  			
  			if(option == "1" || option=="2" || option=="3"){
  				alert(option);
  				
  				var query = "/AZHealthPortal/token/getLabListByCategory/"+ option;
               $.get(query,function(data,status){
                  
                  // var json = JSON.parse(data);                    
                   //var labList = json.labList;//labList
                 
              
                 // Get select
                 //var select = document.getElementById('selectlab');
                 var $select = $('#selectlab');
                 $select.empty();
                 $('#selectlab').append(data);                      
               });     
  			}
       	
       });
     
   
   	
       </script>

</body>
</html>