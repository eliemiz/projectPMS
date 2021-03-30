<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<!-- <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css"> -->
<!-- Theme style -->
<!-- <link rel="stylesheet" href="../../dist/css/adminlte.min.css"> -->
<link rel="stylesheet" href="dist/font/fonts.css"/>

<h1 class="m-0">Dashboard</h1>
<h1>대시보드 Dashboard</h1>
<h1 style="font-family: 'Noto Sans KR';">대시보드 Dashboard</h1>

<!-- DONUT CHART -->
<div class="card card-danger">
  <div class="card-header">
    <h3 class="card-title">Donut Chart</h3>

    <div class="card-tools">
      <button type="button" class="btn btn-tool" data-card-widget="collapse">
        <i class="fas fa-minus"></i>
      </button>
      <button type="button" class="btn btn-tool" data-card-widget="remove">
        <i class="fas fa-times"></i>
      </button>
    </div>
  </div>
  <div class="card-body">
    <canvas id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
  </div>
  <!-- /.card-body -->
</div>
<!-- /.card -->
    
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<script type="text/javascript">
	//-------------
	//- DONUT CHART -
	//-------------
	// Get context with jQuery - using jQuery's .get() method.
	var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
	var donutData = {
	  labels: [
	      'Chrome',
	      'IE',
	      'FireFox',
	      'Safari',
	      'Opera',
	      'Navigator',
	  ],
	  datasets: [
	    {
	      data: [700,500,400,600,300,100],
	      backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'],
	    }
	  ]
	}
	var donutOptions     = {
	  maintainAspectRatio : false,
	  responsive : true,
	}
	//Create pie or douhnut chart
	// You can switch between pie and douhnut using the method below.
	var donutChart = new Chart(donutChartCanvas, {
	  type: 'doughnut',
	  data: donutData,
	  options: donutOptions
	})

</script>