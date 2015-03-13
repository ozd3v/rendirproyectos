<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><decorator:title /></title>    
    
    
<link rel="stylesheet" type="text/css" href="css/jMenu.jquery.css" media="screen" />    
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link href="css/showLoading.css" rel="stylesheet" media="screen" />  
<script type='text/javascript' src='js/jquery-2.0.3.min.js'></script>
<!--<script src="js/jqueryui1-10-3/jquery-1.9.1.js"></script> -->
<script type="text/javascript" src="js/jMenu.jquery.js"></script>
<script type="text/javascript" src="js/jquery.showLoading.js"></script>
<!--
http://demos.myjqueryplugins.com/jmenu/
-->
			<!-- JS to add -->
			<script type="text/javascript">
			  $(document).ready(function(){
				$("#jMenu").jMenu({
				  openClick : false,
				  ulWidth : 'auto',
				  effects : {
					effectSpeedOpen : 200,
					effectSpeedClose : 200,
					effectTypeOpen : 'slide',
					effectTypeClose : 'hide',
					effectOpen : 'linear',
					effectClose : 'linear'
				  },
				  TimeBeforeOpening : 200,
				  TimeBeforeClosing : 400,
				  animatedText : false,
				  paddingLeft: 1
				});
			  })
                                               
                          
			</script>                      
<decorator:head />
</head>
<body>
<header>    
    <img src="images/calendar_banner.jpeg" alt="Horas por Proyecto" height="50%" width="50%" />
</header>    
<nav>        
<ul id="jMenu">
    <li class="arrow"></li>
    <li>
        <a class="fNiv" href="<c:url value='/welcome' />">Home</a>
    <!-- Do not forget the "fNiv" class for the first level links !! -->
  </li>
    <li><a class="fNiv" href="<c:url value='/listproyecto' />">Proyectos</a>
        <ul>
            <li class="arrow"></li>
            <li><a class="loading-ajax" href="<c:url value='/listproyecto' />">Listado</a>
                <ul>
                    <li><a>Sub-Submenu</a></li>
                </ul>
            </li>
            <li><a class="loading-ajax" href="<c:url value='/subirarchivo' />">Subir Archivo</a>                
            </li>
            <li><a class="loading-ajax" href="<c:url value='/formproyecto' />">Formulario</a>                
            </li>            
        </ul>
    </li>  
    <li>
        <a class="fNiv">Clientes</a>
                <ul>
                    <li><a class="loading-ajax" href="<c:url value='/clientepgr' />">Cliente Recargas PGR</a></li>
                    <li><a class="loading-ajax" href="<c:url value='/logviewer' />">Visor de Logs</a></li>
                </ul>        
    </li>     
    <li>
        <a class="fNiv" href="<c:url value='/j_spring_security_logout' />">Logout</a>
    </li>  
</ul> 
</nav>
        <section id="content">
            <decorator:getProperty property="page.pagSection"/> 
            <!-- <  decorator:body /> --> 
        </section> 
<aside>
	 
    <sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
        <sec:authentication var="user" property="principal.username" />
    Username : ${user}
    </sec:authorize>     
    <p>En construcción</p>  
    <div id="activity_pane">
            Este contenedor es cargado via ajax por jQuery.load().
            <br />
            Este contenedor <b>DEBE</b> tener un atributo id (activity_pane)
    </div>    
</aside>    
<footer id="main" style="alignment-adjust: central">
    <a href="http://ozd3v.blogspot.com">Actividades APP (HTML5/CSS3 Coded)</a><label>V1.0</label>
</footer>
</body>
</html> 