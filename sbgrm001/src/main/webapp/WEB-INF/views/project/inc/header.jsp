<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html  lang = "ko">
 <head>
   <meta charset="UTF-8"/>
   <title>HTML BASIC</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<%@ include file="style/header_style.jsp" %>
	<%@ include file="style/style_dg.jsp" %>
	<%@ include file="style/style_yr.jsp" %>
	<%@ include file="style/style_mj.jsp" %>
 </head>
  <body>
	<div id="header">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/do/main"><img src="${pageContext.request.contextPath}/images/hotellogo3.png" alt="호텔로고" /></a>
		</div>
		
		<nav class="navbar firstnav">
			<div class="container1">
				<ul class="nav navbar-nav navbar-right ">
					
					<!-- 세션 -->
					<!-- 세션 -->
					<!-- 세션 -->
					
					<c:choose>
						<c:when test="${sessionScope.dto.uid!=null}">
							<c:choose>
								<c:when test="${sessionScope.dto.umanager eq 'Y'}">
									<li><a href="${pageContext.request.contextPath}/do/manager_page">관리자페이지</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.request.contextPath}/do/my_page" title="마이페이지로 이동하기">마이페이지</a></li>
								</c:otherwise>
							</c:choose>
							<li><a href="${pageContext.request.contextPath}/do/logout" title="로그아웃 하기">로그아웃</a></li>
							
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/do/login_page">로그인</a></li>
							<li><a href="${pageContext.request.contextPath}/do/join_page">회원가입</a></li>
						</c:otherwise>
					</c:choose>
					
				</ul>
			</div>
		</nav>
		<!-- 		 		-->
		<!-- 		 		-->
		<!-- 		 		-->
		<!-- 		 		-->
		<nav class="navbar n1">
         <div class="container1">
            <ul class="nav navbar-nav navbar-right secondnav">
               <li><a href="${pageContext.request.contextPath}/do/hotel_info">호텔소개</a></li>
               <c:choose>
                  <c:when test="${sessionScope.dto.umanager eq 'Y'}">
                     <li><a href="${pageContext.request.contextPath}/do/manager_board_answer_page" id="myqnaPage">고객문의함</a></li>
                  </c:when>
                  <c:otherwise>
                  	<li><a href="${pageContext.request.contextPath}/do/myqna" id="myqnaPage">고객문의</a></li>
                  </c:otherwise>               
                     
               </c:choose>
            </ul>
         </div>
      </nav>
		
	</div>