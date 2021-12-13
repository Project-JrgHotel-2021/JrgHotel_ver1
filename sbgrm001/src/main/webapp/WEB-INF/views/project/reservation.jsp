<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/header.jsp" %>
<%@ include file="mypage_menu.jsp" %>


	<div class="container">
		<div class="mypage">
			<h2>예약확인</h2>
			<p class="mypage_undervar"></p>
		</div>
		
		<div class="reservation">
		<!-- 체크인 기간이 지나면 예약확인내역만 보이게끔 만들기 (예약취소버튼안보임) -->
			<table class="table table-bordered">
				<caption>예약내역</caption>
				<thead>
					<tr>
						<th scope="col">예약번호</th>
						<th scope="col">예약자</th>
						<th scope="col">예약날짜</th>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr>
					<td>${dto.rno}</td>
					<td>${uname}</td>
					<td>
						<div class="col-sm-7">
							<span>${dto.realdate}</span>
						
						</div>	
						
						<c:set var="checkin" value="${dto.rcheckin}"/>
						<c:set var="today" value="${today_check}"/>
						
								<!-- 				 -->
								<!-- 				 -->
								<!-- 				 -->
								
								<!-- Trigger the modal with a button -->
								
								<c:choose>
									<c:when test="${today < checkin}">
										<input type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal${dto.rno}" value="예약취소"/>
									</c:when>
									
									<c:otherwise>
									</c:otherwise>
								</c:choose>
								
								
								
								<!-- Modal -->
								<div id="myModal${dto.rno}" class="modal fade" role="dialog">
								  <div class="modal-dialog">
								
								    <!-- Modal content-->
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal">&times;</button>
								        <h4 class="modal-title">예약취소</h4>
								      </div>
								        <form action="${pageContext.request.contextPath}/do/reservation_delete" method="post">
								        	<fieldset>
										      <div class="modal-body">
								        		<div class="text-left">
								        			<label for="uname">서명(예약자<span class="byul">*</span>)</label>
								        		</div>
								        		<div class="form-group">	
								        			<input type="text" id="uname" name="uname" class="form-control"/>
													<input type="hidden" id="uid" name="uid" value="${sessionScope.dto.uid}"/>
													<input type="hidden" id="rno" name="rno" value="${dto.rno}"/>
								        		</div>
					
								        	
								       
									      	</div>
										    <div class="modal-footer">
										    
										       <input type="submit" value="예약취소" class="btn btn-colored"/>
										  
										       <input type="button" data-dismiss="modal" class="btn btn-colored" value="뒤로가기"/>
										    </div>
										    
								
									      </fieldset>
								       </form>
								    </div>
								
								  </div>
								</div>
								<!-- 				 -->
								<!-- 				 -->
								<!-- 				 -->
								<!-- 				 -->
								<a href="${pageContext.request.contextPath}/do/reservation_check?rno=${dto.rno}" title="예약확인하기" class="btn btn-colored reservation_check_btn">예약확인</a>
							
							<%-- <a href="${pageContext.request.contextPath}/do/reservation_delete" title="예약취소" class="btn btn-colorless text-right">예약취소</a> --%>
						</td>
					</tr>
				</c:forEach>
					<%-- <tr>
						<td>1</td>
						<td>홍길동</td>
						<td>
						<span>2021-10-15</span>
						<a href="${pageContext.request.contextPath}/do/reservation_check" title="예약하러가기" class="btn btn-colorless text-right">예약확인</a>
								<!-- 				 -->
								<!-- 				 -->
								<!-- 				 -->
							
								<!-- Trigger the modal with a button -->
								<input type="button" class="btn btn-colorless" data-toggle="modal" data-target="#myModal" value="예약취소"/>
								<!-- Modal -->
								<div id="myModal" class="modal fade" role="dialog">
								  <div class="modal-dialog">
								
								    <!-- Modal content-->
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal">&times;</button>
								        <h4 class="modal-title">예약취소</h4>
								      </div>
								        <form action="${pageContext.request.contextPath}/do/reservation_delete" method="post">
								        	<fieldset>
										      <div class="modal-body">
								        		<div class="text-left">
								        			<label for="name"  >서명(예약자<span class="byul">*</span>)</label>
								        		</div>
								        		<div class="form-group">
								        			<input type="text" id="name" name="name" class="form-control"/>
								
								        		</div>
					
								        	
								       
									      	</div>
										    <div class="modal-footer">
										       <input type="submit" value="예약취소" class="btn btn-colored"/>
										       <input type="button" data-dismiss="modal" class="btn btn-colored" value="뒤로가기"/>
										    </div>
									      </fieldset>
								       </form>
								    </div>
								
								  </div>
								</div>
								<!-- 				 -->
								<!-- 				 -->
								<!-- 				 -->
								<!-- 				 -->
							<a href="${pageContext.request.contextPath}/do/reservation_delete" title="예약취소" class="btn btn-colorless text-right">예약취소</a>
						</td>
						
					</tr> --%>
				</tbody>
			</table>
		</div>
	</div>
<%@ include file="inc/footer.jsp" %>
