<?php
  if (isset($_GET["link"])) {
    $link = $_GET["link"]; 
    $sql = "SELECT * FROM `post` LEFT JOIN `user` ON `post`.`insert_by`=`user`.`id_user` WHERE `link`='$link'"; 
    if (mysqli_num_rows(mysqli_query($koneksi, $sql))==1) { $valid = 1; }
    else{ $valid=0; }
  }
  else{ $valid=0; }
?>

<?php 
  if ($valid==1) { ?>
    <?php
      $query = mysqli_query($koneksi,$sql); 
      while($data = mysqli_fetch_array($query)){
        $judul      = $data["judul"];
        $isi        = $data["isi"];
        $insert_at  = $data["insert_at"];
        $tanggal    = date_create("$insert_at");
        $author     = $data["nama"];
        $link       = $data["link"];
        $views      = $data["views"];
        $views2     = $views+1;
        $foto       = $data["foto"];
        if (empty($foto)) {$foto="default.png";}
        mysqli_query($koneksi,"UPDATE `post` SET `views`='$views2' WHERE `link`='$link'");
      }
    ?>
    <!-- POST -->
    <section class="pt-8 pt-md-11 pb-12">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-12 col-md">
            <a href="index.php?page=blog" class="font-weight-bold font-size-sm text-decoration-none mb-3">
              <i class="fe fe-arrow-left mr-3"></i> All Post
            </a>
            <h1 class="display-4 mb-2 text-dark"><?= $judul ?></h1>
            <p class="font-size-md text-gray-700 mb-5 mb-md-0">Posted by <?= $author ?>, <?= date_format($tanggal,"d M Y") ?></p>
          </div>
          <!-- <div class="col-auto">
            <a href="#!" class="btn btn-primary-soft mr-1">Refer a friend</a>
            <a href="#!" class="btn btn-primary">Apply</a>
          </div> -->
        </div>
        <div class="row">
          <div class="col-12">
            <hr class="my-6 my-md-8 border-gray-300">
          </div>
        </div>
        <div class="row">
          <div class="col-12 col-md-8 post">
            <?= $isi ?>
          </div>
          <div class="col-12 col-md-4">
            
            <!-- Card -->
            <div class="card shadow mb-5 bg-light">
              <div class="card-body">
                <h5 class="text-uppercase text-dark font-weight-bold">Popular Post</h5>
                <hr class="my-2">
                <?php
                  $query = mysqli_query($koneksi,"SELECT * FROM `post` ORDER BY `views` DESC LIMIT 5"); 
                  while($data = mysqli_fetch_array($query)){
                    $judul     = $data["judul"];
                    $link      = $data["link"];
                ?>
                <a href="index.php?page=post&link=<?= $link ?>" class="text-reset font-size-sm"><?= $judul ?></a>
                <hr class="my-2">
                <?php } ?>
              </div>
            </div>

          </div>
        </div> <!-- / .row -->
      </div> <!-- / .container -->
    </section>
  <?php }else{ ?>
    <h1>Post tidak ditemukan</h1>
  <?php } 
?>
  

    
    


		<div class="position-relative">
      <div class="shape shape-bottom shape-fluid-x svg-shim text-black">
        <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M0 48h2880V0h-720C1442.5 52 720 0 720 0H0v48z" fill="currentColor"></path></svg>
      </div>
    </div>

    <!-- JAVASCRIPT -->
