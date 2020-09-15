<?php
session_start();
#require_once 'radius/autoload.php';
#use Dapphp\Radius\Radius;
#require_once 'jwt/autoload.php';
#use \Firebase\JWT\JWT;

require_once 'rjwt_mod.php';

if (isset($_SESSION['jwt_token'])) {
  if (VerifyJWT($_SESSION['jwt_token']) == true) {
    header("Location: ./home.php");
  } else {
    return false
  }
} else {
  #header("Location: ./index.php");
  echo "Token Invalid<br>";
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>login_lib_test_index</title>
</head>
<body>
  <div class="login-form">
    <form action="index.php" method="post">
      <input type="text" name="username" placeholder="Username">
      <br>
      <input type="password" name="password" placeholder="Password">
      <br>
      <button type="submit" name="Submit">Login</button>
    </form>
  </div>
<?php
if (isset($_POST['Submit'])) {
    $alert1 = "<script>alert('Invalid Login Attempt')</script>";
    $username = protect($_POST["username"]);
    $password = protect($_POST["password"]);
    if (!$username || !$password) {
        print($alert1);
    } else {
      $authenticated = rjwtAuth($username, $password, "rjwt.ini.php")
        if ($authenticated === false) {
            // false returned on failure
            print("<script>alert('Failed Login Attempt')</script>");
//            echo sprintf("Access-Request failed with error %d (%s).\n", $client->getErrorCode(), $client->getErrorMessage());
        } else {
            // access request was accepted - client authenticated successfully
            echo "Success! Proceeding.\n";
            header("Location: ./home.php");
        }
    }
}
?>
</body>
</html>
