<?php

	header( "Access-Control-Allow-Origin: http://localhost" );

	echo file_get_contents( "webapplication.html" );

?>