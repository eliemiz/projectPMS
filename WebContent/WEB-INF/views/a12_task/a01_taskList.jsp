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
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

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
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">검색조건</h3><br><br>
                <a href="">
                <div style="text-align:right;">
                	<label >새Task만들기</label><!-- 이미지삽입예정 -->
                </div></a>
                <div class="input-group input-group-m" style="width: 250px;">
                  <label>검색조건</label>&nbsp;&nbsp;
                  <select class="form-control select2">
                    <option>유형</option>
                    <option selected>상태</option>
                    <option>담당자</option>
                    <option>제목</option>
                    <option>설명</option>
                  </select>
                  </div><br>
                  <%--
                  <div class="input-group input-group-m" style="width: 200px;">
                  <input type="checkbox" checked id="checkboxSuccess1">
                  &nbsp;&nbsp;<label>유형</label>&nbsp;&nbsp;
                  <select class="form-control select2">
                    <option>결함</option>
                    <option>새기능</option>
                    <option>지원</option>
                  </select>
                   </div><br>
                   --%>
                  <div class="input-group input-group-m" style="width: 200px;">
                  <input type="checkbox" checked id="checkboxSuccess1">
                  &nbsp;&nbsp;<label>상태</label>&nbsp;&nbsp;
                  <select class="form-control select2">
                    <option>진행중</option>
                    <option>완료</option>
                    <option selected>모두</option>
                  </select>
                  </div><br>
                  <%--
                  <div class="input-group input-group-m" style="width: 600px;">
                  <input type="checkbox" checked id="checkboxSuccess1">
                  &nbsp;&nbsp;<label>담당자</label>&nbsp;&nbsp;
                  <input type="text" class="form-control">
                  </div><br>
                  <div class="input-group input-group-m" style="width: 600px;">
                  <input type="checkbox" checked id="checkboxSuccess1">
                  &nbsp;&nbsp;<label>제목</label>&nbsp;&nbsp;
                  <input type="text" class="form-control">
                  </div><br>
                  <div class="input-group input-group-m" style="width: 600px;">
                  <input type="checkbox" checked id="checkboxSuccess1">
                  &nbsp;&nbsp;<label>설명</label>&nbsp;&nbsp;
                  <input type="text" class="form-control">
                  </div><br>
                 --%>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example2" class="table table-bordered table-hover">
                <col width="5%">
			  	<col width="10%">
			    <col width="10%">
			    <col width="10%">
			    <col width="40%">
			    <col width="10%">
			    <col width="10%">
                  <thead>
                  <tr>
                    <th>번호</th>
                    <th>유형</th>
                    <th>상태</th>
                    <th>우선순위</th>
                    <th>제목</th>
                    <th>담당자</th>
                    <th>날짜</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>1</td>
                    <td>결함</td>
                    <td>진행중</td>
                    <td>낮음</td>
                    <td>task1</td>
                    <td>김철수</td>
                    <td>2021-04-01</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>새기능</td>
                    <td>진행중</td>
                    <td>보통</td>
                    <td>task2</td>
                    <td>김철수</td>
                    <td>2021-04-01</td>
                  </tr>
                 <tr>
                    <td>3</td>
                    <td>지원</td>
                    <td>진행중</td>
                    <td>높음</td>
                    <td>task3</td>
                    <td>홍길동</td>
                    <td>2021-04-01</td>
                  </tr>
                  <tr>
                    <td>4</td>
                    <td>새기능</td>
                    <td>완료</td>
                    <td>긴급</td>
                    <td>task4</td>
                    <td>홍길동</td>
                    <td>2021-04-01</td>
                  </tr>
                  <tr>
                    <td>5</td>
                    <td>새기능</td>
                    <td>완료</td>
                    <td>즉시</td>
                    <td>task5</td>
                    <td>이춘향</td>
                    <td>2021-04-01</td>
                  </tr>
                  </tbody>
                </table>
                </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
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
</body>
</html>