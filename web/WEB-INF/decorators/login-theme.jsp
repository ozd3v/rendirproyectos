<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Login</title>
<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/structure.css" />
<script type='text/javascript'>
function IsAttributeSupported(tagName, attrName) {
    var val = false;
    // Create element
    var input = document.createElement(tagName);
    // Check if attribute (attrName)
    // attribute exists
    if (attrName in input) {
        val = true;
    }
    // Delete "input" variable to
    // clear up its resources
    delete input;
    // Return detected value
    return val;
}

function test_html5() {
if (!IsAttributeSupported("input", "placeholder")) {
    // Do something special here
    //alert("placeholder attribute is not supported");
    window.location.href="excludenotsupported";
}
}
</script>
</head>
    <body onload="test_html5();">
    <fieldset class="boxBody">
              <decorator:getProperty property="page.errorSection"/>  
    </fieldset>  
 <decorator:getProperty property="page.loginSection"/>    
<footer id="main">
    <a href="http://ozd3v.blogspot.com">Actividades APP (HTML5/CSS3 Coded)</a><label>V1.0</label>
</footer>
</body>
</html>
