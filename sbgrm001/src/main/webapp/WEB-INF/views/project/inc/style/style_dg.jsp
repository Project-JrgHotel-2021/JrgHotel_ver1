<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	footer > p {
		color:white;
	}
	footer{
		margin-top:15px;
	}
	.checkin > dt {
		text-align:center;
	}
	.hotelsearch , .checkin , .checkout ,.adult , .kid , .search{
		margin-right:0px;
	}
	.fast_reserve{
		width:100%;
		height:70px;
		text-align:center;
	}
	.reserve_dg{ 	
	    margin: 20px auto;
	    border-bottom: 1px solid gray;
	}
	.reverse_dg > .col-sm-2 {
		min-width:190px;
	}
	.adult , .kid {
		text-align:center;
	}
	.searchbtn{
		width:100px;
		height: 45px;
		background:black;
		color:white;
	}
	.reserve_dg span:hover , .reserve_dg p:hover{
		cursor:pointer;
	}
	.location_dg{
		
		min-width:400px;
	}
	.question_dg{
		
		min-width:400px;
	}
	.location_dg > .col-sm-2 {
		padding-left:0px;
		padding-right:30px;
		margin-bottom:5px;
	}
	.lo1:hover , .lo2:hover , .lo3:hover{
		cursor:pointer;
	}
	.popup_lo_dg{
		width: 1000px;
	    height: 500px;
	    background: white;
	    position: absolute;
	    top: 105px;
	    left: 20%;
	    z-index: 99 !important;
	    display:none;
	}
	.popup_location_dg{
		height:100px;
		border-bottom:1px solid black;
		
	}
	.popup_location_dg > .col-sm-1 {
		width:100px;
		border:1px solid black;
		text-align:center;
		margin:20px;
		padding-top:15px;
		padding-bottom:15px;
		font-size:15px;
	}
	.img_dg{
		min-width:1170px;
		height:500px;
	}
	.lo_img_dg{
		width: 390px;
	    height: 350px;
	    margin-top: 20px;
	}
	.hotel_lo , .hotel_desc , .hotel_addr {
		font-size: 20px;
    	margin-top: 20px;
    	margin-bottom: 50px;
    	font-family: sans-serif;
	}
	.question_dg > .panel {
		margin-bottom:0px;
	}
	.popup_location_dg > .btn-colored:hover{
		cursor:pointer;
	}
	.locationCheck{
		position: absolute;
   		bottom: 30px;
   	 	right: 248px;
	}
	.locationCheck > input {
		width:100px;
	}
	.popup_lo_dg_rePage{
		width: 1000px;
	    height: 500px;
	    background: white;
	    position: absolute;
	    top: 185px;
	    left: 22%;
	    z-index: 99 !important;
	    display: none;
	    border: 1px solid black;
	}
	.text-leftPrice_dg {
    margin-left: 158px;
    padding-top: 8px;
    font-size: 15px;
	}
	
	.text-middle_dg {
    margin-left: -90px;
    padding-top: 8px;
    font-size: 15px;
	}
	
	.text-rightPrice_dg {
    margin-left: -40px;
    padding-top: 8px;
    font-size: 15px;
	}
	
	.emptyLo{
		height:400px;
		display:none;
	}
	
	.checkPopupLo{
		display:none;
		position: fixed;
	    width: 100vw;
	    height: 100vh;
	    left: 0px;
	    bottom: 0px;
	    background: #191a1bb8;
	    z-index: 99 !important;
	}
	.popup_check{
		width: 300px;
	    height: 245px;
	    background:  #191a1bf7;
	    text-align: center;
	    margin: 0 auto;
    	margin-top: 335px;
	}
	.form_class{
		padding-top: 40px;
	}
	.form_class > .btn {
		margin-left:10px;
		margin-right:10px;
	}
	.check_text{
		padding-top: 70px;
	    color: white;
	    font-size: 20px;
	}
	
	.yearMonth > .col-sm-2 , .yearMonth > .col-sm-1 , .yearMonth > .col-sm-3 {
		padding:0px;
	}
	.nextMonthIn:hover , .preMonthIn:hover , .nextMonthOut:hover , .preMonthOut:hover{
		cursor:pointer;
	}
	
	.checkInChoice:hover , .checkOutChoice:hover {
		cursor:pointer;
	}
	
	
	/* 2021-12-02 */
   .container.row.reserve_dg {
       border: 2px solid #A18866;
       padding-top: 25px;
       padding-bottom: 10px;
   }
   
   dt.hotelsearch_dt {
       font-size: 16px;
       font-weight: bold;
       color: gray;
   }

   dt.checkIn_mj {
      font-size: 16px;
       font-weight: bold;
       color: gray;
   }
   
   dt.checkOut_mj {
      font-size: 16px;
       font-weight: bold;
       color: gray;
   }
   input#search {
    width: 110px;
    height: 50px;
    background: #3D1919;
    border-radius: 0px;
}

   .hotelguide > h3 {
       font-size: 35px;
       text-align: center;
       margin-top: 50px;
       font-family: 'Pretendard-Regular';
   }
   
   .hotelguide > p {
    border: 1px solid #C2B7A9;
    margin: 10px 400px 10px 400px;
   }
   .hotelguide > h2 {
    font-size: 20px;
    color: #C2B7A9;
    text-align: center;
    font-family: 'MaruBuri-Regular';
    margin-bottom: 30px;
}

   .col-sm-5.location_dg {
       background: #E7E3DD;
       border-radius: 5px;
       padding: 25px;
   }
   .location_dg > h3.panel-heading {
    font-size: 20px;
    font-weight: bold;
    font-family: 'Pretendard-Regular';
    text-align: center;
    padding-bottom: 20px;
   }

   .col-sm-5.question_dg {
       background: #E7E3DD;
       padding: 25px;
       height: 515px;
       border-radius: 5px;
   }
   
   .question_dg > h3.panel-heading {
    font-size: 20px;
    font-weight: bold;
    font-family: 'Pretendard-Regular';
    text-align: center;
    padding-bottom: 20px;
}

