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
<script type="text/javascript">
	$(document).ready(function(){
		$("#sb-risk").addClass("active");
	})
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
            <h1 class="m-0">Risk</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Risk</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <!-- Main content -->
    <section class="content">
     <div class="card card-primary">
      <div class="card-header">
       <h3 class="card-title">리스크 수정</h3>
         </div>
           <!-- /.card-header -->
           <!-- form start -->
             <form>
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">제목</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" disabled>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">상태</label>
	                  <div class="col-sm-6">
	                      <!-- select -->
	                      <div class="form-group">
	                        <select class="form-control">
	                          <option>open</option>       
	                          <option>close</option>
	                        </select>
	                      </div>
	                    </div>
	              </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">상세설명</label>
                    <textarea class="form-control" id="exampleInputPassword1" rows="3" placeholder="설명을 입력해주세요">
                    </textarea>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">담당자</label>
                    <input type="email" class="form-control" id="exampleInputEmail1">               
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">범주</label>
	                  <div class="col-sm-6">
	                      <!-- select -->
	                      <div class="form-group">
	                        <select class="form-control">
	                          <option>Internal</option>
	                          <option>External</option>
	                          <option>Technical</option>
	                          <option>Unforeseeable</option>
	                        </select>
	                      </div>
	                    </div>
	              </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">발생가능성</label>
                    <input type="email" class="form-control" id="exampleInputEmail1">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">영향도</label>
                    <input type="email" class="form-control" id="exampleInputEmail1">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">전략</label>
	                  <div class="col-sm-6">
	                      <!-- select -->
	                      <div class="form-group">
	                        <select class="form-control">
	                          <option>Accept</option>
	                          <option>Mitigate</option>
	                          <option>Transfer</option>
	                          <option>Eliminate</option>
	                        </select>
	                      </div>
	                    </div>
	              </div>
	              <div class="form-group">
                    <label for="exampleInputEmail1">예상시작일</label>
                    <input type="email" class="form-control" id="exampleInputEmail1">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">예상종료일</label>
                    <input type="email" class="form-control" id="exampleInputEmail1">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">해결방안</label>
                    <textarea class="form-control" id="exampleInputPassword1" rows="3" placeholder="설명을 입력해주세요">
                    </textarea>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">파일 첨부</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="exampleInputFile">
                        <label class="custom-file-label" for="exampleInputFile">파일 선택</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">업로드</span>
                      </div>
                    </div>
                  </div>
                  <!-- <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                  </div> -->
                </div>
                <!-- /.card-body -->
            <div class="card-footer">
          <button type="button" onclick="location.href='${path}/risk.do?method=detail'"
           class="btn btn-secondary float-right">취소</button>
           <button type="button" onclick="location.href='${path}/risk.do?method=list'"
           class="btn btn-primary float-right">수정</button>
         </div>
        </form>
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


</body>
</html>
