<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file ="inc/header.jsp" %>
<c:set var="hotel" value="${hotel}" />
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
<div class="popup_lo_dg_rePage">
	<div class="popup_location_dg">
		<div class="col-sm-1 btn-colored lo_btn" id="all_hotel">전체</div>
		<div class="col-sm-1 btn-colored lo_btn" id="seoul_hotel">서울</div>
		<div class="col-sm-1 btn-colored lo_btn" id="busan_hotel">부산</div>
		<div class="col-sm-1 btn-colored lo_btn" id="jeju_hotel">제주</div>
	</div>
	<div class="col-sm-5"><div class="lo_img_dg"><img src="${pageContext.request.contextPath}/images/allhotel.PNG" style="width:100%; height:100%;" /> </div> </div>
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
		<input type="button" class="btn-colored locationCheckBtn" value="확인" />
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
					var lo = $("<div class='hotel_lo' id='"+data.hno+"'>").html(data.hname);
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
			if($(".popup_lo_dg_rePage").css("display") == "none" ) { $(".popup_lo_dg_rePage").css({"display":"block"}); }
			else{$(".popup_lo_dg_rePage").css({"display":"none"}) ;}
			$("input[type=hidden][name=hno]").val( $(".hotel_lo").attr("id")  );
		});
	});
	
	$(function(){
		$(".hotel").on("click" , function(){
			if($(".popup_lo_dg_rePage").css("display") == "none"){$(".popup_lo_dg_rePage").css({"display":"block"});}
			else{ $(".popup_lo_dg_rePage").css({"display":"none"}); }		
		});
	});
</script>

<div class = "container">

	<div class="container row reserve_dg">
		<div class="hotelsearch col-sm-2">
			<dl>
				<dt>호텔</dt>
				<dd class="hotel" id="${hotel.cno}"><p>${hotel.hname}</p></dd>
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

		<div class="checkin col-sm-2">
			<dl>
				<dt class = "checkIn_mj">체크인</dt>
					<dd class="checkInChoice" id="${rcheckin}">${rcheckin}</dd>
					<dd class="in_mj">
					<!-- 달력자리 -->
					<div class = "startCalendar_mj"><!-- 달력 시작 -->
