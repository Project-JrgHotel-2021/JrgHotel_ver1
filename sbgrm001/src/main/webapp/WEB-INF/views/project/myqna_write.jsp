<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/header.jsp" %>
<%@ include file="mypage_menu.jsp" %>
<div class="container">
	<div class="mypage">
		<h2>문의하기</h2>
		<p class="mypage_undervar"></p>
	</div>
	<!-- 		 -->
	<!-- 		 -->
	<!-- 		 -->
	
	<div class="myqna_write">
		<form action="${pageContext.request.contextPath}/do/qna_write" method="post">
			<fieldset>
			
				<div class="form-group">
					<label for="uname">작성자</label>
					<input type="text" id="uname" name="uname" value="${uname}" class="form-control" readonly/>
				</div>
				
				
				<!-- 작성자  -->
				<!-- 작성자  -->
				<!-- 작성자  -->
				
				<div class="form-group">
					<label for="btitle">문의제목</label>
					<input type="text" id="btitle" name="btitle" class="form-control"/>
				</div>
				<!-- 문의제목 -->
				<!-- 문의제목 -->
				<!-- 문의제목 -->
				
				<div class="form-group">
					<label for="bcontent">문의내용</label>
					<input type="text" id="bcontent" name="bcontent" class="form-control"/>
				</div>
				<!-- 문의내용 -->
				<!-- 문의내용 -->
				<!-- 문의내용 -->
				
				<div class="form-group">
					<label for="upass">비밀번호</label>
					<input type="password" id="upass" name="upass" class="form-control"/>
				</div>
				<!-- 비밀번호 -->
				<!-- 비밀번호 -->
				<!-- 비밀번호 -->
				
				<div class="form-group">
					<input type="submit" value="문의하기" class="form-control btn btn-colored"/>
				</div>

			</fieldset>
		</form>
	</div>
</div>
<%@ include file="inc/footer.jsp" %>
