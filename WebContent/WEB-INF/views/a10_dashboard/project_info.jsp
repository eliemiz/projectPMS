<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container-fluid">
	<div class="text-right mb-3">
		<span style="font-weight: bolder;">달성률 기준</span>
		<i class="fas fa-thumbs-up ml-3" style="color:green;"></i> 정상 (90% 이상)
		<i class="fas fa-exclamation-triangle ml-3" style="color:orange;"></i> 경고 (70% 이상 90% 미만)
		<i class="fas fa-times-circle ml-3" style="color:red"></i> 위험 (70% 미만)
	</div>
	<div class="row">
		<!-- /.col -->
		<div class="col-10">
			<div class="table-responsive">
				<table class="table">
					<colgroup>
						<col width="25%" />
						<col width="25%" />
						<col width="25%" />
						<col width="25%" />
					</colgroup>
					<tr>
						<th>프로젝트명</th>
						<td>${project.name}</td>
						<th>프로젝트 매니저(PM)</th>
						<td>홍길동(임시)</td>
					</tr>
					<tr>
						<th>프로젝트 설명</th>
						<td>${project.description}</td>
						<th>참여 인원 수</th>
						<td>6명</td>
					</tr>
					<tr>
						<th>홈페이지</th>
						<td>${project.homepage}</td>
						<th></th>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="col-2">
			<div class="table-responsive">
				<table class="table text-center">
					<tr>
						<th>프로젝트 상태</th>
					</tr>
					<!-- <tr>
						<td style="color:red">
						<i class="fas fa-times-circle" style="font-size: 50px;"></i><br>
						<span style="font-weight:bold;">Danger</span>
						</td>
					</tr>
					<tr>
						<td style="color:orange">
						<i class="fas fa-exclamation-triangle" style="font-size: 50px;"></i><br>
						<span style="font-weight:bold;">Warning</span>
						</td>
					</tr> -->
					<tr>
						<td style="color:green">
						<i class="fas fa-thumbs-up" style="font-size: 50px;"></i><br>
						<span style="font-weight:bold;">Safe</span>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- /.col -->
	</div>
</div>
