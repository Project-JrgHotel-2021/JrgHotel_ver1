<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/header.jsp" %>
<%@ include file="manager_mypage_menu.jsp" %>
<div class="container">
   <div class="mypage">
      <h2>문의글 확인</h2>
      <p class="mypage_undervar"></p>
   </div>
   
   <div class="manager_board_detail">
      <form action="#" method="post">
         <fieldset>
            <div class="form-group">
               <label for="uname">작성자</label>
               <input type="text" id="uname" name="uname" class="form-control" value="${dto.userDto.uname}" readonly/>
            </div>
            <!-- 작성자 -->
            
            <div class="form-group">
               <label>문의제목</label>
               <input type="text" id="btitle" name="btitle" class="form-control" value="${dto.boardDto.btitle}" readonly/>
            </div>
            <!-- 문의제목 -->
            
            <div class="form-group bcontent_detail">
               <label>문의내용</label>
               <textArea id="bcontent" name="bcontent" class="form-control" readonly>${dto.boardDto.bcontent}</textArea>
            </div>
            <!-- 문의내용 -->
            
            <div class="form-group list_detail">
               <a href="javascript:history.back()" title="목록으로이동" class="btn btn-colored">문의글 목록</a>
               
            </div>
            
         </fieldset>
      </form> 
   </div>
   
   <c:choose>
      <c:when test="${dto.boardDto.bcheck eq 'N' or 'n'}">
         <div class="manager_comment">
            <form id="commentForm" action="${pageContext.request.contextPath}/do/insert_answer" method="post">
               
                  <div>   
                     <div class="panel panel-default">
                        <div class="panel-heading">Comments</div>
                        <div class="panel-body myqna_panelbody">
                           <textArea id="answer" name="answer"></textArea>
                           <div class="manager_comment_btn">
                              <input type="hidden" id="bno" name="bno" value="${dto.boardDto.bno}"/>
                              <input type="submit" value="등록" class="btn btn-colorless"/>
                           </div>
                        </div>
                     </div>
                     
                     <!-- panel panel-default -->
                     <!--  입력한답변 -->
                        
                     
                     
               </div>
            </form>
         </div><!-- 답변입력 -->
      </c:when>
      <c:when test="${dto.boardDto.bcheck eq 'Y' }">
         <div class="manager_comment">
         <div class="panel panel-default">
           <div class="panel-heading">[RE:${dto.userDto.uname}님 문의글에 대한 답변입니다.]</div>
           <div class="panel-body myqna_panelbody">
              <div class=" form-group result_comment">
                 <input type="text" id="answer" name="answer" value="${dto.answerDto.answer}" class="form-control"/>
             </div>
             
             <div class="form-group manager_comment_btn">
                <input type="button" id="commentUpdate" name="commentUpdate" class="btn btn-colorless" value="수정"/>
                <input type="button" id="commentDelete" name="commentDelete" class="btn btn-colorless" value="삭제"/>
             </div>
           </div>
         </div>
         <!-- 답변이 이미 있는경우 -->
         </div>
      </c:when>
   </c:choose>
   
   
   
</div>

   <script>
   <!-- 답변삭제 -->
    $(function(){
       $("#commentDelete").on("click",function(){
          $.ajax({
             url:"${pageContext.request.contextPath}/co/comment_delete",
             type:"post",
             dataType:"json",
             data:{"ano" : ${dto.answerDto.ano}, "bno" : ${dto.answerDto.bno}},
             success:function(data){
                var result = parseInt(data);
                if(data>0){
                   alert('삭제완료되었습니다.');
                   location.href="${pageContext.request.contextPath}/do/manager_board_answer_page";
                }else{
                  return false;
                }
             },
             error:function(xhr,textStatus,errorThrown){
                $("result_comment").html(textStatus+"(HTTP-"+xhr.status+"/"+errorThrown);
             }
          });
       });
          
          
          $("#commentUpdate").on("click",function(){
            $.ajax({
               url:"${pageContext.request.contextPath}/co/comment_update",
                dateType:"json",
                data:{"ano":${dto.answerDto.ano},"answer":$("#answer").val()},
                success:function(data){
                   var result = parseInt(data);
                   
                   if(data>0){
                      alert('수정완료되었습니다.');
                      location.href="${pageContext.request.contextPath}/do/manager_answer_detail?bno=${dto.boardDto.bno}";
                   }else{
                      return false;
                   }
                },
                error:function(xhr,textStatus,errorThrown){
                   $("result_comment").html(textStatus+"(HTTP-"+xhr.status+"/"+errorThrown);
                }
             });
          });
    });
   </script>
<%@ include file="inc/footer.jsp" %>