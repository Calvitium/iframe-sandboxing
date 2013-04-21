<?php

	$csp_rule = "default-src 'self'; frame-src localhost; script-src 'self'";

	foreach (array("X-WebKit-CSP", "X-Content-Security-Policy", "Content-Security-Policy") as $csp) {
    	header($csp . ": " . $csp_rule);
	}

	echo file_get_contents( "webapplication.html" );

?>