<%-- 			 		<div class ="text-center"> <div class="  year"  id = "${year}">${year}</div></div>	--%>			 		
 
			 		<div class="yearMonth">
			 			<div class="col-sm-2  preMonthIn text-left">이전</div> 
			 			<div class="col-sm-2" ></div>
			 			<div class="col-sm-3  checkInYear text-right"  id = "${year}">${year} - </div>
			 			<div class="col-sm-1  checkInMon text-left"  id = "${month}">${month}</div>
			 			<div class="col-sm-2"></div>
			 			<div class="col-sm-2 nextMonthIn text-right">다음</div>
			 			<%-- <div class="col-sm-6 next_mon"  id="${month}">다음달</div> --%>
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
				<dd class="checkOutChoice" id="${rcheckout}">${rcheckout}</dd>
				<dd class="out_mj">
					<!-- 달력자리 -->
					<div class = "endCalendar_mj"><!-- 달력 시작 -->
			 		<!-- <div class ="text-center"> </div> -->
			 		
			 		<div class ="yearMonth"> 
			 			<%-- <div class="col-sm-6  mon"  id = "${month}">${month}</div> --%>
			 			<div class="col-sm-2 preMonthOut text-left">이전</div> 
			 			<div class="col-sm-2" ></div>
			 			<div class="col-sm-3  checkOutYear text-right"  id = "${year}">${year} - </div>
			 			<div class="col-sm-1  checkOutMon text-left"  id = "${month}">${month}</div>
			 			<div class="col-sm-2"></div>
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
				<dt>성인</dt>
				<dd>
					<div class="minus col-sm-4"><span class="glyphicon glyphicon-minus adultnum_minus"></span></div>
					<div class="adultnum col-sm-4">${adultnum}</div>
					<div class="plus col-sm-4"><span class="glyphicon glyphicon-plus adultnum_plus"></span></div>
				</dd>
			</dl>
		</div>
		<div class="kid col-sm-2 row">
			<dl>
				<dt>어린이</dt>
				<dd>
					<div class="minus col-sm-4"><span class="glyphicon glyphicon-minus kidnum_minus"></span></div>
					<div class="kidnum col-sm-4">${kidnum}</div>
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


	<div class="container selectRoom">
		<!-- 탭 (클릭수, 낮은 가격순, 높은 가격순, 인기순)-->
		<div class="selectChoice">
			<select id = "selectChoice">
			<option value = "region" <c:if test="${sort eq 'region'}">selected</c:if>  >지역 별</option>
			<option value = "low" <c:if test="${sort eq 'low'}">selected</c:if> >낮은 가격 순</option>
			<option value = "high" <c:if test="${sort eq 'high'}">selected</c:if> >높은 가격 순</option>
		<!-- 	<option value = "hot">인기 순</option>
			<option value = "new">최신 순</option> -->
			</select>	
		
		</div>
		
		<script>
			$(function(){
				$("#selectChoice").on("change" , function(){
					location.href="${pageContext.request.contextPath}/do/sort?cno=${hotel.hno}&adult=${adultnum}&kid=${kidnum}&sort="
							+$('#selectChoice option:selected').val()+"&rcheckin=${rcheckin}&rcheckout=${rcheckout}";
							
				});
			});
		
		</script>
		
		
		
		<script>
			$(function(){
				$(".reservationBtn").on("click", function(){
					/* $(".down_detail").css({ "display" : "none"});
					$("#not_ajax").css({ "display" : "block"}); */
				 	var id = $(this).attr('name');
					var rprice = ${days} * $(this).attr('id'); 
					
					$(".roomType").html( $(this).parents(".all_dg").find(".rtype").attr("id") );
					
					$(".roomPri").html(rprice+"원");
					
									
					$(".body_mj").css('display','none');
					/* https://ungdoli0916.tistory.com/460 */
					if( $("div[id="+id+"]").css('display') == 'block' ){
						jQuery("div[id="+id+"]").css('display', 'none');
					}else {
						jQuery("div[id="+id+"]").css('display','block');
					}
					
					
					$(".rspa").html("SPA 0명");
					$(".rspap").html("0원");
					$(".rswim").html("SWIM 0명");
					$(".rswimp").html("0원");
					$(".rbreakfast").html("조식 0명");
					$(".rbreakfastp").html("0원");
					$(".rbar").html("BAR 0명");
					$(".rbarp").html("0원");
					$(".raddbed").html("엑스트라베드 X");
					$(".raddbedp").html("0원");
					
					 $(this).parents(".all_dg").find(".opno1").text("0");
					 $(this).parents(".all_dg").find(".opno2").text("0");
					 $(this).parents(".all_dg").find(".opno3").text("0");
					 $(this).parents(".all_dg").find(".opno4").text("0");
					 
					 $(this).parents(".all_dg").find("#single").prop("checked" , true);
					 
					 
					 $(this).parents(".all_dg").find(".opno5").prop("checked" ,false) ;
					 
					var opno1 = $(".opno1").attr("id");
					var opno2 = $(".opno2").attr("id");
					var opno3 = $(".opno3").attr("id");
					var opno4 = $(".opno4").attr("id");
					var num1 =  $(this).parents(".all_dg").find(".opno1").text();
					var num2 =  $(this).parents(".all_dg").find(".opno2").text();
					var num3 =  $(this).parents(".all_dg").find(".opno3").text();
					var num4 =  $(this).parents(".all_dg").find(".opno4").text();
					var opno5 = 0;
					if( $(this).parents(".all_dg").find(".opno5").is(":checked") == true) {
						  opno5 = 1;
					}else{
						opno5 = 0;
					}
					
					
					
					console.log(num1);
					console.log(rprice);
					$.ajax({
						url:"${pageContext.request.contextPath}/do/total_price" , type:"get", dataType:"json",
						data:{ "num1" : num1 , "num2" : num2 , "num3" : num3 , "num4" : num4 , "opno1" : opno1 , "opno2" : opno2 , "opno3" : opno3 , "opno4" : opno4 , "opno5" : opno5 },
						success:function(data){
							console.log(data);
						
							
							rprice = parseInt(rprice)+parseInt(data);
							
							$(".rprice").html(rprice+"원");
						},
						
						error:function(xhr, textStatus, errorThrown){
							$(".rprice").html(textStatus + "(HTTP- " + xhr.status + "/" + errorThrown)
						}
					});
					
					$("input[name=reserveType]").prop("checked",false);
					$("input[type=hidden][name=rnote]").val("-");
					$(".rspa").html("SPA "+num1+"명");
					$(".rspap").html(50000*num1+"원");
					$(".rswim").html("SWIM "+num2+"명");
					$(".rswimp").html(25000*num2+"원");
					$(".rbreakfast").html("조식 "+num3+"명");
					$(".rbreakfastp").html(35000*num3+"원");
					$(".rbar").html("BAR "+num4+"명");
					$(".rbarp").html(50000*num4+"원");
					
					if(opno5 == 1) {
						$(".raddbed").html("엑스트라베드 O");
						$(".raddbedp").html("30000원");
					}else{
						$(".raddbed").html("엑스트라베드 X");
						$(".raddbedp").html("0원");
					} 
					
					$("input[type=hidden][name=rspa]").val(0);
					$("input[type=hidden][name=rswim]").val(0);
					$("input[type=hidden][name=rbreakfast]").val(0);
					$("input[type=hidden][name=rbar]").val(0);
					$("input[type=hidden][name=raddbed]").val("N");
					$("input[type=hidden][name=rnote]").val("-");
					$("input[type=hidden][name=bedno]").val(3);
					var mno = $(this).attr("name").substring(6);
					console.log(mno);
					$("input[type=hidden][name=mno]").val(mno);
					
					
				});
			});
		</script>
		
		
		
		<div class="sort">
		<c:forEach var="room" items="${room}" varStatus="status" >
		<div class="all_dg">
		<div class = "photoRoom">
		<!-- 사진 방이름  방가격,  최대인원  가격  ,예약하기(클릭버튼)-->
		
			<div class="col-sm-3 ">  
				<!-- 사진 -->
				<p><img src="${pageContext.request.contextPath}/images/${room.riimage}" alt="자바"/> </p>
			</div>
			
			<div class="col-sm-3">  
				<!-- 방이름, 방가격, 최대인원 -->
				<div class="rtype" id="${room.rtname}(${room.cname})">
					<h4>방타입</h4>
					<p>${room.rtname}</p>
				</div>
				<div class="rtmax">
					<h4>최대 인원</h4>
					<p>${room.rtmax}</p>
				</div>
			</div>
			
			<div class="col-sm-3">  
				<!-- 가격 -->
				<div class="rtprice">
					<h4>가격</h4>
					<p>${room.rtprice}</p>
				</div>
				<div class="Location_dg">
					<h4>지역</h4>
					<p>${room.cname}</p>
				</div>
			</div>
			
			
			<div class="col-sm-3  ">  
			<!-- 클릭버튼 -->
				<input type = "button" id = "${room.rtprice}" name="reBody${room.mno}"  class = "btn reservationBtn" value = "예약하기"/>
		
			</div><!--  end  col-sm-3  -->
		
		</div><!-- end 방 소개해주는 곳 (검색후)-->
		<div class = "panel-body  body_mj"   id = "reBody${room.mno}" >
		
		
		<div class = "down_detail"  >
			<div class = "row   addOption_mj ">
			      	
				<div class = "col-sm-3">
			    	<label for = "bedType">침대</label>
			    </div>
			      	
				<div class = "col-sm-3">
				    <input type = "radio" id = "single" name = "bed${room.mno}" value = "싱글" checked="checked" class="total_p" />
			        <label for = "single">싱글</label><br/>
				</div>
				      
				<div class = "col-sm-3">
				  	<input type = "radio" id = "double" name = "bed${room.mno}" value = "더블" class="total_p"/>
					<label for = "double">더블</label><br/>
				</div>
					  
				<div class = "col-sm-3">  
				  	<input type = "radio" id = "twin" name = "bed${room.mno}" value = "트윈" class="total_p"/>
				  	<label for = "twin">트윈</label><br/>
				</div>
				  	
			 </div><!-- end row bed -->
			 
			 
			 <!-- SPA -->
			 <!-- SPA -->
			 
			 
			 <div class = "row    addOption_mj ">
			 	
			 	<div class = "col-sm-6">
			 		<label for = "spaNum">SPA</label>
			 	</div>
			 
			 	<div class = "col-sm-6">
			 		<!-- -  0  +  : 인원수 -->
			 		<div class = "col-sm-4">
			 			<span class="glyphicon glyphicon-minus spa_minus total_p"></span>
			 		</div>
			 		
			 		<div class = "col-sm-4 spa_num opno1" id="1">0</div>
			 		
			 		<div class = "col-sm-4">
			 			<span class="glyphicon glyphicon-plus spa_plus total_p"></span>
			 		</div>
			 		<!-- <a href = "#none" class = "minus" name = "optionBtn">감소</a> -->
			 		<!-- <a href = "#none" class = "plus" name = "optionBtn">증가</a> -->
	 		 	</div>
			 	
			 </div><!-- end row addOption_mj -->
			 
			 
			 
			 <!-- Swimming Pool -->
			 <!-- Swimming Pool -->
			 
			 
			 <div class = "row   addOption_mj ">
			 	<div class = "col-sm-6">
			 		<label for = "swimNum">Swimming Pool</label>
			 	</div>
			 
			 	<div class = "col-sm-6">
			 		<!-- -  0  +  : 인원수 -->
			 		<div class = "col-sm-4">
			 			<span class="glyphicon glyphicon-minus swim_minus total_p"></span>
			 		</div>
			 		
			 		<div class = "col-sm-4 swim_num opno2" id="2">0</div>
			 		
			 		<div class = "col-sm-4">
			 			<span class="glyphicon glyphicon-plus swim_plus total_p"></span>
			 		</div>
			 		
	 		 	</div><!-- end col-sm-6 -->
	 		 	
			 </div><!-- end row addOption_mj -->
			 
			 
			 <!-- breakfast -->
			 <!-- breakfast -->
			 
			 
			 <div class = "row    addOption_mj ">
			 	<div class = "col-sm-6">
			 		<label for = "breakfastNum">조식</label>
			 	</div>
			 
			 	<div class = "col-sm-6">
			 		<!-- -  0  +  : 인원수 -->
			 		<div class = "col-sm-4">
			 			<span class="glyphicon glyphicon-minus breakfast_minus total_p"></span>
			 		</div>
			 		
			 		<div class = "col-sm-4 breakfast_num opno3" id="3">0</div>
			 		
			 		<div class = "col-sm-4">
			 			<span class="glyphicon glyphicon-plus breakfast_plus total_p"></span>
			 		</div>
			 		
	 		 	</div><!-- end col-sm-6 -->
			 	
			 </div><!-- end row addOption_mj -->
			 
			 
			 
			 <!-- BAR -->
			 <!-- BAR -->
			 
			  
			 <div class = "row    addOption_mj ">
			 	<div class = "col-sm-6">
			 		<label for = "bar">BAR</label>
			 	</div>
			 
			 	<div class = "col-sm-6">
			 		<!-- -  0  +  : 인원수 -->
			 		<div class = "col-sm-4">
			 			<span class="glyphicon glyphicon-minus bar_minus total_p"></span>
			 		</div>
			 		
			 		<div class = "col-sm-4 bar_num total opno4" id="4">0</div>
			 		
			 		<div class = "col-sm-4">
			 			<span class="glyphicon glyphicon-plus bar_plus total_p"></span>
			 		</div>
			 		
	 		 	</div><!-- end col-sm-6 -->
			 	
			 </div><!-- end row addOption_mj -->
			 
			
			 <!-- extraBed -->
			 <!-- extraBed -->
			 
			  
			 <div class = "row    addOption_mj ">
			 	<div class = "col-sm-6">
			 		<label for = "extraBed">엑스트라베드 / 30,000</label>
			 	</div>
			 
			 	<div class = "col-sm-6">
			 		<div class = "col-sm-3">
						<input type = "checkbox" id = "5" name = "extraBed" value = "extraBed" class="opno5 total_p"/>
						
					</div>
			 	
	 		 	</div><!-- end col-sm-6 -->
			 	
			 </div><!-- end row addOption_mj -->
		  
		 
			<div class = "panel-body" id = "etcOption">
				
				<div class = "row  etcOption_mj">
					<div class = "col-sm-3">
						<label for = "etcAdd">기타 추가사항</label>
					</div>
					
					<div class = "col-sm-3">
						<input type = "checkbox" id = "view" name = "reserveType" value = "view" class="total_p"/>
						<label for = "view">뷰</label>
					</div>
					
					<div class = "col-sm-3">
						<input type = "checkbox" id = "hocance" name = "reserveType" value = "hocance" class="total_p"/>
		  				<label for = "hocance">호캉스</label>
		  			</div>
		  			<div class = "col-sm-3">	
		  				<input type = "checkbox" id = "business" name = "reserveType" value = "business" class="total_p"/>
		  				<label for = "business">비즈니스</label>
					</div>
					
				</div>
				
				<div class = "textOption">
					<p> * 무조건 반영하는 사항은 아닙니다.</p>
				</div>
				
				
			</div>
		 
		</div><!-- end down_detail      id = "not_ajax" -->
	 </div> <!-- end panel-body -->
	 </div>
		</c:forEach>
		</div>
	</div>
	
	

		    
	
