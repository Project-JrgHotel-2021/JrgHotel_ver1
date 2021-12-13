<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/header.jsp" %>
<div class = "totalcontainer_1">
	<div class = "container">
		<div class = "row  ">
			<div class = "col-sm-2 hotelInfo_mj">	<!-- 옆에 네이게이션 바 -->
			<h2 class = "titleHotel">JRG HOTEL 소개</h2>
			
			<ul class = "infoMenu_mj">
				<li class = "menu1_mj">
					<!-- <p>만들게 된 계기</p> -->
					<a href = "${pageContext.request.contextPath}/do/hotel_info" class ="clicken">호 텔 소 개</a>
				</li>
				
				<li class = "menu2_mj">
				
					<a href = "${pageContext.request.contextPath}/do/hotel_info_mj" class ="clicken">고 민 지</a>
				</li>
				
				<li class = "menu2_mj">
					
					<a href = "${pageContext.request.contextPath}/do/hotel_info_dg" class ="clicken">김 대 구</a>
				</li>
				
				<li class = "menu2_mj">
					
					<a href = "${pageContext.request.contextPath}/do/hotel_info_yr" class ="clicken">김 예 림</a>
				</li>
				
			</ul>
			
			</div><!-- end hotelInfo_mj -->
			
			<div class = "col-sm-1" ></div>
			
			
			<div class = "col-sm-9">
				<div class = "info_mj">
					<h3 class = "causeMachen_mj">김 대 구</h3>
				</div>
			
				<div class = "videoSize_mj">
					<iframe width="600" height="350" src="https://www.youtube.com/embed/TO49sYpi2y8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				</div>
				
				<div class = "des_1">
					<div class = "descriptionMappen_mj">
					
						<div class = "col-sm-6    desc1_mj">
							<div class = "desc1">
								
								
							</div>
						</div>
						
						<div class = "col-sm-6  desc2_mj ">
							<div class = "col-sm-6   ">
								<img src = "<%=request.getContextPath()%>/images/QRcode_dg.png" alt = "web Mappen QR"  class = "QRsizedg_mj"/>
								<p>JSP 웹 포트폴리오 QR 코드입니다.</p>
							</div>
							<div class = "col-sm-6  ">
								<img src = "<%=request.getContextPath()%>/images/QRCodeJava_dg.png" alt = "web Mappen QR" class = "QRsizedg_mj"/>
								<p>JAVA 포트폴리오 QR 코드입니다.</p>
							</div>
						</div>
						
						
						
					</div>
				</div>
			
			</div>
	
	
		</div>
	
	
	
	</div>
</div>