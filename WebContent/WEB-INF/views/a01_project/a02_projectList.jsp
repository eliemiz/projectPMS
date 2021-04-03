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
<title>프로젝트 목록</title>


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
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->

  $.widget.bridge('uibutton', $.ui.button)

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
            <h1 class="m-0">project list</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">project</li>
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
          <h3 class="card-title"></h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
          
           <nav class="navbar navbar-expand-sm bg-white navbar-white">
		     <form  class="form-inline" method="post">
		      상태:&nbsp;
		        <select class="form-control mr-sm-2">
		        <option selected="selected">사용중</option>
		           <option>모두</option>
	               <option>사용중</option>
	               <option>닫힘</option>
	               <option>잠금보관</option>
		        </select>
		        <input  class="form-control mr-sm-2" placeholder="프로젝트명"/>
		       <button class="btn btn-success" type="submit">적용</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		       <button class="btn btn-primary" type="submit"><i class="fas fa-pen">새 프로젝트 만들기</i></button>
		     </form>
		  </nav>
          <br>
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
                        <a href="${path}/project.do?method=insert"  class="btn btn-info"><i class="fas fa-copy"></i>복사</a>
                        </div>
                      </td>
                      <td>
                      	<div class="btn-group">
                        <a href="${path}/project.do?method=delete" class="btn btn-danger"><i class="fas fa-trash"></i>삭제</a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>2.</td>
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
                        <a href="${path}/project.do?method=insert" class="btn btn-info"><i class="fas fa-copy"></i>복사</a>
                        </div>
                      </td>
                      <td>
                      	<div class="btn-group">
                        <a href="${path}/project.do?method=delete" class="btn btn-danger"><i class="fas fa-trash"></i>삭제</a>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
             </div> 
        <!-- /.card-body -->
      <!-- /.card -->
      
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
