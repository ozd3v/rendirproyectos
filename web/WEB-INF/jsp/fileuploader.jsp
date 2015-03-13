<%-- 
    Document   : fileuploader
    Created on : 22-08-2013, 03:07:30 PM
    Author     : rberrezueta
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>    
    <title>Spring MVC Multiple File Upload</title>
    <script>
$(document).ready(function() {
    //add more file components if Add is clicked
    $('#addFile').click(function() {
        var fileIndex = $('#fileTable tr').children().length - 1;
        $('#fileTable').append(
                '<tr><td>'+
                '   <input type="file" name="files['+ fileIndex +']" />'+
                '</td></tr>');
    });
     
});
</script>
</head>
<body>
<content tag="pagSection">      
<h1>Subir Multiples Archivos</h1>
 
<form:form method="post" action="upload"
        modelAttribute="uploadForm" enctype="multipart/form-data">
 
    <p>Selecciona Archivos a Subir</p>
 
    <input id="addFile" type="button" value="Add File" />
    <table id="fileTable">
        <tr>
            <td><input name="files[0]" type="file" /></td>
        </tr>
    </table>
    <br/><input type="submit" value="Upload" />
</form:form>

    <h1>Resultado de subida de Archivos</h1>
    <p>Se Subieron los siguientes archivos: </p>
    <ol>
        <c:forEach items="${files}" var="file"> 
            <li>${file}</li>
            <a href="<c:url value='/filedownload?s=${file}' />"> Bajar</a>
        </c:forEach>
    </ol>

</content>
</body>
</html>