</div><!-- end container  -->
<div class="emptyLo">

</div>

<!-- 		요금 상세보기 (화살표)		 -->
<!-- 		요금 상세보기 (화살표)		 -->
<!-- 		요금 상세보기 (화살표)		 -->

<div class = "totalCharge" id = "totalCharge">
	<div class="reserve_scroll">
		<div class="down_btn"><img src = "${pageContext.request.contextPath}/images/down.png" alt = "underArrow" id = "down"/></div>
		
		<div class="detail_fee">
			<div class="col-sm-1"></div>
			<div class="text-left col-sm-10">요금상세(${days}박)</div>
			<!-- <div class="col-sm-7 text-right">예약초기화</div> -->
			<div class="col-sm-1"></div>
		</div><!-- end detail_fee -->
		
		<div class = "roomNum">
			<div class = "col-sm-1"></div>
			<div class="col-sm-3 text-left person">객실(성인 ${adultnum} / 어린이 ${kidnum} )</div>
			<div class="col-sm-7 text-right roomPri">0원</div>
			<div class="col-sm-1"></div>
		</div><!-- end roomNum -->
		
		<div class = "roomPrice">
			<div class ="col-sm-1"></div>
			<div class="col-sm-4 text-leftPrice">객실요금	1</div>
			<div class="col-sm-3 text-middle">옵션사항</div>
			<div class="col-sm-3 text-rightPrice text-right">부가가치세 및 봉사료</div>
			<div class="col-sm-1"></div>
		</div> <!-- end roomPrice -->
		
		<div class = "rspaPrice">
			<div class ="col-sm-1"></div>
			<div class="col-sm-4 text-leftPrice_dg roomType">			</div>
			<div class="col-sm-3 text-middle_dg rspa"> 	SPA 0명 		</div>
			<div class="col-sm-3 text-rightPrice_dg text-right rspap">  0원	</div>
			<div class="col-sm-1"></div>
		</div> <!-- end rspaPrice -->
		
		<div class = "rswimPrice">
			<div class ="col-sm-1"></div>
			<div class="col-sm-4 text-leftPrice_dg"> 			</div>
			<div class="col-sm-3 text-middle_dg rswim"> 	Swim 0명	</div>
			<div class="col-sm-3 text-rightPrice_dg text-right rswimp">  0원	</div>
			<div class="col-sm-1"></div>
		</div> <!-- end rswimPrice -->
		
		<div class = "rbreakfatstPrice">
			<div class ="col-sm-1"></div>
			<div class="col-sm-4 text-leftPrice_dg"> 			</div>
			<div class="col-sm-3 text-middle_dg rbreakfast"> 	조식	0명		</div>
			<div class="col-sm-3 text-rightPrice_dg text-right rbreakfastp">  0원	</div>
			<div class="col-sm-1"></div>
		</div> <!-- end rbreakfatstPrice -->
		
		<div class = "rbarPrice">
			<div class ="col-sm-1"></div>
			<div class="col-sm-4 text-leftPrice_dg"> 			</div>
			<div class="col-sm-3 text-middle_dg rbar"> 	BAR	0명		</div>
			<div class="col-sm-3 text-rightPrice_dg text-right rbarp">  0원	</div>
			<div class="col-sm-1"></div>
		</div> <!-- end rbarPrice -->
		
		<div class = "raddbedPrice">
			<div class ="col-sm-1"></div>
			<div class="col-sm-4 text-leftPrice_dg"> 			</div>
			<div class="col-sm-3 text-middle_dg raddbed"> 	엑스트라베드 O	</div>
			<div class="col-sm-3 text-rightPrice_dg text-right raddbedp">  0원	</div>
			<div class="col-sm-1"></div>
		</div> <!-- end raddbedPrice -->
		
		
		<div  class = "vatText">
		<div  class = "col-sm-1"></div>
		<div class = "col-sm-10">
			<p> * 부가가치세 10% 및 봉사료 10%(합계 21%)가 포함된 금액입니다.</p> 
		</div>
		<div class = ""></div>
		</div><!-- end vatText -->
	
		
	</div><!-- end reserve_scroll -->
	
	<div class = "container">
		<div class="up_btn"><img src = "${pageContext.request.contextPath}/images/up.png" alt = "underArrow" id = "up"/>
			<%-- <div class="reserve_scroll container">
				<div class="down_btn"><img src = "<%=request.getContextPath()%>/images/down.png" alt = "underArrow" id = "down"/></div>
				<div class="detail_fee"><div class="col-sm-1"></div><div class="text-left col-sm-3">요금상세(2박)</div><div class="col-sm-7 text-right">예약초기화</div><div class="col-sm-1"></div></div>
			</div> --%>
		</div>
	
		<div class = "inner container">
		
			<div class="col-sm-6 text-left">
				<input type="button" class="btn btn-default toMain" value="이전" />
			</div>
			
			<div class="col-sm-6">
				<div class = "totalBox col-sm-4 text-left">
					<img src = "${pageContext.request.contextPath}/images/totalprice.png" alt = "세금 및 봉사료" />
				</div>
				<div class = "col-sm-4 text-center rprice">0원</div>
				<div class = "col-sm-4 text-right">
					<input type="button" class="btn btn-warning checkPopup" value="예약" />
				</div>
			</div>
		</div><!-- end inner -->	
	</div> <!-- end container -->	
