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
							<div>Token Profile <small>user account page</small>
								<%-- <div style="float: right; margin-left:500px;">
									<a href="<c:url value='/assignToDoctor/getFileUploadPage/${headTokenId}'/>" class="btn sbold green">Upload Reports</a>
									
								</div> --%>
							</div>
						</h1>
					</div>
					<!-- END PAGE TITLE -->
					
				</div>
				<!-- END PAGE HEAD-->
				<!-- BEGIN PAGE BREADCRUMB -->
				<ul class="page-breadcrumb breadcrumb">
					<li><a href="${pageContext.request.contextPath}/token/getTokens">Tokens</a> <i class="fa fa-long-arrow-right"></i>
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
                                                <td style="width:15%"> Customer Name:  </td>
                                                <td style="width:50%">
                                                    <a href="javascript:;" id="username" data-type="text" data-pk="1" data-original-title="Enter username">${headToken.customerName } </a>
                                                </td>
                                               
                                            </tr>
                                            <tr>
                                                <td> NIC : </td>
                                                <td>
                                                    <a href="javascript:;" id="firstname" data-type="text" data-pk="1" data-placement="right" data-placeholder="Required" data-original-title="Enter your firstname">${headToken.nic }  </a>
                                                </td>
                                               
                                            </tr>
                                            
                                            <tr>
                                                <td> Proposal No : </td>
                                                <td>
                                                    <a href="javascript:;" id="firstname" data-type="text" data-pk="1" data-placement="right" data-placeholder="Required" data-original-title="Enter your firstname">${headToken.proposalNo }  </a>
                                                </td>
                                               
                                            </tr> 
                                             <tr>
                                                <td> Medical Reports: </td>
                                                <td>
                                                    <a href="javascript:;" id="fruits" data-type="checklist" data-value="2,3" data-original-title="Select fruits">${headToken.medicalReports} </a>
                                                </td>                                                
                                            </tr>     
                                            <tr>
                                                <td> From Lab : </td>
                                                <td>
                                                    <a href="javascript:;" id="firstname" data-type="text" data-pk="1" data-placement="right" data-placeholder="Required" data-original-title="Enter your firstname">${headToken.labName }  </a>
                                                </td>
                                               
                                            </tr>                                            
                                            <tr>
                                                <td> From Doctor : </td>
                                                <td>
                                                    <a href="javascript:;" id="firstname" data-type="text" data-pk="1" data-placement="right" data-placeholder="Required" data-original-title="Enter your firstname">${headToken.doctorName }  </a>
                                                </td>
                                               
                                            </tr>                                  
                                                          
                                        </tbody>
                                    </table>
                                    
                                    
                                </div>
                                
                                <!-- 2nd table -->
                                <div class="col-md-6">
                                    <table id="user" class="table table-bordered table-striped">
                                        <tbody>
                                        	 <tr>
                                                <td style="width:15%">Token Status :  </td>
                                                <td style="width:50%">
                                                    <a href="javascript:;" id="username" data-type="text" data-pk="1" data-original-title="Enter username" style="color: red;">${headToken.tokenStatus } </a>
                                                </td>
                                               
                                            </tr>
                                              <tr>
                                                <td style="width:15%">Created Date: :  </td>
                                                <td style="width:50%">
                                                    <a href="javascript:;" id="username" data-type="text" data-pk="1" data-original-title="Enter username">${headToken.createdDate } </a>
                                                </td>
                                               
                                            </tr>
                                            <tr>
                                                <td> Last Message: : </td>
                                                <td>
                                                    <a href="javascript:;" id="firstname" data-type="text" data-pk="1" data-placement="right" data-placeholder="Required" data-original-title="Enter your firstname">${headToken.lastMessage }  </a>
                                                </td>
                                               
                                            </tr>
                                            
                                            <tr>
                                                <td> Last Response: </td>
                                                <td>
                                                    <a href="javascript:;" id="firstname" data-type="text" data-pk="1" data-placement="right" data-placeholder="Required" data-original-title="Enter your firstname">${headToken.lastResponse }  </a>
                                                </td>
                                               
                                            </tr> 
                                                                             
                                                          
                                        </tbody>
                                    </table>
                                    
                                    
                                </div>
                                <!-- end 2nd table -->
                            </div>
                            
                            <h1><div>${reportStatus}</div></h1>                            
                            
                          	
                          	<table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
                                        <thead>
                                            <tr>
                                                <th>
                                                <input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /> </th>
                                                <th> Report </th>
                                                <th>  </th>
                                               
                                            </tr>
                                        </thead>
                                        <tbody>                       
                                         
                                            <c:if test="${!empty fileNameList}">
                                            <h2><label class="col-md-3 control-label">Lab Reports: </label></h2>
                                            <c:forEach var="i" items="${fileNameList}" varStatus="status">																
												<tr class="odd gradeX">
												 <td>
                                                   <input type="checkbox" class="checkboxes" value="${i}" checked="checked" disabled="disabled" /></td>
                                                	<td> <c:out value="${i}" /> </td>
                                               
                                                <td><a href="<c:url value='/assignToLab/downloadReport/${i}/${headTokenId }' />"> Download</a></td>
												</tr>
											</c:forEach>
                                            </c:if>
                                        </tbody>
                                    </table>
                                    
            
                      		
                      		<br/>
                      		<br/>
                      		
                      		
                      		<fieldset>
                      			 <legend>SRP Statement:</legend>
                      			 	<c:if test="${!empty srpComment}">
                      			 	<label>${srpComment} </label>
                      			 	</c:if>   
                      		</fieldset>
                      		
                      		<br/>
                      		<br/>
                      		
                       <form class="form-horizontal" method="post" 
			action="/AZHealthPortal/assigToSRP/assignToDoctor/${headTokenId }" modelAttribute="assignToDoctor">
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="user" class="table table-bordered table-striped">
                                        <tbody>
                                            <tr>
                                                <td style="width:15%"> Add Comment: <span style="color: red;">*</span>  </td>
                                                <td style="width:50%">
                                                    <textarea path="adminComment" name="adminComment" type="text" placeholder="Your Comment" class="form-control"></textarea>
                                                </td>                                               
                                            </tr>                                  
                                            
                                            <tr>
                                                <td> Change Status:  </td>
                                                <td>                                                
	                                                    <select path="tokenStatus" id="assignType" name="tokenStatus">
	                                                        <option>Select</option>
	                                                        <option value="toDoctor">Assign To Doctor</option>
	                                                        <option value="closed">closed token </option>
	                                                                                                             
	                                                    </select>                                                	
                                                </td>
                                                
                                            </tr> 
                                             <tr id="selectDoctor" hidden="hidden">
		                                            <td>
		                                            	Select Doctor: 
		                                            </td>
			                                         <td>
		                                            	<c:if test="${!empty doctorList}">
															<select path="doctorId" name="doctorId"> <!-- doctorName -->
																<option value="">- select -</option>
																<c:forEach var="i" items="${doctorList}" varStatus="status">																
																
																<option value="${i.id}">${i.labName} , ${i.fullName}</option>																				
																									
																</c:forEach>
															</select>	
																
																
															</c:if>
															
		                                            </td>
                                            </tr>
                                            
                                         <tr id="selectReport" hidden="hidden">
                                            	<td>select report
                                            	</td>
                                           <td>
                                            	
			                                 <table class="table table-striped table-bordered table-hover table-checkable order-column" id="sample_1">
			                                        <thead>
			                                            <tr>
			                                                <th>
			                                                                                            
			                                                 <th></th>
			                                               
			                                            </tr>
			                                        </thead>
			                                        <tbody>                       
			                                         
			                                            <c:if test="${!empty fileNameList}">
			                                            <c:forEach var="i" items="${fileNameList}" varStatus="status">																
															<tr class="odd gradeX">
															 <td>
			                                                 
			                                                  <%-- <form:checkbox path="assignToDoctorReport" class="checkReport checkboxes" value="${i}" /> --%>
			                                                  <input type="checkbox" path="assignToDoctorReport" name="assignToDoctorReport" class="checkReport checkboxes" value="${i}"  />
			                                                 </td>                                                	
			                                                	<td> <c:out value="${i}" /> </td>                                	
			                                                
															</tr>
														</c:forEach>
			                                            </c:if>
			                                        </tbody>
			                                    </table>
			                                    
			                                   </td>
                                            </tr>  
                                            
                                            <tr><td></td>
                                             <td><input class="btn btn-labeled btn-primary btn-xs" type="submit" value="Submit">
                                            </td></tr>
                                                                          
                                        </tbody>
                                    </table>
                                    
                                    
                                </div>
                            </div>
                            </form>
                            
                        </div>
								
						
                                                   
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
	
    
    
    
	  $(document).on('change', '#assignType', function () {
		  
 			var option = $('#assignType').find('option:selected').val();
 			
 			if(option == "toDoctor"){//doctor
 				//alert(option);
 				$('#selectDoctor').show();
 				$('#selectReport').show();
 				
 				
 			}else{
 				$('#selectDoctor').hide();
 				$('#selectReport').hide();
 			}
		
	  });
		
    </script>           
              
</body>
</html>