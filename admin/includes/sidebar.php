      <style type="text/css">
        .nav-item.active .nav-link i{color: #000 !important;}
        .nav-item.active .nav-link span{color: #000 !important;}
      </style>
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="index.php">
              <i class="mdi mdi-speedometer menu-icon"></i>
              <span class="menu-title">Dashboard</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#post" aria-expanded="false" aria-controls="ui-basic">
              <i class="mdi mdi-pin menu-icon" style="transform: rotate(45deg);"></i>
              <span class="menu-title">Post</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="post">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="index.php?page=postnew">Add New</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">All Post</a></li>
              </ul>
            </div>
          </li>
          <!-- <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#pages" aria-expanded="false" aria-controls="ui-basic">
              <i class="mdi mdi-content-copy menu-icon flip-v"></i>
              <span class="menu-title">Pages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="pages">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">Add New</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">All Pages</a></li>
              </ul>
            </div>
          </li> -->
          <li class="nav-item">
            <a class="nav-link" href="#">
              <i class="mdi mdi-folder-multiple-image menu-icon"></i>
              <span class="menu-title">Media</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#website" aria-expanded="false" aria-controls="ui-basic">
              <i class="mdi mdi-laptop-chromebook menu-icon"></i>
              <span class="menu-title">Website</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="website">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">Navbar</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">Visi & Misi</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">Footer</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="index.php?page=user">
              <i class="mdi mdi-account menu-icon"></i>
              <span class="menu-title">Pengaturan User</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="index.php?page=profil">
              <i class="mdi mdi-account menu-icon"></i>
              <span class="menu-title">Profil</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="index.php?page=editpassword">
              <i class="mdi mdi-key-variant menu-icon flip-h"></i>
              <span class="menu-title">Edit Password</span>
            </a>
          </li>

          <!-- <li class="nav-item">
            <a class="nav-link">
              <br>
              <span class="menu-title"></span>
            </a>
          </li> -->

        </ul>
      </nav>