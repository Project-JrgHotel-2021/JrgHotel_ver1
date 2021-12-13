<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file ="inc/header.jsp" %>
<div class = "container">
 <table class = "table table-bordered">
 	<caption>예약 확인</caption>
 	<colgroup>
  			<col style="10%" /><col style="10%" /><col style="20%" /><col style="20%"/><col style="20%" /><col style="20%" />
  		</colgroup>
  		
  		<thead>
			<tr>	<th scope="col">NO</th><th scope="col">호텔</th>
			      	<th scope="col">객실</th><th scope="col">예약일</th>
			      	<th scope="col">체크인</th><th scope="col">체크아웃</th>
			</tr>
		</thead>
  		
  		<tbody>
  			<%-- <c:forEach var = "dto" items = "${list}" varStatus = "status">
  			<tr>
  				<td>${pageTotal-status.index-pstartno}</td>
				<td><a href ="${pageContext.request.contextPath}/detail.machen?uno=${dto.uno}">${dto.utitle}</a></td>
				<td>${dto.uname}</td>
				<td>${dto.udate}</td>
				<td>${dto.uhit}</td>
  			</tr>
  			</c:forEach> --%>
  			<tr>
				<td>1</td>
				<td>${dto.hname}</td>
				<td>${dto.rtname}</td>
				<td>${dto.rdate}</td>
				<td>${dto.rcheckin}</td>
				<td>${dto.rcheckout}</td>
				
			</tr>
  			
  		
  		
  		</tbody>
  		
  		
  		<%-- <tfoot>
			<tr><td colspan = "4" class = "text-center">
				<ul class="pagination text-center">
					<c:if test="${start_bottom>=bottomlist}">
						<li><a href="${pageContext.request.contextPath}/list.machen?pstartno=${(start_bottom-2)*onepagelimit}">이전</a></li>
					</c:if>
					
					<!-- <c:forEach var = "i" begin = "${start_bottom}" end = "${end_bottom}" varStatus = "status">
						<li><a href = "${pageContext.request.contextPath}/list.machen?pstartno=${(i-1)*onepagelimit}">${i}</a></li>
					숫자들
					</c:forEach>  -->
					
					<c:forEach var="i" begin="${start_bottom}" end="${end_bottom}" varStatus="status">
						<li  <c:if test="${current_bottom==i}">class="active"</c:if>><a href="${pageContext.request.contextPath}/list.machen?pstartno=${(i-1)*onepagelimit}">${i}</a></li>
							<!-- 만약 현재페이지와 i가 같다면 li태그에 active 지정해주기 -->
							<!--System.out.println("1 전체 게시판 갯수 : " + pageTotal);
								System.out.println("2 한 페이지 줄 갯수 : "+ onepagelimit);
								System.out.println("3 하단 전체 페이지 갯수 : "+ pageAll);
								System.out.println("4 : "+ list);
								System.out.println("5 하단 네비게이션 : " + bottomlist);
								System.out.println("6 현재페이지 번호 : " + current_bottom);
								System.out.println("7 시작버튼 : " + start_bottom);
								System.out.println("8 마지막 버튼 : " + end_bottom); -->
					</c:forEach>
					
					
					
					<c:if test="${pageAll>end_bottom}">
						<li><a href="${pageContext.request.contextPath}/list.machen?pstartno=${end_bottom*onepagelimit}">다음</a></li>
					</c:if>
				
				</ul>
			</td></tr>
		
		</tfoot> --%>
		
	</table>
	
	
		<div class = "container redonePage_mj">
			<a href="${pageContext.request.contextPath}/do/my_page"   class="btn btn-default">MYPAGE</a>
		 	<a href="${pageContext.request.contextPath}/do/main"   class="btn btn-default">HOME</a>
		</div>
	</div>
	