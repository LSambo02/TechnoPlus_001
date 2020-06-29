<?php

// show error reporting
    error_reporting(E_ALL);

// set your default time-zone
    date_default_timezone_set('Africa/Mozambique');

// variables used for jwt
    $key = "example_key";
    $iss = "localhost:8888/mahungo";
    $iat = time();
    $nbf = $iat + 10;
    $exp = $nbf + 10;

?>