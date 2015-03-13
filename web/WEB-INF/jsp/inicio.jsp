<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>SRH</title>   
    
</head>
<body>
<content tag="pagSection">    
    <h3>Message : ${message} </br>

    <sec:authentication var="user" property="principal.username" />	
		 
    <sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
    Bienvenido ${user} </br>
    </sec:authorize>   
    Esta página esta en construcción. 
    </h3>
</content> 
</body>
</html>