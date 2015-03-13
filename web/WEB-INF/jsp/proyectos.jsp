<%-- 
    Document   : proyectos
    Created on : 15-07-2013, 04:04:06 PM
    Author     : rberrezueta
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
	<meta charset="utf-8">
	<title>SHR</title>
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
	<!-- <link rel="stylesheet" href="js/jqueryui1-10-3/demos/demos.css">      -->
	<style>
	.custom-combobox {
		position: relative;
		display: inline-block;
	}
	.custom-combobox-toggle {
		position: absolute;
		top: 0;
		bottom: 0;
		margin-left: -1px;
		padding: 0;
		/* support: IE7 */
		*height: 1.7em;
		*top: 0.1em;
	}
	.custom-combobox-input {
		margin: 0;
		padding: 0.3em;
	} 
.save-button
{
    background-image:none;
    border: 1px solid #d3d3d3;
    background-color:#7a7aff;
    color:#FFFFFF;
}
.save-button:hover
{ 
    border: 1px solid #c3c9d0;
    background-color:#6868d9;
    color:#000000;
}  
.save-button:active
{
    background-color:#FFFFFF;
    border: 1px solid #aaaaaa;
    color:#132b14;
}
	</style>
	<script>
	(function( $ ) {
		$.widget( "custom.combobox", {
			_create: function() {
				this.wrapper = $( "<span>" )
					.addClass( "custom-combobox" )
					.insertAfter( this.element );

				this.element.hide();
				this._createAutocomplete();
				this._createShowAllButton();
			},

			_createAutocomplete: function() {
				var selected = this.element.children( ":selected" ),
					value = selected.val() ? selected.text() : "";

				this.input = $( "<input>" )
					.appendTo( this.wrapper )
					.val( value )
					.attr( "title", "" )
					.addClass( "custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left" )
					.autocomplete({
						delay: 0,
						minLength: 0,
						source: $.proxy( this, "_source" )
					})
					.tooltip({
						tooltipClass: "ui-state-highlight"
					});

				this._on( this.input, {
					autocompleteselect: function( event, ui ) {
						ui.item.option.selected = true;
						this._trigger( "select", event, {
							item: ui.item.option
						});
					},

					autocompletechange: "_removeIfInvalid"
				});
			},

			_createShowAllButton: function() {
				var input = this.input,
					wasOpen = false;

				$( "<a>" )
					.attr( "tabIndex", -1 )
					.attr( "title", "Mostrar Todo" )
					.tooltip()
					.appendTo( this.wrapper )
					.button({
						icons: {
							primary: "ui-icon-triangle-1-s"
						},
						text: false
					})
					.removeClass( "ui-corner-all" )
					.addClass( "custom-combobox-toggle ui-corner-right" )
					.mousedown(function() {
						wasOpen = input.autocomplete( "widget" ).is( ":visible" );
					})
					.click(function() {
						input.focus();

						// Close if already visible
						if ( wasOpen ) {
							return;
						}

						// Pass empty string as value to search for, displaying all results
						input.autocomplete( "search", "" );
					});
			},

			_source: function( request, response ) {
				var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
				response( this.element.children( "option" ).map(function() {
					var text = $( this ).text();
					if ( this.value && ( !request.term || matcher.test(text) ) )
						return {
							label: text,
							value: text,
							option: this
						};
				}) );
			},

			_removeIfInvalid: function( event, ui ) {

				// Selected an item, nothing to do
				if ( ui.item ) {
					return;
				}

				// Search for a match (case-insensitive)
				var value = this.input.val(),
					valueLowerCase = value.toLowerCase(),
					valid = false;
				this.element.children( "option" ).each(function() {
					if ( $( this ).text().toLowerCase() === valueLowerCase ) {
						this.selected = valid = true;
						return false;
					}
				});

				// Found a match, nothing to do
				if ( valid ) {
					return;
				}

				// Remove invalid value
				this.input
					.val( "" )
					.attr( "title", value + " No se encontro el dato" )
					.tooltip( "open" );
				this.element.val( "" );
				this._delay(function() {
					this.input.tooltip( "close" ).attr( "title", "" );
				}, 2500 );
				this.input.data( "ui-autocomplete" ).term = "";
			},

			_destroy: function() {
				this.wrapper.remove();
				this.element.show();
			},
                        
                        setselectedvalue: function(value) {
                            this.element.val(value);
                            this.input.val(value);
                        }
		});
	})( jQuery );

	$(function() {
		//$( "#combobox" ).combobox();
                $("#selectempresa").combobox({
                   select: function(event, ui) {
                      chainedselect($(this).val());
                      $('#dropdown2').combobox('setselectedvalue', 'Seleccione...'); 
                      $('#dropdown2div').show()                      
                      $("#idempresaseleccionada").val($(this).val());
                   }
                });                
                $( "#dropdown2" ).combobox();                
		/*$( "#toggle" ).click(function() {
			$( "#selectempresa" ).toggle();
		});
                */
               
               $( "#dropdown2" ).combobox({
                   select: function(event,ui) {
                       selval = $(this).val();
                       $('#pane_proyecto').showLoading(   
                          {'afterShow': 	function() {
                            $("#idproyectoseleccionado").val(selval);
                            setTimeout( "jQuery('#pane_proyecto').hideLoading()", 1000 );
                            loadDatoProyecto("dataselector","#datocargado","#pane_proyecto",selval);
                            $("#pane_horas_proyecto").fadeIn("slow");
        }                            
                          });                       
                   }
    
               });
	});
        
