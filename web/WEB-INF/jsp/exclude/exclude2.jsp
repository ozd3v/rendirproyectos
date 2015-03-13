<%-- 
    Document   : exclude2
    Created on : 19-07-2013, 12:14:53 PM
    Author     : rberrezueta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>jQuery Load</title>
		<!-- Libreria jQuery -->
		<script type='text/javascript' src='js/jquery-2.0.3.min.js'></script>
		
		<!-- Acción sobre el botó con id=boton y actualizamos el div con id=capa -->
		<script type="text/javascript">
			$(document).ready(function() {
				$("#boton").click(function(event) {
					$("#capa").load("listproyecto",{}, function(response, status, xhr) {
						  if (status == "error") {
						    var msg = "Error!, algo ha sucedido: ";
						    $("#capa").html(msg + xhr.status + " " + xhr.statusText);
						  }
						});
				});
			});			
		</script>
	</head>
	<body>
	<div id="capa">Pulsa 'Actualizar capa' y este texto se actualizará</div>
	<br>
   	<input name="boton" id="boton" type="button" value="Actualizar capa" />
	<br><br><br><br><h4><a href="http://www.anerbarrena.com">Volver a www.anerbarrena.com</a></h4>
	</body>
</html>