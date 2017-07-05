
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.6
Version: 4.5.4
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>AZHealthPortal | Coming Soon</title>
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
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="${pageContext.request.contextPath}/resources/assets/global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/assets/global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="${pageContext.request.contextPath}/resources/assets/pages/css/coming-soon.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> </head>
        <link href="${pageContext.request.contextPath}/resources/assets/apps/css/app.css" rel="stylesheet" type="text/css" />
    <!-- END HEAD -->

    <body>
        <div class="container">
            <div class="row firstPageHeader">
            	<div style = "height: 150px; width: 1150px margin-left: auto; margin-right: auto;";>
	                	<div class="col-md-6 coming-soon-header">
	                    <a class="brand" href="index.html">
	                        <img class="firstPageAppLogo table-responsive" src="${pageContext.request.contextPath}/resources/assets/pages/img/logo-big.png" alt="logo" /> </a>
	                	</div>
	                 	<div class="col-md-6 coming-soon-header">
	                    <a class="brand" href="index.html">
	                        <img class="firstPageAllianzLogo table-responsive" src="${pageContext.request.contextPath}/resources/assets/layouts/layout4/img/allianz-logo/allianzLogo.png" alt="logo" /> </a>
	                	</div>
	              </div>
            </div>
            
           <div style="background-color:#cccccc">
            <div class="row firstPageWelcomeMsg">
                <div class="coming-soon-content">
                    <h1>Welcome to the Allianz Health Partner Portal</h1>
                     <p> With online connectivity, simplified features and real time updating, Allianz Health Partner Portal is intended to help you to deliver differentiated value and referring medical examinations results and opinions faster than ever before. This will enable you to win new clients by being a technological and innovative Health Care provider within your competition with the new technology advancements. </p>
                   <!--  <p>Allianz Lanka has Introduced for the first time in Sri Lanka the Health Care Partner
Portal bringing customer, Health Care Provide, Allianz under one platform</p> -->
                    <br>
                    <div class="labportalSignIn"><a href="${pageContext.request.contextPath}/login/" class="btn green">Sign In</a></div>
                   
                    
                 
                </div>
                <%-- 
                  <div class="row table-responsive coming-soon-content">
            	                
                        <img class="firstPageBigImg" src="${pageContext.request.contextPath}/resources/assets/layouts/layout4/img/allianz-logo/labportalBig.jpg" alt="Biglogo" />
                	
            	</div> --%>
            	
            	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		              <!-- Indicators -->
		              <ol class="carousel-indicators">
		                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					    <li data-target="#myCarousel" data-slide-to="1"></li>
					    <li data-target="#myCarousel" data-slide-to="2"></li>
					    <li data-target="#myCarousel" data-slide-to="3"></li>
					    <li data-target="#myCarousel" data-slide-to="4"></li>
		
		              </ol>
		
		              <!-- Wrapper for slides -->
		              <div class="carousel-inner">
			                <div class="item active">
			                  <img class= "cover" src="${pageContext.request.contextPath}/resources/assets/pages/img/firstPage/Health6.jpg" alt="Health6">
			               
			               	
			                </div>
			
			                <div class="item">
			                  <img class= "cover1" src="${pageContext.request.contextPath}/resources/assets/pages/img/firstPage/Health2.jpg" alt="Health2">
			                </div>
			
			                <div class="item">
			                  <img class= "cover2" src="${pageContext.request.contextPath}/resources/assets/pages/img/firstPage/Health3.jpg" alt="Health3">
			                </div>
			                
			                 <div class="item">
			                  <img class= "cover3" src="${pageContext.request.contextPath}/resources/assets/pages/img/firstPage/Health4.jpg" alt="Health4">
			                </div>
			
			                <div class="item">
			                  <img class= "cover4" src="${pageContext.request.contextPath}/resources/assets/pages/img/firstPage/Health5.jpg" alt="Health5">
			                </div>
		
		
		                </div>

           		 </div>
           		 
           		 <div class="row">
                	<div class="col-md-12 coming-soon-footer"> 2017 &copy; Allianz Life Insurance Lanka Ltd. </div>
           		 </div>
              
            </div>
           
            
        </div>
      </div> <!-- end container -->
       
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
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/countdown/jquery.countdown.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="${pageContext.request.contextPath}/resources/assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${pageContext.request.contextPath}/resources/assets/pages/scripts/coming-soon.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <!-- END THEME LAYOUT SCRIPTS -->
        
        <div class="backstretch" style="left: 0px; top: 0px; overflow: hidden; margin: 0px; padding: 0px; height: 745px; width: 1583px; z-index: -999999; position: fixed;"><img src="./AZHealthPortal _ Coming Soon_files/1.jpg" style="position: absolute; display: none; margin: 0px; padding: 0px; border: none; width: auto; height: 745px; max-height: none; max-width: none; z-index: -999999; top: 0px;"></div>
        
    </body>

</html>