<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html lang="en">
<head>
	
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FreeP</title>
</head>
<body onload="autoSubmit();">

<form:form name="loginForm" action="../and/mainLoginAction" method="post">

	<input type="hidden" name="id" value="${param.id }" />
	<input type="hidden" name="pass" value="${param.pass }" />

</form:form>


<script>
	function autoSubmit(){
		document.loginForm.submit();
	}
</script>

</body>
</html>