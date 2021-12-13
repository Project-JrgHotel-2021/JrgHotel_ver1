<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/header.jsp" %>
<script src = "<%=request.getContextPath()%>/js/cookie.js"></script>

	<script>
		//close 버튼 클릭하면 오늘 하루동안 이 창 열지 않음 알림창 띄우기
		 $(function(){
		 		if(  getCookie("subpop") != "done" ){  $("#notice").fadeIn();  }
		 		else{  $("#notice").hide(); }
				
		 		$("#close").on("click" , function(){ $("#notice").fadeOut(); });
		 		$("#subpop").on("click" , function(){ 
		 			setCookie("subpop", "done", 1);  // 쿠키 1일동안 안보이게 설정
		 			$("#notice").fadeOut();
		 		});
	         
     	 }); // end ready
		
	</script>
 
	 <div class ="container panel" id = "notice">
		 	<h3 class = "panel-heading     " >공지사항</h3>
		 	<p >본 사이트는 상업적 목적이 아닌 개인 포트폴리오 용도로 제작되었습니다.</p>
		 	<p >홈페이지의 일부내용과 기타 이미지등은 그 출처가 따로 있음을 밝힙니다.</p>
		 	<p><img src="<%=request.getContextPath()%>/images/QRcode_mj.jpg" alt="자바"/> 
		 	 	<img src="<%=request.getContextPath()%>/images/QRCode_JSPYoutube.jpg" alt="JSP"/>
		 	<p class = "javaYoutube">[ 자바 포트폴리오 동영상 ] </p>	 	<p class = "jspYoutube">[ JSP 포트폴리오 영상 ]</p>
	
		 	<p class = "ppp">
		 		<input type = "checkbox" id = "subpop" name = "subpop" title = "오늘 하루동안 이 창 열지 않음."/>
		 		<label for = "subpop">오늘 하루동안 이 창 열지 않음</label>
		 		<input type = "button" id = "close" class = "btn btn-primary" value = "닫기"/>
		 	</p>
	 </div>



	


	<script>
		$(function(){
			var now = new Date();
			var nowmonth = now.getMonth();
			var nowday = now.getDate();
			for(var i=1; i< nowday; i++){
				 $("a[id="+i+"]").css("pointer-events" , "none" );
				 $("a[id="+i+"]").css("color" , "gray" );
			}
		});
	</script>

 <div class="main_dg">
 	<c:set var="hotel" value="${hotel}" />

	 <div class="img_dg">
		  <div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <!-- Indicators -->
			  <ol class="carousel-indicators">
			    <c:set var="active" value="active"/>
			    <c:forEach var="dto" items="${list}" varStatus="status">
			 		<c:if test="${status.index != 0}"><c:set var="active" value=" "/></c:if>
			      <li data-target="#myCarousel" data-slide-to="${status.index}" class="${active}"></li>
				</c:forEach> 
			    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner">
			    <c:forEach var="dto" items="${list}" varStatus="status">
					<c:set var="active" value="item"/>
					<c:if test="${status.index==0}"><c:set var="active" value="item active"/></c:if>
					<div class="${active} item">
			        <img src="${pageContext.request.contextPath}/images/${dto.caimg}" alt="abc" style="width:100%; height:500px;" class="sudden_add" />
			      </div>
				</c:forEach>
		    
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right"></span>
		      <span class="sr-only">Next</span>
		    </a>
		  </div>
	</div>
	
	
	
	
 
 
 
	
	
