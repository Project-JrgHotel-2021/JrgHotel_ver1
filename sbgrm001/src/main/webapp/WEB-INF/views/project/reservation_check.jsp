<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.*" %>

<%@ include file="inc/header.jsp" %>
<%@ include file="mypage_menu.jsp" %>

<!-- 예약내역가져오는데 오류가 나는 경우  -->
<c:set var="result" value="${result}"></c:set>
	<c:if test="${result!='0'}">
		<script>
			alert("관리자에게 문의바랍니다.");
			history.go(-1);
		</script>
	</c:if>
<div class="container">
	<div class="mypage">
		<h2>예약확인</h2>
		<p class="mypage_undervar"></p>
	</div>
	
	<div class="reservation_check">
		<div class="reservation_detail">
			<h3 class="text-center">예약내역</h3>
			<hr>
			<div class="reservation_detail_table">
				<table class="table table-striped">
					<thead>
						<tr><th scope="row" colspan="2"><div class="reservation_check_img"><img src="${pageContext.request.contextPath}/images/${dto.roomimageDto.riimage}" alt="룸사진"/></div></th></tr>
					</thead>
					<tbody>
						
						<tr><th scope="row">ROOMTYPE</th><td>${rtdto.rtname}</td></tr>						
						<tr><th scope="row">ADULT</th><td>${dto.reservationDto.radult}명</td></tr>
						<tr><th scope="row">KID</th><td>${dto.reservationDto.rkid}명</td></tr>
						<tr><th scope="row">TOTAL</th>
						<td style="text-style:bold">
						<c:set var="total" value="${dto.reservationDto.radult+dto.reservationDto.rkid}"></c:set>
						${total}명</td></tr>
						<tr><th scope="row">ADDBED</th><td>
						<c:choose>
							<c:when test="${dto.reservationDto.raddbed=='y'}">
								추가O
							</c:when>
							<c:otherwise>
								추가X
							</c:otherwise>
						</c:choose>
						</td></tr>
						<tr><th scope="row">SPA</th><td>${dto.reservationDto.rspa}명</td></tr>
						<tr><th scope="row">SWIM</th><td>${dto.reservationDto.rswim}명</td></tr>
						<tr><th scope="row">BREAKFAST</th><td>${dto.reservationDto.rbreakfast}명</td></tr>
						<tr><th scope="row">BAR</th><td>${dto.reservationDto.rbar}명</td></tr>
						<tr><th scope="row">CHECK-IN</th><td>${dto.reservationDto.rcheckin}</td></tr>
						<tr><th scope="row">CHECK-OUT</th><td>${dto.reservationDto.rcheckout}</td></tr>
						<tr><td colspan="2" class="reservation_var"><p></p></td></tr>
						
					</tbody>
					<tfoot>
						
					</tfoot>
				</table>
				
				<!--  계산 -->
				<c:set var="spaNum"></c:set>
				<c:set var="swimNum"></c:set>
				<c:set var="breakfastNum"></c:set>
				<c:set var="barNum"></c:set>
				<c:set var="addbedNum"></c:set>
				
				<%-- <c:forEach var="opdto" items="${optiondto}" varStatus="status">
					<c:choose>
						<c:when test="${opdto.opname eq 'rspa'}">
							<c:set var="spaNum" value="${opdto.opprice * dto.reservationDto.rspa}"></c:set>
						</c:when>
						<c:when test="${opdto.opname eq 'rswim'}">
							<c:set var="swimNum" value="${opdto.opprice * dto.reservationDto.rswim}"></c:set>
						</c:when>
						<c:when test="${opdto.opname eq 'rbreakfast'}">
							<c:set var="breakfastNum" value="${opdto.opprice * dto.reservationDto.rbreakfast}"></c:set>
						</c:when>
						<c:when test="${opdto.opname eq 'rbar'}">
							<c:set var="barNum" value="${opdto.opprice * dto.reservationDto.rbar}"></c:set>
						</c:when>
						<c:when test="${opdto.opname eq 'raddbed'}">
							<c:set var="addbedNum" value="${opdto.opprice}"></c:set>
							<c:if test="${dto.reservationDto.raddbed!='y'}"> <c:set var="addbedNum" value="0"></c:set> </c:if>
						</c:when>
					</c:choose>
				</c:forEach> --%>
				
				
				<!-- 합계 -->
				<c:set var="sum" value="${dto.reservationDto.rtotalprice}"></c:set>
				<div class="reservation_check_foot">
				
					<h2>합계</h2>
					
					<%
						
						
						DecimalFormat formatter = new DecimalFormat("###,###");
						
						String resultSum = formatter.format(pageContext.getAttribute("sum"));
						
						pageContext.setAttribute("resultSum", resultSum);
					%>
					
					<div class="reservation_check_foot_content">
						<p>
						${resultSum}원
						</p>
					</div>
					
					<div class="reservation_backBtn">
						<a href="${pageContext.request.contextPath}/do/reservation?rno=${dto.reservationDto.rno}" title="뒤로가기" class="btn btn-colored">확인</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="inc/footer.jsp" %>
