<?php 
  /* Tambah */ 
  if (isset($_POST["submit-tambah"])) {
    if (!empty($_POST["nama"])&&!empty($_POST["id_dept"])&&!empty($_POST["jabatan"])&&!empty($_POST["tampil"])&&!empty($_POST["urutan"])) {
      $nama      = $_POST["nama"];
      $id_dept   = $_POST["id_dept"];
      $jabatan   = $_POST["jabatan"];
      $tampil    = $_POST["tampil"];
      $urutan    = $_POST["urutan"];
      
      if (mysqli_num_rows(mysqli_query($koneksi, "SELECT * FROM `anggota` WHERE `nama`='$nama'"))=="0") {
        $sql_t = "INSERT INTO `anggota` (`nama`, `id_dept`, `jabatan`, `tampil`, `urutan`)
                  VALUES ('$nama', '$id_dept', '$jabatan', '$tampil', '$urutan')";
        mysqli_query($koneksi,$sql_t);
        $berhasil = "Anggota berhasil ditambahkan";
      } else {$gagal = "Nama telah tercantum dalam daftar";}
    }else {$gagal = "Semua data wajib diisi!";}
  }

  /* Edit */
  if (isset($_POST["submit-edit"])) {
    if (!empty($_POST["id_anggota"])&&!empty($_POST["nama"])&&!empty($_POST["id_dept"])&&!empty($_POST["jabatan"])&&!empty($_POST["tampil"])&&!empty($_POST["urutan"])) {
      $id_anggota  = $_POST["id_anggota"];
      $nama        = $_POST["nama"];
      $id_dept     = $_POST["id_dept"];
      $jabatan     = $_POST["jabatan"];
      $tampil      = $_POST["tampil"];
      $urutan      = $_POST["urutan"];
      mysqli_query($koneksi,"UPDATE `anggota` SET `nama`='$nama',`id_dept`='$id_dept',`jabatan`='$jabatan',`tampil`='$tampil',`urutan`='$urutan' WHERE `id_anggota`='$id_anggota'");
      $berhasil = "Akun berhasil diedit";  
    } else {$gagal = "Semua data wajib diisi!";}
  }

  /* Edit Foto*/  
  if (isset($_POST["submit-foto"])) {
    if(!empty($_POST["id_anggota"])) {
      $id_anggota =$_POST["id_anggota"];
      if (isset($_FILES['foto'])) {
      $file_tmp   = $_FILES['foto']['tmp_name'];
      $file_name  = $_FILES['foto']['name']; 
      $file_exp   = explode('.',$file_name);
      $file_ext   = end($file_exp);
      $nama_file  = $id_anggota.".".$file_ext;
      $direktori  = '../assets/img/foto/'.$nama_file;
      if(move_uploaded_file($file_tmp,$direktori)){ 
        mysqli_query($koneksi,"UPDATE `anggota` SET `foto`='$nama_file' WHERE `id_anggota`='$id_anggota'");
        $berhasil="Foto berhasil diupload";
      }
    }
    else{
      $gagal="Foto gagal diupload";
    }
  }
}

