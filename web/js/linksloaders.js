/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
	jQuery(document).ready(
		function() {

		  //
		  // When a user clicks the 'loading-default' link,
		  // call showLoading on the activity pane
		  // with default options
		  //
		  jQuery('a.loading-default').click(

			function() {
				jQuery('#activity_pane').showLoading();
			}

		  ); 


		  //
		  // When a user clicks the 'loading-ajax' link,
		  // call showLoading, sleep, then call hide loading
		  // with default options
		  //
		  jQuery('a.loading-ajax').click(

			function() {
                    
				jQuery('#activity_pane').showLoading(
	 			 {
				    'afterShow': 
					function() {
						setTimeout( "jQuery('#activity_pane').hideLoading()", 1000 );
					}

				
								
				 }
				);                                  
			}                                             

		  ); 


		  //
		  // When a user clicks the 'loading-bars' link,
		  // call showLoading with addClass specified
		  //
		  jQuery('a.loading-bars').click(

			function() {
				jQuery('#activity_pane').showLoading(
	 			 {
				    'addClass': 'loading-indicator-bars'
								
				 }
				);
			}

		  ); 


		  //
		  // When a user clicks the 'loading-hide' link,
		  // call hideLoading on the activity pane
		  //
		  jQuery('a.loading-hide').click(

			function() {
				jQuery('#activity_pane').hideLoading();
			}

		  ); 
                      
                      
                    $("#testbutton").click(function(evento){
                       evento.preventDefault();
                       $("#activity_pane").load("/listproyecto",
                               {},
                               function(response,status,xht){
                                   
                            if (status == "error") {
                            var msg = "Error!, algo ha sucedido: ";
                            $("#activity_pane").html(msg + xhr.status + " " + xhr.statusText);
                            alert(msg + xhr.status + " " + xhr.statusText);
                          }                                   
                                   
                               }
                             
                       
                                                
                            );
                      
                     } );                       
                      

		}
        
	);   
            