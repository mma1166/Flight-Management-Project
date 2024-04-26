<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Air Ticket Booking System</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
      crossorigin="anonymous"
    />
    <!-- Home Css file connect -->
    <link rel="stylesheet" href="css/available_admin.css" />

    <!-- google font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=PT+Serif&display=swap" rel="stylesheet"> 

    <!-- favicon -->
    <link rel="shortcut icon" href="images/plane_nav.png" type="image/x-icon">

    <style>
       body {
    font-family: 'PT Serif', serif;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;

    min-height: 100vh;
    margin: 0 auto;
    max-width: 1400px;
  }
    </style>
  </head>
  <body>
    <div>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-primary nav-all">
      <div class="container-fluid">
       <a class="navbar-brand" href="home.php"> <span><img style = " height: 70px;" src="images//logo.png" alt=""></span></a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse nav-element-left" id="navbarNav">
          <ul class="navbar-nav nav-ul">
            <li class="nav-item nav-li">
              <a class="nav-link nav-right active" aria-current="page" href="home.php"
                >Home</a
              >
          </ul>
        </div>
      </div>
    </nav>

    <!-- section one table -->
    <section class="sec-1">
        <div class="whole-table">
            <div class="title">
                <h1>Available Flight</h1>
            </div>
            <div class="table main-td">
                <div class="td-element"><h5>Flight Id</h5></div>
                <div class="td-element"><h5>Flight Name</h5></div>
                <div class="td-element"><h5>From</h5></div>
                <div class="td-element"><h5>To</h5></div>
                <div class="td-element"><h5>Starting Date</h5></div>
                <div class="td-element"><h5>Time</h5></div>
                <div class="td-element"><h5>Adult Cost</h5></div>
                <div class="td-element"><h5>Child Cost</h5></div>
                <div class="td-element"><h5>Seat Remaining</h5></div>
            </div>

            <?php
            require_once('DBconnect.php');
            session_start();
            $email = $_SESSION['email'];
            $sql_table = "SELECT * from flight";
            $result_table = mysqli_query($conn, $sql_table);

            if(mysqli_num_rows($result_table) != 0){
            while($row = mysqli_fetch_assoc($result_table) ){


?>
            <div class="table">
                <div class="td-element-sub"><h5><?php echo $row['f_id'];?></h5></div>
                <div class="td-element-sub"><h5><?php echo $row['f_name'];?></h5></div>
                <div class="td-element-sub"><h5><?php echo $row['f_from'];?></h5></div>
                <div class="td-element-sub"><h5><?php echo $row['f_to'];?></h5></div>
                <div class="td-element-sub"><h5><?php echo $row['f_date'];?></h5></div>
                <div class="td-element-sub"><h5><?php echo $row['f_time'];?></h5></div>
                <div class="td-element-sub"><h5><?php echo $row['adult_cost'];?></h5></div>
                <div class="td-element-sub"><h5><?php echo $row['child_cost'];?></h5></div>
                <div class="td-element-sub"><h5><?php echo $row['available'];?></h5></div>
            </div>

<?php }} ?>
            

        </div>
    </section>

    <section class= "sec-2">
        <form class="all" action = "admin_edit.php" method = "post">
            <div class = "top">
                <div class = "left both">
                    <h5>Flight Id</h5>
                    <input type="text" placeholder="Id" name = "id" required>
                    <h5>From</h5>
                    <input type="text" placeholder="From" name = "from" required>
                    <h5>Adult Cost</h5>
                    <input type="text" placeholder="Adult cost" name = "adult" required>
                    <h5>Ticket</h5>
                    <input type="text" placeholder="Ticket" name = "ticket" required>
                    <h5>Starting Date</h5>
                    <input type="date" name = "sdate" required>
                </div>
                <div class = "right both">
                    <h5>Flight Name</h5>
                    <input type="text" placeholder="Name" name = "name" required>
                    <h5>To</h5>
                    <input type="text" placeholder="To" name = "to" required>
                    <h5>Child Cost</h5>
                    <input type="text" placeholder="Child cost" name = "child" required>
                    <h5>Time</h5>
                    <input type="text" placeholder="Time" name = "time" required>
            
                </div>
            </div>
            <div class = "three-button">
                <input class="btn btn-primary" type="submit" name = "add" value = "Add">
                <input class="btn btn-warning" type="submit" name = "modify" value = "Modify">
                <input class="btn btn-danger" type="submit" name = "delete" value = "Delete">
            </div>
        </form>
    </section>
    </div>

 </body>
</html>