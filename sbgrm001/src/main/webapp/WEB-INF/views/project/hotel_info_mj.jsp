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
					<h3 class = "causeMachen_mj">고민지</h3>
				</div>
			
				<div class = "videoSize_mj">
					<iframe width="600" height="350" src="https://www.youtube.com/embed/W8b5wGtwSZk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				</div>
				
				<div class = "des_1">
					<div class = "descriptionMappen_mj">
					
						<div class = "col-sm-6    desc1_mj">
							<div class = "desc1">
								<textarea class = "jspMappenInfo" style="resize: none;"> 전시안내 및 예약 사이트입니다. 
- 진행중인 전시를 볼 수 있고 여러 방법으로 전시를 찾을 수 있습니다.
- 조회수가 많은 전시를 메인에 두어 어떤 전시가 인기가 많은지 한눈에 볼 수 있도록 제작하였습니다.
- 같은 지역에서 하는 전시를 볼 수 있도록 따로 구성하여 그 전시 뿐만 아니라 다른 전시도 확인하고 예매할 수 있습니다.
- 전시장은 많은 사람이 다녀가는 곳이기 때문에 코로나19 확진율에 따라 휴관을 합니다. 공공데이터 API를 이용하여 코로나 현황을 볼 수 있도록 하였습니다.
- 다음카카오 MAP API를 사용하여 전시관이 있는 곳을 지도에서 찾을 수 있습니다.
								</textarea>
							</div>
						</div>
						
						<div class = "col-sm-6  desc2_mj ">
							<div class = "col-sm-6   ">
								<img src = "<%=request.getContextPath()%>/images/QRCode_JSPYoutube.jpg" alt = "web Mappen QR" class = "QRsize_mj"/>
								<p>JSP 웹 포트폴리오 QR 코드입니다.</p>
							</div>
							<div class = "col-sm-6  ">
								<img src = "<%=request.getContextPath()%>/images/QRcodeJava_mj.jpg" alt = "web Mappen QR" class = "QRsize_mj"/>
								<p>JAVA 포트폴리오 QR 코드입니다.</p>
							</div>
						</div>
						
					</div>
				</div>
			</div>
	
	
		</div>
	
	
	
	</div>
</div>