/* Hapus anggota*/ 
if (isset($_POST["submit-hapus"])) {
  if (!empty($_POST["id_anggota"])) {
    $id_anggota =$_POST["id_anggota"];
    mysqli_query($koneksi,"DELETE from `anggota` where `id_anggota` = '$id_anggota'");
    //get foto
    $query_f = mysqli_query($koneksi,"SELECT `foto` FROM `anggota` WHERE `id_anggota`='$id_anggota'"); 
    if(mysqli_num_rows($query_f)!="0"){ 
      while($data_f = mysqli_fetch_row($query_f)){ 
        $foto = $data_f[0]; 
        //menghapus foto 
        unlink("../assets/img/foto/$foto"); 
      } 
    }
    $berhasil= "Akun berhasil dihapus";
  }
} 
?> 
          <section class="row">
            <div class="col-md-12 grid-margin">
              <div class="d-flex justify-content-between flex-wrap">
                <div class="d-flex align-items-end flex-wrap">
                  <div class="mr-md-3 mr-xl-5">
                    <div class="row m-0">
                      <h2>Pengaturan Anggota</h2>
                      <button type="button" class="btn btn-outline-primary btn-sm mx-3" data-toggle="modal" data-target="#tambahanggota" style="height: fit-content;">
                        Tambah Anggota
                      </button>
                    </div>
                    <p class="mb-md-0">Tambah, Edit dan Delete Anggota.</p>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <section class="card">
            <div class="card-body">
              <h4 class="card-title">Data Anggota</h4>
              <?php 
                if (isset($berhasil)) {?>
                  <div class="alert alert-success col-12" role="alert">
                    <p><?= $berhasil ?></p>
                  </div>
                <?php } else if (isset($gagal)) {?>
                  <div class="alert alert-danger col-12" role="alert">
                    <p><?= $gagal ?></p>
                  </div>
                <?php }
              ?>
              <div class="row">
                <div class="col-12">
                  <div class="table-responsive">
                    <table id="data-alumni" class="table">
                      <thead>
                        <tr>
                          <th>No.</th>
                          <th>Nama</th>
                          <th>Departemen</th>
                          <th>Jabatan</th>
                          <th>Tampil</th>
                          <th>Urutan</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php 
                          //query sql
                          $no = 1;
                          $sql = "SELECT * FROM `anggota` ORDER BY `id_anggota` DESC"; 
                          $query = mysqli_query($koneksi,$sql); 
                          while($data = mysqli_fetch_array($query)){ 
                             $id_anggota  = $data["id_anggota"]; 
                             $nama        = $data["nama"];
                             $id_dept     = $data["id_dept"];
                             $foto        = $data["foto"];
                             $jabatan     = $data["jabatan"];
                             $tampil      = $data["tampil"];
                             $urutan      = $data["urutan"];
                             if (empty($foto)) {$foto="default.png";}
                        ?>
                        <tr>
                          <td class="td-nomer"><?= $no ?></td>
                          <td>
                            <img src="../assets/img/foto/<?= $foto ?>" class="rounded-circle img-profil mr-2" style="height:16px;width:16px">
                            <span><?= $nama ?></span>
                          </td>
                          <td>
                            <?php 
                              $query_dept = mysqli_query($koneksi,"SELECT `nama` FROM `departemen` WHERE `id_dept`='$id_dept'"); 
                              while($data_dept = mysqli_fetch_row($query_dept)){ echo $data_dept[0]; }
                            ?>
                          </td>
                          <td><?= $jabatan ?></td>
                          <td><?= $tampil ?></td>
                          <td><?= $urutan ?></td>
                          <td>
                            <button type="button" class="btn btn-primary btn-sm btn-table" title="Edit" data-toggle="modal" data-target="#editanggota" onclick='editanggota(<?php echo  '"'.$id_anggota.'"' ?>)'><i class="mdi mdi-pencil"></i></button>
                            <p id="<?= $id_anggota ?>" class="d-none"><?php echo $nama.','.$id_dept.','.$jabatan.','.$tampil.','.$urutan ?></p>
                            <button type="button" class="btn btn-primary btn-sm btn-table" title="Edit Foto" data-toggle="modal" data-target="#editFoto" onclick='editFoto(<?php echo  '"'.$id_anggota.'"' ?>)'><i class="mdi mdi-image-area"></i></button>
                            <button type="button" class="btn btn-danger btn-sm btn-table" title="Hapus"  data-toggle="modal" data-target="#hapusanggota" onclick='hapusanggota(<?php echo  '"'.$id_anggota.'"' ?>)'><i class="mdi mdi-delete-forever"></i></button>
                          </td>
                        </tr>
                        <?php $no++; } ?>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <div class="modal fade" id="tambahanggota" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel"><i class="mdi mdi-account-plus"></i> Tambah anggota</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form class="forms-sample" method="post">
                    <div class="form-group">
                      <div class="row m-0">
                        <div class="col-6 p-0 pr-2">
                          <label for="nama">Nama</label>
                          <input type="text" class="form-control form-control-sm" id="nama" name="nama" placeholder="Nama..." required>
                        </div>
                        <div class="col-6 p-0 pr-2">
                          <label for="departemen">Departemen</label>
                          <select class="form-control form-control-sm" id="id_dept" name="id_dept">
                            <?php 
                              $query_dept = mysqli_query($koneksi,"SELECT * FROM `departemen`"); 
                              while($data_dept = mysqli_fetch_array($query_dept)){ $id_dept ;
                            ?>
                              <option value="<?= $data_dept["id_dept"] ?>"><?= $data_dept["nama"] ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="row m-0">
                        <div class="col-7 p-0 pr-2">
                          <label for="jabatan">Jabatan</label>
                          <input type="text" class="form-control form-control-sm" id="jabatan" name="jabatan" placeholder="Ketua departemen..." required>
                        </div>
                        <div class="col-3 p-0 pr-2">
                          <label for="tampil">Tampil</label>
                          <select class="form-control form-control-sm" id="tampil" name="tampil">
                            <option value="show">Show</option>
                            <option value="hide">Hide</option>
                          </select>
                        </div>
                        <div class="col-2 p-0 pr-2">
                          <label for="urutan">Urutan</label>
                          <input type="text" class="form-control form-control-sm" id="urutan" name="urutan" placeholder="Select..." required>
                        </div>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="submit" name="submit-tambah" class="btn btn-success"><i class="mdi mdi-check"></i><span> Submit</span></button>
                      <button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>

          <div class="modal fade" id="editanggota" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel"><i class="mdi mdi-pencil"></i> Edit anggota</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form class="forms-sample" method="post">
                    <input type="hidden" class="d-none" id="eId" name="id_anggota">
                    <div class="form-group">
                      <div class="row m-0">
                        <div class="col-6 p-0 pr-2">
                          <label for="nama">Nama</label>
                          <input type="text" class="form-control form-control-sm" id="eNama" name="nama" placeholder="Nama..." required>
                        </div>
                        <div class="col-6 p-0 pr-2">
                          <label for="departemen">Departemen</label>
                          <select class="form-control form-control-sm" name="id_dept">
                            <?php 
                              $query_dept = mysqli_query($koneksi,"SELECT * FROM `departemen`"); 
                              while($data_dept = mysqli_fetch_array($query_dept)){ $id_dept ;
                            ?>
                              <option class="eIdDept" value="<?= $data_dept["id_dept"] ?>"><?= $data_dept["nama"] ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="row m-0">
                        <div class="col-7 p-0 pr-2">
                          <label for="jabatan">Jabatan</label>
                          <input type="text" class="form-control form-control-sm" id="eJabatan" name="jabatan" placeholder="Ketua departemen..." required>
                        </div>
                        <div class="col-3 p-0 pr-2">
                          <label for="tampil">Tampil</label>
                          <select class="form-control form-control-sm" name="tampil">
                            <option class="eTampil" value="show">Show</option>
                            <option class="eTampil" value="hide">Hide</option>
                          </select>
                        </div>
                        <div class="col-2 p-0 pr-2">
                          <label for="urutan">Urutan</label>
                          <input type="text" class="form-control form-control-sm" id="eUrutan" name="urutan" placeholder="Select..." required>
                        </div>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="submit" name="submit-edit" class="btn btn-success"><i class="mdi mdi-content-save"></i><span> Simpan</span></button>
                      <button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>      

          <div class="modal fade" id="hapusanggota" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-sm" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="eNamaHapus"><i class="mdi mdi-delete-forever"></i> Hapus anggota</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form class="forms-sample" method="post" enctype="multipart/formdata">
                    <input type="hidden" class="d-none" id="eIdHapus" name="id_anggota" required>
                   <div class="form-group">
                    <p class="" id="eDesc">Apakah anda yakin ingin menghapus anggota?</p>
                   </div>
                    <div class="modal-footer p-0 pt-3">
                      <button type="button" class="btn btn-sm btn-outline-dark" data-dismiss="modal">Batal</button>
                      <button type="submit" class="btn btn-sm btn-danger" name="submit-hapus"><i class="mdi mdi-delete-forever"></i><span> Hapus</span></button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>      

          <div class="modal fade" id="editFoto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="eNamaLogo"><i class="mdi mdi-image-area"></i> Edit Foto</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form class="forms-sample" method="post" enctype="multipart/form-data">
                    <input type="hidden" class="d-none" id="eIdFoto" name="id_anggota" required>
                    <div class="form-group">
                      <label>Foto</label>
                      <input type="file" name="foto" class="file-upload-default" id="customFile">
                      <div class="input-group col-xs-12">
                        <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
                        <span class="input-group-append">
                          <button class="file-upload-browse btn btn-primary btn-sm" type="button">Upload</button>
                        </span>
                      </div>
                      <ul class="my-2">
                        <li class="text-danger">Foto harus berformat JPG atau PNG.</p></li>
                        <li class="text-danger">Foto tidak boleh lebih dari 500 KB.</li>
                      </ul>
                    </div>
                    <div class="modal-footer">
                      <button type="submit" name="submit-foto" class="btn btn-success"><i class="mdi mdi-content-save"></i><span> Simpan</span></button>
                      <button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>

          <script type="text/javascript">
            function editanggota(idanggota){
              var dataanggota = (document.getElementById(idanggota).textContent).split(",");
              document.getElementById("eId").value = idanggota;
              document.getElementById("eNama").value = dataanggota[0];
              document.getElementById("eJabatan").value = dataanggota[2];
              document.getElementById("eUrutan").value = dataanggota[4];
              for (var i = 0; i < document.getElementsByClassName("eIdDept").length ; i++) {
                if (document.getElementsByClassName("eIdDept")[i].value==dataanggota[1]) {
                  document.getElementsByClassName("eIdDept")[i].selected = "true";
                }
              }
              for (var i = 0; i < document.getElementsByClassName("eTampil").length ; i++) {
                if (document.getElementsByClassName("eTampil")[i].value==dataanggota[3]) {
                  document.getElementsByClassName("eTampil")[i].selected = "true";
                }
              }
              
            }
            function hapusanggota(idanggota){
              var dataanggota2 = (document.getElementById(idanggota).textContent).split(",");
              document.getElementById("eIdHapus").value = idanggota;
              document.getElementById("eDesc").textContent = 'Apakah anda yakin ingin menghapus "'+dataanggota2[0]+'"?';
            }
            function editFoto(idanggota){
              document.getElementById("eIdFoto").value = idanggota;
            }

          </script>