<div class="fast_reserver">
	<div class="freservationservice">
      <p>빠른 예약서비스로 간편하게 예약 및 조회해보세요.</p>
   	</div>
   	
	<div class="container row reserve_dg">
		<div class="hotelsearch col-sm-2">
			<dl>
				<dt class="hotelsearch_dt">호텔</dt>
				<dd class="hotel"><p>호텔 선택</p></dd>
			</dl>
		</div>
		
		<script>			/* 달력 script */
				$(function(){
					
					$(".checkInChoice").on("click",function(){
						if($(".in_mj").css('display') == 'block'){
							jQuery(".in_mj").css('display', 'none');
						}else {
							jQuery(".in_mj").css('display','block');
						}
					});
					
					$(".checkOutChoice").on("click",function(){
						if($(".out_mj").css('display') == 'block'){
							jQuery(".out_mj").css('display', 'none');
						}else {
							jQuery(".out_mj").css('display','block');
						}
					});
					
				});
			
		</script>
		
		
		<div class="checkin col-sm-2">
			<dl>
				<dt class = "checkIn_mj">체크인</dt>
						<dd class="checkInChoice" id="null">날짜 선택</dd>
						<dd class="in_mj">
						<!-- 달력자리 -->
						<div class = "startCalendar_mj"><!-- 달력 시작 -->			 		
	 
				 		<div class="yearMonth">
				 			<div class="col-sm-2  preMonthIn text-left">이전</div> 
				 			<div class="col-sm-2" >	 </div>
				 			<div class="col-sm-3  checkInYear text-right"  id = "${year}">${year} - </div>
				 			<div class="col-sm-1  checkInMon text-left"  id = "${month}">${month}</div>
				 			<div class="col-sm-2">	 </div>
				 			<div class="col-sm-2 nextMonthIn text-right">다음</div>
				 		</div>
				 		
				 		<table class = "table table-bordered checkInTable">  
					 	<%-- <caption>${month}</caption> --%>
					 	
					  		<thead>
								<tr>
									<th scope="col">일</th><th scope="col">월</th>
									<th scope="col">화</th><th scope="col">수</th>
								    <th scope="col">목</th><th scope="col">금</th><th scope="col">토</th>
								</tr>
							</thead>
					  		
					  		<tbody>
					  			<c:forEach var = "dto" items = "${myCal}" varStatus = "status">
					  			<c:choose>
						  			<c:when test = "${(status.count)%7==1}">
						  				<tr><td><a href = "#" class = "checkInDay" id = "${dto}">${dto}</a></td>
									</c:when>	
									
						  			
						  			<c:when test = "${(status.count)%7==0}">
						  				<td><a href = "#" class = "checkInDay"  id = "${dto}">${dto}</a></td></tr>
									</c:when>
									<c:otherwise>
										<td><a href = "#" class = "checkInDay"  id = "${dto}">${dto}</a></td>
									</c:otherwise>
					  			</c:choose>
					  			</c:forEach>
					  		
					  		
					  		</tbody>
					  		</table>
					  		
					  		
					  		</div><!-- end 달력 -->
	
	
					</dd>
			</dl>
		</div>
		
		<div class="checkout col-sm-2">
			<dl>
				<dt class = "checkOut_mj">체크아웃</dt>
					<dd class="checkOutChoice" id="null">날짜 선택</dd>
					<dd class="out_mj">
						<!-- 달력자리 -->
						<div class = "endCalendar_mj"><!-- 달력 시작 -->
				 		<!-- <div class ="text-center"> </div> -->
				 		
				 		<div class ="yearMonth"> 
				 			<%-- <div class="col-sm-6  mon"  id = "${month}">${month}</div> --%>
				 			<div class="col-sm-2 preMonthOut text-left">이전</div> 
				 			<div class="col-sm-2" >	 </div>
				 			<div class="col-sm-3  checkOutYear text-right"  id = "${year}">${year} - </div>
				 			<div class="col-sm-1  checkOutMon text-left"  id = "${month}">${month}</div>
				 			<div class="col-sm-2">	 </div>
				 			<div class="col-sm-2 nextMonthOut text-right">다음</div>
				 		</div>
				 		
				 		<table class = "table table-bordered checkOutTable">  
					 	<%-- <caption>${month}</caption> --%>
					 	
					  		<thead>
								<tr>
									<th scope="col">일</th><th scope="col">월</th>
									<th scope="col">화</th><th scope="col">수</th>
								    <th scope="col">목</th><th scope="col">금</th><th scope="col">토</th>
								</tr>
							</thead>
					  		
					  		<tbody>
					  			<c:forEach var = "dto" items = "${myCal}" varStatus = "status">
						  			<c:choose>
							  			<c:when test = "${(status.count)%7==1}">
							  				<tr><td><a href = "#" class = "checkOutDay" id = "${dto}">${dto}</a></td>
										</c:when>	
										
							  			<c:when test = "${(status.count)%7==0}">
							  				<td><a href = "#" class = "checkOutDay"  id = "${dto}">${dto}</a></td></tr>
										</c:when>
										<c:otherwise>
											<td><a href = "#" class = "checkOutDay"  id = "${dto}">${dto}</a></td>
										</c:otherwise>
						  			</c:choose>
					  			</c:forEach>
					  			
					  		
					  		</tbody>
					  		</table>
					  		
					  		</div><!-- end 달력 -->
				
				
					</dd>
			</dl>
		</div>
		
		
		<script>
				$(function(){
					$(".nextMonthIn").on("click",function(){
						var now = new Date();
						var nowyear = now.getFullYear();
						var nowmonth = now.getMonth() +1;
						var nowday = now.getDate();
						var month = parseInt($(".checkInMon").attr("id"));
						var year = parseInt($(".checkInYear").attr("id"));
						var table = "";
						$.ajax({
							url:"${pageContext.request.contextPath}/do/nextMonth" , type:"get", dataType:"json",
							data:{ "month" : month ,"year" : year},
							success:function(data){
								
								console.log(data);
								console.log(data[0]);
								
								
								for(var i=0; i<data.length; i++ ){
									if(  (i+1)%7 == 1){
										table += "<tr><td><a href = '#' class = 'checkInDay' id = '"+data[i].day+"'>"+data[i].day+"</a></td>";
									}
									else if( (i+1)%7  ==0){
										table += "<td><a href = '#' class = 'checkInDay'  id = '"+data[i].day+"'>"+data[i].day+"</a></td></tr>";
									}
									else{
										table += "<td><a href = '#' class = 'checkInDay'  id = '"+data[i].day+"'>"+data[i].day+"</a></td>";
									}
								}
								
								$(".checkInTable tbody").html(table);
								
								if(month==12){
									$(".checkInYear").html(year+1 + " - ");
									$(".checkInMon").html(1);
									$(".checkInMon").attr("id",1);
									$(".checkInYear").attr("id",year+1);
								}
								else{
									$(".checkInYear").html(year + " - ");
									$(".checkInMon").html(month+1);
									$(".checkInMon").attr("id",month+1);
									$(".checkInYear").attr("id",year);
								}
								if(nowyear == parseInt($(".checkInYear").attr("id")) ){
									if(nowmonth ==parseInt($(".checkInMon").attr("id"))){
										for(var i=1; i<nowday; i++){
											$(".checkInDay[id="+i+"]").css("pointer-events" , "none");
											$(".checkInDay[id="+i+"]").css("color" , "gray" ); 
										}
									}else if(nowmonth > parseInt($(".checkInMon").attr("id"))){
										for(var i=1; i<=data[data.length-1].day; i++){
											$(".checkInDay[id="+i+"]").css("pointer-events" , "none");
											$(".checkInDay[id="+i+"]").css("color" , "gray" ); 
										}
									}
								}else if(   nowyear > parseInt($(".checkInYear").attr("id"))  ){
									for(var i=1; i<=data[data.length-1].day; i++){
										$(".checkInDay[id="+i+"]").css("pointer-events" , "none");
										$(".checkInDay[id="+i+"]").css("color" , "gray" ); 
									}
								}
							},
							
							error:function(xhr, textStatus, errorThrown){
								$(".checkInTable tbody").html(textStatus + "(HTTP- " + xhr.status + "/" + errorThrown)
							}
						});
					});
				});
			</script>
			
			<script>
				$(function(){
					$(".nextMonthOut").on("click",function(){
						var now = new Date();
						var nowyear = now.getFullYear();
						var nowmonth = now.getMonth() + 1;
						var nowday = now.getDate();
						var month = parseInt($(".checkOutMon").attr("id"));
						var year = parseInt($(".checkOutYear").attr("id"));
						var table = "";
						$.ajax({
							url:"${pageContext.request.contextPath}/do/nextMonth" , type:"get", dataType:"json",
							data:{ "month" : month ,"year" : year},
							success:function(data){
								
								console.log(data);
								console.log(data[0]);
								
								
								for(var i=0; i<data.length; i++ ){
									if(  (i+1)%7 == 1){
										table += "<tr><td><a href = '#' class = 'checkOutDay' id = '"+data[i].day+"'>"+data[i].day+"</a></td>";
									}
									else if( (i+1)%7  ==0){
										table += "<td><a href = '#' class = 'checkOutDay'  id = '"+data[i].day+"'>"+data[i].day+"</a></td></tr>";
									}
									else{
										table += "<td><a href = '#' class = 'checkOutDay'  id = '"+data[i].day+"'>"+data[i].day+"</a></td>";
									}
								}
								
								$(".checkOutTable tbody").html(table);
								
								if(month==12){
									$(".checkOutYear").html(year+1 + " - ");
									$(".checkOutMon").html(1);
									$(".checkOutMon").attr("id",1);
									$(".checkOutYear").attr("id",year+1);
								}
								else{
									$(".checkOutYear").html(year + " - ");
									$(".checkOutMon").html(month+1);
									$(".checkOutMon").attr("id",month+1);
									$(".checkOutYear").attr("id",year);
								}
								
								if(nowyear == parseInt($(".checkOutYear").attr("id")) ){
									if(nowmonth == parseInt($(".checkOutMon").attr("id")) ){
										for(var i=1; i<nowday; i++){
											 $(".checkOutDay[id="+i+"]").css("pointer-events" , "none");
											$(".checkOutDay[id="+i+"]").css("color" , "gray" ); 
										}
									}else if(nowmonth > parseInt($(".checkOutMon").attr("id"))){
										for(var i=1; i<=data[data.length-1].day; i++){
											 $(".checkOutDay[id="+i+"]").css("pointer-events" , "none");
											$(".checkOutDay[id="+i+"]").css("color" , "gray" ); 
										}
									}
								}else if( nowyear > parseInt($(".checkOutYear").attr("id"))){
									for(var i=1; i<=data[data.length-1].day; i++){
										 $(".checkOutDay[id="+i+"]").css("pointer-events" , "none");
										$(".checkOutDay[id="+i+"]").css("color" , "gray" ); 
									}
								}
							},
							
							error:function(xhr, textStatus, errorThrown){
								$(".checkOutTable tbody").html(textStatus + "(HTTP- " + xhr.status + "/" + errorThrown)
							}
						});
					});
				});
			</script>
			
			<script>
				$(function(){
					$(".preMonthOut").on("click",function(){
						var now = new Date();
						var nowyear = now.getFullYear();
						var nowmonth = now.getMonth() + 1;
						var nowday = now.getDate();
						var month = parseInt($(".checkOutMon").attr("id"));
						var year = parseInt($(".checkOutYear").attr("id"));
						var table = "";
						$.ajax({
							url:"${pageContext.request.contextPath}/do/preMonth" , type:"get", dataType:"json",
							data:{ "month" : month ,"year" : year},
							success:function(data){
								
								console.log(data);
								console.log(data[0]);
								
								
								for(var i=0; i<data.length; i++ ){
									if(  (i+1)%7 == 1){
										table += "<tr><td><a href = '#' class = 'checkOutDay' id = '"+data[i].day+"'>"+data[i].day+"</a></td>";
									}
									else if( (i+1)%7  ==0){
										table += "<td><a href = '#' class = 'checkOutDay'  id = '"+data[i].day+"'>"+data[i].day+"</a></td></tr>";
									}
									else{
										table += "<td><a href = '#' class = 'checkOutDay'  id = '"+data[i].day+"'>"+data[i].day+"</a></td>";
									}
								}
								
								$(".checkOutTable tbody").html(table);
								
								if(month==1){
									$(".checkOutYear").html(year-1 + " - ");
									$(".checkOutMon").html(12);
									$(".checkOutMon").attr("id",12);
									$(".checkOutYear").attr("id",year-1);
								}
								else{
									$(".checkOutYear").html(year + " - ");
									$(".checkOutMon").html(month-1);
									$(".checkOutMon").attr("id",month-1);
									$(".checkOutYear").attr("id",year);
								}
								if(nowyear == parseInt($(".checkOutYear").attr("id")) ){
									if(nowmonth == parseInt($(".checkOutMon").attr("id")) ){
										for(var i=1; i<nowday; i++){
											 $(".checkOutDay[id="+i+"]").css("pointer-events" , "none");
											$(".checkOutDay[id="+i+"]").css("color" , "gray" ); 
										}
									}else if(nowmonth > parseInt($(".checkOutMon").attr("id"))){
										for(var i=1; i<=data[data.length-1].day; i++){
											 $(".checkOutDay[id="+i+"]").css("pointer-events" , "none");
											$(".checkOutDay[id="+i+"]").css("color" , "gray" ); 
										}
									}
								}else if( nowyear > parseInt($(".checkOutYear").attr("id"))){
									for(var i=1; i<=data[data.length-1].day; i++){
										 $(".checkOutDay[id="+i+"]").css("pointer-events" , "none");
										$(".checkOutDay[id="+i+"]").css("color" , "gray" ); 
									}
								}
							},
							
							error:function(xhr, textStatus, errorThrown){
								$(".checkOutTable tbody").html(textStatus + "(HTTP- " + xhr.status + "/" + errorThrown)
							}
						});
					});
				});
			</script>
			
			<script>
				$(function(){
					$(".preMonthIn").on("click",function(){
						var now = new Date();
						var nowyear = now.getFullYear();
						var nowmonth = now.getMonth() + 1;
						var nowday = now.getDate();
						var month = parseInt($(".checkInMon").attr("id"));
						var year = parseInt($(".checkInYear").attr("id"));
						var table = "";
						$.ajax({
							url:"${pageContext.request.contextPath}/do/preMonth" , type:"get", dataType:"json",
							data:{ "month" : month ,"year" : year},
							success:function(data){
								
								console.log(data);
								console.log(data[0]);
								
								
								for(var i=0; i<data.length; i++ ){
									if(  (i+1)%7 == 1){
										table += "<tr><td><a href = '#' class = 'checkInDay' id = '"+data[i].day+"'>"+data[i].day+"</a></td>";
									}
									else if( (i+1)%7  ==0){
										table += "<td><a href = '#' class = 'checkInDay'  id = '"+data[i].day+"'>"+data[i].day+"</a></td></tr>";
									}
									else{
										table += "<td><a href = '#' class = 'checkInDay'  id = '"+data[i].day+"'>"+data[i].day+"</a></td>";
									}
								}
								
								$(".checkInTable tbody").html(table);
								
								if(month==1){
									$(".checkInYear").html(year-1 + " - ");
									$(".checkInMon").html(12);
									$(".checkInMon").attr("id",12);
									$(".checkInYear").attr("id",year-1);
								}
								else{
									$(".checkInYear").html(year + " - ");
									$(".checkInMon").html(month-1);
									$(".checkInMon").attr("id",month-1);
									$(".checkInYear").attr("id",year);
								}
								if(nowyear == parseInt($(".checkInYear").attr("id")) ){
									if(nowmonth == parseInt($(".checkInMon").attr("id")) ){
										for(var i=1; i<nowday; i++){
											 $(".checkInDay[id="+i+"]").css("pointer-events" , "none");
											$(".checkInDay[id="+i+"]").css("color" , "gray" ); 
										}
									}else if(nowmonth > parseInt($(".checkInMon").attr("id"))){
										for(var i=1; i<=data[data.length-1].day; i++){
											 $(".checkInDay[id="+i+"]").css("pointer-events" , "none");
											$(".checkInDay[id="+i+"]").css("color" , "gray" ); 
										}
									}
								}else if( nowyear > parseInt($(".checkInYear").attr("id"))){
									for(var i=1; i<=data[data.length-1].day; i++){
										 $(".checkInDay[id="+i+"]").css("pointer-events" , "none");
										$(".checkInDay[id="+i+"]").css("color" , "gray" ); 
									}
								}
							},
							
							error:function(xhr, textStatus, errorThrown){
								$(".checkInTable tbody").html(textStatus + "(HTTP- " + xhr.status + "/" + errorThrown)
							}
						});
					});
				});
			</script>
		
		<script>
				$(function(){
					$(document).on("click" , ".checkOutDay" , function(){	
						if( $(".checkInChoice").attr("id") == "null" ){
							alert("체크인 날짜를 먼저 선택해 주세요"); return false;
						}	
						var checkinday = $(".checkInChoice").attr("id");
						var day = checkinday.substr( checkinday.length-2 , checkinday.length-1  );
						console.log(day);
						
						if( $(".checkInYear").attr("id") > $(".checkOutYear").attr("id") ){
							alert("체크인 날짜보다 같거나 빠를 수 없습니다."); return false;
						}
						else if(  $(".checkInYear").attr("id") == $(".checkOutYear").attr("id") ){
							if( $(".checkInMon").attr("id") > $(".checkOutMon").attr("id") ){
								alert("체크인 날짜보다 같거나 빠를 수 없습니다."); return false;
							}else if( $(".checkInMon").attr("id") == $(".checkOutMon").attr("id") ){
								if( parseInt(day)  >= $(this).attr("id") ){
									alert("체크인 날짜보다 같거나 빠를 수 없습니다."); return false;
								} 
							}
						}
						
						
						var checkoutday = $(".checkOutYear").attr("id")+"-"+$(".checkOutMon").attr("id") + "-" + $(this).attr("id");
						$(".checkOutChoice").attr("id" , checkoutday );
						$(".checkOutChoice").html(checkoutday);
						$(".out_mj").css("display" , "none");
					});
					$(document).on("click" , ".checkInDay" , function(){
						var checkinday = $(".checkInYear").attr("id")+"-"+$(".checkInMon").attr("id") + "-" + $(this).attr("id");
						$(".checkInChoice").attr("id" , checkinday );
						$(".checkInChoice").html(checkinday);
						$(".in_mj").css("display" , "none");
						$(".checkOutChoice").attr("id" , "null");
						$(".checkOutChoice").html("날짜 선택");
						
						
					});
				});
			</script>
		<div class="adult col-sm-2 row">
			<dl>
				<dt class="hotelsearch_dt">성인</dt>
					<dd>
						<div class="minus col-sm-4"><span class="glyphicon glyphicon-minus adultnum_minus"></span></div>
						<div class="adultnum col-sm-4">1</div>
						<div class="plus col-sm-4"><span class="glyphicon glyphicon-plus adultnum_plus"></span></div>
				</dd>
			</dl>
		</div>
		
		
		<div class="kid col-sm-2 row">
			<dl>
				<dt class="hotelsearch_dt">어린이</dt>
				<dd>
					<div class="minus col-sm-4"><span class="glyphicon glyphicon-minus kidnum_minus"></span></div>
					<div class="kidnum col-sm-4">0</div>
					<div class="plus col-sm-4"><span class="glyphicon glyphicon-plus kidnum_plus"></span></div>
				</dd>
			</dl>
		</div>
		<div class="search col-sm-2 text-right">
			<input type="button" id="search" name="search" class="searchbtn" value="검색"/>
		</div>
		<script>
			$(function(){
				$(".searchbtn").on("click",function(){		
						console.log(  $(".hotel").text()  );
						if( ($(".hotel").text())==("호텔 선택") ){ alert("호텔을 선택해 주세요."); return false; }
						else if(  $(".checkInChoice").attr("id") == "null" ){ alert("체크인 날짜를 선택해 주세요."); return false; }
						else if(  $(".checkOutChoice").attr("id") == "null" ){ alert("체크아웃 날짜를 선택해 주세요."); return false; }
						else{ location.href="${pageContext.request.contextPath}/do/rePage?cno="
									+$('.hotel').attr('id')+"&adult="+$(".adultnum").text()+"&kid="
									+$(".kidnum").text()+"&rcheckin="+$(".checkInChoice").attr("id")+"&rcheckout="+$(".checkOutChoice").attr("id"); }		
				});
			});
		</script>
	</div>
