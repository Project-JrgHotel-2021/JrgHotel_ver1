<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="inc/header.jsp" %>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<!--회원가입에 필요한 : 이름, 아이디, 비밀번호, 생년월일, 주소, 이메일, 휴대폰 -->
	<div class="container join">
		<h3>회원가입</h3>
		
		<script>
      /* 아이디 중복 확인 */
      $(function(){
         jQuery("#check_doubleid").on("click", function(){
            console.log('...............................클릭확인');
            
        	if($("#uid").val()==""){ alert("아이디를 입력해주세요."); $("#uid").focus(); return false; }	
            
            $.ajax({
               url : "${pageContext.request.contextPath}/do/check_doubleid", 
               type : "get", dataType : "text",
               success : function(data){
                  console.log(data);
                  $(".doubleIDCheck").html(data);
                  $("#id_check").val( $("#uid").val() );
               },
               data:{"uid" : $("#uid").val()},   /* 값 넘겨주기 */
               error : function(xhr, textStatus, errorThrown){
                    $(".doubleIDCheck").html(textStatus + "(Http-" + xhr.status + "/" + errorThrown);
               }
            });// end ajax
         });//end jQuery
      });
		</script>
		
		<form id="jform" action="${pageContext.request.contextPath}/do/join" method="post">
			<fieldset>
				<legend></legend>
				<p class="text-right">필수입력사항<span class="byul">*</span></p>
				<div class="form-group">
					<div class="row">
						<div class="col-sm-3"><label for="uid">아이디<span class="byul">*</span></label></div>
						<div class="col-sm-7"><input type="text" id="uid" name="uid" placeholder="아이디는 영문, 숫자 4~15자리" class="form-control"/></div>
						<div class="col-sm-2">
							<input type="button" id="check_doubleid" value="중복확인" class="btn btn-colorless"/>
						</div>
					</div>
				</div>
				<p class = "result doubleIDCheck"></p>
				<input type="hidden" name="id_check" id="id_check" value="null" /> 
				
				
				<!-- 	아이디	 -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->		
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
				
				<div class="form-group">
					<div class="row">
						<div class="col-sm-3"><label for="uname">이름<span class="byul">*</span></label></div>
						<div class="col-sm-7"><input type="text" id="uname" name="uname" placeholder="이름을 입력해주세요" class="form-control"/></div>
						<div class="col-sm-2"></div>
					</div>
				</div>
				<!-- 이름			  -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->
				<div class="form-group">
					<div class="row">
						<div class="col-sm-3"><label for="uemail">이메일<span class="byul">*</span></label></div>
						<div class="col-sm-7"><input type="text" id="uemail" name="uemail" placeholder="ex)admin@gmail.com" class="form-control" /></div>
						<div class = "col-sm-2"></div>
						<!-- <div class="col-sm-2"><input type="button" id="check_doubleemail" value="중복확인" class="btn btn-colorless"/></div> -->
					</div>
				</div>
				<!-- 	이메일	 -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->
				
				<div class="form-group">
					<div class="row">
						<div class="col-sm-3"><label>휴대폰<span class="byul">*</span></label></div>
						<div class="col-sm-7"><input type="text" id="uphone" name="uphone" placeholder="숫자만 입력해주세요." class="form-control"/></div>
						<div class="col-sm-2"></div>
					</div>
				</div>
				<!-- 	휴대폰	 -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->
				<div class="form-group">
					<div class="row">
						<div class="col-sm-3"><label for="zonecode">우편번호<span class="byul">*</span></label></div>
						<div class="col-sm-7"><input type="text" id="zonecode" name="zonecode" class="form-control"></div>
						<div class="col-sm-2"><input type="button" id="postcode" class="btn btn-colorless" value="우편번호"></div>
					</div>
				</div>
				<!-- 	우편번호	 -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->
				<div class="form-group">
					<div class="row">
						<div class="col-sm-3"></div>
						<div class="col-sm-5"><input type="text" id="address" name="address" class="form-control"/></div>
						<div class="col-sm-2"><input type="text" id="address2" name="address2" class="form-control"></div>
						<div class="col-sm-2"></div>
						
					</div>
				</div>
				<!-- 	상세주소	 -->
				<!-- 		 	 -->			
				<!-- 		 	 -->			
				<!-- 		 	 -->
				
				<div class="form-group">
					<div class="row">
						<div class="col-sm-3"><label for="birth">생년월일<span class="byul">*</span></label></div>
						<div class="col-sm-2">
							<select id="birth_yy" name="birth_yy" class="form-control">
								<option value="default">년</option>
								<c:forEach var="i" begin="1950" end="2000" step="1" varStatus="status">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
						</div>
						<!--	 년	 	-->
						<!-- 			-->
						<!-- 			-->
						
						<div class="col-sm-2">
							<select id="birth_mm" name="birth_mm" class="form-control">
								<option value="default">월</option>
								<c:forEach var="i" begin="1" end="12" step="1" varStatus="status">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
						</div>
						<!--	 월 		-->
						<!-- 			-->	
						<!-- 			-->
						
						<div class="col-sm-3">
							<input type="text" id="birth_dd" name="birth_dd" placeholder="일" class="form-control">
						</div>
						<!-- 	일 		-->
						<!-- 			-->
						<!-- 			-->
						
						<div class="col-sm-2"></div>
					</div>
				</div>
						<!-- 	생년월일	 -->
						<!-- 		 	 -->			
						<!-- 		 	 -->			
						<!-- 		 	 -->
				
				<div class="form-group text-center">
					<input type="submit" value="회원가입" class="btn btn-colored form-control">
				</div>
			</fieldset>
		</form>
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
			
			$("#jform").submit(function(){ 
				var id_ch = "";
				var dup_ch = "";
				var blank = /\s/;
				var id_check = /^[_a-z0-9-]{4,16}$/;  
				var pass_check = /^(?=.{8,16})(?=.*[!@#])(?=.*[a-zA-Z0-9]).*$/;   
				var uemail = /^[a-zA-Z0-9_]+(.[a-zA-Z0-9_]+)*@(?:\w)+.(net|com)+$/;
				var uname = /^[가-힣]{2,20}$/;
				var uphone = /01{1}[016789]{1}[0-9]{7,8}/; 
				
				if($("#uid").val()==""){ alert("아이디를 입력해주세요."); $("#uid").focus(); return false; }				
				if($("#upass").val()==""){ alert("비밀번호를 입력해주세요."); $("#upass").focus(); return false; }				
				if($("#uname").val()==""){ alert("이름을 입력해주세요."); $("#uname").focus(); return false; }				
				if($("#uemail").val()==""){ alert("이메일을 입력해주세요."); $("#uemail").focus(); return false; }				
				if($("#uphone").val()==""){ alert("전화번호를 입력해주세요."); $("#uphone").focus(); return false; }				
				if($("#zonecode").val()==""){ alert("주소를 선택해주세요."); $("#zonecode").focus(); return false; }				
				if($("#address").val()==""){ alert("주소를 선택해주세요."); $("#address").focus(); return false; }
				if($("#address2").val()==""){ alert("상세주소를 입력해주세요."); $("#address2").focus(); return false; } 
				if($("#birth_yy").val()=="default"){ alert("년도를 선택해주세요."); $("#birth_yy").focus(); return false; }				
				if($("#birth_mm").val()=="default"){ alert("월을 선택해주세요."); $("#birth_mm").focus(); return false; }				
				if($("#birth_dd").val()==""){ alert("일을 입력해주세요."); $("#birth_dd").focus(); return false; }
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
				if(blank.test($("#uid").val()) ){alert("아이디에 공백이 있습니다."); $("#uid").focus(); return false;}
				if(blank.test($("#upass").val()) ){alert("비밀번호에 공백이 있습니다."); $("#upass").focus(); return false;}
				if(blank.test($("#upass_check").val()) ){alert("비밀번호 재확인에 공백이 있습니다."); $("#upass_check").focus(); return false;}
				if(blank.test($("#uemail").val()) ){alert("이메일에 공백이 있습니다."); $("#uemail").focus(); return false;}
				if(blank.test($("#uname").val())){alert("이름에 공백이 있습니다."); $("#uname").focus(); return false;}
				if(blank.test($("#uphone").val()) ){alert("전화번호에 공백이 있습니다."); $("#uphone").focus(); return false;}
				if(!(id_check.test($("#uid").val())) ){alert("5~20자의 영문 소문자,숫자,특수기호(_),(-)만 사용가능합니다.."); $("#uid").focus(); return false;}  
				if(!(pass_check.test($("#upass").val()))){alert("8~16특수문자 포함입니다."); $("#upass").focus(); return false; } 
		        if(!(uname.test($("#uname").val()))){alert("올바른 이름 형식이 아닙니다."); $("#uname").focus(); return false; }
		        if(!(uemail.test($("#uemail").val()))){alert("올바른 메일 형식이 아닙니다."); $("#uemail").focus(); return false; }
		        if(!(uphone.test($("#uphone").val()))){alert("올바른 번호 형식이 아닙니다."); $("#uphone").focus(); return false; }
		        
		        console.log( $("#uid").val() + "/////" + $("#id_check").val());
		       	if(  $("#uid").val() != $("#id_check").val()  ) {
		       		alert("ID중복확인 해주시기 바랍니다."); return false;
		       	}
		       
			});
			
		});
	</script>
	<!-- 우편다음api -->
<%-- <%@include file ="inc/footer.jsp" %> --%>