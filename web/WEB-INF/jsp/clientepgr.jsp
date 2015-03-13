<%-- 
    Document   : clientepgr
    Created on : 12-09-2013, 04:56:27 PM
    Author     : rberrezueta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente PGR</title>
	<link rel="stylesheet" href="js/jqueryui1-10-3/themes/base/jquery.ui.all.css">
	<!--<script src="js/jquery-2.0.3.min.js"></script> -->
	<script src="js/jqueryui1-10-3/ui/jquery.ui.core.js"></script>
	<script src="js/jqueryui1-10-3/ui/jquery.ui.widget.js"></script>
	<script src="js/jqueryui1-10-3/ui/jquery.ui.button.js"></script>
	<script src="js/jqueryui1-10-3/ui/jquery.ui.position.js"></script>
	<script src="js/jqueryui1-10-3/ui/jquery.ui.menu.js"></script>
	<script src="js/jqueryui1-10-3/ui/jquery.ui.autocomplete.js"></script>
	<script src="js/jqueryui1-10-3/ui/jquery.ui.tooltip.js"></script>
        <script src="js/jqueryui1-10-3/external/jquery.mousewheel.js"></script>
        <script src="js/jqueryui1-10-3/ui/jquery.ui.spinner.js"></script>  
        <script src="js/jquery.ui.touch-punch.min.js"></script>
        
    <script>
        
 	$(function() {         
            
		$( "#recargar" ).click(function() {
			//alert('cargando');                        
                        $('#form1').submit();

		});    
      
		$( "#nextelpre" ).click(function() {
			//alert('cargando');
                        $('#host').val("spp145.idev.cl");
                        $('#puerto').val("5100");

		});      
                
		$( "#nexteldesarrollo" ).click(function() {
			//alert('cargando');
                        $('#host').val("sd03.idev.cl");
                        $('#puerto').val("9100");

		});                   
            

		$( "button" ).button();
	});         
    </script>
        
    </head>
    <body>
        <content tag="pagSection">    
            

            <c:if test = "${submit == 'submit'}">     
                <fieldset>
                    <label>Código de Retorno: ${si_cre} / ${mensajeRetorno}</label>
                    </br>
                    <label>Mensaje: ${rp_men}</label>                                      
                </fieldset>
            </c:if>  
            
            
            
            <form name="form1" id="form1" action="<c:url value='/clientepgrsubmit' />" method="POST">
            <table  cellspacing="10" style="float:left;">  
                <tr>
                    <td><label>Monto: </label></td>
                    <td><input type="text" id="rp_mnt" name='rp_mnt' tabindex="1" placeholder="Monto a Recargar" required /></td>
                </tr>
                <tr>
                    <td><label><label>Número Teléfono </label></label></td>
                    <td><input type="text" id="rp_ids" name='rp_ids' tabindex="2"  required /></td>
                </tr>
                <tr>
                    <td><label><label>Id Distribuidor: </label></label></td>
                    <td><input type="text" name='iddis' tabindex="3"  value="1002" /></td>
                </tr> 
                <tr>
                    <td><label><label>Id Sub-Distribuidor: </label></label></td>
                    <td><input type="text" name='idsdi' tabindex="4"  value="000001" /></td>
                </tr>                
                <tr>
                    <td><label><label>Id Canal: </label></label></td>
                    <td><input type="text" name='idcan' tabindex="5"  value="000001"  /></td>
                </tr> 
                <tr>
                    <td><label><label>Id Terminal: </label></label></td>
                    <td><input type="text" name='idter' tabindex="6"  value="000000000001"  /></td>
                </tr> 
                <tr>
                    <td><label><label>Version: </label></label></td>
                    <td><input type="text" name='version' tabindex="7"  value="1"  /></td>
                </tr>   
                <tr>
                    <td><label><label>Código de Producto: </label></label></td>
                    <td><input type="text" name='cdp' tabindex="8"  value="0001"  /></td>
                </tr>     
                <tr>
                    <td><label><label>Host: </label></label></td>
                    <td><input id="host" type="text" name='host' tabindex="9"  value="sd03.idev.cl"  /></td>
                </tr>
                <tr>
                    <td><label><label>Puerto: </label></label></td>
                    <td><input id="puerto" type="text" name='puerto' tabindex="10"  value="9100"  /></td>
                </tr>
                <tr>
                    <td><label><label>Timeout: </label></label></td> 
                    <td><input type="text" name='timeout' tabindex="11"  value="5"  /></td>
                </tr> 
                <tr>
                    <td><label><label>Iteraciones: </label></label></td> 
                    <td><input type="text" name='iteraciones' tabindex="12"  value="1"  /></td>
                </tr>                
                <tr>
                    <td colspan="2" align="center" >
                        <button id="recargar" style="margin-left: auto;
                                                     margin-right: auto;" >Recargar</button>
                    </td>
                </tr>  
            </table>    
            </form>
            
            <table  cellspacing="10" style="float:right;
                                            margin-left: auto;">  
                <tr>
                    <td>
                        <button id="nexteldesarrollo" style="margin-left: auto;
                                                     margin-right: auto;">Nextel Desarrollo</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button id="nextelpre" style="margin-left: auto;
                                                     margin-right: auto;">Nextel Pre</button>
                    </td>
                </tr>                
            </table>
            
            
        </content>        
    </body>
</html>
