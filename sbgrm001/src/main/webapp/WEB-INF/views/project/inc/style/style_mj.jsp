<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.selectChoice {				/*  2021-10-29 */
    text-align: right;
    margin-bottom: 65px;
	}
	
	/* 2021 10 06 */
	
	.photoRoom {				/*  2021-10-29 */
    height: 170px;
    margin-top: -50px;
    margin-bottom: 100px;
	}
	.photoRoom img {			/*  2021-10-29 */
    width: 100%;
    height:150px;
	}
	
	.photoRoom .col-sm-3 h4 {
    margin-top: 20px;
    
	}
	
	/* 2021  10  11 */
	.addOption_mj >  .col-sm-3 {
    margin-top: 15px;
    margin-bottom: 15px;
    margin-right: -80px;
    margin-left: 80px;
	}
	
	
	.addOption_mj >  .col-sm-6 {
    margin-top: 15px;
    margin-bottom: 15px;
    margin-right: -80px;
    margin-left: 80px;
	}
	
	.addOption_mj > .col-sm-6 > .col-sm-4 {
    margin-left: 10px;
    margin-right: -53px;
	}
	
	.panel-body {
    border: 2px solid darkred;
	}
	
	.body_mj {					/* 2021-10-29  */
    border: 2px solid darkred;
    margin-top: -93px;
    margin-bottom: 100px;
    display: none;
	}
	
	.etcOption_mj > .col-sm-3 {
    margin-top: 15px;
    margin-bottom: 15px;
    margin-left: 60px;
    margin-right: -60px;
	}
	.textOption {
    margin-top: 15px;
    margin-bottom: 15px;
    margin-left: 60px;
    margin-right: -60px;
	}
	
	.totalCharge {  			/* 2021-10-29  */
    background: white;
    padding: 35px;
    border-top: 2px solid darkred;
    position: fixed;
    left: 0px;
    width: 100%;
    bottom: 0;
	}

	/* .inner {
    margin-top: 35px;
    margin-left: 150px;
	} */
	
	.totalCharge > .container > .up_btn > img{
	width: 39px;
    display: block;
    background: white;
    margin:0 auto;
    border-radius: 50%;
	}
	
	.up_btn > img:hover{
	cursor:pointer;
	}
	
	.up_btn{
    margin-top: -55px;
    height:40px;
	}
	
	.reserve_scroll{	
    width: 100%;
    height: 400px;
    display: none;
    background: #fef2d8;
    position: absolute;
    bottom: 92px;
    left:0;
	font-size:20px;
	font-family: sans-serif;
	border:2px solid darkred;
	}
	
	.detail_fee{
	margin-top:  25px;
	}
	
	.detail_fee > .col-sm-3 , .detail_fee > .col-sm-7 , .detail_fee > .col-sm-10{   /*  2021-11-08  */
	border-bottom: 3px solid black;
	padding-bottom: 5px;
	}
	
	
	/* 	2021 10 18 객실 + 요금 */
	.roomNum{
	margin-right:  15px;
	}
	
	.roomNum > .col-sm-3, .roomNum > .col-sm-7 {
    border-bottom: 3px solid black;
    padding-top: 20px;
    padding-bottom: 5px;
	}
	
	/* 	2021 10 18	roomPrice	 */
	.text-leftPrice {
    margin-left: 158px;
    padding-top: 20px;
	}
	
	.text-middle {
    margin-left: -90px;
    padding-top: 20px;
	}
	
	.text-rightPrice {			/*  2021-11-05  */
    margin-left: -40px;
    padding-top: 20px;
	}
	
	
	.vatText{
	position: absolute;
    width: 100%;
    bottom: 40px;
	}
	
	.vatText > .col-sm-10{
    font-size: 11px;
    color: #999;
    height: 14px;
    }
	
	.down_btn{
	margin-top: -20px;
    height:40px;
	}
	.down_btn > img:hover{
	cursor:pointer;
	}
	
	.glyphicon-plus:hover , .glyphicon-minus:hover {
		cursor:pointer;
	}
	
	.totalCharge > .reserve_scroll > .down_btn > img{
	width: 39px;
    display: block;
    background: white;
    margin:0 auto;
    border-radius: 50%;
	}
	
	.in_mj{					/* 2021-11-08  */
	display:none;
	margin-left: -74px;
    margin-top: 15px;
    position: absolute;
    z-index: 99 !important;
    background-color: #ebdccc;
    left: -70px;
    top: 46px;
	}
	
	.out_mj{
	display:none;
	margin-left: 10px;
    margin-top: 15px;
    position: absolute;
    z-index: 99 !important;
    background-color: #ebdccc;
    top: 46px;
    left: -40px; 
	}
	.redonePage_mj {			
	padding-top: 10	px	;
	text-align: center;
	padding-bottom: 10px;
	}
	.startCalendar_mj > table , .endCalendar_mj > table {		/* 2021-11-08  */
		margin-bottom:0px;
	}
	
	
	.qcontent_mj {
    padding: 10px;
	}
	

	.popup_in_mj {
    width: 376px;
    height: 244px;
    background: white;
    position: absolute;
    top: 346px;
    left: 14%;
    index: 99 !important;
    display: none;
    margin-left: -68px;
    margin-top: 15px;
    }
	
	.popup_out_mj{
	width: 376px;
    height: 244px;
    background: white;
    position: absolute;
    top: 346px;
    left: 34%;
    index: 99 !important;
	display:none;
	margin-left: 26px;
    margin-top: 15px;
	}
	
	/* 2021-11-12*/
	
	.infoMenu_mj{
	   list-style:none;
	}
	
	.info_mj{
		display : block;
		height : 47px;
	    border-bottom: 3px solid #432c10;
	}
	
	.totalcontainer_1{
		padding: 65px 0 0 0;
	}
	
	.clicken{
	color: black;
    text-decoration: none;

	}
	
	
	/* 이거 다시 */
	/* .hotelInfo_mj .infoMenu_mj>li>a.clicken:active{
		background-color : white;
		border : 1px solid red;
		margin : 10px  0;
	} */
	
	/* .clicken a:visited{
	background-color: red;
	} */
	
	
	.hotelInfo_mj {
    width: 216 px ; 
    border: #e9dab8 solid 1px ; 
    background: #f1e3c4; 
    padding: 23px ; 
    margin: 0 0 30px 0;
    
	}
	.hotelInfo_mj  li{
	margin: 30px -5px;
    color: black;
    text-decoration: none;
	}
	
	
	
	h1, h2, h3, h4, h5, h6, h7, form {
    font-size: 100%;
    font-weight: normal;
   	padding : 0;
   	margin : 0;
	}
	
	.titleHotel{
    margin: 0 0 29 px 0; 
    height: 53 px ;
    display: block;
    text-indent: 10%; 
    overflow: hidden;
    /* font-size: 1.5em; */
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    padding: 10px 0 10px 0;
    border-bottom: 5px solid #432c10;
    }
	
	.causeMachen_mj {
	/* h3 태그 */
    font-size: 25px;
	}
	
	.menu2_mj{
	
	}
	
	.videoSize_mj {
   	padding: 25px 130px;
	}
	
	.des_1 { 
	padding: 30px 5px ; 
	}
	
	.descriptionMappen_mj {
    border:   1px   solid   #432c10;
    padding:  10px   0   300px   0;
	}
	
	.desc2_mj{
	padding: 40px 0px ;
	}
	
	/* QR CODE img 사이즈 */
	.QRsize_mj {
    width: 170px ; 
    }
	.QRsizedg_mj {
    padding: 14px   0px; 
    width: 148px ; 
    }
	 .doubleIDCheck{
    margin: -30px 320px ;
    }
    	
	/* 공지사항 */
	#notice {
	 width: 405px; 
	 text-align: justify; 
	 padding: 10px; 
	 position: absolute; 
	 top: 20%;
	 left: 15%; 
	 font-size: 80%; 
	 z-index:1;
	 }
	 
	#notice img{width : 188px;}
	#notice h3{
	text-align:center;
	font-size: 25px; 
	background-color: #F0DBBE;
    margin: 1px 0 18px 0;
	}
	.ppp{text-align: right;}

	.javaYoutube{    margin: 0px 0px 14px 19px;}
	.jspYoutube{    margin: -30px 0px 15px 230px;}
    
    
    
    /* 호텔 안내	*/
    /* 2021-12-09 */
    
    .roomInfo {
    padding: 28px 0;
	}
	.roomInfo2 {
    margin: 140px 0px;
	}    
    .roomInfoImg {
    vertical-align: middle;
    padding: 20px 0;
    width: 90%;
    margin: 0 43px;
	}    
    h3.stadardH3 {
    font-size: 20px;
    padding: 2px 2px;
    border-bottom: #e9dab8 solid 3px;
    width: 137px;
    margin: 0 13px;
	}
	.kleinDesc {
    padding-left: 93px;
	}
	
	
	 /*  .jspMappenInfo {
    margin: 100px 0px;
    width: 388px;
    height: 182px;
	} */
	.jspMappenInfo {
    width: 388px;
    height: 287px;
	}
    
	</style>