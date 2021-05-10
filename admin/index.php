<?php  
  include('../koneksi/koneksi.php'); 
  include('includes/session.php');
  date_default_timezone_set("Asia/Jakarta"); 
?> 
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Dashboard Admin</title>
  <?php include("includes/head.php"); ?>
</head>
<body>
  <div class="container-scroller">
    <?php include("includes/navbar.php"); ?>
    <div class="container-fluid page-body-wrapper">
      <?php include("includes/sidebar.php"); ?>
      <div class="main-panel">
        <div class="content-wrapper">
          
          <?php  
            if (isset($_GET["page"])) {
              $page = $_GET["page"]; 
              //pemanggilan ke halaman-halaman menu admin 
              $admin_page = array(
                "dashboard","editpassword","logout","pages","pagesnew","post","postnew","profil","user"
              );
              if  (in_array($page, $admin_page)) {
                $pagee = str_replace("-", "", $page);
                include("page/$pagee.php");
              }
            }
            else{ include("page/dashboard.php"); }   
          ?>

        </div>
        <!-- content-wrapper ends -->
        <?php include("includes/footer.php"); ?>
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <?php include("includes/script.php"); ?>
</body>

</html>

