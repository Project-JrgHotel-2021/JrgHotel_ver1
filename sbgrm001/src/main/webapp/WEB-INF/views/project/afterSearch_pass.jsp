<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@  taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="inc/header.jsp" %>

<div>
<form id="jform" action="${pageContext.request.contextPath}/do/updatepass" method="post">
			<fieldset>
				<legend></legend>		
				<div class="form-group">
					<div class="row">
						<div class="col-sm-3"><label for="upass">비밀번호<span class="byul">*</span></label></div>
						<div class="col-sm-7"><input type="password" id="upass" name="upass" placeholder="영문,숫자,특수문자 조합 8~16자리" class="form-control"/></div>
						<div class="col-sm-2"></div>
					</div>
				</div>
				
				<!-- 	비밀번호	 -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->	
				
				<div class="form-group">
					<div class="row">
						<div class="col-sm-3"><label for="upass">비밀번호확인<span class="byul">*</span></label></div>
						<div class="col-sm-7"><input type="password" id="upass_check" name="upass_check" placeholder="위와 같은 비밀번호를 입력해주세요." class="form-control"/></div>
						<div class="col-sm-2"></div>
					</div>
				</div>
				<!-- 비밀번호확인란  -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->
				<input type="hidden" name="uid" value="${uid}">
				<div class="form-group text-center">
					<input type="submit" value="확인" class="btn btn-colored form-control">
				</div>
			</fieldset>
		</form>
		<script>
		$(function(){
			
			$("#jform").submit(function(){			
				if($("#upass").val()==""){ alert("비밀번호를 입력해주세요."); $("#upass").focus(); return false; }				
				if($("#upass_check").val() == ""){
					alert('비밀번호를 입력해주세요.');
					$("#upass_check").focus();
					return false;
				}
				if($("#upass_check").val() != $("#upass").val()){
					alert('비밀번호가 다릅니다.\n비밀번호를 확인해주세요.');
					$("#upass_check").focus();
					return false;
				}
			});
			
		});
	</script>
</div>













<%-- <%@ include file="inc/footer.jsp" %> --%>