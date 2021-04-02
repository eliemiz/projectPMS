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
<title>프로젝트 설정-구성원</title>
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
  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Page specific script -->
<script>
  $(function () {
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>  
<script>
$(function () {
  bsCustomFileInput.init();
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$("#sm-setting").addClass("menu-open");
	$("#sb-setting").addClass("active");
	$("#sb-setting-members").addClass("active");
	
    $("#regBtn").click(function(){
       //등록 컨트롤러 호출
       location.href="${path}/admin.do?method=groupInsForm";
    });
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
            <h1 class="m-0">Member</h1>
          </div><!-- /.col -->
          <div class="col-sm-6"> 
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Setting</li>
            </ol>
           </div>  <!-- .col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
     <section class="content">
    
    
    
<!-- card -->
      <div class="card">
              <div class="card-header">
                <h3 class="card-title">구성원 추가</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                        <!-- 검색 -->
	           <nav class="navbar navbar-expand-sm bg-white navbar-white">
			     <form  class="form-inline" method="post">
			      <input  class="form-control mr-sm-2" placeholder="이름"/>
			        <select class="form-control mr-sm-2">
			           <option>그룹</option>
			           <option>사용자</option>
			        </select>
			       <button class="btn btn-primary" type="submit">Search</button>&nbsp;
			     </form>
			  </nav>
           <!-- /검색 -->
                <table id="example2" class="table table-bordered table-hover">
                <col width="93%">
                <col width="7%">
                  <thead>
                  <tr>
                    <th style="text-align:center;">사용자/그룹</th>
                    <th></th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>관리팀</td>
                    <td><button type="button" id="" class="btn btn-primary">추가</button></td>
                  </tr>
                  <tr>
                    <td>2팀</td>
                    <td><button type="button" id="" class="btn btn-primary">추가</button></td>
                  </tr>
                  <tr>
                    <td>3팀</td>
                    <td><button type="button" id="" class="btn btn-primary">추가</button></td>
                  </tr>
                  <tr>
                    <td>이해수</td>
                    <td><button type="button" id="" class="btn btn-primary">추가</button></td>
                  </tr>
                  <tr>
                    <td>박강인</td>
                    <td><button type="button" id="" class="btn btn-primary">추가</button></td>
                  </tr>
                  </tbody>
               <!--<tfoot>
                  	<tr>
                    <th>관리팀</th>
                  	</tr>
                  </tfoot> -->
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            

     </section>
     </div>
  <!-- /.content-wrapper -->
              <!-- Footer -->
  <jsp:include page="../a00_common/a02_footer.jsp"/>
  
         <!-- Control Sidebar
  <aside class="control-sidebar control-sidebar-dark">
     Control sidebar content goes here
  </aside>
    /.control-sidebar -->
    

</div><!-- wrapper -->


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
<!-- DataTables  & Plugins -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="plugins/jszip/jszip.min.js"></script>
<script src="plugins/pdfmake/pdfmake.min.js"></script>
<script src="plugins/pdfmake/vfs_fonts.js"></script>
<script src="plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- bs-custom-file-input -->
<script src="plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- Page specific script -->

</body>
</html>