<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/header.jsp" %>
<%@ include file="manager_mypage_menu.jsp" %>
<div class="container">
	<div class="mypage">
		<h2>답변완료목록</h2>
		<p class="mypage_undervar"></p>
	</div>
	
	<div class="manager_answer_before">
		<table class="table table-bordered">
			<caption>답변완료 리스트입니다.</caption>
			<thead>
				<tr>
					<th scope="col">문의번호</th>
					<th scope="col">문의제목</th>
					<th scope="col">작성날짜</th>
					<th scope="col">작성자</th>
					<th scope="col">답변여부</th>
				</tr>
			</thead>
			<tbody>
			 <c:forEach var="dto" items="${list}" varStatus="stauts">
				<tr>
					<td># ${dto.boardDto.bno}</td>
					<td>${dto.boardDto.btitle}</td>
					<td>${dto.boardDto.bdate}</td>
					<td>${dto.userDto.uname}</td>
					<td><a href="${pageContext.request.contextPath}/do/manager_answer_detail?bno=${dto.boardDto.bno}" title="답변여부 확인" class="btn btn-danger">답변완료</a></td>
				</tr>
			</c:forEach> 
			</tbody>		
		</table>
	</div>
</div>
<%@ include file="inc/footer.jsp" %>