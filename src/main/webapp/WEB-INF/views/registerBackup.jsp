
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>AZHelth Portal | User Login </title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="${pageContext.request.contextPath}/resources/assets/global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="${pageContext.request.contextPath}/resources/assets/pages/css/login.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/apps/css/app.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> </head>
    <!-- END HEAD -->


    
    <body class=" login">
        
        
        <!-- END LOGO -->
        <!-- BEGIN LOGIN -->
        <div class="content">
        
          
            <form:form id="loginForm" class="login-form" modelAttribute="RegisterUserRequest" method="POST" action="/AZHealthPortal/register/requestUser">
                
               <h3 class="form-title font-green">User Registration(Medi Provider/CMO/SRP)</h3>
               
                
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">User Type</label>
                    <form:select path="userType" class="form-control" required="required" id="userType">
                    	<option>- Select -</option>
                    	<form:option value="medicalUser">Medi Provider/ME</form:option> <!-- lab/doctor - Medical Examiner -->
                    	<form:option value="doctor">CMO</form:option> <!-- Company Doctor - cheif medical officer -->
                    	
                    </form:select>
                    </div>
                    
                 <!-- doctor user registration -->
                 <div id="Doctor" hidden="hidden">
                 	
                	<div class="form-group">
		                    <label class="">Full Name</label>
		                    <form:input path="doctorName" class="form-control form-control-solid placeholder-no-fix" id="doctorName" placeholder="Full Name" type="text"></form:input> </div>
		              
		                 <div class="form-group">
		                    <label class="">DOB</label>
		                    <form:input path="dob" class="form-control form-control-solid placeholder-no-fix" id="dob" placeholder="DOB" type="text"></form:input> </div>
		                
		                 <div class="form-group">
		                    <label class="">Telephone</label>
		                    <form:input path="doctorTelephone" class="form-control form-control-solid placeholder-no-fix" id="doctorTelephone" placeholder="Telephone" type="text"></form:input> </div>
		                
	                	<div class="form-group">
		                    <label class="">Email</label>
		                    <form:input path="doctorEmail" class="form-control form-control-solid placeholder-no-fix" id="doctorEmail" placeholder="Email" type="text" ></form:input> </div>
		                
	                	
               	</div> 
               	
               	<!-- Lab -->
               		   <div id="Lab" hidden="hidden">
	               		<div class="form-group">
		                    <label class="">Name of the Dispensary/Laboratory/Hospital</label>
		                    <form:input path="labName" class="form-control form-control-solid placeholder-no-fix" id="labName" placeholder="Name of the Dispensary/Laboratory/Hospital" type="text"></form:input> </div>
		              
		                 <div class="form-group">
		                    <label class="">Address of the Dispensary/Laboratory/Hospital</label>
		                    <form:input path="labAddress" class="form-control form-control-solid placeholder-no-fix" id="labAddress" placeholder="Address of the Dispensary/Laboratory/Hospital" type="text"></form:input> </div>
		                
		                <div class="form-group">
		                    <label class="">Medical Council Registered ?</label>
		                   	<form:select path="mediCouncilRegistered" type="int" class="form-control" id="mediCouncilRegistered">
	                    	<form:option value="">  - select -</form:option>
	                    	<form:option value="1">Yes</form:option> 
	                    	<form:option value="0">No</form:option>                    	
	                    	
	                    	</form:select>         
	                	</div>
	                	
	                	<div class="form-group">
		                    <label class="">Date of Registration</label>
		                    <form:input path="dateOfRegistration" class="form-control form-control-solid placeholder-no-fix" id="dateOfRegistration" placeholder="Date of Registration" type="text" ></form:input> </div>
		                
	                	 <div class="form-group">
		                    <label class="">Telephone No/Mobile</label>
		                    <form:input path="labTelephone" class="form-control form-control-solid placeholder-no-fix" id="labTelephone" placeholder="Telephone No/Mobile" type="text" ></form:input> </div>
		                
		                <div class="form-group">
		                    <label class="">Email</label>
		                    <form:input path="labEmail" class="form-control form-control-solid placeholder-no-fix" id="labEmail" placeholder="Email" type="text"></form:input> </div>
               	 
               	 
               	 	</div>
               	
               	
               	
               
                   
                <div class="form-actions">
                  <!--   <button type="submit" class="btn green uppercase">Login</button> -->
                    <input type="submit" class="btn green uppercase" value="Login"/>                    
                   	<a href="${pageContext.request.contextPath}/user/changePassword" id="forget-password" class="forget-password" hidden="hidden">Can't Access your account?</a>     
                 </div>
                
                  <div class="create-account">
                  <!--   <button type="submit" class="btn green uppercase">Login</button> -->
                     <a href="${pageContext.request.contextPath}/register/getRegisterPage" class="btn green uppercase">Create an account</a>                   
                      <!--   register/userRegistration -->
                  
               	 </div>
                
            </form:form>
            
             	
            <!-- END LOGIN FORM -->
            
        </div>
        <!-- begin footer -->
        <%@include file="template/footer.jsp"%>
		<!-- end footer -->
		
        <!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
        <!-- BEGIN CORE PLUGINS -->
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
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="${pageContext.request.contextPath}/resources/assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath}/resources/assets/pages/scripts/login.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <!-- END THEME LAYOUT SCRIPTS -->
        
         <%@include file="template/template_script.jsp" %> 
     
     </body>
         
    <script type="text/javascript">

    $(document).ready(function(){
    	$("#Lab").hide();
		$("#Doctor").hide();
    });
    

    /* $("input").keypress(function(event) {
        if (event.which == 13) {
            event.preventDefault();
            $("form").submit();
        }
    }); */

    $(document).on('change', '#userType', function () {	
		var option = $('#userType').find('option:selected').val();
		
		
		if(option == "medicalUser"){
			$("#Lab").show();
			$("#Doctor").hide();	
			$('#doctorName').removeAttr("required");
			$('#dob').removeAttr("required");
			$('#doctorTelephone').removeAttr("required");
			$('#doctorEmail').removeAttr("required");
			
			/* $('#doctorName').removeAttr("path");
			$('#dob').removeAttr("path");
			$('#doctorTelephone').removeAttr("path");
			$('#doctorEmail').removeAttr("path");
			
			//add attribute path
			$('#labName').attr('path', 'labName');
			$('#labAddress').attr('path', 'labAddress');
			$('#mediCouncilRegistered').attr('path', 'mediCouncilRegistered');
			$('#dateOfRegistration').attr('path', 'mediCouncilRegistered');
			$('#labTelephone').attr('path', 'labTelephone');
			$('#labEmail').attr('path', 'labEmail'); */
			
			$('#labName').attr('required', 'required');
			$('#labAddress').attr('required', 'required');
			$('#mediCouncilRegistered').attr('required', 'required');
			$('#dateOfRegistration').attr('required', 'required');
			$('#labTelephone').attr('required', 'required');
			$('#labEmail').attr('required', 'required');
				
		}
		else if(option == "doctor"){
			
			$("#Doctor").show();
			$("#Lab").hide();			
			
			$('#labName').removeAttr("required"); 
			$('#labAddress').removeAttr("required");
			$('#mediCouncilRegistered').removeAttr("required");
			$('#dateOfRegistration').removeAttr("required");
			$('#labTelephone').removeAttr("required");
			$('#labEmail').removeAttr("required");
			
		/* 	$('#labName').removeAttr("path"); 
			$('#labAddress').removeAttr("path");
			$('#mediCouncilRegistered').removeAttr("path");
			$('#dateOfRegistration').removeAttr("path");
			$('#labTelephone').removeAttr("path");
			$('#labEmail').removeAttr("path");
			 */
		
			$('#doctorName').attr('required', 'required');
			$('#dob').attr('required', 'required');
			$('#doctorTelephone').attr('required', 'required');
			$('#doctorEmail').attr('required', 'required'); 
			
			//add attribute path
			/* $('#doctorName').attr('path', 'doctorName');
			$('#dob').attr('path', 'dob');
			$('#doctorTelephone').attr('path', 'doctorTelephone');
			$('#doctorEmail').attr('path', 'doctorEmail'); 
			 */
			
		}else{
			$("#Lab").hide();
			$("#Doctor").hide();
			
			$('#labName').removeAttr("required");
			$('#labAddress').removeAttr("required");
			$('#mediCouncilRegistered').removeAttr("required");
			$('#dateOfRegistration').removeAttr("required");
			$('#labTelephone').removeAttr("required");
			$('#labEmail').removeAttr("required");
			
			$('#doctorName').removeAttr("required");
			$('#dob').removeAttr("required");
			$('#doctorTelephone').removeAttr("required");
			$('#doctorEmail').removeAttr("required");
		}	
		
    });

    </script>
         
   
    
    
    
    
    
 

</html>