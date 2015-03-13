<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        
    </head>
    <body>
            <div id="datocargado">
                <c:if test = "${seleccion == 'datoproyecto'}">     
                       <br />
                 <label>Proyecto: ${proyecto.nombre}</label>
                 <br />
                 <label>Código: ${proyecto.codigo}</label>
                 <br />
                 <label>Estado:
                        <c:choose>
                            <c:when test="${proyecto.activo}">
                                Activo
                            </c:when>
                            <c:otherwise>
                                Inactivo.
                            </c:otherwise>
                        </c:choose>                     
                    
                     </label>
                 <br />                
                </c:if>   
                <c:if test = "${seleccion == 'dato'}"> 
                    <label>Mensaje: ${mensaje}</label>
                </c:if>        
                 
            </div>   
            
            
        
    </body>
</html>
<%--
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>jQuery UI Autocomplete - Combobox</title>
	<link rel="stylesheet" href="js/jqueryui1-10-3/themes/base/jquery.ui.all.css">
	<!--<script src="js/jquery-2.0.3.min.js"></script> -->
	<script src="js/jqueryui1-10-3/ui/jquery.ui.core.js"></script>
	<script src="js/jqueryui1-10-3/ui/jquery.ui.widget.js"></script>
	<script src="js/jqueryui1-10-3/ui/jquery.ui.button.js"></script>
	<script src="js/jqueryui1-10-3/ui/jquery.ui.position.js"></script>
	<script src="js/jqueryui1-10-3/ui/jquery.ui.menu.js"></script>
	<script src="js/jqueryui1-10-3/ui/jquery.ui.autocomplete.js"></script>
	<script src="js/jqueryui1-10-3/ui/jquery.ui.tooltip.js"></script>
	<link rel="stylesheet" href="js/jqueryui1-10-3/demos/demos.css">
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
			}
		});
	})( jQuery );

	$(function() {
		//$( "#combobox" ).combobox();
                $("#combobox").combobox({
                   select: function(event, ui) {
                      chainedselect();
                   }
                });                
                $( "#dropdown2" ).combobox();
		$( "#toggle" ).click(function() {
			$( "#combobox" ).toggle();
		});
	});

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
            if (data) {
               
                $("#dropdown2").html($("<option />").attr("value", "none").text("Seleccione..."));
                $.each(data, function(key, value) {
                  $("#dropdown2").append($("<option />").attr("value", key).text(value));
                }); // fin for
            } // fin if             
  }); // fin .done
}  

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


	</script>
</head>
<body>
<content tag="pagSection"> 
  <form action="<c:url value='/excludetestjson' />" id="searchForm">
   <input type="text" name="s" placeholder="Search..." />
   <input type="submit" value="Search" />
  </form>    
<div class="ui-widget">
	<label>Your preferred programming language: </label>
	<select id="combobox">
		<option value="">Select one...</option>
		<option value="ActionScript111">ActionScript</option>
		<option value="AppleScript">AppleScript</option>
		<option value="Asp">Asp</option>
		<option value="BASIC">BASIC</option>
		<option value="C">C</option>
		<option value="C++">C++</option>
		<option value="Clojure">Clojure</option>
		<option value="COBOL">COBOL</option>
		<option value="ColdFusion">ColdFusion</option>
		<option value="Erlang">Erlang</option>
		<option value="Fortran">Fortran</option>
		<option value="Groovy">Groovy</option>
		<option value="Haskell">Haskell</option>
		<option value="Java">Java</option>
		<option value="JavaScript">JavaScript</option>
		<option value="Lisp">Lisp</option>
		<option value="Perl">Perl</option>
		<option value="PHP">PHP</option>
		<option value="Python">Python</option>
		<option value="Ruby">Ruby</option>
		<option value="Scala">Scala</option>
		<option value="Scheme">Scheme</option>
	</select>
</div>
    
    <select id="dropdown2">
        <option value="">Select one...</option>
        <option>Please select dropdown1</option>
        <option>Please select dropdown1</option>
    </select>
<button id="toggle">Show underlying select</button>

<div class="demo-description">
<p>A custom widget built by composition of Autocomplete and Button. You can either type something into the field to get filtered suggestions based on your input, or use the button to get the full list of selections.</p>
<p>The input is read from an existing select-element for progressive enhancement, passed to Autocomplete with a customized source-option.</p>
<p>This is not a supported or even complete widget. Its purely for demoing what autocomplete can do with a bit of customization. <a href="http://www.learningjquery.com/2010/06/a-jquery-ui-combobox-under-the-hood">For a detailed explanation of how the widget works, check out this Learning jQuery article.</a></p>
</div>
</content> 
</body>
</html>
--%>
