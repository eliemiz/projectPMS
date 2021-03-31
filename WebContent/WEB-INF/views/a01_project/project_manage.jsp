<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 

  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
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

      <div class="card">
      <div class="card-header">
        <a href="" class="h1">프로젝트</a>
      </div>
      <div class="card card-default">
        <button type="button" class="btn btn-block btn-outline-primary btn-flat">새 프로젝트 추가</button>
          <!-- /.card-header -->
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>검색조건</label>
                  <select class="form-control select2" style="width: 500px;">
                    <option selected="selected">사용중</option>
                    <option>모두</option>
                    <option>사용중</option>
                    <option>닫힘</option>
                    <option>잠금보관</option>
                  </select>
                </div>
                 <div class="input-group input-group-m" style="width: 500px;">
                    프로젝트:&nbsp;
                    <input type="text" name="table_search" class="form-control float-right">
                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->
               
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th style="width: 50px">#</th>
                      <th style="width: 500px">프로젝트</th>
                      <th style="width: 100px">공개</th>
                      <th style="width: 200px">등록</th>
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
                        <a href="#" class="btn btn-warning"><i class="fas fa-lock"></i></a>
                        </div>
                      </td>
                      <td>
                      	<div class="btn-group">
                        <a href="#" class="btn btn-info"><i class="fas fa-copy"></i></a>
                        </div>
                      </td>
                      <td>
                      	<div class="btn-group">
                        <a href="#" class="btn btn-danger"><i class="fas fa-trash"></i></a>
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
                        <a href="#" class="btn btn-warning"><i class="fas fa-lock"></i></a>
                        </div>
                      </td>
                      <td>
                      	<div class="btn-group">
                        <a href="#" class="btn btn-info"><i class="fas fa-copy"></i></a>
                        </div>
                      </td>
                      <td>
                      	<div class="btn-group">
                        <a href="#" class="btn btn-danger"><i class="fas fa-trash"></i></a>
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
                        <a href="#" class="btn btn-warning"><i class="fas fa-lock"></i></a>
                        </div>
                      </td>
                      <td>
                      	<div class="btn-group">
                        <a href="#" class="btn btn-info"><i class="fas fa-copy"></i></a>
                        </div>
                      </td>
                      <td>
                      	<div class="btn-group">
                        <a href="#" class="btn btn-danger"><i class="fas fa-trash"></i></a>
                        </div>
                      </td>
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
   </div>     
</div>
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>