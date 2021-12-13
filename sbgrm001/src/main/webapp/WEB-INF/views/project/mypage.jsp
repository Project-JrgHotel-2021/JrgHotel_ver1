<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/header.jsp" %>
<%@ include file="mypage_menu.jsp" %>
<div class="container mysub">
	<div class="mypage">
		<h2>마이페이지</h2>
		<p class="mypage_undervar"></p>
	</div>
	
	<div class="mypage_default">
		<div class="row">
			<div class="col-sm-4"><p class="mypage_default_img"><a href="${pageContext.request.contextPath}/do/my_check"><img src="${pageContext.request.contextPath}/images/user_update.png" alt="회원정보수정으로 이동"/></a><br><span class="mypage_default_span">회원정보</span></p></div>
			<div class="col-sm-4"><p class="mypage_default_img"><a href="${pageContext.request.contextPath}/do/reservation"><img src="${pageContext.request.contextPath}/images/reservation.png" alt="예약확인으로 이동"/></a><br><span class="mypage_default_span">예약정보</span></p></div>
			<div class="col-sm-4"><p class="mypage_default_img"><a href="${pageContext.request.contextPath}/do/myqna"><img src="${pageContext.request.contextPath}/images/board.png" alt="문의내역확인으로 이동"/></a><br><span class="mypage_default_span">문의내역</span></p></div>
			
		</div>
	</div>
		
</div>
	
		
	
<%@ include file="inc/footer.jsp" %>
