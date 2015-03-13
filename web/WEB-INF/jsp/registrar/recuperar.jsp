<%-- 
    Document   : recuperar
    Created on : 08-08-2014, 11:32:34 AM
    Author     : rberrezueta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <content tag="pagSection">
        <h1>Hello World!</h1>
        <form action="recuperarpass" method="POST">
            <table>
                <tr>
                    <td>
                        Email
                    </td>
                    <td>
                        <input type="text" value="" name="email" /> 
                    </td>
                </tr>                
            </table>
            <button type="submit">Enviar</button>
        </form>

        
                <c:if test = "${mensaje != null}"> 
                    <label>${mensaje}</label>
                </c:if>           
        
    </content>
    </body>
</html>