</div>
<div class="container hotelguide">
	<h3>호텔안내</h3>
	<p></p>
	<h2>HOTEL GUIDE</h2>
</div>
<div class="container">
	<div class="col-sm-5 location_dg">
	 		<h3 class="panel-heading">호텔 위치</h3>
	 		<div class="col-sm-2"><div class="lo1">서울</div></div>
	 		<div class="col-sm-2"><div class="lo2">부산</div></div>
	 		<div class="col-sm-2"><div class="lo3">제주</div></div>
	 
	 
	
		<div id = "map" style = "width:100%;  height:350px;  margin-bottom:20px;">	 </div> 
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eba3ef19a6148088f32dc02a791b5fbe"></script>
			<script>
				$(function(){
					var location1 = 37.555810945578784;
					var location2 = 127.00516518875077;
					//제주점 33.24757363354068, 126.40803709799717
					//서울점 37.555810945578784, 127.00516518875077
					//???
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
					        center: new kakao.maps.LatLng(location1, location2), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };
						// 37.5065633,127.0385036   //33.450701, 126.570667
					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption); 
						
					var marker = new kakao.maps.Marker({ 
					    // 지도 중심좌표에 마커를 생성합니다 
					    position: map.getCenter() 
					});  
					// 지도에 마커를 표시합니다
					marker.setMap(map);
				
					// 지도에 클릭 이벤트를 등록합니다
					// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
					
				});
			</script>
	</div>
	<div class="col-sm-2">	 </div>
	
	<div class="col-sm-5 question_dg">
	   <h3 class="panel-heading">자주묻는 질문</h3> 
	   
	      <div class="panel-group" id="accordion">
	           
	           <div class="panel panel-default">
	              <c:forEach var="dto" items="${qnalist}" varStatus="status">
	                <div class="panel-heading">
	                  <h4 class="panel-title">
	                  <a data-toggle="collapse" data-parent="#accordion"    href="#collapse${dto.qno}" >${dto.qtitle}</a>
	                  </h4>
	                </div>
	                
	            
	                  <div id="collapse${dto.qno}" class="panel-collapse collapse <c:if test="${status.index==0}"> in </c:if> ">
	                <!-- panel-collapse collapse in -->
	                  <div class="qcontent_mj">${dto.qcontent}</div>
	                </div>
	               </c:forEach>
	            
	           </div>
	           <script>
	              jQuery(document).ready(function(){
	            	  console.log( $(".qcontent_mj").text() );
	                 if($(".qcontent_mj").text() == ""){
	                    $(this).parents(".qcontent_mj").css({"display":"none"});
	                 }
	              });
	           </script>
	           
	         </div> 
	</div>
	
	<script>
		$(function(){
			$(".lo1").on("click",function(){
				location1 = 37.555810945578784;
				location2 = 127.00516518875077;
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(location1, location2), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
				// 37.5065633,127.0385036   //33.450701, 126.570667
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption); 
				
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter() 
			});  
			// 지도에 마커를 표시합니다
			marker.setMap(map);
			});	
			$(".lo2").on("click",function(){			
				// 35.15984866812901, 129.1589003606937
				location1 = 35.15984866812901;
				location2 = 129.1589003606937;
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(location1, location2), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
				// 37.5065633,127.0385036   //33.450701, 126.570667
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption); 
				
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter() 
			});  
			// 지도에 마커를 표시합니다
			marker.setMap(map);
			});	
			
			$(".lo3").on("click",function(){
				location1 = 33.24757363354068;
				location2 = 126.40803709799717;
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(location1, location2), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
				// 37.5065633,127.0385036   //33.450701, 126.570667
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption); 
				
			var marker = new kakao.maps.Marker({ 
			    // 지도 중심좌표에 마커를 생성합니다 
			    position: map.getCenter() 
			});  
			// 지도에 마커를 표시합니다
			marker.setMap(map);
			});	
			
			$(".kidnum_plus").on("click",function(){	
				var kidnum = parseInt($(".kidnum").text());
				var adultnum = parseInt($(".adultnum").text());
				if((kidnum+adultnum) >= 4){
					alert("최대 인원은 4명입니다."); return false;
				}
				kid_plus();
				
			});
			$(".kidnum_minus").on("click",function(){	
				kid_minus();
			});
			$(".adultnum_plus").on("click",function(){	
				var kidnum = parseInt($(".kidnum").text());
				var adultnum = parseInt($(".adultnum").text());
				if((kidnum+adultnum) >= 4){
					alert("최대 인원은 4명입니다."); return false;
				}
				adult_plus();
			});
			$(".adultnum_minus").on("click",function(){	
				var kidnum = parseInt($(".kidnum").text());
				var adultnum = parseInt($(".adultnum").text());
				if((kidnum+adultnum) <= 1){
					alert("어른은 최소 1명 존재해야합니다."); return false;
				}
				adult_minus();
				
			});
		});
		function kid_plus() { 
			var kidnum = parseInt($(".kidnum").text());
			if(kidnum < 3){
				kidnum = kidnum + 1;
			}
			$(".kidnum").val(kidnum);
			$(".kidnum").html(kidnum);
		}
		function kid_minus() { 
			var kidnum = parseInt($(".kidnum").text());
			if(kidnum > 0){
				kidnum = kidnum - 1;
			}
			$(".kidnum").val(kidnum);
			$(".kidnum").html(kidnum);		
		}
		function adult_plus() { 
			var adultnum = parseInt($(".adultnum").text());
			if(adultnum < 4){
				adultnum = adultnum + 1;
			}
			$(".adultnum").val(adultnum);
			$(".adultnum").html(adultnum);
		}
		function adult_minus() { 
			var adultnum = parseInt($(".adultnum").text());
			if(adultnum > 1){
				adultnum = adultnum - 1;
			}
			$(".adultnum").val(adultnum);
			$(".adultnum").html(adultnum);		
		}
	</script>