.pofol > h3.panel-heading {
    font-size: 25px;
    font-family: 'GowunBatang-Regular';
    margin-top: 30px;
    margin-bottom: 15px;
}

.row.pofoldetail {
    background: #E9E8E7;
    padding-top: 40px;
    padding-bottom: 40px;
    border-radius: 5px;
}

.row.pofolaudio {
    margin: 50px 100px 70px 100px;
}
   .row.pofolaudio>.col-sm-4.text-center>h2 {
    font-size: 18px;
    margin-bottom: 15px;
}

span.glyphicon.glyphicon-menu-left {
    color: gray;
}

span.glyphicon.glyphicon-menu-right {
    color: gray;
}

.freservationservice > p {
    background: #eee;
    margin: 30px 370px 30px 370px;
    padding: 20px;
    font-size: 15px;
    /* font-weight: bold; */
    color: #929190;
}

.lo1 {
    border: 1px solid #fff;
    background: #fff;
    padding-left: 11px;
    width: 54px;
    margin: 10px;
    font-size: 15px;
    font-family: 'Pretendard-Regular';
    border-radius: 5px;
    color: gray;
}

.lo2 {
    border: 1px solid #fff;
    background: #fff;
    padding-left: 11px;
    width: 54px;
    margin: 10px;
    font-size: 15px;
    font-family: 'Pretendard-Regular';
    border-radius: 5px;
    color: gray;
}

.lo3 {
    border: 1px solid #fff;
    background: #fff;
    padding-left: 11px;
    width: 54px;
    margin: 10px;
    font-size: 15px;
    font-family: 'Pretendard-Regular';
    border-radius: 5px;
    color: gray;
}
.col-sm-7.hotelDesc {
    border: 2px solid #A18866;
    margin-top: 20px;
    width: 570px;
    height: 300px;
}

.pofolreport {
    margin-left: 260px;
    background: #FFD581;
    padding: 10px;
     height: auto;
    margin-top: 15px;
}

</style>
 --%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
