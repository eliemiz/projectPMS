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
		
		$("#status").val("${status}");
		
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
				alert("에러발생");
			}
		});
		
		/* 목록 이동 */
		$(".data").dblclick(function(){
			var id = $(this).attr("id");
			if(confirm("상세화면으로 이동하시겠습니까?")){
    			location.href="${path}/task.do?method=detail&id="+id;
			}
    	});
		
		/* sidebar */
		$("#sb-approval").addClass("active");

		$("#hd-project-list").change(function() {			
			location.href = "${path}/approval.do?projectId=" + $(this).val();
		});
		
		$("#status").change(function(){
			var projectId = $("#hd-project-list").val();
			location.href = "${path}/approval.do?projectId="+projectId+"&status="+$(this).val();
		});
		
		var proc = "${proc}";
		if(proc=="accept"){
			if(confirm("결재 승인이 완료되었습니다.\n결재 완료목록으로 이동하시겠습니까?")){
				var projectId = $("#hd-project-list").val();
				location.href = "${path}/approval.do?projectId=${project_id}&status=결재완료";
			}
		}
		if(proc=="reject"){
			if(confirm("결재 거절이 완료되었습니다.\n결재 반려목록으로 이동하시겠습니까?")){
				var projectId = $("#hd-project-list").val();
				location.href = "${path}/approval.do?projectId=${project_id}&status=결재반려";
			}
		}
		
		/* $("#accept").click(function(){
			if(confirm("결재를 승인하시겠습니까?")){
				$("[name=proc]").val("accept");
				$("form").attr("action","${path}/approval.do?method=update");
				$("form").submit();
			}
		});
		$("#reject").click(function(){
			if(confirm("결재를 거절하시겠습니까?")){
				$("[name=proc]").val("reject");
				$("form").attr("action","${path}/approval.do?method=update");
				$("form").submit();
			}
		}); */
		
		
	});
	
	function appAccept(obj) {
		$("[name=proc]").val("accept");
		$("[name=task_id]").val(obj);
		$("#form_app").attr("action","${path}/approvalUpdate.do");
		$("#form_app").submit();
	}
	function appReject(obj) {
		$("[name=proc]").val("reject");
		$("[name=task_id]").val(obj);
		$("#form_app").attr("action","${path}/approvalUpdate.do");
		$("#form_app").submit();
	}
	
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
							<h1 class="m-0"><spring:message code="sb-approval"/></h1>
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
						<div class="card card-primary card-outline">
							<div class="card-header">
								<h3 class="card-title"><spring:message code="dash-project-select"/></h3>
							</div>
							<div class="card-body">
								<select id="hd-project-list" class="form-control"></select>
							</div>
						</div>
						<div class="card card-outline card-success">
							<div class="card-header">
								<h3 class="card-title">상태 선택</h3>
							</div>
							<div class="card-body">
				                <div class="form-group">		
									<div class="row mb-3">
										<label for="status" class="col-md-2">상태 선택</label>
										<select id="status" name="status" class="form-control col-md-3" style="display:inline-block;">
											<option value="결재대기">결재대기</option>
											<option value="결재반려">반려</option>
											<option value="결재완료">완료</option>
										</select>																	
									</div>						
								</div>                
				            </div>
						</div>
					</div>
				</div>
		        <div class="row">
		          <div class="col-12">
		            <div class="card">		              
		              <div class="card-body">
		              <form id="form_app" method="post">
		              	<input type="hidden" name="proc"/>
		              	<input type="hidden" name="task_id"/>
		              </form>
		                <table id="example2" class="table table-bordered table-hover">
		                  <thead>
		                  <tr align="center">
		                    <th>번호</th>
		                    <th>프로젝트 이름</th>
		                    <th>유형</th>
		                    <th>상태</th>
		                    <th>우선순위</th>
		                    <th>제목</th>
		                    <th>담당자</th>
		                    <th>시작날짜</th>
		                    <th>완료날짜</th>
		                    <th>결재여부</th>
		                  </tr>
		                  </thead>
		                  <tbody>
		                  <c:forEach var="task" varStatus="t" items="${tasklist}">
		                  <tr align="center" class="data" id="${task.id}" style="cursor:pointer;">
		                  	<%-- <td>${task.level}</td> --%>
		                  	<td>${t.count}</td><%-- task.id에서 task.cnt로 수정(0427) --%>
		                  	<td>${task.project_name}</td>
		                  	<td>${task.tracker}</td>
		                  	<td>${task.status}</td>
		                  	<td>
			                  	<c:choose>
				                   	<c:when test="${task.priority==1}">낮음</c:when>
				                   	<c:when test="${task.priority==2}">보통</c:when>
				                   	<c:when test="${task.priority==3}">높음</c:when>
				                   	<c:when test="${task.priority==4}">긴급</c:when>
				                   	<c:when test="${task.priority==5}">즉시</c:when>
				                    </c:choose>
		                  	</td>
		                  	<td align="left">
		                  		${task.subject}
		                	</td>
		                  	<td>${task.name}</td>
		                  	<td>${task.start_date}</td>
		                  	<td>${task.due_date}</td>
		                  	<c:choose>
                              <c:when test="${task.status=='결재대기'}">		               
			                  	<td>
			                  		<input type="button" onclick="appAccept(${task.id})" class="btn btn-primary" value="승인"/>
			                  		<input type="button" onclick="appReject(${task.id})" class="btn btn-danger" value="거절"/>
		                  		</td>
	                  		</c:when>
	                  		<c:when test="${task.status=='결재반려'}">
	                  			<td>반려 됨</td>
	                  		</c:when>
	                  		<c:otherwise>
	                  			<td>결재 완료</td>
	                  		</c:otherwise>
	                  		</c:choose>
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
