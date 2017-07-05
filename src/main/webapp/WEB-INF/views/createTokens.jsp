<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
							New Token Profile
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
					 <form:form role="form" method="post" action="/AZHealthPortal/token/addToken" id="newTokenForm" modelAttribute="token">
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="user" class="table table-bordered table-striped">
                                        <tbody>
                                            
                                             <tr>
                                                <td colspan="2" style="background-color: #d6dbdb;"> Customer Informations: </td>
                                              </tr>
                                           
                                             <tr>
                                                <td> Customer Name: <span style="color: red;">*</span> </td>
                                                <td>
                                                    <form:input path="customerName" type="text" placeholder="Customer Name" class="form-control" required="required" ></form:input>
                                                </td>
                                               
                                            </tr>
                                            
                                            <tr>
                                                <td> NIC: <span style="color: red;">*</span></td>
                                                <td>
                                                    <form:input path="nic" id="nicardNo" type="text" placeholder="NIC No" class="form-control" required="required" data-toggle="masked" data-inputmask="'mask': '999999999v'" ></form:input>
                                               		                                               		 
                                    					<span class="help-block">'help block: 123456789v'</span>
                                               		
                                                </td>
                                                
                                            </tr>
                                             <tr>
                                                <td> Policy/Proposal No: <span style="color: red;">*</span> </td>
                                                <td>
                                                    <form:input path="proposalNo" type="text" placeholder="Policy/Proposal No" class="form-control" required="required"></form:input>
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
	                                                        <option>Select</option>
	                                                        <form:option value="Standard Medical Reports">Standard Medical Reports</form:option>
	                                                        <form:option value="Special Medical Reports">Special Medical Reports</form:option>
	                                                        <form:option value="Other Medical Reports">Other</form:option>	                                                        	                                                       
	                                                    </form:select>
                                                </td>
                                                
                                            </tr>
                                             
                                            <tr>
                                                <td colspan="2" style="background-color: #d6dbdb;"> Medical Reports Informations: </td>
                                             </tr>
                                            
                                             </tbody>
                                          </table>
                                            <!-- start 1nd hidden table --> 
                                           <div class="row" id="Standard_Medical_Reports" hidden="hidden">
                                           		
	                               				<div class="col-md-6">                               				
	                               					<table  class="table table-bordered table-striped"> 
	                               					                                       		
		                                        		<tbody>
		                                        		<th>Standard Medical Reports</th> 
														  <c:forEach begin="0" end="7" var="i" items="${medicalReportList}" varStatus="status">
																<tr><td><label><form:checkbox path="medicalReports" value="${i.reportName}"></form:checkbox>${i.reportName}</label></td></tr>
														 </c:forEach>                                           		 
		                                            	</tbody>
	                                           		</table>
                               					</div>
                               					<div class="col-md-6">
                               						<table  class="table table-bordered table-striped">
                                        				<tbody>
                                        				<th>Standard Medical Reports </th>
													  		<c:forEach begin="8" var="i" items="${medicalReportList}" varStatus="status">
																<tr><td><label><form:checkbox path="medicalReports" value="${i.reportName}"></form:checkbox>${i.reportName}</label></td></tr>
													 		</c:forEach>
                                            			</tbody>
                                           			</table>
                               					</div>
                               				</div>
                                       
                                          
                                            <!-- end 1nd hidden table --> 
                                            
                                            <!-- start 2nd hidden table --> 
                                             <table id="special_medical_reports" class="table table-bordered table-striped" hidden="hidden">
                                        		<th>Special Medical Reports</th>
                                        		<tbody>
                                           
                                            	<tr>                                                
                                                 <td><label><form:checkbox path="specialMedicalReports" value="specialMedicalReports1"></form:checkbox>Special Medical Reports 1</label></td>
                                                 <td><label><form:checkbox path="specialMedicalReports" value="specialMedicalReports2"></form:checkbox>Special Medical Reports 2 </label></td>
                                                
                                                </tr>
                                                <tr>
                                                 
                                                   <td><label><form:checkbox path="specialMedicalReports" value="specialMedicalReports3"></form:checkbox>Special Medical Reports 3</label></td>
                                                   <td><label><form:checkbox path="specialMedicalReports" value="specialMedicalReports4"></form:checkbox>Special Medical Reports 4 </label></td>
                                                
                                                </tr>
                                           	</tbody>
                                          </table>
                                          <!-- end 2nd hidden table -->
                                          
                                          <!-- start 3nd hidden table --> 
                                             <table id="Other_Medical_Reports" class="table table-bordered table-striped" hidden="hidden">
                                        		<th>Other Medical Reports</th>
                                        		<tbody>
                                        			<tr>
		                                                <td style="width:15%">Reports Name:</td>
		                                                <td style="width:50%">
                                                    	<form:textarea path="otherMedicalReports" type="text" placeholder="Other reports" class="form-control"></form:textarea>
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
                                             			<option value="1">Labs&Hospital</option>
                                             			<option value="2">Doctor</option>
                                             			
                                             		</select>
                                             	</td>
                                             </tr>
                                            
                                          
                                          	<tr>
                                                <td> Assign To Lab: <span style="color: red;">*</span>  </td>
                                               
                                                <td>
                                                 
                                                <form:select id="selectlab" path="labId" required="required" class="form-control select2me">
                                                   <form:option value="">- Select -</form:option>
                                               <c:if test="${!empty labList}">
													<c:forEach var="i" items="${labList}" varStatus="status">
														  	<form:option value="${i.id}">${i.labName}</form:option>
													</c:forEach>
												</c:if> 
												</form:select>
												
												
                                                </td>    
                                               
                                            </tr>
                                            
                                            <tr>
                                                <td> Priority Level: </td>
                                                <td>
                                                    
                                                	 <form:select path="priority" class="form-control">
	                                                        <form:option value="">- Select -</form:option>
	                                                        <form:option value="low">Low</form:option>
	                                                        <form:option value="normal">Normal</form:option>
	                                                        <form:option value="high">High</form:option>
	                                                        <form:option value="emergency">Emergency</form:option>	                                                        	                                                       
	                                                </form:select>
                                                </td>                                      
                                                
                                            </tr>
                                            
                                          
                                          <tr>
                                                <td colspan="2" style="background-color: #d6dbdb;"> Medical Reports Informations: </td>
                                             </tr>
                                           <tr>
                                          	<td> Appointment Date: </td>
                                                <td>
                                                	<div class="input-group input-medium">
                                                    <form:input path="appointmentDate" type="text" placeholder="Appointment Date" class="form-control date date-picker" data-date-format="dd-mm-yyyy" data-date-start-date="+0d"></form:input>
                                                	 <span class="input-group-btn"><button class="btn default" type="button">
                                                       <i class="fa fa-calendar"></i>
                                                      </button>
                                                     </span>
                                                    </div>
                                                    
                                                </td>
                                          </tr>
                                          <tr>
                                          	 <td> Appointment Time: </td>
                                                <td>
                                                
                                                <div class="input-group input-medium">
                                                    <form:input path="appointmentTime" type="text" placeholder="Appointment Time" class="form-control timepicker timepicker-default" ></form:input>
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
                                                    <form:textarea path="tokenCreateComment" type="text" placeholder="Your Comments" class="form-control"></form:textarea>
                                                </td>                                               
                                            </tr> 
                                             <tr>
                                                <td style="width:15%">Special Instructions to Lab:  </td>
                                                <td style="width:50%">
                                                    <form:textarea path="specialInstructions" type="text" placeholder="Add Special Instructions" class="form-control"></form:textarea>
                                                </td>                                               
                                            </tr> 
                                           <tr>
                                                <td style="width:15%">Remarks:  </td>
                                                <td style="width:50%">
                                                    <form:textarea path="remarks" type="text" placeholder="Add Remarks" class="form-control"></form:textarea>
                                                </td>                                               
                                            </tr>
                                                                          
                                        </tbody>
                                    </table>
                                      
                                    
                              
                            </div>
                           
                            </div>
                            
                            <button type="submit" class="addTokenBtn btn btn-primary" value="Save"
							 name="addTokenBtn" id="submitBtn">Save</button>
							 
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
   			
   			if(option == "1" || option=="2" || option=="3" || option=="4"){
   				//alert(option);
   				
   				var query = "/AZHealthPortal/token/getLabListByCategory/"+ option;
                $.get(query,function(data,status){
                   
                  var $select = $('#selectlab');
                  $select.empty();
                  $('#selectlab').append(data);                      
                });     
   			}
        	
        });
       
       
        document.getElementById("nicardNo").onblur = function() {validateNic()};//Write something in the input field, and then click outside the field to lose focus (blur).
     	
     	function validateNic() {
     		var nic = document.getElementById("nicardNo").value;	
     		
     		 var lastChar = nic.charAt(nic.length - 1); // this will be return last charactor	
     		
     		 /* if (nic.length < 10 || nic.length > 10) {
     	            alert("Invalid length of NIC. Please check again.");
     	        }
     		 else if(nic.length == 10){
     			 if (lastChar >= '0' && lastChar <= '9') {
     			     // it is a number
     				 alert("Invalid Id number. check last character again.");
     			 }  
     			 
     		 }   */
     		 
     		 
     		if (nic.length < 10 || nic.length > 12 || nic.length == 11) {
 	            alert("Invalid length of NIC. Please check again.");
 	        }
 		 else if(nic.length == 10 || nic.length == 12 ){
 			 if (lastChar >= '0' && lastChar <= '9') {
 			     // it is a number
 				 alert("Invalid Id number. check last character again.");
 			 }  
 		 } 
     		 
     	}
     	
     	
       
       </script>

</body>
</html>