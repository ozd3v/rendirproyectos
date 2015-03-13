<%-- 
    Document   : logviewer
    Created on : 13-09-2013, 02:48:49 PM
    Author     : rberrezueta
--%>

<%@page import="com.ozdev.utils.DateUtilities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log Viewer</title>
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
        
    <script>
        
 	$(function() {         
           
		$( "#recargar" ).click(function() {
			//alert('cargando');
                        $('#form1').submit();

		});          
            
                $("#logfase1").click(function() {                   
                    labelText = $("#logfase1").text();
                    $("#log").val(labelText);
                });
                
                $("#logfase2").click(function() {                   
                    labelText = $("#logfase2").text();
                    $("#log").val(labelText);
                });
                
                $("#logpro").click(function() {                   
                    labelText = $("#logpro").text();
                    $("#log").val(labelText);
                });
                
                $("#logreg").click(function() {                   
                    labelText = $("#logreg").text();
                    $("#log").val(labelText);
                });       
                
                $("#log2100").click(function() {                   
                    labelText = $("#log2100").text();
                    $("#log").val(labelText);
                });  
                
                 var color;
                $("#logfase1").hover(
                    function(){
                        //$(this).find(".label").fadeOut(100);
                        $(this).css("cursor","hand");
                         color= $(this).css("color");
                         $(this).css("color","red");
                    },
                    function(){
                        //$(this).find(".label").fadeIn(100);
                        $(this).css("cursor","pointer");
                        $(this).css("color",color);
                    }
                );                

                $("#logfase2").hover(
                    function(){
                        //$(this).find(".label").fadeOut(100);
                        $(this).css("cursor","hand");
                         color= $(this).css("color");
                         $(this).css("color","red");
                    },
                    function(){
                        //$(this).find(".label").fadeIn(100);
                        $(this).css("cursor","pointer");
                        $(this).css("color",color);
                    }
                );   
                    
                $("#logpro").hover(
                    function(){
                        //$(this).find(".label").fadeOut(100);
                        $(this).css("cursor","hand");
                         color= $(this).css("color");
                         $(this).css("color","red");
                    },
                    function(){
                        //$(this).find(".label").fadeIn(100);
                        $(this).css("cursor","pointer");
                        $(this).css("color",color);
                    }
                );   
                    
                $("#logreg").hover(
                    function(){
                        //$(this).find(".label").fadeOut(100);
                        $(this).css("cursor","hand");
                         color= $(this).css("color");
                         $(this).css("color","red");
                    },
                    function(){
                        //$(this).find(".label").fadeIn(100);
                        $(this).css("cursor","pointer");
                        $(this).css("color",color);
                    }
                );                
                    
                $("#log2100").hover(
                    function(){
                        //$(this).find(".label").fadeOut(100);
                        $(this).css("cursor","hand");
                         color= $(this).css("color");
                         $(this).css("color","red");
                    },
                    function(){
                        //$(this).find(".label").fadeIn(100);
                        $(this).css("cursor","pointer");
                        $(this).css("color",color);
                    }
                );                       
                    
                    

		$( "button" ).button();
	});         
    </script>        
    </head>
    <body>
        <content tag="pagSection">      
            
            <table cellspacing="10" width="100%" border="0">
                <tr>
                    
                    <td colspan="4" align="center" style=" font-size:25px;">
                        
                        Pinche sobre uno de los logs para seleccionarlo.
                        
                    </td>
                </tr>
                   
                <tr>
                    <td>
                        <label>Log Fase 1</label>
                        <label id="logfase1">dvt419_3000__p_tq_r001_0001.9151.<%out.print(DateUtilities.getString(DateUtilities.now(), "yyyyMMdd"));%>.log
                        </label>
                    </td>
                    
                     <td>
                         <label>Log Fase 2</label>
                        <label id="logfase2">dvt419_3000__p_tq_r002_0001.9161.<%out.print(DateUtilities.getString(DateUtilities.now(), "yyyyMMdd"));%>.log</label>
                    </td>
                    
                </tr>                                  
                     <td>
                         <label>Log Promociones</label>
                        <label id="logpro">dvt419_4001__prosrv.9125.<%out.print(DateUtilities.getString(DateUtilities.now(), "yyyyMMdd"));%>.log</label>
                    </td>
                    
                     <td>
                         <label>Log Reglas</label>
                        <label id="logreg">dvt419_4001__regsrv.9131.<%out.print(DateUtilities.getString(DateUtilities.now(), "yyyyMMdd"));%>.log</label>
                    </td>                                        
                </tr>
                <tr>
                     <td>
                         <label>Log 2100</label>
                        <label id="log2100">dvt419_2100__server.9100.<%out.print(DateUtilities.getString(DateUtilities.now(), "yyyyMMdd"));%>.log</label>
                    </td>                    
                </tr>
            </table>
            
               <form name="form1" id="form1" action="<c:url value='/logviewersubmit' />" method="POST">
            <table  cellspacing="10">  
                <tr>
                    <td><label>Comando </label></td>
                    <td><input type="text" id="comando1" name='comando1' tabindex="1" placeholder="Comando Unix" required value="tail -n 1000 /home/psd/psd_10/var/log/" /></td>
                </tr>
                <tr>
                    <td><label><label>Log a revisar </label></label></td>
                    <td><input type="text" id="log" name='log' tabindex="2"  readonly /></td>
                </tr>  
                <tr>
                    <td><label><label>Hostname: </label></label></td>
                    <td><input type="text" id="hostname" name='hostname' tabindex="2" value="sd03.idev.cl" /></td>
                </tr> 
                <tr>
                    <td><label><label>Username: </label></label></td>
                    <td><input type="text" id="username" name='username' tabindex="2"  value="psd" /></td>
                </tr> 
                <tr>
                    <td><label><label>Password </label></label></td>
                    <td><input type="password" id="password" name='password' tabindex="2"  value="circle" /></td>
                </tr>                 
                <tr >
                    <td colspan="2" align="center" >
                        <button id="recargar" style="margin-left: auto;
                                                     margin-right: auto;" >Ver Log</button>
                    </td>
                </tr>  
            </table> 
               </form>

            <c:if test = "${submit == 'submit'}">     
                <fieldset>
                    ${resultado}
                </fieldset>
            </c:if> 
            
        </content>
    </body>
</html>
