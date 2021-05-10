<?php  
  if (isset($_POST["submit-tambah"])) {
    if (!empty($_POST["nama"])&&!empty($_POST["username"])&&!empty($_POST["password"])&&!empty($_POST["jabatan"])&&!empty($_POST["level"])) {
      $nama       = $_POST["nama"];
      $username   = $_POST["username"];
      $password   = MD5($_POST["password"]);
      $jabatan    = $_POST["jabatan"];
      $level      = $_POST["level"];
      if (mysqli_num_rows(mysqli_query($koneksi, "SELECT * FROM `user` WHERE `username`='$username'"))=="0") {
        $sql_t = "INSERT INTO `user` (`nama`, `username`, `password`, `level`, `jabatan`)
                  VALUES ('$nama', '$username', '$password', '$level', '$jabatan')";
        mysqli_query($koneksi,$sql_t);
        $berhasil = "Akun berhasil ditambahkan";
      } else {$gagal = "Username telah terpakai";}
    }else {$gagal = "Semua data wajib diisi!";}
  }
?> 
          <section class="row">
            <div class="col-md-12 grid-margin">
              <div class="d-flex justify-content-between flex-wrap">
                <div class="d-flex align-items-end flex-wrap">
                  <div class="mr-md-3 mr-xl-5">
                    <div class="row m-0">
                      <h2>Pengaturan User</h2>
                      <button type="button" class="btn btn-outline-primary btn-sm mx-3" data-toggle="modal" data-target="#tambahUser" style="height: fit-content;">
                        Tambah User
                      </button>
                    </div>
                    <p class="mb-md-0">Tambah, Edit dan Delete User.</p>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <section class="card">
            <div class="card-body">
              <h4 class="card-title">Data User</h4>
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
                          <th>Username</th>
                          <th>Jabatan</th>
                          <th>Level</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php 
                          //query sql
                          $no = 1;
                          $sql = "SELECT * FROM `user` ORDER BY `id_user` DESC"; 
                          $query = mysqli_query($koneksi,$sql); 
                          while($data = mysqli_fetch_array($query)){ 
                             $id_user   = $data["id_user"]; 
                             $nama      = $data["nama"];
                             $username  = $data["username"];
                             $foto      = $data["foto"];
                             $jabatan   = $data["jabatan"];
                             $level     = $data["level"];
                             if (empty($foto)) {$foto="default.png";}
                        ?>
                        <tr>
                          <td class="td-nomer"><?= $no ?></td>
                          <td>
                            <img src="assets/img/profil/<?= $foto ?>" class="rounded-circle of-cover mr-2" style="height:16px;width:16px">
                            <span><?= $nama ?></span>
                          </td>
                          <td><?= $username ?></td>
                          <td><?= $jabatan ?></td>
                          <td><?= $level ?></td><td>
                            <button type="button" class="btn btn-primary btn-sm btn-table" title="Edit" data-toggle="modal" data-target="#editUser" onclick='editUser(<?php echo  '"'.$id_user.'"' ?>)'><i class="mdi mdi-pencil"></i></button>
                            <p id="<?= $id_user ?>" class="d-none"><?php echo $nama.','.$username.','.$jabatan.','.$level ?></p>
                            <button type="button" class="btn btn-primary btn-sm btn-table" title="Edit Logo" data-toggle="modal" data-target="#editFoto" onclick='editFoto(<?php echo  '"'.$id_user.'"' ?>)'><i class="mdi mdi-image-area"></i></button>
                            <button type="button" class="btn btn-danger btn-sm btn-table" title="Hapus"><i class="mdi mdi-delete-forever"></i></button>
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

          <div class="modal fade" id="tambahUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel"><i class="mdi mdi-account-plus"></i> Tambah User</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form class="forms-sample" method="post">
                    <div class="form-group">
                      <label for="nama">Nama</label>
                      <input type="text" class="form-control form-control-sm" id="nama" name="nama" placeholder="Nama..." required>
                    </div>
                    <div class="form-group">
                      <div class="row m-0">
                        <div class="col-6 p-0 pr-2">
                          <label for="username">Username</label>
                          <input type="text" class="form-control form-control-sm" id="username" name="username" placeholder="Username..." required>
                        </div>
                        <div class="col-6 p-0 pr-2">
                          <label for="password">Password</label>
                          <input type="password" class="form-control form-control-sm" id="password" name="password" placeholder="Password..." minlength="6" required>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="row m-0">
                        <div class="col-8 p-0 pr-2">
                          <label for="jabatan">Jabatan</label>
                          <input type="text" class="form-control form-control-sm" id="jabatan" name="jabatan" placeholder="Ketua Divisi..." required>
                        </div>
                        <div class="col-4 p-0 pr-2">
                          <label for="level">Level</label>
                          <select class="form-control form-control-sm" id="level" name="level">
                            <option value="admin">Admin</option>
                            <option value="superadmin">Superadmin</option>
                          </select>
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

          <div class="modal fade" id="editUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel"><i class="mdi mdi-pencil"></i> Edit User</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form class="forms-sample" method="post">
                    <div class="form-group">
                      <label for="nama">Nama</label>
                      <input type="text" class="form-control form-control-sm" id="eNama" name="nama" placeholder="Nama..." required>
                    </div>
                    <div class="form-group">
                      <div class="row m-0">
                        <div class="col-6 p-0 pr-2">
                          <label for="username">Username</label>
                          <input type="text" class="form-control form-control-sm" id="eUsername" name="username" placeholder="Username..." required>
                        </div>
                        <div class="col-6 p-0 pr-2">
                          <label for="password">Password</label>
                          <input type="password" class="form-control form-control-sm" id="password" name="password" placeholder="Password...">
                          <p>Kosongkan jika tidak ingin mengganti password</p>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="row m-0">
                        <div class="col-8 p-0 pr-2">
                          <label for="jabatan">Jabatan</label>
                          <input type="text" class="form-control form-control-sm" id="eJabatan" name="jabatan" placeholder="Ketua Divisi..." required>
                        </div>
                        <div class="col-4 p-0 pr-2">
                          <label for="level">Level</label>
                          <select class="form-control form-control-sm" id="level" name="level">
                            <option class="eLevel" value="admin">Admin</option>
                            <option class="eLevel" value="superadmin">Superadmin</option>
                          </select>
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

          <div class="modal fade" id="editFoto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="eNamaLogo"><i class="mdi mdi-image-area"></i> Edit Logo</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form class="forms-sample" method="post" enctype="multipart/form-data">
                    <input type="hidden" class="d-none" id="eIdLogo" name="id_univ" required>
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
                        <li class="text-danger">Logo harus berformat JPG atau PNG.</p></li>
                        <li class="text-danger">Logo tidak boleh lebih dari 500 KB.</li>
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
            function editUser(iduser){
              var dataUser = (document.getElementById(iduser).textContent).split(",");
              document.getElementById("eNama").value = dataUser[0];
              document.getElementById("eUsername").value = dataUser[1];
              document.getElementById("eJabatan").value = dataUser[2];
              for (var i = 0; i < document.getElementsByClassName("eLevel").length ; i++) {
                if (document.getElementsByClassName("eLevel")[i].value==dataUser[3]) {
                  document.getElementsByClassName("eLevel")[i].selected = "true";
                }
              }
            }
          </script>