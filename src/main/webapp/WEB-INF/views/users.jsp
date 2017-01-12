<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Users

<form:form method="post" modelAttribute="user" action="/labportal/user/addUser">
<table>
		<tr>
			<th colspan="2">Add Country</th>
		</tr>
		<tr>
		 <form:hidden path="userId" />
          <td><form:label path="username">User Name:</form:label></td>
          <td><form:input path="username" size="30" maxlength="30"></form:input></td>
        </tr>
		<tr>
			    <td><form:label path="firstName">First Name:</form:label></td>
          <td><form:input path="firstName" size="30" maxlength="30"></form:input></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit"
				class="blue-button" /></td>
		</tr>
	</table> 
</form:form>


<h3>Country List</h3>
<c:if test="${!empty listOfUsers}">
	<table class="tg">
	<tr>
		<th width="80">Id</th>
		<th width="120">username</th>
		<th width="120">first name</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listOfUsers}" var="user">
		<tr>
			<td>${user.userId}</td>
			<td>${user.username}</td>
			<td>${user.firstName}</td>
			<td><a href="<c:url value='user/updateUser/${user.userId}' />" >Edit</a></td>
			<td><a href="<c:url value='/user/deleteUser/${user.userId}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>	
</c:if>

<%	/* String arra= request.getAttribute("listOfUsers").toString();
	System.out.print("*****************************"+arra); */
%>
</body>
</html>