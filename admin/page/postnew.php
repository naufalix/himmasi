<?php
	$tanggal = date("Y-m-d");
	if (isset($_POST["submit-new"])) {
    if (!empty($_POST["judul"])&&!empty($_POST["isi"])&&!empty($_POST["status"])&&!empty($_POST["link"])) {
      $judul 	= $_POST["judul"];
      $isi   	= $_POST["isi"];
      $status = $_POST["status"];
      $link 	= $_POST["link"];
      if (mysqli_num_rows(mysqli_query($koneksi, "SELECT * FROM `post` WHERE `link`='$link'"))=="0") {
        mysqli_query($koneksi,"INSERT INTO `post` (`judul`,`isi`,`status`,`link`,`insert_by`,`insert_at`,`update_by`,`update_at`) 
        VALUES ('$judul','$isi','$status','$link','$id_user','$tanggal','$id_user','$tanggal')");
        
        //header("Location:index.php?page=post&berhasil=1");
        $notif = "Akun berhasil ditambahkan";
      } else {$notif = "Link telah terpakai";}
    }else {$notif = "Semua data wajib diisi!";}
  }
?>
<style type="text/css">
	.btn i {font-size: 14px}
	.card-body {padding: 16px !important}
	.card-title, .card {margin-bottom: 16px !important}
</style>
<form method="post">
<div class="row">
	<div class="col-md-8">

    <div class="form-group">
      <h3>Tambah Postingan Baru</h3>
      <input type="text" class="form-control form-control-sm" id="judul" name="judul" placeholder="Judul postingan..." required>
      <p class="mb-md-0 m-1 d-none"><b>Permalink : </b>http://</p>
    </div>
    <textarea class="d-none" id="summernoteExample" name="isi" required>
    </textarea>
		
	</div>
	<div class="col-md-4">

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Publishing</h4>
				<div class="form-group row m-0">
          <div class="form-check col-4 my-0">
            <label class="form-check-label">
              <input type="radio" class="form-check-input" name="status" value="publish" onclick='setSubmit("publish")'checked>
              Publish
            </label>
          </div>
          <div class="form-check col-4 my-0">
            <label class="form-check-label">
              <input type="radio" class="form-check-input" name="status" value="draft" onclick='setSubmit("draft")'>
              Draft
            </label>
          </div>
          <div class="form-check form-check-danger col-4 my-0">
            <label class="form-check-label">
              <input type="radio" class="form-check-input" name="status" value="trash" onclick='setSubmit("trash")'>
              Trash
            </label>
          </div>
        </div>
        <hr>
        <div class="row m-0">
        	<button type="submit" name="submit-new" id="submitNew" class="btn btn-primary ml-auto">Publish</button>
        </div>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Permalink</h4>
				<input type="text" class="form-control form-control-sm" id="link" name="link" required>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Tag</h4>
				<div class="form-group row m-0">
          <div class="form-check col-6 my-0">
            <label class="form-check-label"><input type="checkbox" class="form-check-input">Default</label>
          </div>
          <div class="form-check col-6 my-0">
            <label class="form-check-label"><input type="checkbox" class="form-check-input" checked> Checked</label>
          </div>
          <div class="form-check col-6 my-0">
            <label class="form-check-label"><input type="checkbox" class="form-check-input"> Teknologi</label>
          </div>
        </div>
			</div>
		</div>
		
	</div>

</div>
</form>

<script type="text/javascript">
  function setSubmit(data){
  	if (data=="publish") {
  		document.getElementById("submitNew").textContent = "Publish";
  		document.getElementById("submitNew").classList.add("btn-primary");
    	document.getElementById("submitNew").classList.remove("btn-outline-danger");
  	}
    if (data=="draft") {
    	document.getElementById("submitNew").textContent = "Save Draft";
    	document.getElementById("submitNew").classList.add("btn-primary");
    	document.getElementById("submitNew").classList.remove("btn-outline-danger");
    }
    if (data=="trash") {
    	document.getElementById("submitNew").textContent = "Move to Trash";
    	document.getElementById("submitNew").classList.remove("btn-primary");
    	document.getElementById("submitNew").classList.add("btn-outline-danger");
    }
  }
</script>
<script type="text/javascript">
	document.getElementById("judul").addEventListener("change",function(){
		var judul = document.getElementById("judul").value;
		var link = judul.replace(/[^a-z0-9]+/gi, '-').replace(/^-*|-*$/g, '').toLowerCase();
		document.getElementById("link").value = link;
	});
</script>