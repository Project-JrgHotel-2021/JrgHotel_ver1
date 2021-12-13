<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/header.jsp" %>

<!--  세션 확인 -->
<%
   String cookie = request.getHeader("Cookie");
   String id = "";
   String remember="";
   
   if(cookie!=null){
      Cookie[] cookies = request.getCookies();
      
      for(int i=0; i<cookies.length; i++){
         if(cookies[i].getName().equals("id")){
            id = cookies[i].getValue();
         }
         
         if(cookies[i].getName().equals("remember") && cookies[i].getValue().equals("on")){
            
            remember = "checked";
         }
      }
   }
%>
<div class="container text-center">
   <div class="login_h3">
   <h3 style="font-weight:bold"  >로그인</h3>
   <div class="login">
   <form id="login_form"   action="${pageContext.request.contextPath}/do/login" method="post">
      <div class="row">
         <div class="col-sm-4"></div>
         <div class="col-sm-4">
            <fieldset>
         <legend></legend>
         
         <div class="form-group">
         
            <input type="text" name="uid" id="uid" value="<%=id%>" placeholder="아이디를 입력해주세요." class="form-control" />   

         </div>
         <!-- 아이디 -->
         <!-- 아이디 -->
         <!-- 아이디 -->

         <div class="form-group">
            <input type="password" name="upass" id="upass" placeholder="비밀번호를 입력해주세요."  class="form-control"/>
            
         </div>
         <!-- 비밀번호 -->
         <!-- 비밀번호 -->
         <!-- 비밀번호 -->
         
         <div class="form-group">
            <div class="row">
               <div class="col-sm-6 left"><input type="checkbox" name="remember" id="remember" <%=remember %> /><label for="remember">아이디 저장하기</label></div>
               <div class="col-sm-6 search_id_pass"><a href="${pageContext.request.contextPath}/do/searchid_page" title="아이디찾기로 이동">아이디찾기</a><span>/</span>
               <a href="${pageContext.request.contextPath}/do/searchpass_page">비밀번호찾기</a>
               </div>
            </div>
         </div>
         <!-- 아이디저장, 아이디찾기, 비밀번호찾기 -->
         
         <div class="loginbtn">
            <p><input type="submit" value="로그인" class="btn btn-colored form-control"/></p>
            <p><a href="${pageContext.request.contextPath}/do/join_page" title="회원가입으로 이동" class="btn btn-colorless form-control">회원가입</a></p>
         </div>
      </fieldset>
         </div><!-- end col-sm-4 -->
         <div class="col-sm-4"></div>
      
      </div>
   </form>
   </div>
   </div>
</div>
<script>

   $(function(){
      $("#login_form").submit(function(){
         if($("#uid").val()==""){
            alert("아이디를 입력해주세요.");
            $("#uid").focus();
            return false;
         }
         
         if($("#upass").val()==""){
            alert("비밀번호를 입력해주세요.");
            $("#upass").focus();
            return false;
         }
      });
   });
</script>
<%@ include file="inc/footer.jsp" %>