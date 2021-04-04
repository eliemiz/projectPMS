<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- DataTables -->
<link rel="stylesheet"
	href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

<!-- Main content -->
<table id="example2" class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>역할</th>
			<th>전체</th>
			<th>진행</th>
			<th>완료</th>
			<th>달성률</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>5</td>
			<td><a href="${path}/info.do">홍길동</a></td>
			<td>관리자</td>
			<td>22</td>
			<td>15</td>
			<td>7</td>
			<td>77.5%</td>
		</tr>
		<tr>
			<td>4</td>
			<td><a href="${path}/info.do">마길동</a></td>
			<td>개발자</td>
			<td>22</td>
			<td>15</td>
			<td>7</td>
			<td>77.5%</td>
		</tr>
		<tr>
			<td>3</td>
			<td><a href="${path}/info.do">이점검</a></td>
			<td>개발자</td>
			<td>22</td>
			<td>15</td>
			<td>7</td>
			<td>77.5%</td>
		</tr>
		<tr>
			<td>2</td>
			<td><a href="${path}/info.do">김피엠</a></td>
			<td>개발자</td>
			<td>22</td>
			<td>15</td>
			<td>7</td>
			<td>77.5%</td>
		</tr>
		<tr>
			<td>1</td>
			<td><a href="${path}/info.do">김실장</a></td>
			<td>관리자</td>
			<td>22</td>
			<td>15</td>
			<td>7</td>
			<td>77.5%</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>역할</th>
			<th>전체</th>
			<th>진행</th>
			<th>완료</th>
			<th>달성률</th>
		</tr>
	</tfoot>
</table>

<!-- DataTables  & Plugins -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script
	src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script
	src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
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
	$(function() {
		$('#example2').DataTable({
			"paging" : true,
			"lengthChange" : false,
			"searching" : false,
			"ordering" : true,
			"info" : true,
			"autoWidth" : false,
			"responsive" : true,
		});
	});
</script>