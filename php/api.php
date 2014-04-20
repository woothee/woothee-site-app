<?php

require "vendor/autoload.php";

use Woothee\Classifier;

$classifier = new \Woothee\Classifier;

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$ua = $_SERVER["HTTP_USER_AGENT"];
if ( array_key_exists("ua", $_GET) ) {
  $ua = $_GET["ua"];
}

$r = $classifier->parse($ua);

$path = parse_url( $_SERVER['REQUEST_URI'] )["path"];

echo json_encode(array( "version" => Classifier::VERSION, "result" => $r ));
?>
