<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="inc/header.jsp" %>

<%@ include file="mypage_menu.jsp" %>
<style>
	.user_update{
		margin-left:300px;
	}
</style>

	<!-- 본인확인에서 비밀번호 입력이 틀렸을 경우 -->
	<c:set var="result" value="${result}"></c:set>
	<c:if test="${result!='0'}">
		<script>
			alert("비밀번호를 확인해주세요.");
			history.go(-1);
		</script>
	</c:if>
	
	<div class="container">
		<div class="mypage">
			<h2>회원정보수정</h2>
			<p class="mypage_undervar"></p>
		</div>
		
		<div class="container user_update">
		
			<form id="updateform" action="${pageContext.request.contextPath}/do/user_update" method="post">
				<fieldset>
					<div class="form-group">
						<div class="row">
							<div class="col-sm-2"><label for="uname">이름<span class="byul">*</span></label></div>
							<div class="col-sm-4"><input type="text" id="uname" name="uname" value="${dto.uname}" placeholder="이름을 입력해주세요" class="form-control" readonly/></div>
							<div class="col-sm-6"></div>
						</div>
					</div>
					<!-- 이름			  -->
					<!-- 		 	 -->			
					<!-- 		 	 -->			
					<!-- 		 	 -->
					<div class="form-group">
					<div class="row">
						<div class="col-sm-2"><label for="uid">아이디<span class="byul">*</span></label></div>
						<div class="col-sm-4"><input type="text" id="uid" name="uid" value="${dto.uid}"placeholder="아이디는 영문, 숫자 4~15자리" class="form-control" readonly/></div>				
						<div class="col-sm-6"></div>
					</div>
					</div>
				<!-- 	아이디	 -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->
				
				<div class="form-group">
					<div class="row">
						<div class="col-sm-2"><label for="upass">비밀번호<span class="byul">*</span></label></div>
						<div class="col-sm-4"><input type="password" id="upass" name="upass" placeholder="영문,숫자,특수문자 조합 8~16자리" class="form-control"/></div>
						<div class="col-sm-6"></div>
					</div>
				</div>
				
				<!-- 	비밀번호	 -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->
				
				<div class="form-group">
					<div class="row">
						<div class="col-sm-2"><label for="up_check">비밀번호 확인<span class="byul">*</span></label></div>
						<div class="col-sm-4"><input type="password" id="up_check" name="up_check"  class="form-control"/></div>
						<div class="col-sm-6"></div>
					</div>
				</div>
				
				<!-- 	비밀번호 확인	 -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->
				
				<div class="form-group">
					<div class="row">
						<div class="col-sm-2"><label for="uemail">이메일<span class="byul">*</span></label></div>
						<div class="col-sm-4"><input type="text" id="uemail" name="uemail" value="${dto.uemail}"placeholder="ex)admin@gmail.com" class="form-control" /></div>
						<div class="col-sm-2"><!-- <input type="button" id="check_doubleemail" value="중복확인" class="btn btn-colorless"/> --></div>
						<div class="col-sm-4"></div>
					</div>
				</div>
				<!-- 	이메일	 -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->
				
				<div class="form-group">
					<div class="row">
						<div class="col-sm-2"><label for="uphone">휴대폰<span class="byul">*</span></label></div>
						<div class="col-sm-4"><input type="text" id="uphone" name="uphone" value="${dto.uphone}" placeholder="숫자만 입력해주세요." class="form-control"/></div>
						<div class="col-sm-6"></div>
					</div>
				</div>
				<!-- 	휴대폰	 -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->
				
				
				
				<div class="form-group">
					<div class="row">
						<div class="col-sm-2"><label for="zonecode">우편번호<span class="byul">*</span></label></div>
						<div class="col-sm-4"><input type="text" id="zonecode" name="zonecode"  value="${addrlist[0]}"class="form-control"></div>
						<div class="col-sm-2"><input type="button" id="postcode" class="btn btn-colorless" value="우편번호"></div>
						<div class="col-sm-4"></div>
					</div>
				</div>
				<!-- 	우편번호	 -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->
				<div class="form-group">
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-4"><input type="text" id="address" name="address"  value="${addrlist[1]}"class="form-control"/></div>
						<div class="col-sm-6"></div>
						
					</div>
				</div>
				<!-- 	상세주소1	 -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->
				
				<div class="form-group">
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-4"><input type="text" id="address2" name="address2" value="${addrlist[2]}" class="form-control"></div>
						<div class="col-sm-6"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="row">
						<div class="col-sm-2"><label for="birth">생년월일<span class="byul">*</span></label></div>
						<div class="col-sm-2">
							<select id="birth_yy" name="birth_yy"  class="form-control">
								<option value="default">년</option>
								<c:forEach var="i" begin="1960" end="2002" step="1" varStatus="status">
									<c:choose>
										<c:when test="${not empty birthlist[0] and (birthlist[0] eq i)}">
											<option value="${i}" selected >${i}</option>
											<p>${birthlist[0]}</p>
										</c:when>
										<c:otherwise>
											<option value="${i}">${i}</option>
										</c:otherwise>
									</c:choose>
									
								</c:forEach>
								
								
							</select>
						</div>
						<!--	 년	 	-->
						<!-- 			-->
						<!-- 			-->
						
						<div class="col-sm-1">
							<select id="birth_mm" name="birth_mm" class="form-control">
								<option value="default">월</option>
								<c:forEach var="i" begin="1" end="12" step="1" varStatus="status">
									<c:choose>
										<c:when test="${not empty birthlist[1] and (birthlist[1] eq i)}">
											<option value="${i}" selected>${i}</option>
										</c:when>
										<c:otherwise>
											<option value="${i}">${i}</option>
										</c:otherwise>
									</c:choose>
									
								</c:forEach>
							</select>
						</div>
						<!--	 월 		-->
						<!-- 			-->	
						<!-- 			-->
						
						<div class="col-sm-1">
							<input type="text" id="birth_dd" name="birth_dd"  value="${birthlist[2]}" placeholder="일" class="form-control">
						</div>
						<!-- 	일 		-->
						<!-- 			-->
						<!-- 			-->
						
					
					</div>
				</div>
				<!-- 	생년월일	 -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->
				
					<div class="form-group text-center">
						<div class="row">
							
							<div class="col-sm-4"><input type="submit" value="정보수정" class="btn btn-colored form-control"> </div>
						</div>
						
						
					</div>
				
				</fieldset>
			</form>
		</div>
	</div>
	<script>
		$(function(){
			$("#postcode").click(function(){
				new daum.Postcode({
					oncomplete:function(data){
						$("#zonecode").val(data.zonecode);
						$("#address").val(data.address);
						$("#address2").focus();
			            //새우편번호 : data.zonecode
						//기본 주소 : data.address
						}
					}).open();
			});
		});
		
		
		//공백
		var blank = /\s/;
		
		$(function(){
			$("#updateform").submit(function(){
				
				if(blank.test($(".form-control").val())){
					alert('공백을사용불가합니다.');
					return false;
				}else if($("#upass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#upass").focus();
					return false;
				}else if($("#upass").val()!=$("#up_check").val()){
					alert("비밀번호가 일치하지 않습니다.\n비밀번호를 확인해주세요.");
					$("#upass").focus();
					return false;
				}else if($("#uemail").val()==""){
					alert("이메일을 입력해주세요.");
					$("#uemail").focus();
					return false;
					
				}else if($("#uphone").val()==""){
					alert("핸드폰번호를 입력해주세요.");
					$("#uphone").focus();
					return false;
				}else if($("#zonecode").val()=="" || $("#address").val()=="" || $("#address2").val()==""){
					alert("주소를 입력해주세요.");
					$("#zonecode").focus();
					return false;
				}else if($("#birth_yy").val()=="default" || $("#birth_mm").val()=="default" || $("#birth_dd").val()=="default"){
					alert("생년월일을 선택해주세요.");
					return false;
				}
				
				
			});
		});
	</script>
	<!-- 우편다음api -->


<%@ include file="inc/footer.jsp" %>

