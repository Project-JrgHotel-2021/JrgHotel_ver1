<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/header.jsp" %>
<%@ include file="manager_mypage_menu.jsp" %>
<div class="container">
	<div class="mypage">
		<h2>예약완료리스트</h2>
		<p class="mypage_undervar"></p>
	</div>
	
	<div class="myqnalist_manager">
		<table class="table table-bordered">
			<caption>예약완료 명단입니다.</caption>
			<thead>
				<tr>
					<th scope="col">예약번호</th>
					<th scope="col">예약자</th>
					<th scope="col">아이디</th>
					<th scope="col">예약날짜</th>
					<th scope="col">승인여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}" varStatus="status">
				
				<tr>
					<td><a href="${pageContext.request.contextPath}/do/manager_reservation_detail?rno=${dto.rno}">예약번호#${dto.rno}</a></td>
					<td>${dto.uname}</td>
					<td>${dto.uid}</td>
					<td>${dto.rdate}</td>
					<!-- 승인여부 확인 checkreservation!="Y"이라면 예약대기중-->
					<td>
						<a href="#reservation_complete" class="btn btn-danger">예약완료</a>
					</td>
				</tr>
				
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<%@ include file="inc/footer.jsp" %>
