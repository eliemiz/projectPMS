<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fetch/2.0.3/fetch.js "></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/es6-promise/4.1.1/es6-promise.auto.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var vm3 = new Vue({
			el:"#infoTable",
			data: {
				projectId:0,
				memberList:[]
			},
			methods:{
				getMembers:function(){
					this.projectId = "${projectId}";
					console.log("projectId : " + this.projectId);
					this.fetchMemberList();	
				},
				fetchMemberList: _.debounce(function(){
					var vm = this;
					/* 1. 모델데이터 초기화 */
					this.memberList = [];
					
					var url = "${path}/jsonProjectMembers.do";
					/* 2. fetch api의 ajax처리와 promise 형태 함수 처리 */
					fetch(url).then(function(response){ 
						return response.json();
					}).then(function(json){	/* response에 의해서 받은 json 데이터 처리 */
						console.log(json.memberList);
						vm.memberList = json.memberList;
					}).catch(function(err){	/* 에러 발생 시 처리 */
						console.log("# 에러 발생 #");
						console.log(err);
					});
				}, 200)
			}
		});
		
		vm3.getMembers();
	});
	
</script>

<div class="container-fluid">
	<div class="text-right mb-3">
		<span style="font-weight: bolder;"><spring:message code="dash-achievement-rate"/> </span>
		<i class="fas fa-thumbs-up ml-3" style="color:green;"></i> <spring:message code="dash-achievement-safe"/>
		<i class="fas fa-exclamation-triangle ml-3" style="color:orange;"></i> <spring:message code="dash-achievement-warning"/>
		<i class="fas fa-times-circle ml-3" style="color:red"></i> <spring:message code="dash-achievement-danger"/>
	</div>
	<div class="row">
		<!-- /.col -->
		<div class="col-10">
			<div class="table-responsive">
				<table class="table" id="infoTable">
					<colgroup>
						<col width="25%" />
						<col width="25%" />
						<col width="25%" />
						<col width="25%" />
					</colgroup>
					<tr>
						<th><spring:message code="dash-project-name"/> </th>
						<td>${project.name}</td>
						<th><spring:message code="dash-project-manager"/></th>
						<td>
							<span v-for="(user, index) in memberList" v-if="user.auth == 'Manager'">{{user.name}}</span>
							<%-- <c:forEach var="account" items="${accountList}">
								<c:if test="${account.auth == 'Manager'}">${account.name} </c:if>
							</c:forEach> --%>
						</td>
					</tr>
					<tr>
						<th><spring:message code="dash-project-description"/></th>
						<td>${project.description}</td>
						<th><spring:message code="dash-project-members"/></th>
						<td>
							{{memberList.length}}
							<spring:message code="dash-project-member-count"/>
						</td>
					</tr>
					<tr>
						<th><spring:message code="dash-project-homepage"/></th>
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
						<th><spring:message code="dash-project-status"/></th>
					</tr>
					<c:choose>
						<c:when test="${completeAll / (incompleteAll + completeAll) <= 0.7}">
						<tr>
							<td style="color:red">
							<i class="fas fa-times-circle" style="font-size: 50px;"></i><br>
							<span style="font-weight:bold;">Danger</span>
							</td>
						</tr>
						</c:when>
						<c:when test="${completeAll / (incompleteAll + completeAll) <= 0.9}">
						<tr>
							<td style="color:orange">
							<i class="fas fa-exclamation-triangle" style="font-size: 50px;"></i><br>
							<span style="font-weight:bold;">Warning</span>
							</td>
						</tr>
						</c:when>
						<c:otherwise>
						<tr>
							<td style="color:green">
							<i class="fas fa-thumbs-up" style="font-size: 50px;"></i><br>
							<span style="font-weight:bold;">Safe</span>
							</td>
						</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
		<!-- /.col -->
	</div>
</div>
