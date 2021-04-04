<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- Bootstrap4 Duallistbox -->
  <link rel="stylesheet" href="plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
  <!-- BS Stepper -->
  <link rel="stylesheet" href="plugins/bs-stepper/css/bs-stepper.min.css">
  <!-- dropzonejs -->
  <link rel="stylesheet" href="plugins/dropzone/min/dropzone.min.css">
  
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet" href="dist/font/fonts.css"/>
<style type="text/css">
html, body {
	font-family: "Noto Sans KR", "Source Sans Pro", sans-serif !important;
}
</style>
<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#sm-dashboard").addClass("menu-open");
		$("#sb-task").addClass("active");
		$("#sb-task").addClass("active");
	});
</script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
<!-- Navbar -->
  <jsp:include page="../a00_common/a00_header.jsp"/>

  <!-- Main Sidebar Container -->
  <jsp:include page="../a00_common/a01_sidebar.jsp"/>  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Task</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

     <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- SELECT2 EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">새 Task 만들기</h3>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>프로젝트 *</label>
                  <select class="form-control select2" style="width: 100%;">
                    <option>게시판 프로젝트</option>
                    <option>화소반 프로젝트</option>
                    <option selected>PMS 프로젝트</option>
                  </select>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>상태 *</label>
                  <select class="form-control select2" disabled="disabled" style="width: 100%;">
                    <option selected="selected">신규</option>
                  </select>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>유형 *</label>
                  <select class="form-control select" style="width: 100%;">
                    <option>유형</option>
                    <option>결함</option>
                    <option>새기능</option>
                    <option>지원</option>
                  </select>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>상위일감</label>
                  <input type="text" class="form-control" style="width: 100%;">
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
             <%-- TODO: 제목, 설명 부분 화면에 꽉차게 하는 방법? --%>
            <div class="bs-stepper-content">
            	<div class="form-group">
            		<label>제목 *</label>
            		<input type="text" class="form-control" style="width: 100%;">
            	</div>
            	<div class="form-group">
            		<label>설명</label>            	
            		<textarea class="form-control" style="width: 100%; height:300px;"></textarea>
            	</div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>우선순위 *</label>
                  <select class="form-control select" style="width: 100%;">
                  	<option>우선순위</option>
                    <option>낮음</option>
                    <option>보통</option>
                    <option>높음</option>
                    <option>긴급</option>
                    <option>즉시</option>
                  </select>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>담당자</label>
                  <select class="form-control select" style="width: 100%;">
                  	<option>담당자</option>
                    <option>홍길동</option>
                    <option>김철수</option>
                    <option>이춘향</option>
                  </select>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>추정시간</label>
                  <input type="text" class="form-control" style="width: 100%;" placeholder="시간(숫자만 입력하세요)">
                </div>
                
                <div class="form-group">
                  <label>시작시간</label><br>
                  <div class="input-group date" id="startdate" data-target-input="nearest">
                       <input type="date" class="form-control" value="2021-04-05" style="width:100%;"><%-- 발표날짜에 맞춤 --%>
                    </div>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>담당그룹</label>
                  <select class="form-control select" style="width: 100%;">
                  	<option>담당그룹</option>
                    <option>개발팀1</option>
                    <option>개발팀2</option>
                    <option>개발팀3</option>
                  </select>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>진척도</label>
                  <select class="form-control select" style="width: 100%;">
                  	<option>진척도</option>
                    <option>낮음</option>
                    <option>보통</option>
                    <option>높음</option>
                    <option>긴급</option>
                    <option>즉시</option>
                  </select>
                </div>
                <div class="form-group">
                  <label>Task 관리자</label><br>
                  <select class="form-control select" style="width: 100%;">
                  	<option>관리자</option>
                    <option>홍길동</option>
                    <option>김철수</option>
                    <option>이춘향</option>
                  </select>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <!-- Date -->
                <div class="form-group">
                  <label>완료기한</label>
                   <div class="input-group date" id="enddate" data-target-input="nearest">
                       <input type="date" class="form-control" value="2021-04-06" style="width:100%;">
                   </div><br>
                
                <!-- /.form-group -->
                <div class="form-group">
                  <label for="exampleInputFile">첨부파일</label> <!-- 첨부파일명 안뜸 -->
                  <div class="custom-file">
                        <input type="file" class="custom-file-input" id="exampleInputFile">
                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                  </div><br><br>
                  <div class="form-group">
                  <label>연결된 일감</label>
                  <input type="text" class="form-control" style="width: 100%;">
                </div>
                
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->
			</div>   
			
				<!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary" onclick="location.href='${path}/task.do?method=list'">만들기</button>
                  <button type="button" class="btn btn-primary" onclick="location.href='${path}/task.do?method=list'">취소</button>
                </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
      </div>
    </section>
    <!-- /.content -->
  </div>
    <!-- Footer -->
  <jsp:include page="../a00_common/a02_footer.jsp"/>
 
  <!-- Control Sidebar -->
  <!-- <aside class="control-sidebar control-sidebar-dark">
    Control sidebar content goes here
  </aside> -->
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>

