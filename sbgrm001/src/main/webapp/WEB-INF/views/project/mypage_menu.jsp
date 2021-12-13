<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="container mysub mypage_top">
		<!-- <h3>마이페이지</h3> -->
			<div class="row mypage_middle">
				<div class="mypage col-sm-3">
					<ul class="mypage-menu">
						<li>
							<h3>마이페이지</h3>
						</li>
						<li>
						<p class="menu_undervar"></p>
						</li>
						<li  class="active">
							<a href="#userinfo" id="mypage_menu_list_title">회원정보</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/do/my_check">회원정보수정</a></li>
									<li><a href="${pageContext.request.contextPath}/do/my_check_delete">회원탈퇴</a></li>
								</ul>
						</li>
						
						<li  class="active">
							<a href="#reservation" id="mypage_menu_list_title">예약정보</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/do/reservation">예약확인</a></li>
									<%-- <li><a href="${pageContext.request.contextPath}/do/reservation_delete_p">예약취소</a></li> --%>
								</ul>
						</li>
						
						<li  class="active">
							<a href="#qna" id="mypage_menu_list_title">문의내역</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/do/myqna_write">문의하기</a></li>
									<li><a href="${pageContext.request.contextPath}/do/myqna">문의내역확인</a></li>
								</ul>
						</li>
						
					</ul><!-- end ul -->
				</div><!-- end col-sm-3 -->
				
	</div>
	</div>
	<script>
		$(function(){
			$('ul > li').click(function() {
			    if ( $(this).hasClass('active') ) {
			        $(this).find(' > ul').stop().slideUp(300);
			        $(this).removeClass('active');
			    }
			    else {
			        $(this).find(' > ul').stop().slideDown(300);
			        $(this).addClass('active');
			    }
			});
		});
	</script>
