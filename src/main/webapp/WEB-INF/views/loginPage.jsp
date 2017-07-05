<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="styles.jsp" %>
</head>
<body>
Login

<form:form id="loginForm" method="post" action="/AZHealthPortal/login/add" modelAttribute="loginUser">

<table>
		<tr>
			<th colspan="2">Login</th>
		</tr>
		<tr>
		 
          <td><form:label path="username">User Name:</form:label></td>
          <td><form:input path="username" size="30" maxlength="30" id="username"></form:input></td>
        </tr>
		<tr>
			    <td><form:label path="password">Password :</form:label></td>
          <td><form:input path="password" size="30" maxlength="30" type="password" id="password"></form:input></td>
		</tr>
		<tr>
			<!-- <td colspan="2"><input type="submit" class="blue-button" value="Login" /></td> -->
			<td colspan="2"><button type="submit" class="loginBtn blue-button" >Login</button></td>
		</tr>
	</table> 
</form:form>
 
 
  <%@include file="scripts.jsp" %>  
  
  
  <script>


jQuery(document).ready(function($) {

	//$("#loginForm").submit(function(event) {

		
		// Prevent the form from submitting via the browser.
		//event.preventDefault();

		//searchViaAjax();

	//});

});

function searchViaAjax() {

	var search = {}
	var username = $("#username").val();
	var password = $("#password").val();
	
	alert(username);
	alert(password);
	var jason = {"username" : username, "password": password};

	$.ajax({
		type : "POST",		
		url : "${pageContext.request.contextPath}/login/add",
		data : JSON.stringify(jason), 
		//data:  $('#loginForm').serialize(),
		dataType : 'json',
		timeout : 100000,
		beforeSend: function(xhr) {
            xhr.setRequestHeader("Accept", "application/json");
            xhr.setRequestHeader("Content-Type", "application/json");
        },
		success : function(data) {
			console.log("SUCCESS: ", data);
			alert("success");
		},
		error : function(e) {
			console.log("ERROR: ", e);
			alert("error");
			
		},
		done : function(e) {
			console.log("DONE");
			alert("done");
			
		}
		
	});

}




</script>  
</body>


</html>