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
<!-- vue -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->

  $.widget.bridge('uibutton', $.ui.button)

</script>
<script type="text/javascript">
$(document).ready(function(){
	
	
	 /* Get project List */
	$.ajax({
		type: "get",
		url: "${path}/jsonProject.do",
		dataType: "json",
		success: function(data){
			var projectList = data.projectList;
			
			$.each(projectList, function(idx, e, arr){
				$("#ac-project-list").append("<option value='" + e.id + "'>" + e.name + "</option>");
			});
			
			$("#ac-project-list").val(data.projectId);
			
			
			var selectType = '${document_type}';
			if (${empty document_type}) {
				selectType = "all";
			}
			/* 페이지 전환 후 select값 고정 */
			$('#ac-document-type').val(selectType);
			
			/* if(selectType == 'task'){
				$('#ac-document-type').val('task')
		        $('#task').attr('selected','selected');
		    } else if(selectType == 'risk'){
		        $('#risk').attr('selected','selected');
		    }  else{
		    	 $('#all').attr('selected','selected');
		    }  */
		},
		error: function(err){
			alert("에러발생");
		}
	});
	
	
	
      $("#ac-project-list").change(function(){
    	 
    	  location.href="${path}/activity.do?projectId="+$(this).val();
    	 	
       });	 
     
     	var pi = '${projectId}';//session받아오는거라서 param.projectId가 아니라 projectId임
     			
   	 $(".type").click(function(){
    	  /* var ty = $(this).attr("id"); */
    	  var ty = $("#ac-document-type").val();
    	  location.href="${path}/activity.do?projectId="+pi+"&document_type="+ty;
      	});
   
   	
     $(".data").click(function(){
	  	  var id = $(this).attr("id");
	  	  var type = $(this).attr("data-id");
	  	  
	  	  if(type=="risk"){
	  	  location.href="${path}/risk.do?method=detail&id="+id;
	  	  	}else if(type=="task"){
	  	  location.href="${path}/task.do?method=detail&id="+id;
	  	  	}
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
            <h1 class="m-0">Activity</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">activity</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    
         
      <section class="content pb-3">
      <div class="container-fluid h-100">
        <div class="card card-row card-secondary">
          <div class="card-header">
            <h3 class="card-title">
              <spring:message code="activity"/> 
            </h3>
          </div>
          
          <div class="card-body">
            <div class="card card-primary card-outline">
              <div class="card-header">
                <h5 class="card-title"><spring:message code="ac_project-select"/></h5>
              </div>
              <div class="card-body">
              <div class="input-group input-group-m" style="width: 250px;">
                  <select id="ac-project-list" class="form-control" style="width: 200px;"></select>
                </div>
              </div>
            </div>
            <div class="card card-primary card-outline">
              <div class="card-header">
                <h5 class="card-title"><spring:message code="d_type_select"/></h5>
              </div>
              <div class="card-body">
              <div class="input-group input-group-m" style="width: 250px;">
                  <label><spring:message code="ac_type"/></label>&nbsp;&nbsp;
                  <select class="form-control select2" id="ac-document-type">
                   <option value="all" id="all"><spring:message code="ac_all"/></option> 
                   <option value="task" id="task"><spring:message code="ac_task"/></option> 
                    <option value="risk" id="risk"><spring:message code="ac_risk"/></option>
                  </select>
                </div>
               <div class="form-row float-left">
            <button type="button"  class="btn btn-primary btn-block type"><spring:message code="ac_setting"/></button> 
              </div>
              </div>
            </div>
       <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title"><spring:message code="ac_list"/></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0" style="height: 300px;">
                <table class="table table-head-fixed text-nowrap">
                <col width="5%">
			    <col width="5%">
			    <col width="75%">
			    <col width="5%">
			    <col width="10%">
                  <thead>
                    <tr style="text-align:center;">
                      <th><spring:message code="ac_no"/></th>
                      <th><spring:message code="ac_type"/></th>
                      <th><spring:message code="ac_content"/></th>
                      <th><spring:message code="ac_writer"/></th>
                      <th><spring:message code="ac_date"/></th>
                    </tr>
                  </thead>
                  <tbody>
                   <c:forEach var="act" items="${activity}">
	                    <tr onmouseover="this.style.backgroundColor='#efefef';" onmouseout="this.style.backgroundColor='#ffffff';" 
	                    	style="text-align:center; cursor: pointer;" class="data" id="${act.document_id}" data-id="${act.document_type}">
	                      <td>${act.document_id}</td>
	                      <td>
	                      <c:choose>
							<c:when test="${act.document_type=='risk'}"> <spring:message code="ac_risk"/> </c:when>
							<c:when test="${act.document_type=='task'}"> <spring:message code="ac_task"/> </c:when>
							<c:otherwise> Error </c:otherwise>
					  	 </c:choose>
					  	 </td>
	                      <td>${act.content}</td>
	                      <td>${act.account_name}</td>
	                       <td><fmt:formatDate value="${act.created_on}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
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
               
            </div>
          </div>
        </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

 <!-- Footer -->
  <jsp:include page="../a00_common/a02_footer.jsp"/>

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
