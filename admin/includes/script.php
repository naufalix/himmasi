<!-- plugins:js -->
  <script src="assets/vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <script src="assets/vendors/chart.js/Chart.min.js"></script>
  <script src="assets/vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <script src="assets/vendors/summernote/dist/summernote-bs4.min.js"></script>
  <!-- <script src="assets/vendors/lightgallery/js/lightgallery-all.min.js"></script> -->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="assets/js/off-canvas.js"></script>
  <script src="assets/js/hoverable-collapse.js"></script>
  <script src="assets/js/template.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="assets/js/dashboard.js"></script>
  <script src="assets/js/data-table.js"></script>
  <script src="assets/js/jquery.dataTables.js"></script>
  <script src="assets/js/dataTables.bootstrap4.js"></script>
  <script src="assets/js/file-upload.js"></script>
  <script src="assets/js/chart.js"></script>
  <script src="assets/js/editorDemo.js"></script>
  <!-- End custom js for this page-->
  <script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
  <!-- <script src="assets/js/light-gallery.js"></script> -->

  <!-- Datatable default show entries -->  
  <script type="text/javascript">
    $(document).ready(function(){
      $('#data-alumni').dataTable({
        "aLengthMenu":[[25, 50, 100, 200, -1], [25, 50, 100, 200, "Semua"]],
        "pageLength":25
      })
    })
  </script>
  <script type="text/javascript">
    function editAlumni(nis){
      var dataAlumni = (document.getElementById(nis).textContent).split(",");
      document.getElementById("eId").value = dataAlumni[0];
      document.getElementById("eNis").value = dataAlumni[1];
      document.getElementById("eNama").value = dataAlumni[2];
      if (dataAlumni[3]=="P") {document.getElementById("eJkP").selected = "true";}
      if (dataAlumni[3]=="L") {document.getElementById("eJkL").selected = "true";}
      if (dataAlumni[4]=="IPA") {document.getElementById("eKelasIpa").selected = "true";}
      if (dataAlumni[4]=="IPS") {document.getElementById("eKelasIps").selected = "true";}
      document.getElementById("eJurusan").value = dataAlumni[6];
      document.getElementById("eJalur").value = dataAlumni[8];
      for (var i = 0; i < document.getElementsByClassName("eJenjang").length ; i++) {
        if (document.getElementsByClassName("eJenjang")[i].value==dataAlumni[5]) {
          document.getElementsByClassName("eJenjang")[i].selected = "true";
        }
      }
      for (var i = 0; i < document.getElementsByClassName("eUniv").length ; i++) {
        if (document.getElementsByClassName("eUniv")[i].textContent==dataAlumni[7]) {
          document.getElementsByClassName("eUniv")[i].selected = "true";
        }
      }
    }
  </script> 
  <script type="text/javascript">
    function editUniv(idUniv){
      var dataUniv = (document.getElementById(idUniv).textContent).split(",");
      document.getElementById("eIdUniv").value = dataUniv[0];
      document.getElementById("eNamaUniv").value = dataUniv[1];
      for (var i = 0; i < document.getElementsByClassName("eStatus").length ; i++) {
        if (document.getElementsByClassName("eStatus")[i].value==dataUniv[2]) {
          document.getElementsByClassName("eStatus")[i].selected = "true";
        }
      }
    }
  </script>   
  <script type="text/javascript">
    function editLogo(idUniv){
      var dataUniv = (document.getElementById(idUniv).textContent).split(",");
      document.getElementById("eIdLogo").value = dataUniv[0];
      document.getElementById("eNamaLogo").textContent = "Edit Logo "+dataUniv[1];
    }
  </script>
  <script type="text/javascript">
    $('document').ready(dataAngkatan(57));
    function dataAngkatan(g){
      var dataJumlah = (document.getElementById("data-g"+g).textContent).split(",");
      document.getElementById("jumPTN").textContent = dataJumlah[0]+" Orang";
      document.getElementById("jumPTS").textContent = dataJumlah[1]+" Orang";
      document.getElementById("jumKED").textContent = dataJumlah[2]+" Orang";
      document.getElementById("jumPOL").textContent = dataJumlah[3]+" Orang";
    }
  </script>    