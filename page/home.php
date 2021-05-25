
    <!-- HEADLINE -->
    <section class="pt-10 pt-md-14 pb-8 pb-md-15 " id="welcome" style="position: absolute;width: 100%;background-color: #161c2dbb;">
      <!-- Shape -->
      <!-- <div class="shape shape-blur-3 svg-shim text-white">
        <svg viewBox="0 0 1738 487" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M0 0h1420.92s713.43 457.505 0 485.868C707.502 514.231 0 0 0 0z" fill="url(#paint0_linear)"></path><defs><linearGradient id="paint0_linear" x1="0" y1="0" x2="1049.98" y2="912.68" gradientUnits="userSpaceOnUse"><stop stop-color="currentColor" stop-opacity=".075"></stop><stop offset="1" stop-color="currentColor" stop-opacity="0"></stop></linearGradient></defs></svg>
      </div> -->
      <!-- Content -->
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12 col-md-10 col-lg-8 text-center">
            <h2 class="display-2 font-weight-bold text-white">HIMMASI</h2>
						<p class="lead text-white mb-8">Himpunan Mahasiswa Sistem Informasi <br>Vokasi Universitas Brawijaya</p>
						<a href="#!" class="btn btn-white shadow lift">Lorem Ipsum</a>
          	<div style="height:58px"></div>
          </div>
        </div> <!-- / .row -->
      </div> <!-- / .container -->
		</section>
		<section id="HeadlineVideo">
    	<video id="videoshow"	autoplay loop muted>
			  <source src="assets/uploads/profil.mp4" type="video/mp4" />
			  Your browser does not support the video tag.
			</video>
    </section>
		<div class="position-relative">
      <div class="shape shape-bottom shape-fluid-x svg-shim text-white">
        <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M0 48h2880V0h-720C1442.5 52 720 0 720 0H0v48z" fill="currentColor"></path></svg>
      </div>
    </div>

    <!-- DEPARTEMEN -->
    <section class="pb-4 pb-md-5 pt-10">
      <div class="container">
      	<div class="row justify-content-center">
          <div class="col-12 col-md-10 col-lg-8 text-center">
            <h2 class="font-weight-bold">Departemen di <span class="text-warning bg-dark rounded">&nbsp;HIMMASI&nbsp;</span></h2>
						<p class="font-size-lg text-muted mb-9">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					</div>
        </div>
        <div class="row">
          <?php 
            $query = mysqli_query($koneksi,"SELECT * FROM `departemen`"); 
            while($data = mysqli_fetch_array($query)){ 
               $id_dept   = $data["id_dept"]; 
               $nama      = $data["nama"];
               $deskripsi = $data["deskripsi"];
               $logo      = $data["logo"];
          ?>
          <div class="col-12 col-md-6 text-center">
            <div class="icon icon-lg mb-4"><img class="m-1" src="assets/img/logo/<?= $logo ?>" height="100px"></div>
            <h3 class="font-weight-bold"><?= $nama ?></h3>
						<p class="text-muted mb-8"><?= $deskripsi ?></p>
					</div>
          <?php } ?>
        </div> <!-- / .row -->
      </div> <!-- / .container -->
    </section>

    <!-- ANGGOTA -->
    <section class="py-4 py-md-5 bg-dark">
      <div class="container">
      	<div class="row justify-content-center">
          <div class="col-12 col-md-10 col-lg-8 text-center">
            <h2 class="font-weight-bold text-warning">Anggota <span class="text-dark bg-warning rounded">&nbsp;HIMMASI&nbsp;</span></h2>
						<p class="font-size-lg text-muted mb-9">Geser>></p>
					</div>
        </div>
        <div class="row">
          <div class="col-12">
            <!-- Flickity -->
            <div class="flickity-viewport-visible pt-2 pb-9" data-flickity='{"cellAlign": "left", "imagesLoaded": true, "pageDots": false, "prevNextButtons": false, "contain": true}'>
              <?php
                $sql = "SELECT * FROM `anggota` WHERE `tampil`='show' ORDER BY `urutan` LIMIT 7 "; 
                $query = mysqli_query($koneksi,$sql); 
                while($data = mysqli_fetch_array($query)){
                  $nama     = $data["nama"];
                  $jabatan  = $data["jabatan"];
                  $foto     = $data["foto"];
                  if (empty($foto)) {$foto="default.png";}
              ?>
              <div class="col-12 col-md-5 col-lg-4">
                <div class="card card-border shadow-light-lg lift lift-lg" style="border-top-color: #FFD52B;">
                  <div class="card-body text-center">
										<div class="img-fluid mb-5 w-50 svg-shim mx-auto" style="color: #FFD52B;">
                      <img src="assets/img/foto/<?= $foto ?>" alt="..." class="avatar-img rounded-circle">
                    </div>
                    <h3 style="font-weight: 600;"><?= $nama ?></h3>
										<p class="text-gray-600 mb-5"><i><?= $jabatan ?></i></p>
                    <?php if(strlen($jabatan)<23){echo "<br>";} ?>
                  </div>
                </div>
							</div>
              <?php } ?>
            </div>
          </div>
        </div> <!-- / .row -->
      </div> <!-- / .container -->
    </section>

    <!-- ARTICLES -->
    <section class="pt-4 pt-md-5 pb-md-12">
      <div class="container">
        <div class="row align-items-center mb-5">
          <div class="col-12 col-md">
						<h3 class="mb-0">Postingan terbaru</h3>
						<p class="mb-0 text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					</div>
          <div class="col-12 col-md-auto">
						<a href="#!" class="btn btn-sm btn-outline-gray-300 d-none d-md-inline">Lihat semua</a>
					</div>
        </div> <!-- / .row -->
        <div class="row">
          <?php
            $sql = "SELECT * FROM `post` LEFT JOIN `user` ON `post`.`insert_by`=`user`.`id_user` 
                    WHERE `status`='draft' ORDER BY `id_post` DESC LIMIT 6 "; 
            $query = mysqli_query($koneksi,$sql); 
            while($data = mysqli_fetch_array($query)){
              $judul      = $data["judul"];
              $judul2       = "";
              for ($i=0; $i<35; $i++){
                if (empty($judul[$i])) { break; }
                else {$judul2 .= $judul[$i];}
              }
              if (strlen($judul)>35) {
                $judul2 .= "...";
              }
              
              $isi        = strip_tags($data["isi"]);
              $isi2       = "";
              for ($i=0; $i<200; $i++){
                if (empty($isi[$i])) { break; }
                else {$isi2 .= $isi[$i];}
              }
              if (strlen($isi)>200) {
                $isi2 .= "...";
              }
              
              $insert_at  = $data["insert_at"];
              $tanggal    = date_create("$insert_at");
              $author     = $data["nama"];
              $link       = $data["link"];
              $foto       = $data["foto"];
              if (empty($foto)) {$foto="default.png";}

              $thumbnail="assets/img/default.png";
              $doc = new DOMDocument();
              libxml_use_internal_errors(true);
              $doc->loadHTML($data["isi"]);
              $xpath = new DOMXPath($doc);
              $imgs = $xpath->query("//img");
              for ($i=0; $i<$imgs->length; $i++){
                $img = $imgs->item($i);
                $thumbnail = $img->getAttribute("src");
              }
          ?>
          <div class="col-12 col-md-6 col-lg-4 d-flex my-5">
            <!-- Card -->
            <div class="card mb-6 mb-lg-0 shadow lift lift-lg">
              <!-- Image -->
              <a class="card-img-top" href="index.php?page=post&link=<?= $link ?>">
                <img src="<?= $thumbnail ?>" alt="..." class="card-img-top">
                <div class="position-relative">
                  <div class="shape shape-bottom shape-fluid-x svg-shim text-white">
                    <svg viewBox="0 0 2880 480" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M2160 0C1440 240 720 240 720 240H0v240h2880V0h-720z" fill="currentColor"></path></svg>
                  </div>
                </div>
              </a>
              <!-- Body -->
              <a class="card-body" href="index.php?page=post&link=<?= $link ?>">
                <h4 style="font-weight:500"><?= $judul ?></h4>
                <p class="mb-0 text-muted d-none" style="font-size: medium"><?= $isi2 ?></p>
              </a>
              <!-- Meta -->
              <a class="card-meta mt-auto d-none" href="#!">
                <hr class="card-meta-divider">
                <div class="avatar avatar-sm mr-2">
                  <img src="admin/assets/img/profil/<?= $foto ?>" alt="" class="avatar-img rounded-circle" style="object-position: top;">
                </div>
                <h6 class="text-uppercase text-muted mr-2 mb-0"><?= $author ?></h6>
                <p class="h6 text-uppercase text-muted mb-0 ml-auto">
                  <time datetime=""><?= date_format($tanggal,"d M") ?></time>
                </p>
              </a>
            </div>
          </div>
          <?php } ?>
        </div> <!-- / .row -->
      </div> <!-- / .container -->
    </section>
		<div class="position-relative">
      <div class="shape shape-bottom shape-fluid-x svg-shim text-black">
        <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M0 48h2880V0h-720C1442.5 52 720 0 720 0H0v48z" fill="currentColor"></path></svg>
      </div>
    </div>

    <!-- JAVASCRIPT -->
    <script type="text/javascript">
    	const height = document.querySelector('#welcome').offsetHeight;
    	document.getElementById("videoshow").style.height = height+"px";
    </script>