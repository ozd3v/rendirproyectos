<%-- 
    Document   : formProyecto
    Created on : 23-08-2013, 11:54:12 AM
    Author     : rberrezueta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>SRH</title>   
    
	<script type="text/javascript">
			jQuery(document).ready(function() {
				jQuery("#boton").click(function(event) {
                                         //elimino el comportamiento por defecto del enlace
                                           event.preventDefault();
                                          //jQuery('#activity_pane').showLoading();  
                                        jQuery('#activity_pane').showLoading(   
                                             {'afterShow': 	function() {
						setTimeout( "jQuery('#activity_pane').hideLoading()", 1000 );
                                                }							
                                            });
					jQuery("#activity_pane").load("dataselector #datocargado", { s: "dato" } , function(response, status, xhr) {
						  
                                                    //jQuery('#activity_pane').hideLoading();
                                                    if (status == "error") {
						    var msg = "Error!, algo ha sucedido: ";
						    jQuery("#activity_pane").html(msg + xhr.status + " " + xhr.statusText);
                                                    alert(msg + xhr.status + " " + xhr.statusText);
						  }  
                                                  // aqui otras rutinas.
						});
				});
			});                 
	</script>    
</head>
<body>
<content tag="pagSection">    
	<h3>Message : ${message}</h3>	
<br />
<form name="form1" action="<c:url value='/demoproyecto' />" method="POST">
 
<fieldset class="boxBody">
<table>  
    <tr>
        <td><label>Nombre Proyecto: </label></td>
        <td><input type="text" name='nomproyecto' tabindex="1" placeholder="Nombre Proyecto" required /></td>
    </tr>
    <tr>
        <td><label><label>Código: </label></label></td>
        <td><input type="text" name='codproyecto' tabindex="2"  required /></td>
    </tr>
    <tr>
        <td><label><label>Empresa: </label></label></td>
        <td><input type="text" name='nomempresa' tabindex="3"  required /></td>
    </tr>    
    <tr>
        <td colspan="2" >
            
	  <input type="submit" name="submit" class="btnLogin" value="Enviar" tabindex="4" />
          <input name="boton" id="boton" type="button" value="Actualizar capa" />
        </td>
    </tr>  
</table>    
</fieldset>       
</form>
</content> 
</body>
</html>