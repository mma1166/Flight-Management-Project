<?php
require_once('DBconnect.php');
session_start();

if(isset($_POST['email']) && isset($_POST['pass'])){
    $e = $_POST['email'];
    $p = $_POST['pass'];

    $sql = "SELECT * from user WHERE Email = '$e'";
    // Execute
    $result = mysqli_query($conn, $sql);

    if(mysqli_num_rows($result) == 1){ 
        $row = mysqli_fetch_assoc($result);
        $stored_password = $row['Password'];


        if($p === $stored_password){
            $_SESSION['email'] = $e;

            // Redirect based on user type
            if($e == "admin47@gmail.com"){
                header("Location: dashboard_admin.php");
            } else{
                header("Location: dashboard_user.php");
            }
            exit(); 
        } else {
            
            header("Location: sign_in.php?error=incorrect_password");
            exit();
        }
    } else {
       
        header("Location: sign_in.php?error=user_not_found");
        exit();
    }
} else {
   
    header("Location: sign_in.php");
    exit();
}
?>