function loadDatoProyecto(pagina,origen,destino,selval){
    //pagina = "dataselector";
    //origen = "#datocargado";
    //destino = "#pane_proyecto";
    $(destino).load(pagina+" "+origen, { s: "datoproyecto", selval: selval } , function(response, status, xhr) {
        //jQuery('#activity_pane').hideLoading();
        if (status === "error") {
            var msg = "Error!, algo ha sucedido: ";
            jQuery(destino).html(msg + xhr.status + " " + xhr.statusText);
            alert(msg + xhr.status + " " + xhr.statusText);
	}  
          // aqui otras rutinas.
          
    });

}        

function chainedselect(selval) {
  
  /* stop form from submitting normally */
  event.preventDefault();
 
  /* get some values from elements on the page: */
  var $form = $('#searchForm'); //$( this ),
      term = $form.find( 'input[name="s"]' ).val(),
      url = $form.attr( 'action' );  
       //alert(url);   
  /* Send the data using post */
 var posting = $.post( url, { s: term , selval: selval} );  
  /* Put the results in a div */
  posting.done(function( data ) {  
            if (data) {
               
                $("#dropdown2").html($("<option />").attr("value", "none").text("Seleccione..."));
                $.each(data, function(key, value) {
                  $("#dropdown2").append($("<option />").attr("value", key).text(value));
                }); // fin for
            } // fin if             
  }); // fin .done
}  
/*
  var newOptions = [
    { "key": "steven", "value": "Steven" },
    { "key": "kaine", "value": "Kaine" },
    { "key": "graham", "value": "Graham" },
    { "key": "dalip", "value": "Dalip" }, 
    { "key": "adam", "value": "Adam" }
  ];

  $(document).ready(function () {
    $("#dropdown2").combobox();
  });

  function UpdateList() {
     
    $("#dropdown2").html($("<option />").attr("value", "none").text("Seleccione..."));
    $.each(newOptions, function () {
      //$select.append($("<option />").attr("value", this.key).text(this.value));
      $("#dropdown2").append($("<option />").attr("value", this.key).text(this.value));
    });
    //$select.combobox();
    
  }
  */
  	$(function() {
		var spinnerreu = $( "#spinnerReu" ).spinner({
                    min: 0
                }).on('input', function () {
                    var val = this.value,
                        $this = $(this),
                        max = $this.spinner('option', 'max'),
                        min = $this.spinner('option', 'min');
                        if (!val.match(/^\d+$/)) val = 0; //we want only number, no alpha
                    this.value = val > max ? max : val < min ? min : val;
                });
                
		var spinnertareas = $( "#spinnertareas" ).spinner({
                    min: 0
                }).on('input', function () {
                    var val = this.value,
                        $this = $(this),
                        max = $this.spinner('option', 'max'),
                        min = $this.spinner('option', 'min');
                        if (!val.match(/^\d+$/)) val = 0; //we want only number, no alpha
                    this.value = val > max ? max : val < min ? min : val;
                });
                               
                /*
		$( "#disable" ).click(function() {
			if ( spinner.spinner( "option", "disabled" ) ) {
				spinner.spinner( "enable" );
			} else {
				spinner.spinner( "disable" );
			}
		});
		$( "#destroy" ).click(function() {
			if ( spinner.data( "ui-spinner" ) ) {
				spinner.spinner( "destroy" );
			} else {
				spinner.spinner();
			}
		});
		$( "#getvalue" ).click(function() {
			alert( spinner.spinner( "value" ) );
		});                    
		$( "#setvalue" ).click(function() {
			spinner.spinner( "value", 5 );
		});
                */                  
		$( "#guardarhoras" ).click(function() {
			var valorreu = spinnerreu.spinner( "value" );
                        if(valorreu === null) {
                        $('#spinnerReu').tooltip({ items: "#spinnerReu", content: "Debe Ingresar un valor cero o mayor"});
                        $('#spinnerReu').tooltip("open");
                        $('#lblspinnerReu').css( "color", "#c00" );
                        $('#lblspinnerReu').text("*");
                        }
                        else
                        {
                        $('#lblspinnerReu').text("");                            
                        }    
                        

		});
		$( "button" ).button();
	});  
        
       
 /*
 $('.tooltip_display').click(function() {
    //alert("dssd");
    var $this = $(this);
    $("#background").css({
        "opacity": "0.3"
    }).fadeIn("slow");


    $("#large").html(function() {
        $('.ttip').css({
            left: $this.position() + '20px',
            top: $this.position() + '50px'
        }).show(500);

    }).fadeIn("slow");


});

$('.note').on('click', function() {
    $('.ttip').hide(500);
    $("#background").fadeOut("slow");
    $("#large").fadeOut("slow");

});
$("#large").click(function() {
    $(this).fadeOut();
   
});      

  */       
    </script>        
    </head>
    <body>
        <content id="contenedorgeneral" tag="pagSection">               
            <form action="<c:url value='/excludetestjson' />" id="searchForm">
             <input hidden type="text" name="s" value="selproyectos" placeholder="Search..." />
            </form>  
             <table>
                 <tr>
                     <td style="width : 70%;">
                        <div class="ui-widget">
                        <SELECT id='selectempresa' name="cliente" size="1">
                          <OPTION selected value="none">Seleccione Cliente</OPTION>
                          <c:forEach items="${listadoProyectos}" var="empresa">
                              <option value="${empresa.idEmpresa}">${empresa.nombre}</option>
                          </c:forEach>         
                        </SELECT> 
                        </div>                         
                     </td>
                     <td>
                        <div id="dropdown2div" class="ui-widget" style="display:none;">
                            <select id="dropdown2">
                                <option value="">Seleccionar...</option>
                            </select>
                        </div>                             
                     </td>
                 </tr>
             </table> 
             <br />
             <div id="pane_proyecto" 
                  style="background-color: #EEEEEE;
                         alignment-baseline: middle;
                         width: 90%;
                         margin-left: auto ;
                         margin-right: auto ;
                         font-size: 12px">                
             </div>
             <div id="pane_horas_proyecto" 
                  style="background-color: #EEEEEE;
                         alignment-baseline: middle;
                         width: 90%;
                         margin-left: auto ;
                         margin-right: auto ;
                         font-size: 12px;
                         display: block">
                 
                 <table> 
                     <tr>
                         <td>
                             Reuniones
                         </td>
                         <td>
                             <label>Cantidad de Horas:</label>
                             <input id="spinnerReu" name="value">
                             <label id="lblspinnerReu"></label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             Ejecución de Tareas
                         </td>
                         <td>
                             <label>Cantidad de Horas:</label>
                             <input id="spinnertareas" name="value">
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <button id="guardarhoras" class="save-button">Guardar</button>
                         </td>
                     </tr>
                     
                 </table>
                 
                 <input type="hidden" id="idproyectoseleccionado" />
                 <input type="hidden" id="idempresaseleccionada" />
             </div>                  
        </content>        
    </body>
