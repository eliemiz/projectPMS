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
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

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
<script src="https://kit.fontawesome.com/e67c060a53.js" crossorigin="anonymous"></script>
<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#sm-dashboard").addClass("menu-open");
		$("#sb-task").addClass("active");
		
		$("#newTask").click(function(){
			location.href = "${path}/task.do?method=insForm";
		});
		
		$(".data").click(function(){
//    		var id = $(this).children().eq(0).text();
			var id = $(this).attr("id");
    		location.href="${path}/task.do?method=detail&id="+id;
    	});
		
		/* Get project List */
		$.ajax({
			type: "get",
			url: "${path}/jsonProject.do",
			dataType: "json",
			success: function(data){
				var projectList = data.projectList;
				
				$.each(projectList, function(idx, e, arr){
					$("#projectId").append("<option value='" + e.id + "'>" + e.name + "</option>");
				});
				
				$("#projectId").val(data.projectId);
			},
			error: function(err){
				alert("????????????");
			}
		});
		
		/* Search */
		$("#searchButton").click(function(){
			var projectId = $("#projectId").val();
			var subject = $("#subject").text();
			var tracker = $("#tracker").val();
			var status = $("#status").val();
			var writer = $("#writer").text();
			
			$("form").submit();
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
            <h1 class="m-0">??????</h1>
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
                <h3 class="card-title">????????????</h3>              
                <div style="text-align:right;">
                	<i class="fas fa-pen"></i>
                	<label id="newTask" style="cursor:pointer;">??????????????????</label>
                	<input type="hidden" name="project_id" value="${projectId}"/>
                </div>
              </div>
              <div class="card-body">
                <form class="form-group" method="post" action="${path}/task.do?method=list">
					<div class="row mb-3">
						<label for="projectId" class="col-md-2">???????????? ??????</label>
						<select id="projectId" name="projectId" class="form-control col-md-3" style="display:inline-block;"></select>
					</div>
					<div class="row mb-3">
						<label for="subject" class="col-md-2">?????? ?????? ??????</label>
						<input type="text" name="subject" id="subject" class="form-control col-md-3" style="display:inline-block;"/>
					</div>
					<div class="row mb-3">
						<label for="tracker" class="col-md-2">?????? ??????</label>
						<select id="tracker" name="tracker" class="form-control col-md-3" style="display:inline-block;">
							<option value="">?????? ??????</option>
					        <option value="?????????">?????????</option>
					        <option value="??????">??????</option>
					        <option value="??????">??????</option>
						</select>																	
					</div>
					<div class="row mb-3">
						<label for="status" class="col-md-2">?????? ??????</label>
						<select id="status" name="status" class="form-control col-md-3" style="display:inline-block;">
							<option value="">?????? ??????</option>
					        <option value="??????">??????</option>
					        <option value="??????">??????</option>
							<option value="????????????">????????????</option>
							<option value="????????????">??????</option>
							<option value="????????????">??????</option>
						</select>																	
					</div>
					<div class="row mb-3">
						<label for="wrtier" class="col-md-2">????????? ??????</label>
						<input type="text" name="writer" id="writer" class="form-control col-md-3" style="display:inline-block;"/>																	
					</div>
					<div class="row mb-3">
						<button type="button" id="searchButton" class="btn btn-primary">??????</button>
					</div>
				</form>                
              </div>      
              <hr>        
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example2" class="table table-bordered table-hover">
                <col width="5%">
                <col width="10%">
			  	<col width="10%">
			    <col width="10%">
			    <col width="10%">
			    <col width="25%">
			    <col width="10%">
			    <col width="10%">
			    <col width="10%">
                  <thead>
                  <tr>
                    <th>??????</th>
                    <th>???????????? ??????</th>
                    <th>??????</th>
                    <th>??????</th>
                    <th>????????????</th>
                    <th>??????</th>
                    <th>?????????</th>
                    <th>????????????</th>
                    <th>????????????</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="task" varStatus="t" items="${tasklist}">
                  <tr class="data" id="${task.id}" style="cursor:pointer;">
                  	<%-- <td>${task.level}</td> --%>
                  	<td>${t.count}</td><%-- task.id?????? task.cnt??? ??????(0427) --%>
                  	<td>${task.project_name}</td>
                  	<td>${task.tracker}</td>
                  	<td>${task.status}</td>
                  	<td>
	                  	<c:choose>
		                   	<c:when test="${task.priority==1}">??????</c:when>
		                   	<c:when test="${task.priority==2}">??????</c:when>
		                   	<c:when test="${task.priority==3}">??????</c:when>
		                   	<c:when test="${task.priority==4}">??????</c:when>
		                   	<c:when test="${task.priority==5}">??????</c:when>
		                    </c:choose>
                  	</td>
                  	<td>
                  		<c:forEach varStatus="sts" begin="1" end="${task.level}">
                  			<c:if test="${task.level>1}">&nbsp;&nbsp;</c:if>
                  			<c:if test="${task.level>1 and sts.last}">
                  			???&nbsp;
                  			</c:if>
                  		</c:forEach>
                  		${task.subject}
                	</td>
                  	<td>${task.name}</td>
                  	<td>${task.start_date}</td>
                  	<td>${task.due_date}</td>
                  </tr>
                  </c:forEach>
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
	      "ordering": false,
	      "info": true,
	      "autoWidth": false,
	      "responsive": true,
	    });
  });
</script>
</body>
</html>