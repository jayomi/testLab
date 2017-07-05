
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
        <!-- BEGIN LOGO -->
        <div class="logo">
            <a href="index.html">
                <img src="${pageContext.request.contextPath}/resources/assets/pages/img/logo-big.png" width="250" alt="test" /> </a>
                <h2>${errorMsg1}</h2>
        </div>
        
        <!-- END LOGO -->
        <!-- BEGIN LOGIN -->
        <div class="content">
        
            <!-- BEGIN LOGIN FORM -->
            <%-- <form:form id="loginForm" class="login-form" method="post" action="/AZHealthPortal/login/add" modelAttribute="loginUser"> --%>
            
            
            <c:if test="${!empty regMsg}">
            		<label>${regMsg}</label>
            </c:if>
            
             <c:if test="${!empty loginMsg}">
            		<label>${loginMsg}</label>
            </c:if>
            <c:if test="${!empty PasswordChangMsg}">
            		<label>${PasswordChangMsg}</label>
            </c:if>
            <c:if test="${!empty passwordChangeMsg}">
            		<label>${passwordChangeMsg}</label>
            </c:if> 
            
            <form id="loginForm" class="login-form" modelAttribute="loginUser" method="POST" action="/AZHealthPortal/login/add">
                
                <h3 class="form-title font-green">Sign In</h3>
                <div class="alert alert-danger display-hide">
                    <button class="close" data-close="alert"></button>
                    <span> Enter any username and password. </span>
                </div>
                
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">Login Type</label>
                    <select class="form-control" required="required" id="loginType" name="userType">
                    	<option>- Select -</option>
                    	<option value="medicalUser">Medi Provider/ME</option> <!-- lab/doctor - Medical Examiner -->
                    	<option value="cmo">CMO</option> <!-- Company Doctor - cheif medical officer -->
                    	<option value="tab">Advisor</option> <!-- tab users -->
                    	<option value="bop">BOP</option> <!-- Branch and operation -->
                    	<option value="srp">SRP</option> <!-- Branch and operation -->
                    </select>
                    </div>
                    
                <div id="bopLogin" hidden="hidden">
	                <div class="form-group">
	                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
	                    <label class="control-label visible-ie8 visible-ie9">Username</label>
	                    <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" name="username" id="BPO_username" /> </div>
	                <div class="form-group">
	                    <label class="control-label visible-ie8 visible-ie9">Password</label>
	                    <input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="Password" name="password" id="BPO_password" /> </div>
	                    
                </div> 
                
                <div id="tabLogin" hidden="hidden">
                
                	<div class="form-group">	                   
	                    <label class="control-label visible-ie8 visible-ie9">Agent Code</label>
	                    <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="AgentCode/UserName" name="AgentCode" id="tab_AgentCode" /> </div>
                </div>
                   
                <div class="form-actions">
                  <!--   <button type="submit" class="btn green uppercase">Login</button> -->
                    <input type="submit" class="btn green uppercase" value="Login"/>                      
                   	<a href="${pageContext.request.contextPath}/user/requestPasswordPage" id="forget-password" class="forget-password" hidden="hidden">Can't Access your account?</a>     
                  
                </div>
                
                
                
               
                
                  <div class="create-account">
                  <!--   <button type="submit" class="btn green uppercase">Login</button> -->
                     <a href="${pageContext.request.contextPath}/register/getRegisterPage" class="btn green uppercase">Create an account</a>                   
                      <!--   register/userRegistration -->
                  
               	 </div>
                
            </form>
            
             	
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


    $("input").keypress(function(event) {
        if (event.which == 13) {
            event.preventDefault();
            $("form").submit();
        }
    });
    
    $(document).ready(function(){
    	$('#forget-password').hide();
    });

    $(document).on('change', '#loginType', function () {	
		var option = $('#loginType').find('option:selected').val();
		
		
		if(option == "medicalUser" || option== "cmo" || option=="bop" || option=="srp"){
			$("#bopLogin").show();
			$("#tabLogin").hide();	
			$('#BPO_username').attr('required', 'required');
			$('#BPO_password').attr('required', 'required');
			$("#tab_AgentCode").removeAttr("required");
			
		}
		else if(option == "tab"){
			$("#bopLogin").hide();
			$("#tabLogin").show();
			$("#tab_AgentCode").attr('required', 'required');
			$('#BPO_username').removeAttr("required");
			$('#BPO_password').removeAttr("required");
			
		}else{
			$("#bopLogin").hide();
			$("#tabLogin").hide();
			$('#BPO_username').removeAttr("required");
			$('#BPO_password').removeAttr("required");
			$("#tab_AgentCode").removeAttr("required");
			
		}
		
		if(option == "medicalUser" || option== "cmo" || option== "srp" ){
			$('#forget-password').show();
		}else{
			$('#forget-password').hide();
		}
		
    });

    </script>

</html>