@font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'JSongMyung-Regular-KO';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/JSongMyung-Regular-KO.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'MaruBuri-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/MaruBuri-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GowunBatang-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


   footer > p {
      color:white;
   }
   footer{
      margin-top:15px;
   }
   .checkin > dt {
      text-align:center;
   }
   .hotelsearch , .checkin , .checkout ,.adult , .kid , .search{
      margin-right:0px;
   }
   .fast_reserve{
      width:100%;
      height:70px;
      text-align:center;
   }
   .reserve_dg{    
       margin: 20px auto;
       border-bottom: 1px solid gray;
   }
   .reverse_dg > .col-sm-2 {
      min-width:190px;
   }
   .adult , .kid {
      text-align:center;
   }
   .searchbtn{
      width:100px;
      height: 45px;
      background:black;
      color:white;
   }
   .reserve_dg span:hover , .reserve_dg p:hover{
      cursor:pointer;
   }
   .location_dg{
      
      min-width:400px;
   }
   .question_dg{
      
      min-width:400px;
   }
   .location_dg > .col-sm-2 {
      padding-left:0px;
      padding-right:30px;
      margin-bottom:5px;
   }
   .lo1:hover , .lo2:hover , .lo3:hover{
      cursor:pointer;
   }
   .popup_lo_dg{
      width: 1000px;
       height: 500px;
       background: white;
       position: absolute;
       top: 200px;
       left: 20%;
       z-index: 99 !important;
       display:none;
   }
   .popup_location_dg{
      height:100px;
      border-bottom:1px solid black;
      
   }
   .popup_location_dg > .col-sm-1 {
      width:100px;
      border:0px solid black;
      text-align:center;
      margin:20px;
      padding-top:15px;
      padding-bottom:15px;
      font-size:15px;
   }
   .img_dg{
      min-width:1170px;
      height:500px;
   }
   .lo_img_dg{
      width: 390px;
       height: 350px;
       margin-top: 20px;
   }
   .hotel_lo , .hotel_desc , .hotel_addr {
      font-size: 20px;
       margin-top: 20px;
       margin-bottom: 50px;
       font-family: sans-serif;
   }
   .question_dg > .panel {
      margin-bottom:0px;
   }
   .popup_location_dg > .btn-colored:hover{
      cursor:pointer;
   }
   .locationCheck{
      position: absolute;
         bottom: 30px;
          right: 248px;
   }
   .locationCheck > input {
      width:100px;
   }
   .popup_lo_dg_rePage{
      width: 1000px;
       height: 500px;
       background: white;
       position: absolute;
       top: 185px;
       left: 22%;
       z-index: 99 !important;
       display: none;
       border: 1px solid black;
   }
   .text-leftPrice_dg {
    margin-left: 158px;
    padding-top: 8px;
    font-size: 15px;
   }
   
   .text-middle_dg {
    margin-left: -90px;
    padding-top: 8px;
    font-size: 15px;
   }
   
   .text-rightPrice_dg {
    margin-left: -40px;
    padding-top: 8px;
    font-size: 15px;
   }
   
   .emptyLo{
      height:400px;
      display:none;
   }
   
   .checkPopupLo{
      display:none;
      position: fixed;
       width: 100vw;
       height: 100vh;
       left: 0px;
       bottom: 0px;
       background: #191a1bb8;
       z-index: 99 !important;
   }
   .popup_check{
      width: 300px;
       height: 245px;
       background:  #191a1bf7;
       text-align: center;
       margin: 0 auto;
       margin-top: 335px;
   }
   .form_class{
      padding-top: 40px;
   }
   .form_class > .btn {
      margin-left:10px;
      margin-right:10px;
   }
   .check_text{
      padding-top: 70px;
       color: white;
       font-size: 20px;
   }
   
   .yearMonth > .col-sm-2 , .yearMonth > .col-sm-1 , .yearMonth > .col-sm-3 {
      padding:0px;
   }
   .nextMonthIn:hover , .preMonthIn:hover , .nextMonthOut:hover , .preMonthOut:hover{
      cursor:pointer;
   }
   
   .checkInChoice:hover , .checkOutChoice:hover {
      cursor:pointer;
   }
   
   /* 2021-12-02 */
   .container.row.reserve_dg {
       border: 2px solid #A18866;
       padding-top: 25px;
       padding-bottom: 10px;
   }
   
   dt.hotelsearch_dt {
       font-size: 16px;
       font-weight: bold;
       color: gray;
   }

   dt.checkIn_mj {
      font-size: 16px;
       font-weight: bold;
       color: gray;
   }
   
   dt.checkOut_mj {
      font-size: 16px;
       font-weight: bold;
       color: gray;
   }
   input#search {
    width: 110px;
    height: 50px;
    background: #3D1919;
    border-radius: 0px;
}

   .hotelguide > h3 {
       font-size: 35px;
       text-align: center;
       margin-top: 50px;
       font-family: 'Pretendard-Regular';
   }
   
   .hotelguide > p {
    border: 1px solid #C2B7A9;
    margin: 10px 400px 10px 400px;
   }
   .hotelguide > h2 {
    font-size: 20px;
    color: #C2B7A9;
    text-align: center;
    font-family: 'MaruBuri-Regular';
    margin-bottom: 30px;
}

   .col-sm-5.location_dg {
       background: #E7E3DD;
       border-radius: 5px;
       padding: 25px;
   }
   .location_dg > h3.panel-heading {
    font-size: 20px;
    font-weight: bold;
    font-family: 'Pretendard-Regular';
    text-align: center;
    padding-bottom: 20px;
   }

   .col-sm-5.question_dg {
       background: #E7E3DD;
       padding: 25px;
       height: 515px;
       border-radius: 5px;
   }
   
   .question_dg > h3.panel-heading {
    font-size: 20px;
    font-weight: bold;
    font-family: 'Pretendard-Regular';
    text-align: center;
    padding-bottom: 20px;
}

