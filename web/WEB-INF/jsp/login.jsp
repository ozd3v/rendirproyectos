<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page</title>
<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
</head>
<body onload='document.f.j_username.focus();'>
	<h3>Login with Username and Password (Custom Page)</h3>
 
	<c:if test="${not empty error}">
<content tag="errorSection">            
		<div class="errorblock">
			Error al intentar el login.<br /> Causa :
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		</div>
</content>                
	</c:if>
<content tag="loginSection">
<form name="f" class="box login" action="<c:url value='/j_spring_security_check' />" method="POST" >
	<fieldset class="boxBody">
	  <label>Username</label>
	  <input type="text" name='j_username' tabindex="1" placeholder="Usuario" required />
	  <label><a href="#" class="rLink" tabindex="5">Forget your password?</a>Password</label>
	  <input type="password" name='j_password' tabindex="2" required />
	</fieldset>
	<footer>
            <label for="j_remember"><input id="j_remember" name="_spring_security_remember_me" type="checkbox" tabindex="3" />          
                Recordar Usuario</label>
	  <input type="submit" name="submit" class="btnLogin" value="Login" tabindex="4" />
	</footer>
</form>
</content> 
</body>
</html>