<?php include("koneksi/koneksi.php"); ?>
<!doctype html>
<html lang="en">
  
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<?php include("include/head.php"); ?>
<body style="font-family: Montserrat">

    <!-- NAVBAR -->
    <?php include("include/navbar.php"); ?>

    <?php  
      if (isset($_GET["page"])) {
        $page = $_GET["page"]; 
        //pemanggilan ke halaman-halaman menu admin 
        $admin_page = array(
          "home","blog","post","kabinet"
        );
        if  (in_array($page, $admin_page)) {
          //$pagee = str_replace("-", "", $page);
          include("page/$page.php");
        }else{echo "Page not found!";}
      }
      else{ include("page/home.php"); }   
    ?>

    <!-- FOOTER -->
    <?php include("include/footer.php"); ?>

    <!-- JAVASCRIPT -->
    <?php include("include/script.php"); ?>

</body>
</html>
