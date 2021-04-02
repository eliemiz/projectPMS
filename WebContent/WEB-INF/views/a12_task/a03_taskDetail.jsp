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
 <!-- pace-progress -->
  <link rel="stylesheet" href="plugins/pace-progress/themes/black/pace-theme-flat-top.css">
 
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
      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">새기능&nbsp;&nbsp;#2</h3>
        </div>
        <div class="card-body">
          <div style="text-align:right;">
          <a href="${path}/task.do?method=list">
          <i class="fas fa-list"></i>목록</a>&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="${path}/task.do?method=update">
          <i class="fas fa-pen"></i>편집</a>
          </div>
          <div style="background-Color:lightyellow; textcolor:black;">
                <h2 class="mb-0">
                  task2
                </h2>
                <hr align="left" style="border: solid 1px gray; width: 90%;">
         	<!-- /.card-header -->
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>상태</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;신규
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>우선순위</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;보통
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>완료기한</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;2021-04-06
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>추정시간</label>
                  &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;140시간
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
          <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>담당자/담당그룹</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;김철수
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>시작시간</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;2021-04-01
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>작업시간</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;130시간
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>진척도</label>
                  &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;85%
                </div>
                <!-- /.form-group -->
              </div>
              
              <!-- /.row -->
            </div>
            <hr align="left" style="border: solid 1px gray; width: 90%;">
            <div class="bs-stepper-content">
            	<div class="form-group">
            		<label>설명</label><br><br>
            		projectPMS Front End 입니다.
            	</div>
            </div>
            <hr align="left" style="border: solid 1px gray; width: 90%;">
            <div class="bs-stepper-content">
            	<div class="form-group">
            		<label>첨부파일</label>
            		&nbsp;&nbsp;&nbsp;첨부파일명&nbsp;&nbsp;&nbsp;<i class="fas fa-download"></i>
            		<hr align="left" style="border: solid 1px gray; width: 90%;">
            		<label>상/하위 일감</label>
            		&nbsp;&nbsp;&nbsp;상/하위 일감명
            		<hr align="left" style="border: solid 1px gray; width: 90%;">
            		<label>연결된 일감</label>
            		&nbsp;&nbsp;&nbsp;연결된 일감명
            	</div>
            </div>
        </div>
        <!-- /.card-body -->
        
            </div><br> <!-- /.yellowbox -->
            <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">이력</a>
                <a class="nav-item nav-link" id="product-comments-tab" data-toggle="tab" href="#product-comments" role="tab" aria-controls="product-comments" aria-selected="false">댓글</a>
              </div>
            </nav>
            <div class="tab-content p-3" id="nav-tabContent">
              <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab"> 
              	<br>
              	<div>
              	첨부파일&nbsp;삭제&nbsp;&nbsp;&nbsp;2021-04-03
              	</div><br>
              	<div>
              	제목&nbsp;수정&nbsp;&nbsp;&nbsp;2021-04-04
              	</div>
              </div>
              <div class="tab-pane fade" id="product-comments" role="tabpanel" aria-labelledby="product-comments-tab">
              	<i class="far fa-comment-dots"></i>&nbsp;&nbsp;댓글 달기
              	<div class="form-group" style="width:700px;"><br>
              		<div class="form control" style="width:300px; background-Color:lightgreen; float:right;">
              		팀장&nbsp;:&nbsp;김철수<br>수정사항 확인부탁드립니다
              		</div><br><br><br>
              		<div class="form control" style="width:250px;background-Color:lightpink; float:left;">
              		사원&nbsp;:&nbsp;홍길동<br>확인했습니다
              		</div><br><br><br>
              		<div class="form control" style="width:250px; background-Color:skyblue; float:left;">
              		대리&nbsp;:&nbsp;이춘향<br>확인했습니다
              		</div>
              	</div>
              </div>
            </div>
          </div>
            
            
            
            
            
          
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
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

  <!-- pace-progress -->
<script src="plugins/pace-progress/pace.min.js"></script>

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

</script>
</body>
</html>