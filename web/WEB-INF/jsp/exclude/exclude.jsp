<%-- 
    Document   : exclude
    Created on : 18-07-2013, 11:39:45 AM
    Author     : rberrezueta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
   <title>jQuery showLoading example</title>
   <link href="css/showLoading.css" rel="stylesheet" media="screen" />
   <script type="text/javascript" src="js/jquery-2.0.3.min.js"></script>
   <script type="text/javascript" src="js/jquery.showLoading.js"></script>
   <style type="text/css">

	a {
	  color: blue;
	  cursor:pointer;
          text-decoration: underline;
	}

        div.instructions_container {
	   float: left;
           width: 350px;
           margin-right: 50px;

        }

	div#activity_pane {
           float:left;
           width: 350px;
           height: 200px;
           border: 1px solid #CCCCCC;
           background-color: #EEEEEE;
 	   padding-top: 200px;
	   text-align: center;
           
        }

        div.example_links 
         .link_category {
           margin-bottom: 15px;
        }

	.loading-indicator-bars {
		background-image: url('images/loading-bars.gif');
		width: 150px;
	}

   </style>
   <script type="text/javascript">

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

		}

	);

   </script>

  </head>
  <body>
  <div class="instructions_container">
    <div class="example_links">
	<div class="link_category">     
	      <div class="link">
		<a class="loading-default">Show default loading indicator</a>
	       </div>
	       <div class="link">
		<a class="loading-hide">Hide default loading indicator</a>
       	       </div>
        </div>
	<div class="link_category">     
	      <div class="link">
		<a class="loading-ajax">simulate 1-second Ajax load</a>
	       </div>
        </div>
	<div class="link_category">     
	      <div class="link">
		<a class="loading-bars">show 'bars'-style loading indicator</a>
	       </div>
	       <div class="link">
		<a class="loading-hide">Hide 'bars'-style indicator</a>
       	       </div>
        </div>
     </div> 
     <div class="usage">
	Usage with jQuery load method:
        
        <pre>
jQuery('#activity_pane').showLoading();
jQuery('#activity_pane').load(
    '/path/to/my/url', 
    {},
    function() {
      //
      //this is the ajax callback 
      //
      jQuery('#activity_pane').hideLoading();
    }
);       
     </pre>

     </div>
    </div>

    <div id="activity_pane">
            Here is where we will load something via ajax.
            <br />
            This container <b>must</b> have an id attribute
    </div>
    <div style="clear:both;"></div>
  </body>
</html>