</div>	<!-- end container -->


<!-- 포트폴리오 -->
<!-- 포트폴리오 -->
<!-- 포트폴리오 -->
<div class="container hotelguide">
	<h3>포트폴리오</h3>
	<p></p>
	<h2>JSP PORTFOLIO</h2>
</div>
<div class="container portfolio_back">
	<div class="col-sm-4 text-center"><iframe width="300" height="200" src="https://www.youtube.com/embed/W8b5wGtwSZk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
	<div class="col-sm-4 text-center"><iframe width="300" height="200" src="https://www.youtube.com/embed/9pqc-ETB7kg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
	<div class="col-sm-4 text-center"><iframe width="300" height="200" src="https://www.youtube.com/embed/01JW-qt0b1g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
</div> 
<!-- <div class="container pofol">
   <h3 class="panel-heading">[고민지 포트폴리오]</h3>
   <div class=" pofoldetail">
      
      <div class="row pofolaudio">
         
         <div class="col-sm-4">
         <h2><span class="glyphicon glyphicon-menu-left"></span>GUI활용한 학사관리프로그램<span class="glyphicon glyphicon-menu-right"></span></h2>
            <div class="pofolAudio">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/pnNACj5OldA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
         </div>
         <div class="col-sm-8">
            <div class="pofolreport">
            <p>
              <br/>
              <h4>프로젝트명 : 도자기 상점 관리자 페이지</h4>
            
            제작기간 : 2021-04-12 ~ 2021-06-30<br/>
            참여도    : 100%<br/>
            
            기획의도 : 도예과를 전공한 저에게 도자 제품을 만드는 것은 가장 익숙한 일입니다. 하지만 제작한 상품을 판매한다고 생각하였을때 어떻게 하면 효율적으로 관리 할 수 있을까라는 생각을 하다가 도자기 상점 관리자 페이지를 제작하였습니다.
            <br/>
            <br/>
            [개발환경]  <br/>
            운영체제 : window 10<br/>
            소스코드 : eclipse<br/>
            개발언어 : java(jdk1.8)
              </p> 
            </div>
         </div>
               
            
      </div> -->
      <!-- 자바 포트폴리오 -->
      <!-- 자바 포트폴리오 -->
      <!-- 자바 포트폴리오 -->
      
     <!--  <div class="row pofolaudio">
         
         <div class="col-sm-4">
         <h2><span class="glyphicon glyphicon-menu-left"></span>전시안내 및 전시예약 웹 포트폴리오<span class="glyphicon glyphicon-menu-right"></span></h2>
            <iframe width="560" height="315" src="https://www.youtube.com/embed/W8b5wGtwSZk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
         </div>
         
         
         <div class="col-sm-8">
            <div class="pofolreport">
            <p>
              <br/>
              <h4>프로젝트명 : 전시 안내 및 전시 예약 JSP 웹 프로젝트</h4>
            
            제작기간 : 2021-08-01 ~ 2021-08-22<br/>
            참여도    : 100%<br/>
            
            기획의도 : 사용자 요청처리와 다양한 전시를 한번에 볼 수 있고 여러 검색 방법으로 편리하게 검색할 수 있는 사이트를 제작하였습니다.<br/>
            <br/>
            [개발환경]  <br/>
            운영체제 : window 10<br/>
            소스작성도구 : eclipse<br/>
            웹 서버 : TOMCAT8.0<br/>
            데이터베이스 : ORACLE, MYSQL<br/>
            프론트엔드 : HTML5, CSS3, JS, JQUERY, AJAX, BOOTSTRAP3<br/>
            백엔드 : JAVA(jdk1.8), JSP2.3 / SERVLET 3.1
              </p> 
            </div>
         </div>
               
            
      </div> -->
      
      <!-- 웹 개인 포트폴리오 -->
      <!-- 웹 개인 포트폴리오 -->
      <!-- 웹 개인 포트폴리오 -->
      
      <!-- <div class="row pofolaudio">
         
         <div class="col-sm-4 text-center">
         <h2><span class="glyphicon glyphicon-menu-left"></span>웹 팀포트폴리오 제목<span class="glyphicon glyphicon-menu-right"></span></h2>
            <iframe width="300" height="200" src="https://www.youtube.com/embed/TO49sYpi2y8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
         </div>
         <div class="col-sm-6 text-center">
            <div class="pofolreport">
             웹 팀포트폴리오 제목
            </div>
         </div>
               
            
      </div> -->
      <!-- 웹 팀포트폴리오 -->
      <!-- 웹 팀포트폴리오 -->
      <!-- 웹 팀포트폴리오 -->
   </div>
