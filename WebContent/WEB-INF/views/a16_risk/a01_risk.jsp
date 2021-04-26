<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>RiskList</title>

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
<!-- <script src="dist/js/pages/dashboard.js"></script> -->  
<script type="text/javascript">
	$(document).ready(function(){
		$("#sb-risk").addClass("active");
		
		
		
		$(".detail").click(function(){
    		//var id = $(this).children().eq(0).text();
    		var id = $(this).attr("id");
    		location.href="${path}/risk.do?method=detail&id="+id;
    	});
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
    	<!-- /.row -->
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title"><spring:message code="risk-risk"/></h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm">
                    <div class="input-group-append">
                      <button type="button" onclick="location.href='${path}/risk.do?method=insForm'"
                      class="btn btn-primary float-right"><spring:message code="risk-insert"/></button>          
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th><spring:message code="risk-id"/></th>                      
                      <th><spring:message code="risk-projectname"/></th>
                      <th><spring:message code="risk-subject"/></th>
                      <th><spring:message code="risk-status"/></th>
                      <th><spring:message code="risk-category"/></th>
                      <th><spring:message code="risk-probability"/></th>
                      <th><spring:message code="risk-impact"/></th>
                      <th><spring:message code="risk-accountname"/></th>  
                      <th><spring:message code="risk-startdate"/></th> 
                      <th><spring:message code="risk-enddate"/></th> 
                      <th><spring:message code="risk-updated"/></th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="risk" items="${riskList}">
                    <tr class="detail" id="${risk.id}" style="cursor:pointer">
                      <td>${risk.id}</td>                    
                      <td>${risk.project_name}</td>
                      <td>${risk.subject}</td>
                      <td>${risk.status}</td>
                      <td>${risk.category}</td>
                      <td>
                      <c:choose>
						<c:when test="${risk.probability==1}"> <spring:message code="risk-unlikely"/> </c:when>
						<c:when test="${risk.probability==2}"> <spring:message code="risk-low"/> </c:when>
						<c:when test="${risk.probability==3}"> <spring:message code="risk-medium"/> </c:when>
						<c:when test="${risk.probability==4}"> <spring:message code="risk-high"/> </c:when>
						<c:when test="${risk.probability==5}"> <spring:message code="risk-expected"/> </c:when>
						<c:otherwise> Error </c:otherwise>
					  </c:choose>
                      </td>
                      <td>
                      <c:choose>
						<c:when test="${risk.impact==1}"><spring:message code="risk-negligible"/></c:when>
						<c:when test="${risk.impact==2}"><spring:message code="risk-minor"/></c:when>
						<c:when test="${risk.impact==3}"><spring:message code="risk-moderate"/></c:when>
						<c:when test="${risk.impact==4}"><spring:message code="risk-significant"/></c:when>
						<c:when test="${risk.impact==5}"><spring:message code="risk-severe"/></c:when>
						<c:otherwise> Error </c:otherwise>
					  </c:choose>
                      </td>
                      <td>${risk.account_name}</td>
                      <td>
                      ${risk.start_date}
                      <%-- <fmt:parseDate var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss" value="${risk.start_date}"/>
                      <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/> --%>
                      </td>
                      <td>
                      ${risk.end_date}
                      <%-- <fmt:parseDate var="dateFmt2" pattern="yyyy-MM-dd HH:mm:ss" value="${risk.end_date}"/>
                      <fmt:formatDate value="${dateFmt2}" pattern="yyyy-MM-dd"/> --%>
                      </td> 
                      <td>
                      <fmt:formatDate value="${risk.updated_on}" pattern="yyyy-MM-dd"/>
                      </td>
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
<script>
  $(function () {
	  $('#example2').DataTable({
	      "paging": true,
	      "lengthChange": false,
	      "searching": false,
	      "ordering": false,
	      "info": true,
	      "autoWidth": false,
	      "responsive": true,
	    });
  });
</script>
</body>
</html>
