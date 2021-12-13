<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>



@font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
   .firstnav {
       margin-bottom: 0;
   }   
   #header{
      background: #F0DBBE;
   }
   .nav > li > a{
      color : #A18866;
   }
   .secondnav > li > a{
      font-size:20px;
   }
   .logo img{
       position: absolute;
       width: 200px;
       height: 104px;
       margin-left: 50px;
   }
   .btn-colorless {
       border: solid 1px #A18866;
       color: #A18866;
       font-size: 15px;
       background: #fff;
   }
   .btn-colored {
    border: solid 1px #A18866;
    background: #A18866;
    color: #fff;
    font-size: 15px;
}
   
   .join .form-group {
    margin: 50px;
    font-size: 15px;
   }
   .join input {
    height: 55px;
   }
   .join select {
    height: 55px;
   }
   
   span.byul {
    color: red;
    font-size: 18px;
   }
   .join h3 {
    text-align: center;
    margin: 50px;
    font-weight: bold;
    font-size: 30px;
   }
   .join .btn-colored {
    width: 600px;
    height: 70px;
    margin-top: 40px;
    font-size: 17px;
   }
   
   .login input[type="text" i] {
    padding: 30px 20px;
   }
   .login input[type="password" i] {
    padding: 30px 20px;
   }
   .col-sm-6.left {
    text-align: left;
   }
   input[type="checkbox" i] {
       margin-right: 5px;
   }
   .col-sm-6.search_id_pass > a {
    color: black;
   }
   input[type=submit] {
    -webkit-appearance: button;
    cursor: pointer;
    
   }
   .loginbtn .btn {
      height: 55px;
    font-size: 17px;
   }
   .loginbtn a.btn.btn-colorless.form-control {
    padding-top: 15px;
   }
   .loginbtn {
    margin-top: 30px;
   }
   .login .form-group {
    margin-top: 25px;
   }
   
   
   .mypage_top {
    margin-top: 70px;
    font-family: 'IBMPlexSansKR-Regular';
   }
   .mypage_middle {
    margin-left: -30px;
   }
   .mypage-menu > li  a{
       display:block;
       padding:8px;
    }
    .mypage-menu li > a {
       color: dimgray;
   }
   ul.mypage-menu {
       list-style: none;
   }
   .mypage-menu li {
       list-style: none;
   }
   .mypage.col-sm-3 {
    background: #F0DBBE;
    font-size: 18px;
   }
   .mypage.col-sm-3 h3 {
    font-weight: bold;
    padding: 10px;
    color: #69554b;
   }
   p.menu_undervar {
    background: #69554b;
    width: 190px;
    height: 5px;
   }
   .mypage.col-sm-3 {
    position: absolute;
    width: 295px;
    height: auto;
   }
   
   .mypage h2 {
    margin-left: 300px;
    font-family: 'IBMPlexSansKR-Regular';
   }
   p.mypage_undervar {
    margin-left: 300px;
    background: #69554b;
    height: 5px;
    margin-bottom: 60px;
   }
   .user_update input[type="submit" i] {
    margin-left: 195px;
    margin-top: 50px;
    height: 50px;
   }
   .user_check input[type="submit" i] {
    margin-top: 33px;
    padding: 11px;
   }
   .user_check input[type="password" i] {
    margin-top: 10px;
    padding: 20px;
   }   
   .reservation_check {
    margin-left: 300px;
   }
   .myqna_list{
   margin-left:300px;
   }
   .myqna_list_btn {
    text-align: right;
   }
   input#bcontent_edit {
    height: 300px;
   }
   .reservation {
    margin-left: 300px;
   }
   .reservation a.btn.btn-colorless.text-right {
    float: right;
   }
   .reservation td {
    text-align: center;
   }
   .reservation_check {
    margin-left: 300px;
   }   
   .reservation_detail {
    border-block: 3px solid;
    border-left: 3px solid;
    border-right: 3px solid;
    border-color: #A18866;
    height: auto;
      padding: 10px 40px 10px 40px;
   }
   .reservation_detail_table {
    margin: 30px 10px 30px 10px;
   }
   .reservation_var p {
    background: #69554b;
    height: 5px;
   }
   .reservation input[type="button" i] {
    float: right;
    margin-right: 10px;
   }
   .reservation_check img {
    width: 500px;
    height: auto;   
   }
   .reservation_check_img {
    text-align: center;
    margin-bottom: 20px;
   }   
   .reservation_check_foot_content {
    border: solid #69554b;
    background: #eee;
    font-size: 20px;
   }
   
   a.btn.btn-colored.reservation_check_btn {
    float: right;
    margin-right: 10px;
   }
   
   /* 2021.11.05 */
   
   .myqna_write {
    margin-left: 300px;
    }
    .myqna_write input#bcontent {
    height: 300px;
    }
    .myqnalist_manager {
    margin-left: 300px;
    }
    /* 2021.11.07*/
    
    .manager_answer_before{
    margin-left: 300px;
    }
    
    .manager_board_detail{
    margin-left: 300px;
    }
    .manager_comment{
    margin-left: 300px;
    }
    
    /* 2021.11.08 */
    
    .bcontent_detail textarea#bcontent {
    height: 200px;
    }
    
    .manager_comment textarea#answer {
    width: -webkit-fill-available;
   }
   
   .manager_comment_btn {
    text-align: right;
   }
   .form-group.list_detail {
    text-align: right;
    }
    textarea#commentText {
    width: -webkit-fill-available;
    height: 100px;
   }
    
    /* 2021.11.16 */
    .reservation_backBtn {
    margin-top: 10px;
    text-align: right;
   }
   .reservation_check_foot_content{
   text-align: right;
   }
   
   .mypage_default{
   margin-left:300px;
   text-align:center;
   }
   p.mypage_default_img img {
    height: 100px;
    width: 100px;
   }
   
   p.mypage_default_img {
    border: 5px solid #F0DBBE;
    padding: 50px;
   }
   
   a#mypage_menu_list_title {
    color: #69554b;
    font-weight: bold;
    font-size: 20px;
   }
   span.mypage_default_span {
    font-size: 18px;
    font-family: 'IBMPlexSansKR-Regular';
    font-weight: bold;
   }
   
   /* 2021.11.17*/
   input.btn.btn-colored.myqna_submitBtn {
    padding: 6px;
    width: 55px;
   }
   
   .login_h3 >h3 {
    text-align: center;
    margin: 50px;
    font-weight: bold;
    font-size: 30px;
   }
   
   
   /*2021.11.22 */
   
   .row.mypage_middle h3 {
    margin-top: 20px;
    margin-bottom: 15px;
    font-size: 25px;
   }
   
   .mypage h2 {
    font-size: 25px;
    margin-top: 35px;
    margin-bottom: 20px;
    font-weight: bold;
   }
   
   .panel-body.myqna_panelbody {
   font-size: 15px;
    border: none;
    }
    
    .panel-footer.myqna_panelfooter {
    font-size: 15px;
    font-weight: bold;
   }
   
   h4.panel-title.myqna_paneltitle {
    font-weight: bold;
    font-size: 17px;
    font-family: 'IBMPlexSansKR-Regular';
   }
   
      
   </style>