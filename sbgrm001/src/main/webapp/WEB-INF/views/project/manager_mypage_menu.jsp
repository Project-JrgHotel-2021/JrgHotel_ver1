<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="container mysub mypage_top">
		<!-- <h3>마이페이지</h3> -->
			<div class="row mypage_middle">
				<div class="mypage col-sm-3 ">
					<ul class="mypage-menu">
						<li>
							<h3>관리자페이지</h3>
						</li>
						<li>
						<p class="menu_undervar"></p>
						</li>
						
						
						<li  class="active">
							<a href="#reservation" id="mypage_menu_list_title">예약정보</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/do/manager_page" title="예약대기리스트">예약대기</a></li>
									<li><a href="${pageContext.request.contextPath}/do/manager_reservation_com_page" title="예약완료리스트">예약완료</a></li>
								</ul>
						</li>
						
						<li  class="active">
							<a href="#qna" id="mypage_menu_list_title">문의내역</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/do/manager_board_answer_page" title="답변대기리스트">답변대기</a></li>
									<li><a href="${pageContext.request.contextPath}/do/manager_board_answer_com_page" title="답변완료리스트">답변완료</a></li>
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