</div>
<!-- 포트폴리오 -->
<!-- 포트폴리오 -->


<div class="popup_lo_dg">
	<div class="popup_location_dg">
		<div class="col-sm-1 btn btn-colored lo_btn" id="all_hotel">전체</div>
		<div class="col-sm-1 btn btn-colored lo_btn" id="seoul_hotel">서울</div>
		<div class="col-sm-1 btn btn-colored lo_btn" id="busan_hotel">부산</div>
		<div class="col-sm-1 btn btn-colored lo_btn" id="jeju_hotel">제주</div>
	</div>
	<div class="col-sm-5"><div class="lo_img_dg"><img src="${pageContext.request.contextPath}/images/allhotel.PNG" style="width:100%; height:100%; " /> </div> </div>
	<div class="col-sm-7 hotelDesc">
		<div class="hotel_lo" id="${hotel.hno}">
			${hotel.hname}
		</div>
		<div class="hotel_desc">
			${hotel.hdesc}
		</div>
		<div class="hotel_addr">
			${hotel.haddress}
		</div>
	</div>
	<div class="locationCheck">
		<input type="button" class="btn btn-colored locationCheckBtn" value="확인" />
	</div>
</div>
</div>
<script>
	$(function(){
		$(document).on("click" , ".lo_btn" , function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/do/hotel_lo" , type:"get", dataType:"json",
				data:{ "id" : $(this).attr("id") },
				success:function(data){
					$(".hotelDesc").html("");
					console.log(data);
					console.log(data.hname);
					var hdesc = $("<div class='col-sm-7 hotelDesc'>");
					var lo = $("<div class='hotel_lo'>").html(data.hname);
					var desc = $("<div class='hotel_desc'>").html(data.hdesc);
					var addr = $("<div class='hotel_addr'>").html(data.haddress);
					var img = $("<img src='${pageContext.request.contextPath}/images/"+data.cimg+"' style='width:100%; height:100%; ' />");
					
					$(".lo_img_dg").html(img);
					
					$(".hotelDesc").append(lo).append(desc).append(addr);
					
					$(".hotel_lo").attr('id',data.cno);
				},
				
				error:function(xhr, textStatus, errorThrown){
					$(".hotel_desc").html(textStatus + "(HTTP- " + xhr.status + "/" + errorThrown)
				}
			});
		});
			
		$(document).on("click" , ".locationCheckBtn" , function(){
			var lo = $("<p>").html( $(".hotel_lo").text() );
			$(".hotel").html(lo);
			$(".hotel").attr('id',$(".hotel_lo").attr("id"));
			if($(".popup_lo_dg").css("display") == "none" ) { $(".popup_lo_dg").css({"display":"block"}); }
			else{$(".popup_lo_dg").css({"display":"none"}) ;}
		});
	});
		
</script>
<script>
	$(function(){
		$(".hotel").on("click" , function(){
			if($(".popup_lo_dg").css("display") == "none" ){$(".popup_lo_dg").css({"display":"block"});}
			else{$(".popup_lo_dg").css({"display":"none"});}			
		});
	});
</script>
<%-- <%@include file ="inc/footer.jsp" %> --%>
</body>
</html>