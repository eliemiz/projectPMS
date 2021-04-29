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
  <title>RiskDetail</title>

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
<style type="text/css">
#download:hover{
	cursor:pointer;
	font-weight:bold;
}

</style>
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
		
		$("#hd-project-list").change(function(){
			location.href="${path}/risk.do?projectId="+$(this).val();
		});
		$("#fileInfo").click(function(){
			var filename=$(this).text();
			if(confirm("다운로드하시겠습니까?\n"+filename)){
				$(location).attr("href","${path}/risk.do?method=download&filename="+filename);
			}
		});
		$("#upt").click(function(){
			var auth = "${account.auth}";
			var status = "${risk.status}";
			if((status == 'Request' || 
				status == 'Review' || 
				status == 'Reassignment' ||
				status == 'Completed') && auth != 'Manager'){
				alert("Project Manager만 수정 가능합니다.")
			}else{
				$("form").attr("action","${path}/risk.do?method=uptForm");
				$("form").submit();
			}
		});
		$("#delBtu").on("click",function(){
			var auth = "${account.auth}";
			var status = "${risk.status}";
			if((status == 'Request' || 
				status == 'Review' || 
				status == 'Reassignment' ||
				status == 'Completed') && auth != 'Manager'){
				alert("Project Manager만 삭제 가능합니다.")
			}else{
				if(confirm("삭제하시겠습니까?")){
					$("form").attr("action","${path}/risk.do?method=delete");					
					$("form").submit();				
						
				}
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
     <!-- Default box -->
     	<form:form modelAttribute="risk" method="post"
     	action="" enctype="multipart/form-data">
      <div class="card">
        <div class="card-header">
	        <form:hidden path="id"/>
	    	<form:hidden path="project_id"/>
	    	<form:hidden path="account_id"/>
	    	<form:hidden path="subject"/>
	    	<form:hidden path="description"/>
	    	<form:hidden path="status"/>
	    	<form:hidden path="category"/>
	    	<form:hidden path="created_on"/>
	    	<form:hidden path="updated_on"/>
	    	<form:hidden path="start_date"/>
	    	<form:hidden path="end_date"/>
	    	<form:hidden path="probability"/>
	    	<form:hidden path="impact"/>
	    	<form:hidden path="strategy"/>
	    	<form:hidden path="treatment"/>
	    	<form:hidden path="account_name"/>
	    	<form:hidden path="project_name"/>
          <h3 class="card-title">상세 내용</h3>
			
          <div class="card-tools">
            <div class="input-group input-group-sm">
              <div class="input-group-append">
              <c:if test="${sessionScope.account.id == risk.account_id || (account.auth == 'Manager') }">
                <button type="button" id="upt"
                 	class="btn btn-primary float-right">수정</button>
                </c:if>
              <c:if test="${account.auth == 'Manager'}">
               &nbsp;&nbsp;
	        	<button type="button" id="delBtu"
	         	    class="btn btn-primary float-right">삭제</button> 
	          </c:if>  
                &nbsp;&nbsp;&nbsp;
         <%--        <button type="button" onclick="location.href='${path}/risk.do?method=list'"
                 class="btn btn-secondary float-right">삭제</button>  --%>
              </div>
            </div>
          </div>
        </div>
        <div class="card-body">
          <div class="row">
            
            <div class="col-12 col-lg-12 col-lg-4 order-1 order-md-2">
              <h3 class="text-primary"><i class="fas fa-paint-stamp"></i>${risk.subject}</h3>
              <h5 class="text-secondary">수정일 : <fmt:formatDate value="${risk.updated_on}" pattern="yyyy-MM-dd"/></h5>
              &nbsp;&nbsp;&nbsp;
               <div style="white-space:pre;">${risk.description}</div>  
              &nbsp;&nbsp;&nbsp; 
              <br>
              <div class="text-muted">
               <div class="row">
                <div class="col-md-6">
                
                 <div class="form-group">
	                <p class="text-sm">상태
	                  <b class="d-block">${risk.status}</b>
                	</p>
                 </div>
                 <div class="form-group">
	                <p class="text-sm">담당자
	                  <b class="d-block">${risk.account_name}(${account.auth})</b>
	                </p>
	             </div>
	             <div class="form-group">
	                <p class="text-sm">연결 프로젝트
	                  <b class="d-block">${risk.project_name}</b>
	                </p>
	             </div>
	             <div class="form-group">
	                <p class="text-sm">범주
	                  <b class="d-block">${risk.category}</b>
	                </p>
                </div>
                </div>
                
                <div class="col-md-6">
                <div class="form-group">
                <p class="text-sm">발생도
                  <b class="d-block">
                  <c:choose>
					<c:when test="${risk.probability==1}"> 미세 </c:when>
					<c:when test="${risk.probability==2}"> 낮음 </c:when>
					<c:when test="${risk.probability==3}"> 보통 </c:when>
					<c:when test="${risk.probability==4}"> 높음 </c:when>
					<c:when test="${risk.probability==5}"> 확실 </c:when>
					<c:otherwise> Error </c:otherwise>
				  </c:choose>
                  </b>
                </p>
                </div>
                <div class="form-group">
                <p class="text-sm">영향도
                  <b class="d-block">
                  <c:choose>
					<c:when test="${risk.impact==1}"> 미세 </c:when>
					<c:when test="${risk.impact==2}"> 낮음 </c:when>
					<c:when test="${risk.impact==3}"> 보통 </c:when>
					<c:when test="${risk.impact==4}"> 중요 </c:when>
					<c:when test="${risk.impact==5}"> 치명적 </c:when>
					<c:otherwise> Error </c:otherwise>
				  </c:choose>
                  </b>
                </p>
                </div>
                <div class="form-group">
                <p class="text-sm">예상시작일
                  <b class="d-block">${risk.start_date}</b>
                </p>
                </div>
                <div class="form-group">
                <p class="text-sm">예상종료일
                  <b class="d-block">${risk.end_date}</b>
                </p>
                </div>
                </div>
                </div>
                <br>
                
                
                <h4 class="text-primary">조치내용</h4>
                <div class="form-group">
                <p class="text-md">전략
                  <b class="d-block">${risk.strategy}</b>
                </p>
                </div>
                <div class="form-group">
                <p class="text-md">해결방안</p>
                  <div style="white-space:pre; color:black;">${risk.treatment}</div>
                </div>
                
              <h5 class="mt-5 text-muted">첨부파일</h5>
              <div class="form-group">
              <c:forEach var="file" items="${risk.fileInfo}" varStatus="sts">
                <div id="download">
                  <i class="fas fa-download">&nbsp;</i>
                   <!-- Functional-requirements.docx -->
                  	 <span id="fileInfo" name="filename" value="${file.filename}">${file.filename}</span>
                  </div>
                
                </c:forEach>
                </div>
                <!-- <li>
                  <a href="" class="btn-link text-secondary"><i class="far fa-fw fa-file-pdf"></i> UAT.pdf</a>
                </li>
                <li>
                  <a href="" class="btn-link text-secondary"><i class="far fa-fw fa-envelope"></i> Email-from-flatbal.mln</a>
                </li>
                <li>
                  <a href="" class="btn-link text-secondary"><i class="far fa-fw fa-image "></i> Logo.png</a>
                </li>
                <li>
                  <a href="" class="btn-link text-secondary"><i class="far fa-fw fa-file-word"></i> Contract-10_12_2014.docx</a>
                </li> -->
              
              
             
              
		<div class="col-12 col-lg-12 col-lg-8 order-2 order-md-1">
          <div class="row">
           <div class="col-12">
            <div class="row mt-4">
            <nav class="w-100">
              <div class="nav nav-tabs" id="product-tab" role="tablist">
                <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">이력</a>
               <!--  <a class="nav-item nav-link" id="product-comments-tab" data-toggle="tab" href="#product-comments" role="tab" aria-controls="product-comments" aria-selected="false">댓글</a> -->
              </div>
            </nav>
            <div class="tab-content p-3" id="nav-tabContent">
              <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab"> 
              	<br>
              	<div class="card-body repliesDiv">
			    	<c:forEach var="journal" items="${journals}">
			    	<pre><strong>변경 일자: <fmt:formatDate value="${journal.created_on}" pattern="yyyy-MM-dd HH:mm"/></strong><br>${journal.content}</pre>
			    	</c:forEach>
			    </div>
              </div>
              <%-- <div class="tab-pane fade" id="product-comments" role="tabpanel" aria-labelledby="product-comments-tab">
             	<c:forEach var="comment" items="${risk.commentInfo}">
             	
             	<div class="post">                	
                      <div class="user-block">
                        <img class="img-circle img-bordered-sm" src="dist/img/user1-128x128.jpg" alt="user image">
                        <span class="username">
                          ${comment.account_id}
                        </span>
                        <span class="description">${comment.updated_on}</span> <!--Shared publicly - 7:45 PM today -->
                      </div>
                      <!-- /.user-block -->
                      <p>
                       ${comment.content} 
                      </p>
                    
                </div>                      
                </c:forEach>
                
              </div> --%>
            </div>
          </div>   
         </div>
          </div>
            </div>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      </div>
      <!-- /.card -->
     </form:form>
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
