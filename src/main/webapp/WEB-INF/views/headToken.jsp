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
				<form class="search-form" action="page_general_search_2.html"
					method="GET">
					<div class="input-group">
						<input type="text" class="form-control input-sm"
							placeholder="Search..." name="query"> <span
							class="input-group-btn"> <a href="javascript:;"
							class="btn submit"> <i class="icon-magnifier"></i>
						</a>
						</span>
					</div>
				</form>
				<!-- END HEADER SEARCH BOX -->
				<!-- BEGIN TOP NAVIGATION MENU -->
				<div class="top-menu">
					<ul class="nav navbar-nav pull-right">
						<li class="separator hide"></li>
						<!-- BEGIN NOTIFICATION DROPDOWN -->
						<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->

						<!-- END NOTIFICATION DROPDOWN -->
						<li class="separator hide"></li>
						<!-- BEGIN INBOX DROPDOWN -->
						<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->

						

						<!-- END INBOX DROPDOWN -->
						<li class="separator hide"></li>
					
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
				
				<!-- BEGIN PAGE BREADCRUMB -->
				<ul class="page-breadcrumb breadcrumb">
					<li><a href="${pageContext.request.contextPath}/token/getTokens">TokenID: </a> <i class="fa fa-long-arrow-right"></i>
					</li>
					<li style="color: #105ad1;"><b><span class="active">${headTokenId }</span></b></li>
				</ul>
				<!-- END PAGE BREADCRUMB -->
				<!-- BEGIN PAGE BASE CONTENT -->
			
					
						<!-- BEGIN PROFILE SIDEBAR -->
								
						<div class="portlet-body">
                            
                          <div class="row">
                                <div class="col-md-6">
                                    <table id="user" class="table table-bordered table-striped">
                                        <tbody>
                                        	<tr>
                                                <td> Status: </td>
                                                <td>
                                                    <a href="javascript:;" id="status" data-type="select" data-pk="1" data-value="0" data-source="/status" data-original-title="Select status" style="color:red;"> ${headToken.tokenStatus } </a>
                                                </td>
                                                
                                            </tr>
                                        
                                        	<tr>
                                                <td> Priority: </td>
                                                <td>
                                                    <a href="javascript:;" id="fruits" data-type="checklist" data-value="2,3" data-original-title="Select fruits">${headToken.priority } </a>
                                                </td>
                                                
                                            </tr>
                                            
                                           
                                            <tr>
                                                <td> From: </td>
                                                <td>
                                                    <a href="javascript:;" id="state" data-type="typeahead" data-pk="1" data-placement="right" data-original-title="Start typing State.."> ${headToken.createdBy } </a>
                                                </td>
                                               
                                            </tr>
                                            
                                             <tr>
                                                <td> Branch: </td>
                                                <td>
                                                    <a href="javascript:;" id="fruits" data-type="checklist" data-value="2,3" data-original-title="Select fruits">${headToken.branch } </a>
                                                </td>
                                                
                                            </tr>
                                             
                                            
                                            </tbody>
                                        </table>
                                        <table id="user" class="table table-bordered table-striped">
                                        <tbody>
                                            <tr>
                                                <td> Lab : </td>
                                                <td>
                                                    <a href="javascript:;" id="state" data-type="typeahead" data-pk="1" data-placement="right" data-original-title="Start typing State.."> ${headToken.labName } </a>
                                                </td>
                                               
                                            </tr>
                                            
                                             <tr>
                                                <td> Report Category:  </td>
                                                <td>
                                                    <a href="javascript:;" id="comments" data-type="textarea" data-pk="1" data-placeholder="Your comments here..." data-original-title="Enter comments"> ${reportCategory}</a> 
                                                </td>
                                                
                                            </tr>
                                            
                                            <tr>
                                                <td> Medical Reports: </td>
                                                <td>
                                                    <a href="javascript:;" id="fruits" data-type="checklist" data-value="2,3" data-original-title="Select fruits">${headToken.medicalReports} </a>
                                                </td>
                                                
                                            </tr>
                                            
                                            <tr>
                                                <td> Appointment Date : </td>
                                                <td>
                                                    <a href="javascript:;" id="fruits" data-type="checklist" data-value="2,3" data-original-title="Select fruits">${headToken.appointmentDate} </a>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td> Appointment Time:  </td>
                                                <td>
                                                    <a href="javascript:;" id="fruits" data-type="checklist" data-value="2,3" data-original-title="Select fruits">${headToken.appointmentTime} </a>
                                                </td>
                                                
                                            </tr>
                                            
                                            
                                            </tbody>
                                        </table>                                      
                                               
                                      
                                  </div>
                                  
                                  <div class="col-md-6">                                   
                                        
                                        <table id="user" class="table table-bordered table-striped">
                                        <tbody>
                                           <tr>
                                                <td> Created Date: </td>
                                                <td>
                                                    <a href="javascript:;" id="state" data-type="typeahead" data-pk="1" data-placement="right" data-original-title="Start typing State.."> ${headToken.createdDate} </a>
                                                </td>
                                               
                                            </tr>
                                           <tr>
                                                <td> Last Message:  </td>
                                                <td>
                                                    <a href="javascript:;" id="comments" data-type="textarea" data-pk="1" data-placeholder="Your comments here..." data-original-title="Enter comments"> ${headToken.lastMessage} </a> 
                                                </td>
                                                
                                            </tr>
                                           <tr>
                                                <td> Last Response:  </td>
                                                <td>
                                                    <a href="javascript:;" id="comments" data-type="textarea" data-pk="1" data-placeholder="Your comments here..." data-original-title="Enter comments"> ${headToken.lastResponse} </a> 
                                                </td>
                                                
                                            </tr>
                                             <tr>
                                                <td> Comment :  </td>
                                                <td>
                                                    <a href="javascript:;" id="comments" data-type="textarea" data-pk="1" data-placeholder="Your comments here..." data-original-title="Enter comments"> ${headToken.tokenCreateComment}</a> 
                                                </td>                                                
                                            </tr>
                                            
                                             <tr>
                                                <td> Special Instruction to Lab :  </td>
                                                <td>
                                                    <a href="javascript:;" id="comments" data-type="textarea" data-pk="1" data-placeholder="Your comments here..." data-original-title="Enter comments" style="color:red;"> ${headToken.specialInstructions}</a> 
                                                </td>                                                
                                            </tr>
                                            
                                             <tr>
                                                <td> Remarks :  </td>
                                                <td>
                                                    <a href="javascript:;" id="comments" data-type="textarea" data-pk="1" data-placeholder="Your comments here..." data-original-title="Enter comments"> ${headToken.remarks}</a> 
                                                </td>                                                
                                            </tr>
                                            
                                            </tbody>
                                        </table>
                                 
                                 	<table id="user" class="table table-bordered table-striped">
                                        <tbody>
                                            
                                             <tr>
                                                <td> Proposal No: </td>
                                                <td>
                                                    <a href="javascript:;" id="state" data-type="typeahead" data-pk="1" data-placement="right" data-original-title="Start typing State.."> ${headToken.proposalNo } </a>
                                                </td>
                                               
                                            </tr>
                                            <tr>
                                                <td> Customer Name: </td>
                                                <td>
                                                    <a href="javascript:;" id="state" data-type="typeahead" data-pk="1" data-placement="right" data-original-title="Start typing State.."> ${headToken.customerName } </a>
                                                </td>
                                               
                                            </tr>
                                           <tr>
                                                <td> NIC: </td>
                                                <td>
                                                    <a href="javascript:;" id="fruits" data-type="checklist" data-value="2,3" data-original-title="Select fruits">${headToken.nic } </a>
                                                </td>
                                                
                                            </tr> 
                                         </tbody>
                                      </table>
                                 
                                       
                                      
                                     
                                  </div>      
                                </div>            
                          <%
                          int loginUserType = Integer.parseInt(request.getSession().getAttribute("log_userType").toString());
                          if(loginUserType == 1){%>
                        	  		 <div class="row">
                                      	<h2>Token History: </h2>
                                      	<c:if test="${!empty logList}">
                                      		<c:forEach items="${logList}" var="logs">
                                      			<label>${logs.comment }</label>
                                      			<label>${logs.date }</label>
                                      			<br/>
                                      			<br/>
                                      		</c:forEach>
                                      	</c:if>
                                      </div>
                         <%  } %>
                          			
                          			<br/>
                          			<br/>
                          			<br/>
                        </div>
								
						
                                                   
		<!-- END CONTENT -->
		<!-- BEGIN QUICK SIDEBAR -->
				<%-- <%@ include file="template/quick_sideBar.jsp" %> --%>
		<!-- END QUICK SIDEBAR -->
	</div>
	</div></div>
	<!-- END CONTAINER -->
	
	<!-- start lab modal	 -->
	<div id="labModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		class="modal">
		<form:form class="form-horizontal" method="post" modelAttribute="assignToLab"
			action="/AZHealthPortal/assignToLab/add" id="TokenAssignToLab">
			<div class="modal-dialog">
				<div class="modal-content panel-primary purple">
					<div class="modal-header panel-heading purple">
						<button id="" type="button" data-dismiss="modal"
							aria-hidden="true" class="close">�</button>
						<h4 id="myModalLabel" class="modal-title">
							Select Laboratory
						</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-lg-12">
								
								<div class="form-group">
									<div class="col-md-9">
										Token Id: <form:input value="${headTokenId}" path="tokenId" readonly="true"></form:input>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label">Select Your Lab: </label>
									<div class="col-md-9">
										<div class="input-group">
											
											<form:select path="labName">
												<form:option value="lab1">Lab 1</form:option>
												<form:option value="lab2">Lab 2</form:option>
												<form:option value="lab3">Lab 3</form:option>
												<form:option value="lab4">Lab 4</form:option>
												<form:option value="lab5">Lab 5</form:option>
												<form:option value="lab6">Lab 6</form:option>
											</form:select>
								
										</div>
									</div>
								</div>
								
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
						<button type="submit" class="btn btn-primary" value="Save changes"
							id="assignToLabBtn" name="assignToLabBtn">Save</button>
					</div>
				</div>
			</div>
		</form:form>
	</div>
	<!-- end lab modal -->
	
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
	  		
	  		$("#TokenAssignToLab").submit(function(){		
	  			console.log("TokenAssignToLab");
	      		$.ajax({
	      			url : "/AZHealthPortal/assignToLab/add",
	      			data : $("#TokenAssignToLab").serialize(),
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