</div> <!-- end totalCharge 총 금액부분 -->

<script>
	$(function(){
		$(".toMain").on("click", function(){
			location.href = "${pageContext.request.contextPath}/do/main"; 
		});
	});
</script>

<script>
	$(function(){
		$(".checkPopup").on("click" , function(){
			
			
			if(  ${sessionScope.dto.uid eq null } == true){
				alert("로그인 후 이용할 수 있습니다."); location.href="${pageContext.request.contextPath}/do/login_page";
			}
			else{
				if( $(".rprice").text() == "0원" ){
					alert("예약할 방을 선택해주세요."); return false;
				}else{
					$(".checkPopupLo").css({ "display" : "block"});
				}				
			}	
			
			$("input[type=hidden][name=rtotalprice]").val( parseInt($(".rprice").text()) );
		});	
		
		$(".cancel_reserve").on("click" , function(){
			$(".checkPopupLo").css({ "display" : "none"});
		});
	});
</script>
<div class="checkPopupLo">
	<div class="popup_check">
		<div class="check_text">예약 하시겠습니까?</div>
		<form action="<%=request.getContextPath()%>/do/after" method="get" class="form_class">
						<input type="button" class="btn btn-colorless cancel_reserve" value="취소" />
						<input type="submit" class="btn btn-colored" value="확인" />
						<input type="hidden" name="rspa" value="0" />
						<input type="hidden" name="rswim" value="0" />
						<input type="hidden" name="rbreakfast" value="0" />
						<input type="hidden" name="bedno" value="3" />
						<input type="hidden" name="rbar" value="0" />
						<input type="hidden" name="raddbed" value="N" />
						<input type="hidden" name="radult" value="${adultnum}" />
						<input type="hidden" name="rkid" value="${kidnum}" />
						<input type="hidden" name="rnote" value="-" />
						<input type="hidden" name="rcheckin" value="${rcheckin}" />
						<input type="hidden" name="rcheckout" value="${rcheckout}" />
						<input type="hidden" name="mno" value="0" />
						<input type="hidden" name="hno" value="${hotel.hno}" />
						<input type="hidden" name="rtotalprice" value="0" />
		</form>
	</div>