.pofol > h3.panel-heading {
    font-size: 25px;
    font-family: 'GowunBatang-Regular';
    margin-top: 30px;
    margin-bottom: 15px;
}

.pofoldetail {
    background: #E9E8E7;
    padding-top: 40px;
    padding-bottom: 40px;
    border-radius: 5px;
}

.row.pofolaudio {
    margin: 50px 100px 70px 100px;
}

.row.pofolaudio>.col-sm-4.text-center>h2 {
    font-size: 18px;
    margin-bottom: 15px;
}

.row.pofolaudio> .col-sm-4 {
    margin: 0 0 0 -35px;
}


span.glyphicon.glyphicon-menu-left {
    color: gray;
}

span.glyphicon.glyphicon-menu-right {
    color: gray;
}

.freservationservice > p {
    background: #eee;
    margin: 17px 141px;
    padding: 20px;
    font-size: 15px;
    /* font-weight: bold; */
    color: #929190;
}

.lo1 {
    border: 1px solid #fff;
    background: #fff;
    padding-left: 11px;
    width: 54px;
    margin: 10px;
    font-size: 15px;
    font-family: 'Pretendard-Regular';
    border-radius: 5px;
    color: gray;
}

.lo2 {
    border: 1px solid #fff;
    background: #fff;
    padding-left: 11px;
    width: 54px;
    margin: 10px;
    font-size: 15px;
    font-family: 'Pretendard-Regular';
    border-radius: 5px;
    color: gray;
}

.lo3 {
    border: 1px solid #fff;
    background: #fff;
    padding-left: 11px;
    width: 54px;
    margin: 10px;
    font-size: 15px;
    font-family: 'Pretendard-Regular';
    border-radius: 5px;
    color: gray;
}
.col-sm-7.hotelDesc {
    border: 2px solid #A18866;
    margin-top: 20px;
    width: 570px;
    height: 300px;
}

/*2021-12-09 yr */


.pofolreport {
    margin-left: 290px;
    margin-right: -65px;
    background: #FFD581;
    padding: 10px;
    height: auto;
    margin-top: 15px;
}

/* 2021-12-10 mj */
.portfolio_back{   
	background: #E7E3DD;
    border-radius: 5px;
    padding: 25px 0;
}
</style>