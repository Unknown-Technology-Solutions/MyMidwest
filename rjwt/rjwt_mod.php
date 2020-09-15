<?php

# // TODO: Move RADIUS and JWT Auth mechanism to an external service to reduce main application footprint and to distribute workload across the network

#Protect strings that are being handled

function protect($string)
{
  $string = trim(strip_tags(addslashes($string)));
  return $string;
}


#JWT Verify Function

require_once 'jwt/autoload.php';
use \Firebase\JWT\JWT;

function VerifyJWT($token)
{
    $file = fopen("jwt_auth.key", "r") or die("Unable to read key file!");
    $ServerKey = fread($file, filesize("jwt_auth.key"));
    fclose($file);
    try {
        date_default_timezone_set("America/Chicago");
        $payload = JWT::decode($token, $ServerKey, array('HS256'));
        $returnArray['nbf'] = $payload->nbf;
        $expire = date($returnArray['nbf'] + 3600);
        #echo "Expire Time: ".$expire."<br>";

        $time = date("U");
        #echo "Curren Time: ".$time."<br>";
        if ($time > $expire) {
            return false;
        } else {
            return true;
        }
        #echo $payload['username']."<br>";
        #if (isset($payload->exp)) {
        #    $returnArray['exp'] = date(DateTime::ISO8601, $payload->exp);
        #}
    } catch (Exception $e) {
        $returnArray = array('error' => $e->getMessage());
        echo $returnArray['error']."<br>";
        if ($returnArray['error'] == "Expired token") {
            return false;
        } else {
            return false;
        }
    }
}
