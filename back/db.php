
<?php
//Turns off error reporting (Only needed for localhost, has no effect when used on NJIT servers)
//error_reporting(0);

//connects to database
$con = mysqli_connect("127.0.0.1", "root","","cs490");
if (mysqli_connect_errno())
{
  $err = "Failed to connect to MySQL: " . $con->connect_error;
  $rc = array('return_code'=> -1, 'error_message'=> $err);
  echo (json_encode($rc));
}

?>
