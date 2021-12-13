<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/header.jsp" %>
<%@ include file="mypage_menu.jsp" %>
<div class="container">
   <div class="mypage">
      <h2>문의내역</h2>
      <p class="mypage_undervar"></p>
   </div>
   <!--  end mypage -->
   <!--            -->
   <!--            -->
   <!--            -->

   <div class="myqna_list">
<!-- 
<div class="panel-group" id="accordion">
<c:forEach var="i" begin="0" end="3" varStatus="status">
   <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse${i}">
        Collapsible Group 1</a>
      </h4>
    </div>
    <div id="collapse${i}" class="panel-collapse collapse <c:if test="${status.index==0}">in</c:if>">
      <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat.</div>
    </div>
  </div>

</c:forEach>
 

  
  
</div> -->
  <!-- 아코디언 테스트  -->
  <!-- 아코디언 테스트  -->
  <!-- 아코디언 테스트  -->
  <!-- 아코디언 테스트  -->

 
      <div class="panel-group" id="accordion">
      
      
       <c:forEach var="dto" items="${list}" varStatus="status">
       
       
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title myqna_paneltitle">
              <a data-toggle="collapse" data-parent="#accordion" href="#myqna${dto.boardDto.bno}">
              문의번호 : ${dto.boardDto.bno}</a>
            </h4>
          </div>
          <div id="myqna${dto.boardDto.bno}" class="panel-collapse collapse <c:if test="${status.index==0}">in</c:if>">
            <div class="panel-body myqna_panelbody">
               <div>
                  <h2>${dto.boardDto.btitle}</h2>
                  <p>${dto.boardDto.bcontent}</p>
               </div>
                     <!-- Trigger the modal with a button -->
         <!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->
         <div class="myqna_list_btn">
            <input type="button" class="btn btn-colored" data-toggle="modal" data-target="#myModal_update${dto.boardDto.bno}" value="수정"/>
            <input type="button" class="btn btn-colored" data-toggle="modal" data-target="#myModal_delete${dto.boardDto.bno}" value="삭제"/>
         </div>
         <!-- Modal -->
         <div id="myModal_update${dto.boardDto.bno}" class="modal fade" role="dialog">
           <div class="modal-dialog">
         
             <!-- Modal content-->
             <div class="modal-content">
               <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4 class="modal-title">문의글 수정</h4>
               </div>
               <form action="${pageContext.request.contextPath}/do/myqna_edit" method="post">
                  <div class="modal-body">
                     <div class="form-group">
                        <label for="title_edit">Q.문의제목</label>
                       <input type="text" id="btitle_edit" name="btitle_edit" value="${dto.boardDto.btitle}" class="form-control"/>
                      </div>
                      <div class="form-group">
                         <label for="content_edit">문의글</label>   
                       <input type="text" id="bcontent_edit" name="bcontent_edit" value="${dto.boardDto.bcontent}"class="form-control"/>
                         
                    </div>
                    
                    <div class="from-group">
                       <label for="upass">비밀번호</label>
                       <input type="password" id="upass" name="upass" class="form-control"/>
                       <input type="hidden" id="bno" name="bno" value="${dto.boardDto.bno}"/>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <input type="submit" value="수정" class="btn btn-colored myqna_submitBtn"/>
                    <a href="${pageContext.request.contextPath}/do/myqna" class="btn btn-colored">취소</a>
      <!--           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
       -->            
                  </div>
               </form>
               <!-- 문의글 수정  -->
             </div>
         
             
         </div>
            
        </div>
        
        <!-- Modal --> <!--  문의글 삭제  -->
         <div id="myModal_delete${dto.boardDto.bno}" class="modal fade" role="dialog">
           <div class="modal-dialog">
         
             <!-- Modal content-->
             <div class="modal-content">
               <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4 class="modal-title">본인확인</h4>
               </div>
               <form action="${pageContext.request.contextPath}/do/myqna_delete" method="post">
                  <div class="modal-body">
                     <div class="form-group">
                        <label for="upass">비밀번호</label>
                       <input type="password" id="upass" name="upass" class="form-control"/>
                       <input type="hidden" id="bno" name="bno" value="${dto.boardDto.bno}"/>
                      </div>
                      
                  </div>
                  <div class="modal-footer">
                    <input type="submit" value="삭제" class="btn btn-colored myqna_submitBtn"/>
                    <a href="${pageContext.request.contextPath}/do/myqna" class="btn btn-colored">취소</a>
      <!--           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
       -->            
                  </div>
               </form>
               <!-- 문의글 삭제  -->
             </div>
         
             
         </div>
            
        </div>
        <!-- 문의글 삭제 -->
            </div>
            <!-- panel-body  -->
            <div class="panel-footer myqna_panelfooter">
               <div>A.[${dto.userDto.uname}님 문의글에 대한 답변입니다.]</div>
               <div>${dto.answerDto.answer}</div>
               
            </div>
            
          </div>
        </div>
        <!-- end panel-default1 -->
      </c:forEach>
      
      </div>
      <!-- end panel-group -->
   </div>
   <!-- end myqna_list -->
   
</div>
<!-- end container -->


<%@ include file="inc/footer.jsp" %>