</div>

<script>
	/* 총금액 확인하기 */
	
	$(function(){
		$(".kidnum_plus").on("click",function(){	
			var kidnum = parseInt($(".kidnum").text());
			var adultnum = parseInt($(".adultnum").text());
			if((kidnum+adultnum) >= 4){
				alert("최대 인원은 4명입니다."); return false;
			}
			kid_plus();
			
			
		
			/* $(".person").html("객실(성인 "+$(".adultnum").text()+" / 어린이 "+$(".kidnum").text()+" )"); */
		});
		$(".kidnum_minus").on("click",function(){	
			kid_minus();
	
			/* $(".person").html("객실(성인 "+$(".adultnum").text()+" / 어린이 "+$(".kidnum").text()+" )"); */
		});
		$(".adultnum_plus").on("click",function(){	
			var kidnum = parseInt($(".kidnum").text());
			var adultnum = parseInt($(".adultnum").text());
			if((kidnum+adultnum) >= 4){
				alert("최대 인원은 4명입니다."); return false;
			}
			adult_plus();
		
			/* $(".person").html("객실(성인 "+$(".adultnum").text()+" / 어린이 "+$(".kidnum").text()+" )"); */
		});
		$(".adultnum_minus").on("click",function(){	
			var kidnum = parseInt($(".kidnum").text());
			var adultnum = parseInt($(".adultnum").text());
			if((kidnum+adultnum) <= 1){
				alert("어른은 최소 1명 존재해야합니다."); return false;
			}
			adult_minus();
		
			/* $(".person").html("객실(성인 "+$(".adultnum").text()+" / 어린이 "+$(".kidnum").text()+" )"); */
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
	
	$(function(){
		$("#up").on("click",function(){
			$("#up").css({ "display" : "none"});
			$(".reserve_scroll").css({"display" : "block"});
			$(".emptyLo").css({ "display" : "block" });
		});
		$("#down").on("click",function(){
			$("#up").css({ "display" : "block"});
			$(".reserve_scroll").css({"display" : "none"});
			$(".emptyLo").css({ "display" : "none" });
		});
		
		
		//spa_num
		$(".spa_plus").on("click",function(){	
			var adultnum = parseInt($(".adultnum").text());
			var kidnum = parseInt($(".kidnum").text());
			var num = parseInt(  $(this).parent().prev(".spa_num").text()    );
			if(num < (kidnum+adultnum)){
				num = num + 1;
			}
			$(this).parent().prev(".spa_num").val(num);
			$(this).parent().prev(".spa_num").html(num);
		});
		$(".spa_minus").on("click",function(){	
			var adultnum = parseInt($(".adultnum").text());
			var kidnum = parseInt($(".kidnum").text());
			var num = parseInt(  $(this).parent().next(".spa_num").text()    );
			if(num > 0){
				num = num - 1;
			}
			$(this).parent().next(".spa_num").val(num);
			$(this).parent().next(".spa_num").html(num);
		});
		
		//swim_num
		$(".swim_plus").on("click",function(){	
			var adultnum = parseInt($(".adultnum").text());
			var kidnum = parseInt($(".kidnum").text());
			var num = parseInt(  $(this).parent().prev(".swim_num").text()    );
			if(num <(kidnum+adultnum)){
				num = num + 1;
			}
			$(this).parent().prev(".swim_num").val(num);
			$(this).parent().prev(".swim_num").html(num);
		});
		$(".swim_minus").on("click",function(){	
			var adultnum = parseInt($(".adultnum").text());
			var kidnum = parseInt($(".kidnum").text());
			var num = parseInt(  $(this).parent().next(".swim_num").text()    );
			if(num > 0){
				num = num - 1;
			}
			$(this).parent().next(".swim_num").val(num);
			$(this).parent().next(".swim_num").html(num);
		});
		
		//breakfast_num
		$(".breakfast_plus").on("click",function(){	
			var adultnum = parseInt($(".adultnum").text());
			var kidnum = parseInt($(".kidnum").text());
			var num = parseInt(  $(this).parent().prev(".breakfast_num").text()    );
			if(num < (kidnum+adultnum)){
				num = num + 1;
			}
			$(this).parent().prev(".breakfast_num").val(num);
			$(this).parent().prev(".breakfast_num").html(num);
		});
		$(".breakfast_minus").on("click",function(){	
			var adultnum = parseInt($(".adultnum").text());
			var kidnum = parseInt($(".kidnum").text());
			var num = parseInt(  $(this).parent().next(".breakfast_num").text()    );
			if(num > 0){
				num = num - 1;
			}
			$(this).parent().next(".breakfast_num").val(num);
			$(this).parent().next(".breakfast_num").html(num);
		});
		
		//bar_num
		$(".bar_plus").on("click",function(){	
			var adultnum = parseInt($(".adultnum").text());
			var kidnum = parseInt($(".kidnum").text());
			var num = parseInt(  $(this).parent().prev(".bar_num").text()    );
			if(num < (kidnum+adultnum)){
				num = num + 1;
			}
			$(this).parent().prev(".bar_num").val(num);
			$(this).parent().prev(".bar_num").html(num);
		});
		$(".bar_minus").on("click",function(){	
			var adultnum = parseInt($(".adultnum").text());
			var kidnum = parseInt($(".kidnum").text());
			var num = parseInt(  $(this).parent().next(".bar_num").text()    );
			if(num > 0){
				num = num - 1;
			}
			$(this).parent().next(".bar_num").val(num);
			$(this).parent().next(".bar_num").html(num);
		});
		
		$(document).on("click", ".total_p" ,function(){
			/* var opno = $(this).parents(".addOption_mj").find(".total").attr("id");
			var num = $(this).parents(".addOption_mj").find(".total").text(); */
			var mno = $(this).parents(".all_dg").find(".reservationBtn").attr("name").substring(6);
			var opno1 = $(".opno1").attr("id");
			var opno2 = $(".opno2").attr("id");
			var opno3 = $(".opno3").attr("id");
			var opno4 = $(".opno4").attr("id");
			var num1 =  $(this).parents(".all_dg").find(".opno1").text();
			var num2 =  $(this).parents(".all_dg").find(".opno2").text();
			var num3 =  $(this).parents(".all_dg").find(".opno3").text();
			var num4 =  $(this).parents(".all_dg").find(".opno4").text();
			var opno5 = 0;
			if(   $(this).parents(".all_dg").find(".opno5").is(":checked")  == true) {
				  opno5 = 1;
			}else{
				opno = 0;
			}
			
			
			var rprice =  ${days} * $(this).parents(".body_mj").prev(".photoRoom").find(".reservationBtn").attr("id");
			
			
			console.log(num1);
			console.log(rprice);
			$.ajax({
				url:"${pageContext.request.contextPath}/do/total_price" , type:"get", dataType:"json",
				data:{ "num1" : num1 , "num2" : num2 , "num3" : num3 , "num4" : num4 , "opno1" : opno1 , "opno2" : opno2 , "opno3" : opno3 , "opno4" : opno4 , "opno5" : opno5 },
				success:function(data){
					console.log(data);
					console.log(data[0]);
					
					rprice = parseInt(rprice)+parseInt(data[0]);
					
					$(".rprice").html(rprice+"원");
				},
				
				error:function(xhr, textStatus, errorThrown){
					$(".rprice").html(textStatus + "(HTTP- " + xhr.status + "/" + errorThrown)
				}
			});
					
			$(".rspa").html("SPA "+num1+"명");
			$(".rspap").html(50000*num1+"원");
			$(".rswim").html("SWIM "+num2+"명");
			$(".rswimp").html(25000*num2+"원");
			$(".rbreakfast").html("조식 "+num3+"명");
			$(".rbreakfastp").html(35000*num3+"원");
			$(".rbar").html("BAR "+num4+"명");
			$(".rbarp").html(50000*num4+"원");
			
			if(opno5 == 1) {
				$(".raddbed").html("엑스트라베드 O");
				$(".raddbedp").html("30000원");
				$("input[type=hidden][name=raddbed]").val("Y");
			}else{
				$(".raddbed").html("엑스트라베드 X");
				$(".raddbedp").html("0원");
				$("input[type=hidden][name=raddbed]").val("N");
			}
			
			$("input[type=hidden][name=rspa]").val(num1);
			$("input[type=hidden][name=rswim]").val(num2);
			$("input[type=hidden][name=rbreakfast]").val(num3);
			$("input[type=hidden][name=rbar]").val(num4);
			
			var bedno = "";
			if( $("input[name=bed"+mno+"]:checked").attr("id")  == "single" ){
				bedno = 3;
			}
			else if( $("input[name=bed"+mno+"]:checked").attr("id")  == "double" ) {
				bedno = 1;
			}
			else{
				bedno = 2;
			}
			$("input[type=hidden][name=bedno]").val(bedno);
			
			var arr = Array();
			
			$("input:checkbox[name=reserveType]:checked").each(function(){
					arr += $(this).val() + "/";
					
					$("input[type=hidden][name=rnote]").val(arr);
			});
		
			
		});
		
	});
</script>

