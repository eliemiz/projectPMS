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
  <style>
  #round1 {border-radius : 20px;}
  </style>
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
      <!-- Default box -->
      <div class="card">
        
        <div class="card-header">
          <h3 class="card-title">
          ${task.tracker}&nbsp;&nbsp;#${task.id}
          </h3>  
        </div> <!-- /.card-header -->
        
        <div class="card-body">
          <div style="text-align:right;">
          <a href="${path}/task.do?method=list">
          <i class="fas fa-list"></i>목록</a>&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="${path}/task.do?method=update">
          <i class="fas fa-pen"></i>편집</a>
          </div>
          
          <div style="background-Color:lightyellow; textcolor:black;">
                <h2 class="mb-0">${task.subject}
                </h2>
                <hr align="left" style="border: solid 1px gray; width: 90%;">
         	
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>상태</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
                   ${task.status}
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>우선순위</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
                   ${task.priority}
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>완료기한</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
                   ${task.due_date}
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>추정시간</label>
                  &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
                  ${task.estimated}
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>담당자</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
                   ${task.account_id}
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>시작시간</label>
                   &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
                   ${task.start_date}
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <!-- /.form-group -->
                <div class="form-group">
                  <label>진척도</label>
                  &nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${task.done_ratio}
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.row -->
            </div>
            <hr align="left" style="border: solid 1px gray; width: 90%;">
            <div class="bs-stepper-content">
            	<div class="form-group">
            		<label>설명</label><br><br>
            		${task.description}
            	</div>
            </div>
            <hr align="left" style="border: solid 1px gray; width: 90%;">
              <div class="bs-stepper-content">
            	<div class="form-group">
            		<label>첨부파일</label>
            		&nbsp;&nbsp;&nbsp;첨부파일명&nbsp;&nbsp;&nbsp;<i class="fas fa-download"></i>
            		<hr align="left" style="border: solid 1px gray; width: 90%;">
            		<label>상/하위 Task</label>
            		&nbsp;&nbsp;&nbsp;
						${task.parent_id}
            		<hr align="left" style="border: solid 1px gray; width: 90%;">
            		<label>연결된 Task</label>
            		&nbsp;&nbsp;&nbsp;
           
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
              	<form class="form-horizontal">
              		<div>
                          <input class="form-control form-control-sm" placeholder="댓글을 작성해주세요"><br>
                          	<input type = "button" class="btn btn-success" value="등록"/>
                            <input type = "button" class="btn btn-danger" value="취소"/>
                    </div><br>
                </form>
                <div align="center">2021-04-03</div>
              	<div class="form-group" style="width:700px;"><br>
              		<%-- 시간도 추가여부 확인 --%>
              		<div class="form control" id="round1" style="padding:10px; background-Color:lightgreen; float:right;">
              		김철수&nbsp;&nbsp;팀장<br>수정사항 확인 바랍니다
              		</div><br><br><br>
              		<div class="form control" id="round1" style="padding:10px; background-Color:lightpink; float:left;">
              		홍길동&nbsp;&nbsp;사원<br>확인했습니다
              		</div>
              	</div>
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