</html>
<%--
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SRH</title>
        <script src="js/jquery.selectBox.min.js" type="text/javascript"></script>
        <link href="css/jquery.selectBox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        
        function js_traverse(o) {
            var type = typeof o 
            if (type == "object") {
                for (var key in o) {
                    alert("key: ", key);
                    js_traverse(o[key]);
                }
            } else {
                alert(o);
            }
        }        

      $(document).ready(function () {
        $('select').selectBox({
          mobile: true
        });
      
        $("#selectempresa").selectBox().change(function () {
        //alert($(this).val());
        chainedselect();
        });
        
        
    });        
      //http://marcj.github.io/jquery-selectBox/
      
/* attach a submit handler to the form */
//$("#searchForm").submit(function(event) {
function chainedselect() {
  
  /* stop form from submitting normally */
  event.preventDefault();
 
  /* get some values from elements on the page: */
  var $form = $('#searchForm') //$( this ),
      term = $form.find( 'input[name="s"]' ).val(),
      url = $form.attr( 'action' );  
       //alert(url);   
  /* Send the data using post */
 var posting = $.post( url, { s: term } );  
  /* Put the results in a div */
  posting.done(function( data ) {  
      //alert(data);
            if (data) {
               /*
                $.each(data, function(key, value) {
                  alert(key);
                  alert(value);
                  
                });
                */
                $('#dropdown2').selectBox('options', data);  
            } 
             
  });
}   
//});      
      
    </script>
    </head>
    <body>
        <content tag="pagSection">  
                <h1>Listado de Clientes</h1>             
      <c:forEach items="${listadoProyectos}" var="empresa">
        <br />
          <c:out value="${empresa.nombre}" />
          
            <c:forEach items="${empresa.proyectos}" var="proyecto">
            <br />
              <c:out value="${proyecto.nombre}" />
          </c:forEach> 
            
      </c:forEach>                
            <br />  
    <SELECT id='selectempresa' name="cliente" size="1">
        <OPTION selected value="none">Seleccione Cliente</OPTION>
        <c:forEach items="${listadoProyectos}" var="empresa">
            <option value="${empresa.idEmpresa}">${empresa.nombre}</option>
        </c:forEach>         
    </SELECT>            
             
  <form action="<c:url value='/excludetestjson' />" id="searchForm">
   <input type="text" name="s" placeholder="Search..." />
   <input type="submit" value="Search" />
  </form>
  <!-- the result of the search will be rendered inside this div -->
  <div id="result"></div> 
<script>


</script> 

<select id="dropdown2">
    <option>Please select dropdown1</option>
    <option>Please select dropdown1</option>
    <option>Please select dropdown1</option>
</select>
            <div id="datocargado">
                   un dato cualquiera.
            </div>    

        </content>

    </body>
</html>

--%>
