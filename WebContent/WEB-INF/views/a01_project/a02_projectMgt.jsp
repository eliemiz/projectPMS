<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Log in (v2)</title>


  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
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
            <h1 class="m-0">project</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active"></li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    
    
     <!-- Main content -->
    <section class="content">
	<div class="row">
	<div class="col-md-10">
      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title"></h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
          <div class="row">
           <div class="col-sm-4.5">
            <label>검색조건</label>
            <select class="form-control select2" style="width: 500px;">
             <option selected="selected">사용중</option>
              <option>모두</option>
              <option>사용중</option>
              <option>닫힘</option>
              <option>잠금보관</option>
            </select>
            </div>
            <div class="col-sm-1">
            <label></label><br>
            <h3></h3>
            <button type="submit" class="btn btn-success btn-block">적용</button>
            </div>
             <div class="col-sm-2">
            <label></label><br>
            <h3></h3>
            <button type="submit" class="btn btn-primary btn-block">새 프로젝트 만들기</button>
            </div>
        </div>
		<div class="row text-center">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th style="width: 50px">#</th>
                      <th style="width: 500px">프로젝트명</th>
                      <th style="width: 100px">공개여부</th>
                      <th style="width: 120px">등록</th>
                      <th style="width: 100px"></th>
                      <th style="width: 100px"></th>
                      <th style="width: 100px"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1.</td>
                      <td>게시판 프로젝트</td>
                      <td>  
	                      <div class="icheck-success d-inline">
	                        <input type="checkbox" checked id="checkboxSuccess1">
	                        <label for="checkboxSuccess1">
	                        </label>
	                      </div>
                      </td>
                      <td>2021/04/01</td>
                      <td>
                      	<div class="btn-group">
                        <a href="#" class="btn btn-warning"><i class="fas fa-lock"></i>잠금</a>
                        </div>
                      </td>
                      <td>
                      	<div class="btn-group">
                        <a href="#" class="btn btn-info"><i class="fas fa-copy"></i>복사</a>
                        </div>
                      </td>
                      <td>
                      	<div class="btn-group">
                        <a href="#" class="btn btn-danger"><i class="fas fa-trash"></i>삭제</a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>2.</td>
                      <td>화소반 프로젝트</td>
                      <td>  
	                      <div class="icheck-success d-inline">
	                        <input type="checkbox" checked id="checkboxSuccess1">
	                        <label for="checkboxSuccess1">
	                        </label>
	                      </div>
                      </td>
                      <td>2021/04/01</td>
                      <td>
                      	<div class="btn-group">
                        <a href="#" class="btn btn-warning"><i class="fas fa-lock"></i>잠금</a>
                        </div>
                      </td>
                      <td>
                      	<div class="btn-group">
                        <a href="#" class="btn btn-info"><i class="fas fa-copy"></i>복사</a>
                        </div>
                      </td>
                      <td>
                      	<div class="btn-group">
                        <a href="#" class="btn btn-danger"><i class="fas fa-trash"></i>삭제</a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>3.</td>
                      <td>PMS 프로젝트</td>
                      <td>  
	                      <div class="icheck-success d-inline">
	                        <input type="checkbox" checked id="checkboxSuccess1">
	                        <label for="checkboxSuccess1">
	                        </label>
	                      </div>
                      </td>
                      <td>2021/04/01</td>
                      <td>
                      	<div class="btn-group">
                        <a href="#" class="btn btn-warning"><i class="fas fa-lock"></i>잠금</a>
                        </div>
                      </td>
                      <td>
                      	<div class="btn-group">
                        <a href="#" class="btn btn-info"><i class="fas fa-copy"></i>복사</a>
                        </div>
                      </td>
                      <td>
                      	<div class="btn-group">
                        <a href="#" class="btn btn-danger"><i class="fas fa-trash"></i>삭제</a>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
             </div> 
        <!-- /.card-body -->
      </div>
      </div>
      <!-- /.card -->
      <div class="col-md-2">
            <div class="card card-row card-primary">
          <div class="card-header">
            <h3 class="card-title">
              관리
            </h3>
          </div>
          <div class="card-body">
            <div class="card card-primary card-outline">
              <div class="card-header">
                <a class="btn btn-app bg-primary">
                  <i class="fas fa-edit"></i>프로젝트
                </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <a class="btn btn-app bg-success">
                  <i class="fas fa-user"></i>사용자
                </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <a class="btn btn-app bg-warning">
                  <i class="fas fa-users"></i>그룹
                </a>
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
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<!-- <script src="dist/js/pages/dashboard.js"></script> -->
</body>
</html>
