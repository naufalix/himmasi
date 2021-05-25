<?php 
  /* Edit */
  if (isset($_POST["submit-edit"])) {
    if (!empty($_POST["nama"])&&!empty($_POST["deskripsi"])&&!empty($_POST["jumlah"])&&!empty($_POST["id_dept"])) {
      $id_dept       = $_POST["id_dept"];
      $nama          = $_POST["nama"];
      $deskripsi     = $_POST["deskripsi"];
      $jumlah        = $_POST["jumlah"];
        mysqli_query($koneksi,"UPDATE `departemen` SET `nama`='$nama',`deskripsi`='$deskripsi',`jumlah`='$jumlah' WHERE `id_dept`='$id_dept'");
        $berhasil = "Departemen berhasil di edit";
      }else {$gagal = "Semua data wajib diisi!";}
    } 

  /* Edit Logo*/  
  if (isset($_POST["submit-logo"])) {
    if(!empty($_POST["id_dept"])) {
      $id_dept =$_POST["id_dept"];
      if (isset($_FILES['logo'])) {
        $file_tmp   = $_FILES['logo']['tmp_name'];
        $file_name  = $_FILES['logo']['name']; 
        $file_exp   = explode('.',$file_name);
        $file_ext   = end($file_exp);
        $query_dept = mysqli_query($koneksi,"SELECT `nama` FROM `departemen` WHERE `id_dept`='$id_dept'"); 
        while($data_dept = mysqli_fetch_row($query_dept)){ $nama_dept = $data_dept[0]; }
        $nama_file  = $nama_dept.".".$file_ext;
        $direktori  = '../assets/img/logo/'.$nama_file;
        if(move_uploaded_file($file_tmp,$direktori)){ 
          mysqli_query($koneksi,"UPDATE `departemen` SET `logo`='$nama_file' WHERE `id_dept`='$id_dept'");
          $berhasil="Logo berhasil diupload";
        }
      }else{$gagal="Logo gagal diupload";}
    }
  }
?> 
          <section class="row">
            <div class="col-md-12 grid-margin">
              <div class="d-flex justify-content-between flex-wrap">
                <div class="d-flex align-items-end flex-wrap">
                  <div class="mr-md-3 mr-xl-5">
                    <div class="row m-0">
                      <h2>Pengaturan Departemen</h2>
                      <!-- <button type="button" class="btn btn-outline-primary btn-sm mx-3" data-toggle="modal" data-target="#tambahDept" style="height: fit-content;">
                        Tambah Departemen
                      </button> -->
                    </div>
                    <p class="mb-md-0">Edit Departemen.</p>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <section class="card">
            <div class="card-body">
              <h4 class="card-title">Data Departemen</h4>
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
                          <th>Deskripsi</th>
                          <th>Jumlah</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php 
                          //query sql
                          $no = 1;
                          $sql = "SELECT * FROM `departemen` ORDER BY `id_dept`"; 
                          $query = mysqli_query($koneksi,$sql); 
                          while($data = mysqli_fetch_array($query)){ 
                             $id_dept   = $data["id_dept"]; 
                             $nama      = $data["nama"];
                             $deskripsi = $data["deskripsi"];
                             $jumlah    = $data["jumlah"];
                             $logo      = $data["logo"];
                             if (empty($logo)) {$logo="default.png";}
                        ?>
                        <tr>
                          <td class="td-nomer"><?= $no ?></td>
                          <td>
                            <img src="../assets/img/logo/<?= $logo ?>" class="rounded-0 img-profil mr-2" style="height:16px;width:16px">
                            <span><?= $nama ?></span>
                          </td>
                          <td class="td-deskripsi"><?= $deskripsi ?></td>
                          <td><?= $jumlah ?></td>
                          <td>
                            <button type="button" class="btn btn-primary btn-sm btn-table" title="Edit" data-toggle="modal" data-target="#editDepartemen" onclick='editDepartemen(<?php echo  '"'.$id_dept.'"' ?>)'><i class="mdi mdi-pencil"></i></button>
                            <p id="<?= $id_dept ?>" class="d-none"><?php echo $nama.'|'.$deskripsi.'|'.$jumlah ?></p>
                            <button type="button" class="btn btn-primary btn-sm btn-table" title="Edit Logo" data-toggle="modal" data-target="#editLogo" onclick='editLogo(<?php echo  '"'.$id_dept.'"' ?>)'><i class="mdi mdi-image-area"></i></button>
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

          <div class="modal fade" id="editDepartemen" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel"><i class="mdi mdi-pencil"></i> Edit Departemen</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form class="forms-sample" method="post">
                    <input type="hidden" class="d-none" id="eId" name="id_dept">
                    <div class="form-group">
                      <div class="row m-0">
                        <div class="col-6 p-0 pr-2">
                          <label for="nama">Nama</label>
                          <input type="text" class="form-control form-control-sm" id="eNama" name="nama" placeholder="Nama..." required>
                        </div>
                        <div class="col-6 p-0 pr-2">
                          <label for="jumlah">Jumlah</label>
                          <input type="text" class="form-control form-control-sm" id="eJumlah" name="jumlah" placeholder="Jumlah..." required>
                      </div>
                      </div>
                    </div>
                    <div class="form-group">
                        <label for="deskripsi">Deskripsi</label>
                        <textarea class="form-control form-control-sm" id="eDeskripsi" name="deskripsi" placeholder="Deskripsi..." required style="height: 150px !important;"></textarea>
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

          <div class="modal fade" id="editLogo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="eNamaLogo"><i class="mdi mdi-image-area"></i> Edit Logoo</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form class="forms-sample" method="post" enctype="multipart/form-data">
                    <input type="hidden" class="d-none" id="eIdLogo" name="id_dept" required>
                    <div class="form-group">
                      <label>Logo</label>
                      <input type="file" name="logo" class="file-upload-default" id="customFile">
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
                      <button type="submit" name="submit-logo" class="btn btn-success"><i class="mdi mdi-content-save"></i><span> Simpan</span></button>
                      <button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>

          <script type="text/javascript">
            function editDepartemen(iddept){
              var dataDepartemen = document.getElementById(iddept).textContent.split("|");
              document.getElementById("eId").value = iddept;
              document.getElementById("eNama").value = dataDepartemen[0];
              document.getElementById("eDeskripsi").value = dataDepartemen[1];
              document.getElementById("eJumlah").value = dataDepartemen[2];
            }
            function editLogo(iddept){
              document.getElementById("eIdLogo").value = iddept;
            }

          </script>