<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
						<button type="button" class="btn btn-tool"
							data-card-widget="collapse">
							<i class="fas fa-minus"></i>
						</button>
						<button type="button" class="btn btn-tool"
							data-card-widget="remove">
							<i class="fas fa-times"></i>
						</button>
					</div>
				</div>
				<div class="card-body">
					<div class="chart">
						<div id="lineChart"
							style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></div>
					</div>
					<div class="mt-4">
						<table class="table table-bordered table-hover text-center">
							<thead>
								<tr>
									<th>계획</th>
									<th>실적</th>
									<th>차주 계획</th>
									<th>달성률</th>
								</tr>
							</thead>
							<tbody>
								<tr data-widget="expandable-table" aria-expanded="false">
									<td>100%</td>
									<td>24.8%</td>
									<td>100%</td>
									<td>24.8%</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
				<!-- /.card-body -->
	        </div>
		</div>

		<div class="col-md-4">
			<!-- DONUT CHART -->
			<div class="card card-danger">
				<div class="card-header">
					<h3 class="card-title"><spring:message code="dash-chart-per-project"/></h3>
					<div class="card-tools">
						<button type="button" class="btn btn-tool"
							data-card-widget="collapse">
							<i class="fas fa-minus"></i>
						</button>
						<button type="button" class="btn btn-tool"
							data-card-widget="remove">
							<i class="fas fa-times"></i>
						</button>
					</div>
				</div>
				<div class="card-body">
					<canvas id="donutChart"
						style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
					<div class="mt-4">
						<table class="table table-bordered table-hover text-center">
							<thead>
								<tr>
									<th>전체</th>
									<th>진행</th>
									<th>완료</th>
								</tr>
							</thead>
							<tbody>
								<tr data-widget="expandable-table" aria-expanded="false">
									<td>${incompleteAll + completeAll}</td>
									<td>${incompleteAll}</td>
									<td>${completeAll}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- /.card-body -->
			</div>
		</div>
		<!-- /.card -->
		
		<!-- DONUT CHART -->
		<div class="col-md-4">
			<div class="card card-danger">
				<div class="card-header">
					<h3 class="card-title"><spring:message code="dash-chart-per-person"/></h3>

					<div class="card-tools">
						<button type="button" class="btn btn-tool"
							data-card-widget="collapse">
							<i class="fas fa-minus"></i>
						</button>
						<button type="button" class="btn btn-tool"
							data-card-widget="remove">
							<i class="fas fa-times"></i>
						</button>
					</div>
				</div>
				<div class="card-body">
					<canvas id="donutChart2"
						style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
					<div class="mt-4">
						<table class="table table-bordered table-hover text-center">
							<thead>
								<tr>
									<th><spring:message code="dash-chart-total"/></th>
									<th><spring:message code="dash-chart-progress"/></th>
									<th><spring:message code="dash-chart-done"/></th>
								</tr>
							</thead>
							<tbody>
								<tr data-widget="expandable-table" aria-expanded="false">
									<td>${incompleteUser + completeUser}</td>
									<td>${incompleteUser}</td>
									<td>${completeUser}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- /.card-body -->
			</div>
		</div>
		<!-- /.card -->
	</div>
</div>

<script src="plugins/chart.js/Chart.min.js"></script>
<script src="plugins/uplot/uPlot.iife.min.js"></script>

<script type="text/javascript">
	//-------------
	//- DONUT CHART -
	//-------------
	// Get context with jQuery - using jQuery's .get() method.
	var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
	var donutChartCanvas2 = $('#donutChart2').get(0).getContext('2d')
	var donutData1 = {
	  labels: [
	      '진행',
	      '완료',
	      
	  ],
	  datasets: [
	    {
	      data: [${incompleteAll}, ${completeAll}],
	      backgroundColor : ['#f56954', '#00c0ef'],
	    }
	  ]
	}
	
	var donutData2 = {
	  labels: [
	      '진행',
	      '완료',
	      
	  ],
	  datasets: [
	    {
	      data: [${incompleteUser}, ${completeUser}],
	      backgroundColor : ['#f56954', '#00c0ef'],
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
	  data: donutData1,
	  options: donutOptions
	})
	var donutChart2 = new Chart(donutChartCanvas2, {
	  type: 'doughnut',
	  data: donutData2,
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