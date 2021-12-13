<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/header.jsp" %>
<div class="container">
   <div class="login_h3">
   <h3 style="font-weight:bold">비밀번호 찾기</h3>
   <div class="login">
   <form action="${pageContext.request.contextPath}/do/searchpass" method="post" id="form">
            <fieldset>
               <legend></legend>
               <div class="row">
                  <div class="col-sm-4"></div>
                  <div class="col-sm-4">
                     <div class="form-group">
                        <label for="uid">아이디</label> <input type="text" id="uid"
                           name="uid" placeholder="아이디를 입력해주세요." class="form-control" />
                     </div>
                     <div class="form-group">
                        <label for="uname">이름</label> <input type="text" id="uname"
                           name="uname" placeholder="가입시 입력한 이름을 입력해주세요."
                           class="form-control" />
                     </div>
                     <div class="form-group">
                        <label for="uemail">이메일</label> <input type="text" id="uemail"
                           name="uemail" placeholder="가입시 입력한 이메일을 입력해주세요."
                           class="form-control" />
                     </div>
                     <div class="form-group">
                        <label for="uphone">휴대폰</label> <input type="text" id="uphone"
                           name="uphone" placeholder="가입시 입력한 전화번호를 입력해주세요."
                           class="form-control" />
                     </div>
                     <div class="loginbtn">
                        <p><input type="submit" value="확인" class="btn btn-colored form-control" /></p>
                         <p><input type="button" class="btn btn-colorless form-control" id="back" value="이전" /></p>
                     </div>
                  </div>
                  <div class="col-sm-4"></div>
               </div>
            </fieldset>
         </form>
   </div>
   </div>
</div>
<script>
$(function(){
   $("#form").submit(function(){
      if( $("#uid").val() == ""){
         alert("아이디를 입력해주세요.");  $("#uid").focus(); return false;
      }
      if( $("#uname").val() == ""){
         alert("이름을 입력해주세요.");  $("#uname").focus(); return false;
      }
      if( $("#uemail").val() == ""){
         alert("이메일을 입력해주세요.");  $("#uemail").focus(); return false;
      }
      if( $("#uphone").val() == ""){
         alert("전화번호를 입력해주세요.");  $("#uphone").focus(); return false;
      }
   });
   $("#back").on("click",function(){
      history.go(-1);
   });
});

</script>


<%-- <%@ include file="inc/footer.jsp" %> --%>