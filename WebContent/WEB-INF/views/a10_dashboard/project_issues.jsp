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
<table id="example3" class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>담당자</th>
			<th>완료예정일</th>
			<th>완료일</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>5</td>
			<td>
				<a href="${path}/task.do?method=detail">동료검토결과보고서</a>
			</td>
			<td>김철수</td>
			<td>2021-04-01</td>
			<td>2021-03-27</td>
		</tr>
		<tr>
			<td>4</td>
			<td>
				<a href="${path}/task.do?method=detail">PDF 파일 미리보기</a>
			</td>
			<td>김피엠</td>
			<td>2021-03-30</td>
			<td>2021-03-27</td>
		</tr>
		<tr>
			<td>3</td>
			<td>
				<a href="${path}/task.do?method=detail">사용자를 위한 이용 매뉴얼을 작성합시다</a>
			</td>
			<td>오재복</td>
			<td>2021-04-01</td>
			<td>2021-04-01</td>
		</tr>
		<tr>
			<td>2</td>
			<td>
				<a href="${path}/task.do?method=detail">테스트결과서가이드</a>
			</td>
			<td>이점검</td>
			<td>2021-04-01</td>
			<td>2021-03-27</td>
		</tr>
		<tr>
			<td>1</td>
			<td>
				<a href="${path}/task.do?method=detail">SW아키텍처</a>
			</td>
			<td>김희종</td>
			<td>2021-04-12</td>
			<td>2021-04-11</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>담당자</th>
			<th>완료예정일</th>
			<th>완료일</th>
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
		$('#example3').DataTable({
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