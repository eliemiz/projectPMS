<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>작업내역</title>


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
<link rel="stylesheet" href="dist/font/fonts.css"/>
<style type="text/css">
html, body {
   font-family: "Noto Sans KR", "Source Sans Pro", sans-serif !important;
}
</style>
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->

  $.widget.bridge('uibutton', $.ui.button)

     $(document).ready(function(){
      
      $(".data").click(function(){
         var id = $(this).attr("id");
          location.href="${path}/task.do?method=detail&id="+id;
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
            <h1 class="m-0">User Information</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">information</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    
         
      <section class="content">
      <div class="container-fluid h-100">
        <div class="card card-row card-secondary">
          <div class="card-header">
            <h1 class="card-title">
         
            </h1>
            <div class="form-row float-right">
            <a href="${path}/account.do?method=changeInfo&id=${account.id}">
             <button class="btn btn-default" type="button"><i class="fas fa-pen"><spring:message code="u_change_info"/></i></button>
             </a>
            </div>
          </div>
          
          
          <div class="card-body">
            <div class="card card-info card-outline">
              <div class="card-header">
                <h5 class="card-title"><b>${account.name}</b></h5>
              </div>
              <div class="card-body">
                <a> <spring:message code="u_user_id"/>: ${account.user_id}</a> &nbsp;&nbsp;&nbsp;&nbsp;
            <a> <spring:message code="u_date"/>: <fmt:formatDate value="${account.created_on}" pattern="yyyy-MM-dd hh:mm:ss"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a> <spring:message code="u_login"/>: <fmt:formatDate value="${account.last_login_on}" pattern="yyyy-MM-dd hh:mm:ss"/></a>
            </div>
              </div>
            </div>
          
           <div class="card">
              <div class="card-header">
                <h3 class="card-title">${account.name}<spring:message code="user_task"/></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped">
                      <thead>
                    <tr>
                      <th></th>
                      <th style="text-align:center;"><spring:message code="u_progress"/></th>
                      <th style="text-align:center;"><spring:message code="u_done"/></th>
                      <th style="text-align:center;"><spring:message code="a_all"/></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><spring:message code="user_tasks"/></td>
                      <td style="text-align:center;">${cnt1}</td>
                      <td style="text-align:center;">${cnt2}</td>
                      <td style="text-align:center;">${cnt1 + cnt2}</td>
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
          
       <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title"><spring:message code="u_task_list"/></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0" style="height: 300px;">
                <table class="table table-head-fixed text-nowrap">
                  <thead>
                    <tr style="text-align:center;">
                      <th><spring:message code="u_id"/></th>
                      <th><spring:message code="u_project"/></th>
                      <th><spring:message code="u_type"/></th>
                      <th><spring:message code="u_status"/></th>
                      <th><spring:message code="u_content"/></th>
                      <th><spring:message code="ac_responsibility"/></th>
                      <th><spring:message code="u_start_date"/></th>
                      <th><spring:message code="u_completed_date"/></th>
                    </tr>
                  </thead>
                  <tbody>
                   <c:forEach var="task" varStatus="s" items="${taskList}">
                   <tr class="data" id="${task.id}" style="cursor:pointer; text-align:center;"
                         onmouseover="this.style.backgroundColor='#efefef';" onmouseout="this.style.backgroundColor='#ffffff';">
                        <td>${s.count}</td>
                      <td>${task.project_name}</td>
                      <td>
                      <c:choose>
                     <c:when test="${task.tracker=='새기능'}"> <spring:message code="u_newfunction"/> </c:when>
                     <c:when test="${task.tracker=='결함'}"> <spring:message code="u_defect"/> </c:when>
                     <c:when test="${task.tracker=='지원'}"> <spring:message code="u_support"/> </c:when>
                     <c:otherwise> Error </c:otherwise>
                 </c:choose>
                      </td>
                      <td>
                      <c:choose>
                     <c:when test="${task.status=='신규'}"> <spring:message code="u_new"/> </c:when>
                     <c:when test="${task.status=='완료'}"> <spring:message code="u_completed"/> </c:when>
                     <c:when test="${task.status=='진행'}"> <spring:message code="u_progresss"/> </c:when>
                     <c:when test="${task.status=='해결'}"> <spring:message code="u_solve"/> </c:when>
                     <c:when test="${task.status=='의견'}"> <spring:message code="u_opinion"/> </c:when>
                     <c:when test="${task.status=='거절'}"> <spring:message code="u_reject"/> </c:when>
                     <c:otherwise> Error </c:otherwise>
                 </c:choose>
                      </td>
                      <td>${task.subject}</td>
                      <td>${task.name}</td>
                      <td>${task.start_date}</td>
                       <td><fmt:formatDate value="${task.completed_on}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                   </c:forEach>
                  </tbody>
                </table>
                
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        <!-- /.row -->

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