<!-- Select2 -->
<script src="plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- InputMask -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/inputmask/jquery.inputmask.min.js"></script>
<!-- date-range-picker -->
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap color picker -->
<script src="plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Bootstrap Switch -->
<script src="plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<!-- BS-Stepper -->
<script src="plugins/bs-stepper/js/bs-stepper.min.js"></script>
<!-- dropzonejs -->
<script src="/plugins/dropzone/min/dropzone.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

<!-- Page specific script -->
<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })

    //Date range picker
    $('#reservationdate').datetimepicker({
        format: 'L'
    });
    
    //Bootstrap Duallistbox
    $('.duallistbox').bootstrapDualListbox()

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    $('.my-colorpicker2').on('colorpickerChange', function(event) {
      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    });

    $("input[data-bootstrap-switch]").each(function(){
      $(this).bootstrapSwitch('state', $(this).prop('checked'));
    });
    $(function () {
    	  bsCustomFileInput.init();
    	});

  })
  // BS-Stepper Init
  document.addEventListener('DOMContentLoaded', function () {
    window.stepper = new Stepper(document.querySelector('.bs-stepper'))
  });

  // DropzoneJS Demo Code Start
  Dropzone.autoDiscover = false;

  // Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
  var previewNode = document.querySelector("#template");
  previewNode.id = "";
  var previewTemplate = previewNode.parentNode.innerHTML;
  previewNode.parentNode.removeChild(previewNode);

  var myDropzone = new Dropzone(document.body, { // Make the whole body a dropzone
    url: "/target-url", // Set the url
    thumbnailWidth: 80,
    thumbnailHeight: 80,
    parallelUploads: 20,
    previewTemplate: previewTemplate,
    autoQueue: false, // Make sure the files aren't queued until manually added
    previewsContainer: "#previews", // Define the container to display the previews
    clickable: ".fileinput-button" // Define the element that should be used as click trigger to select files.
  });

  myDropzone.on("addedfile", function(file) {
    // Hookup the start button
    file.previewElement.querySelector(".start").onclick = function() { myDropzone.enqueueFile(file); };
  });

  // Update the total progress bar
  myDropzone.on("totaluploadprogress", function(progress) {
    document.querySelector("#total-progress .progress-bar").style.width = progress + "%";
  });

  myDropzone.on("sending", function(file) {
    // Show the total progress bar when upload starts
    document.querySelector("#total-progress").style.opacity = "1";
    // And disable the start button
    file.previewElement.querySelector(".start").setAttribute("disabled", "disabled");
  });

  // Hide the total progress bar when nothing's uploading anymore
  myDropzone.on("queuecomplete", function(progress) {
    document.querySelector("#total-progress").style.opacity = "0";
  });

  // Setup the buttons for all transfers
  // The "add files" button doesn't need to be setup because the config
  // `clickable` has already been specified.
  document.querySelector("#actions .start").onclick = function() {
    myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
  };
  document.querySelector("#actions .cancel").onclick = function() {
    myDropzone.removeAllFiles(true);
  };
  // DropzoneJS Demo Code End
  
</script>
</body>
</html>