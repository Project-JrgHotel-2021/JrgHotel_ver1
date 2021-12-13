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
			
			
			<!-- <script>
			/* 이거 다시 : 클릭했을때 어떤 탭을 클릭했는지 확인하는 하이라이터			*/
				jQuery(document).ready(function(){
					$(".infoMenu_mj  li  a.active").on("click", function(){
						if(!($(this).hasClass("active"))){
						       $(".infoMenu_mj>li>a.active").removeClass("active");
						       $(this).addClass("active");
						   }       
						
					});
				});
			
			</script> -->
			
			
			<!-- 
			
			$(".tabnav-widget li a").click(function(){        
   if(!($(this).hasClass("active"))){
       $(".tabnav-widget li a.active").removeClass("active");
       $(this).addClass("active");
   }       
});
			
			
			 -->
			
			
			<div class = "col-sm-1" ></div>
		
		
			<div class = "col-sm-9">
				<div class = "info_mj">
					<h3 class = "causeMachen_mj">호텔소개</h3>
				</div>
			
			
				<div class = "roomInfo">
						<h3 class = "stadardH3">객실 스탠다드</h3>
						<img src="${pageContext.request.contextPath}/images/hotelshilla020_S.jpg" alt="스탠다드_서울사진" class = "roomInfoImg"/>
							
							<div class = "kleinPhoto">
								<div class = "col-sm-1">  </div>
								<div class ="col-sm-3">
									<img src="${pageContext.request.contextPath}/images/hotelshilla019_S.jpg" alt="스탠다드_서울사진" class = "roomInfoImg"/>
									<h4 class = "kleinDesc">호텔서울</h4>
								</div>
								
								<div class ="col-sm-3">
									<img src="${pageContext.request.contextPath}/images/hotelshillaBusan023_S.jpg" alt="스탠다드_부산사진" class = "roomInfoImg"/>
									<h4 class = "kleinDesc">호텔부산</h4>
								</div>
								
								<div class ="col-sm-3">
									<img src="${pageContext.request.contextPath}/images/hotelshillaJeju026_S.jpg" alt="스탠다드_제주사진" class = "roomInfoImg"/>
									<h4 class = "kleinDesc">호텔제주</h4>
								</div>
							
								<div class = "col-sm-2">  </div>
								
							</div><!-- end kleinPhoto -->
							
							
					
				</div><!--  end roomInfo   -->
				
				
				<div class = "roomInfo2">
						<h3 class = "stadardH3">객실 비즈니스</h3>
						<img src="${pageContext.request.contextPath}/images/hotelshillaJeju018_B.jpg" alt="비즈니스_제주" class = "roomInfoImg"/>
							
							<!-- <div class = "kleinPhoto"> -->
								<div class = "col-sm-1">  </div>
								<div class ="col-sm-3">
									<img src="${pageContext.request.contextPath}/images/hotelshilla012_B.jpg" alt="비즈니스_서울사진" class = "roomInfoImg"/>
									<h4 class = "kleinDesc">호텔서울</h4>
								</div>
								
								<div class ="col-sm-3">
									<img src="${pageContext.request.contextPath}/images/hotelshillaBusan014_B.jpg" alt="비즈니스_부산사진" class = "roomInfoImg"/>
									<h4 class = "kleinDesc">호텔부산</h4>
								</div>
								
								<div class ="col-sm-3">
									<img src="${pageContext.request.contextPath}/images/hotelshillaJeju017_B.jpg" alt="비즈니스_제주사진" class = "roomInfoImg"/>
									<h4 class = "kleinDesc">호텔제주</h4>
								</div>
							
								<div class = "col-sm-2">  </div>
								
							<!-- </div> --><!-- end kleinPhoto -->
							
							
					
				</div><!--  end roomInfo   -->
				
				
				
				
			
			
			</div>	<!-- end col-sm-9 -->
	
	
		</div>
	
	
	
	</div>
</div>