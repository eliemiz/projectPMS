<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- TABLE: LATEST ORDERS -->
<div class="container-fluid">
	<div class="card">
		<div class="card-header border-transparent">
			<h3 class="card-title">최근 리스크 목록</h3>
	
			<div class="card-tools">
				<button type="button" class="btn btn-tool"
					data-card-widget="collapse">
					<i class="fas fa-minus"></i>
				</button>
				<button type="button" class="btn btn-tool" data-card-widget="remove">
					<i class="fas fa-times"></i>
				</button>
			</div>
		</div>
		<!-- /.card-header -->
		<div class="card-body p-0">
			<div class="table-responsive">
				<table class="table m-0">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>상태</th>
							<th>발생 가능성</th>
							<th>영향도</th>
							<th>예상 시작일자</th>
							<th>예상 완료일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="risk" items="${riskList}">
						<tr>
							<td>${risk.id}</td>
							<td><a href="${path}/risk.do?method=detail&id=${risk.id}">${risk.subject}</a></td>
							<td>${risk.status}</td>
							<td>${risk.probability}</td>
							<td>${risk.impact}</td>
							<td>${risk.start_date}</td>
							<td>${risk.end_date}</td>
						</tr>
						</c:forEach>
						<%-- <tr>
	                      <td>5</td>
	                      <td><a href="${path}/risk.do?method=detail">개발일정 연장 고려</a></td>
	                      <td>open</td>
	                      <td>6</td>
	                      <td>delay</td>
	                      <td>2021-03-01</td>
	                      <td>2021-04-01</td>
	                    </tr>
						<tr>
	                      <td>4</td>
	                      <td><a href="${path}/risk.do?method=detail">새 프로젝트 생성 시 500 error 질문드립니다.</a></td>
	                      <td>open</td>
	                      <td>2</td>
	                      <td>delay</td>
	                      <td>2021-03-05</td>
	                      <td>2021-04-05</td>
	                    </tr>
						<tr>
	                      <td>3</td>
	                      <td><a href="${path}/risk.do?method=detail">dic 도입 추진</a></td>
	                      <td>open</td>
	                      <td>15</td>
	                      <td>cost</td>
	                      <td>2021-03-02</td>
	                      <td>2021-04-11</td>
	                    </tr>
						<tr>
	                      <td>2</td>
	                      <td><a href="${path}/risk.do?method=detail">일감에 가중치(Weight)를 적용 방법 문의	신규	긴급</a></td>
	                      <td>open</td>
	                      <td>1</td>
	                      <td>delay</td>
	                      <td>2021-03-02</td>
	                      <td>2021-03-10</td>
	                    </tr>
						<tr>
	                      <td>1</td>
	                      <td><a href="${path}/risk.do?method=detail">업무흐름 도형 표시 방법 및 프로젝트 메뉴로 들어갔을 때 뜨는 다양한 차트들 방법 문의</a></td>
	                      <td>open</td>
	                      <td>9</td>
	                      <td>delay</td>
	                      <td>2021-03-01</td>
	                      <td>2021-04-01</td>
	                    </tr> --%>
						
					</tbody>
				</table>
			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.card-body -->
		<div class="card-footer clearfix">
			<a href="${path}/risk.do?method=insForm" class="btn btn-sm btn-info float-left">Create New Risk</a>
			<a href="${path}/risk.do?method=list&projectId=${project.id}" class="btn btn-sm btn-secondary float-right">View All Risks</a>
		</div>
		<!-- /.card-footer -->
	</div>
	<!-- /.card -->
	<div class="card">
		<div class="card-header border-transparent">
			<h3 class="card-title">최근 산출물 목록</h3>
	
			<div class="card-tools">
				<button type="button" class="btn btn-tool"
					data-card-widget="collapse">
					<i class="fas fa-minus"></i>
				</button>
				<button type="button" class="btn btn-tool" data-card-widget="remove">
					<i class="fas fa-times"></i>
				</button>
			</div>
		</div>
		<!-- /.card-header -->
		<div class="card-body p-0">
			<div class="table-responsive">
				<table class="table m-0">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>담당자</th>
							<th>완료 예정일</th>
							<th>완료일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="task" items="${taskList}">
						<tr>
		                    <td>${task.id}</td>
		                    <td><a href="${path}/task.do?method=detail&id=${task.id}">${task.subject}</a></td>
		                    <td>${task.name}</td>
		                    <td>${task.dueDate}</td>
		                    <td>${task.completedOn}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.card-body -->
		<div class="card-footer clearfix">
			<a href="${path}/task.do?method=insForm" class="btn btn-sm btn-info float-left">Create new Task</a> 
			<a href="${path}/task.do?method=list" class="btn btn-sm btn-secondary float-right">View new Activities</a>
		</div>
		<!-- /.card-footer -->
	</div>
	<!-- /.card -->
</div>
