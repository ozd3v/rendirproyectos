<%-- 
    Document   : demoproyecto
    Created on : 09-07-2013, 04:25:09 PM
    Author     : rberrezueta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <content tag="pagSection"> 
        <h3>Proyecto</h3>
        <p>Nombre ${proyectoObj.nombre}</p>
        <p>Código: ${proyectoObj.codigo}</p>
        </content>
    </body>
</html>
