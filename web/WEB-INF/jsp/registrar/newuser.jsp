<%-- 
    Document   : newuser
    Created on : 20-06-2014, 11:53:30 AM
    Author     : rberrezueta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Usuario</title>
    </head>
    <body>
    <content tag="pagSection">
        <h1>Hello World!</h1>
        <form action="formregistrarusuario" method="POST">
            <table>
                <tr>
                    <td>
                        Nombre de Usuario
                    </td>
                    <td>
                        <input type="text" value="" name="username" /> 
                    </td>
                </tr>
                <tr>
                    <td>
                        Password
                    </td>
                    <td>
                        <input type="password" value="" name="password" /> 
                    </td>
                </tr>  
                <tr>
                    <td>
                        Repetir Password
                    </td>
                    <td>
                        <input type="password" value="" name="password2" /> 
                    </td>
                </tr>                 
                <tr>
                    <td>
                        Email
                    </td>
                    <td>
                        <input type="text" value="" name="email" /> 
                    </td>
                </tr>
                <tr>
                    <td>
                        Repetir Email
                    </td>
                    <td>
                        <input type="text" value="" name="email2" /> 
                    </td>
                </tr>                
            </table>
            <button type="submit">Registrar</button>
        </form>
    </content>
    </body>
</html>
