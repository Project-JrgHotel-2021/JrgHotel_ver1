<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/header.jsp" %>
<%@ include file="mypage_menu.jsp" %>


	<div class="container">
		<div class="mypage">
			<h2>회원탈퇴</h2>
			<p class="mypage_undervar"></p>
		</div>
		<form  id="deleteform" action="${pageContext.request.contextPath}/do/user_delete" method="post">
		<fieldset>
		
		<div class="row">
			<div class="col-sm-2">
	
			</div>
			<div class="col-sm-9">
				<div class="user_check">
					
					
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-5">
							<div class="form-group">
								<label>비밀번호</label>
								<input  type="password" name="upass" id="upass"  placeholder="본인확인을 위해 비밀번호를 입력해주세요." class="form-control"/>		
							</div>
						</div>
						<div class="col-sm-5">
							<div class="form-group">
								<input type="submit" value="확인" class="btn btn-colored"/>
							</div>
						</div>
							
						
						
					</div>
					
				</div>
				
				
			</div>
		</div>
		</fieldset>
		</form>
	</div>
	
	<script>
		$(function(){
			$("#deleteform").submit(function(){
				var checkdelete = confirm('회원탈퇴를 진행하시겠습니까?');
				
				if($("#upass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#upass").focuse();
					return false;
				}
				
				
				
				if(checkdelete!=true){
					alert('회원탈퇴가 이루어지지 않았습니다.');
					return false;
				} 
				
			});
			
			//확인 후 이동
			
		});
	</script>
	
<%@ include file="inc/footer.jsp" %>
