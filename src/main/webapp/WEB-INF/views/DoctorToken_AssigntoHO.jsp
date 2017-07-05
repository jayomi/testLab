<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
 <%@include file="template/template_style.jsp" %>
  <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="${pageContext.request.contextPath}/resources/assets/global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
 
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
			<!-- BEGIN PAGE ACTIONS -->
			<!-- DOC: Remove "hide" class to enable the page header actions -->


		<%-- 	<%@ include file="template/page_action.jsp"%> --%>

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
			<div class="page-sidebar navbar-collapse collapse">
			


				<%-- <%@ include file="template/sidebar_menu.jsp"%>
 							--%>
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
						
					</div>
					<!-- END PAGE TITLE -->
					
				</div>
				<!-- END PAGE HEAD-->
				<!-- BEGIN PAGE BREADCRUMB -->
				<ul class="page-breadcrumb breadcrumb">
					<li><a href="${pageContext.request.contextPath}/token/getTokens">Tokens</a> <i class="fa fa-long-arrow-right"></i>
					</li>
					<li><span class="active">${headTokenId }</span></li>
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
                                                    <a href="javascript:;" id="status" data-type="select" data-pk="1" data-value="0" data-source="/status" data-original-title="Select status"> ${headToken.tokenStatus } </a>
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
                                            	<td>Assign To Doctor Report : </td>
                                            	<td>${headToken.assignToDoctorReport}</td>
                                            </tr>
                                            <tr>
                                            	<td>Doctor Comment : </td>
                                            	<td>${headToken.doctorComment}</td>
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
                                                    <a href="javascript:;" id="comments" data-type="textarea" data-pk="1" data-placeholder="Your comments here..." data-original-title="Enter comments"> ${headToken.lastResponse}</a> 
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
                                                    <a href="javascript:;" style='color:red;' id="comments" data-type="textarea" data-pk="1" data-placeholder="Your comments here..." data-original-title="Enter comments"> ${headToken.specialInstructions}</a> 
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
                          
                         <%--  <div class="row">
                          	<label class="btn sbold green">Upload Medical Reports</label>
                          	<!-- href="<c:url value='/assignToLab/getFileUploadPage/${headTokenId}'/>" -->
                          	
                          	<form:form id="uploadReportsToLab" class="form-horizontal" method="post" modelAttribute="reportsFromLab"
			action="/AZHealthPortal/assignToLab/addReports/${headTokenId }" enctype="multipart/form-data">
                      			<div class="form-group">
                      			
                      			 <form:input type="text" path="tokenId" value="${headTokenId }" hidden="hidden" />
                      				
                      				
									<label class="col-md-3 control-label">Select Medical Reports: </label>
									<div class="col-md-9">
										<div class="input-group">
																				
											
											<c:set var="reports" value="${fn:split(headToken.medicalReports, ',')}" /> <!-- all reports -->											
											<c:set var="uploadedReports" value="${fn:split(uploadedReports, ',')}" />
											<c:set var="notuploadReports" value="${fn:split(notUploadedReports, ',')}" />
											
											
											<c:if test="${!empty uploadedReports}">
												<c:forEach var="i" items="${uploadedReports}" varStatus="status">																
												<input type="checkbox" class="checkboxes" value="${i}" checked="checked" disabled="disabled" /><c:out value="${i}" /><br/>												
												</c:forEach>
											</c:if>
											<c:if test="${empty uploadedReports}">
												<label class="col-md-3 control-label">Still not uploading Reports. </label>
											</c:if>
											
											<c:forEach var="i" items="${notuploadReports}" varStatus="status">																
												<form:checkbox path="report" class="checkboxes" value="${i}" /><c:out value="${i}" /><br/>												
											</c:forEach> 
											
											<div id="changeImageRow" class="changeImageRow row">										
												<div id="image-holder"></div>
												<input id="files" name="files" type="file" multiple="true" class="imageFile btn sbold green" required="required"/><br/>										  
												<input id="btnUpload" class="btnUpload btn btn-labeled btn-primary  btn-xs" type="submit" upload="no" value="Upload Files">
												
											</div>								
								
										</div>
									</div>
								</div>
                          	</form:form>
                          	
                          </div> --%>                          
                           
                          
                        </div>
                       <!-- End PROFILE SIDEBAR -->
								
						
                                                   
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
							aria-hidden="true" class="close">×</button>
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
									<label class="col-md-3 control-label">Select Medical Reports: </label>
									<div class="col-md-9">
										<div class="input-group">
										<%-- 	${headToken.medicalReports} --%>											
											
											<c:set var="reports" value="${fn:split(headToken.medicalReports, ',')}" />
												<c:forEach var="i" items="${reports}" varStatus="status">												
												<input type="checkbox" class="checkboxes" value="${i}" /><c:out value="${i}" /><br/>
												
											</c:forEach>
										
								
										</div>
									</div>
								</div>
								
								
								<div class="form-group">
									<label class="col-md-3 control-label">Select Medical Reports: </label>
									<div class="col-md-9">
										<div class="input-group">
										<%-- 	${headToken.medicalReports} --%>
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
								
							<div class="form-group">
								<%-- <form id="fileupload" action="../assets/global/plugins/jquery-file-upload/server/php/" method="POST" enctype="multipart/form-data">
                             
                            	</form> --%>
								
								<div id="changeImageRow" class="changeImageRow row">
									<form id="fileForm">
										<div id="image-holder"></div>
										<input id="files" name="files" type="file" multiple="true" class="imageFile" required="required"/>
										  
										<button id="btnUpload" class="btnUpload btn btn-labeled btn-primary  btn-xs" type="button" upload="no">Upload File</button>
										
									</form>
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
               
               <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/js/vendor/tmpl.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/js/vendor/load-image.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/js/vendor/canvas-to-blob.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/js/jquery.iframe-transport.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-process.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-image.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-audio.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-video.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-validate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-ui.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/pages/scripts/form-fileupload.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
               
               
               
                
       <!-- END SCRIPT -->

	<script type="text/javascript">
	
	 $( document ).ready(function() {
    	    $('.page-content-wrapper .page-content ').removeClass();
    	});
		 
		
		    </script>           
              
              
</body>
</html>