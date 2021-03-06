<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dashboard</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet" href="dist/font/fonts.css" />
<style type="text/css">
html, body {
	font-family: "Noto Sans KR", "Source Sans Pro", sans-serif !important;
}

[v-cloak] {
	display: none;
} 
</style>
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Vue.js -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fetch/2.0.3/fetch.js "></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/es6-promise/4.1.1/es6-promise.auto.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		/* Get project List */
		$.ajax({
			type: "get",
			url: "${path}/jsonProject.do",
			dataType: "json",
			success: function(data){
				var projectList = data.projectList;
				
				$.each(projectList, function(idx, e, arr){
					$("#hd-project-list").append("<option value='" + e.id + "'>" + e.name + "</option>");
				});
				
				$("#hd-project-list").val(data.projectId);
			},
			error: function(err){
				alert("????????????");
			}
		});
		
		/* sidebar */
		$("#sb-dashboard").addClass("active");

		$("#hd-project-list").change(function() {
			// getProjectList();
			
			location.href = "${path}/dashboard.do?projectId=" + $(this).val();
		});
	});
</script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<!-- Navbar -->
		<jsp:include page="../a00_common/a00_header.jsp" />

		<!-- Main Sidebar Container -->
		<jsp:include page="../a00_common/a01_sidebar.jsp" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Dashboard</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item">
									<a href="#">Home</a>
								</li>
								<li class="breadcrumb-item active">Dashboard</li>
							</ol>
						</div>
					</div>
				</div>
			</div>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row" id="searchForm">
						<div class="col-12">
							<div class="card card-outline card-success">
								<div class="card-header">
									<h3 class="card-title"><spring:message code="dash-project-select"/></h3>
								</div>
								<div class="card-body">
									<select id="hd-project-list" class="form-control">
										<!-- <option v-for="project in projectList" :value="project.id" v-text="project.name" v-cloak></option> -->
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="card card-primary card-outline card-tabs">
								<div class="card-header p-0 pt-1 border-bottom-0">
									<ul class="nav nav-tabs" id="custom-tabs-three-tab"
										role="tablist">
										<li class="nav-item">
											<a class="nav-link active" id="info-tab" data-toggle="pill"
												href="#info" role="tab" aria-controls="info"
												aria-selected="true">
												<spring:message code="dash-info" />
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="members-tab" data-toggle="pill"
												href="#members" role="tab" aria-controls="members"
												aria-selected="false">
												<spring:message code="dash-members" />
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="issues-tab" data-toggle="pill"
												href="#issues" role="tab" aria-controls="issues"
												aria-selected="false">
												<spring:message code="dash-issues" />
											</a>
										</li>
									</ul>
								</div>
								<div class="card-body">
									<div class="tab-content" id="custom-tabs-three-tabContent">
										<div class="tab-pane fade show active" id="info"
											role="tabpanel" aria-labelledby="info-tab">
											<jsp:include page="project_info.jsp" />
											<jsp:include page="project_chart.jsp" />
											<jsp:include page="project_recent.jsp" />

										</div>
										<div class="tab-pane fade" id="members" role="tabpanel"
											aria-labelledby="members-tab">
											<jsp:include page="project_members.jsp" />
										</div>
										<div class="tab-pane fade" id="issues" role="tabpanel"
											aria-labelledby="issues-tab">
											<jsp:include page="project_issues.jsp" />
										</div>
									</div>
								</div>
								<!-- /.card -->
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Footer -->
		<jsp:include page="../a00_common/a02_footer.jsp" />

		<!-- Control Sidebar -->
		<!-- <aside class="control-sidebar control-sidebar-dark">
    Control sidebar content goes here
  </aside> -->
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="plugins/sparklines/sparkline.js"></script>
	<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
	<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
	<script src="plugins/moment/moment.min.js"></script>
	<script src="plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<script src="plugins/summernote/summernote-bs4.min.js"></script>
	<script
		src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<script src="dist/js/adminlte.js"></script>

</body>
</html>
