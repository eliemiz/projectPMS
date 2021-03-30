<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<link rel="stylesheet" href="plugins/uplot/uPlot.min.css">

<div class="container-fluid">
	<div class="row">
		<div class="col-md-4">
			<!-- LINE CHART -->
	        <div class="card card-info">
	          <div class="card-header">
	            <h3 class="card-title">Line Chart</h3>
	
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
	            <div class="chart">
	              <div id="lineChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></div>
	            </div>
	          </div>
	          <!-- /.card-body -->
	        </div>
		</div>
		
		<div class="col-md-4">
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
		</div>
		<!-- /.card -->
		
		<!-- DONUT CHART -->
		<div class="col-md-4">
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
			    <canvas id="donutChart2" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
			  </div>
			  <!-- /.card-body -->
			</div>
		</div>
		<!-- /.card -->
	</div>
</div>

<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="plugins/chart.js/Chart.min.js"></script>
<script src="plugins/uplot/uPlot.iife.min.js"></script>
<script src="dist/js/adminlte.min.js"></script>

<script type="text/javascript">
	//-------------
	//- DONUT CHART -
	//-------------
	// Get context with jQuery - using jQuery's .get() method.
	var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
	var donutChartCanvas2 = $('#donutChart2').get(0).getContext('2d')
	var donutData        = {
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
	var donutChart2 = new Chart(donutChartCanvas2, {
	  type: 'doughnut',
	  data: donutData,
	  options: donutOptions
	})
	
	function getSize(elementId) {
	      return {
	        width: document.getElementById(elementId).offsetWidth,
	        height: document.getElementById(elementId).offsetHeight,
	      }
	    }

	    let data = [
	      [0, 1, 2, 3, 4, 5, 6],
	      [28, 48, 40, 19, 86, 27, 90],
	      [65, 59, 80, 81, 56, 55, 40]
	    ];

	const optsLineChart = {
      ... getSize('lineChart'),
      scales: {
        x: {
          time: false,
        },
        y: {
          range: [0, 100],
        },
      },
      series: [
        {},
        {
          fill: 'transparent',
          width: 5,
          stroke: 'rgba(60,141,188,1)',
        },
        {
          stroke: '#c1c7d1',
          width: 5,
          fill: 'transparent',
        },
      ],
    };

    let lineChart = new uPlot(optsLineChart, data, document.getElementById('lineChart'));

    window.addEventListener("resize", e => {
      lineChart.setSize(getSize('lineChart'));
    });
</script>