<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 JS, CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>


<link rel='stylesheet' href='http://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css'>
<script src="http://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src='http://code.jquery.com/jquery-3.1.1.min.js'></script>

<style type="text/css">
@font-face{
	font-family: 'Binggrae';
	src:url("../../resources/css/Binggrae-Bold.ttf") format('truetype');
}
body {
	font-size: 1.2em;
	font-family: Binggrae;
}

.dropdown-toggle {
   background: #ECC45D;
   color: black;
   border: 2px solid;
   width: 7.5em;
   height: 2.8em;
   font-size: 1em;
   margin-right: 1.54em;
}
#content {
   margin: 1%;
   
}

#sidebar {
   background-color: orange !important;
   position: relative;
}

.nav-link {
   color: black;
}

.logo{
	margin-left:-5px;
	margin-top:10px;
	padding-bottom:7px;
}
.childli {
	margin-left: 1em;
}	
.mar-bottom
{
   margin-bottom: 10px;   
}
.mar-left
{
   margin-left: 10px;   
}
.mar-right
{
   margin-right: 10px;   
}
#store1, #store2{
   margin-right: 20px;
}
.floatRight {
   float: right;
}
#pieChartArea1 {
	flex-grow : row;
	width: 33.3%;
}
#pieChartArea2 {
flex-grow : row;
width: 33.3%;
}
#pieChartArea3 {
flex-grow : row;
width: 33.3%;
}
#pieChartArea {
  	margin-top: 50px;
  	display: flex;
  	flex-directory:row;
}


.chartArea {
	margin-bottom: 15px;
}
th, td {
   text-align: center;
}
</style>

<script>
var alert = function(msg, type) {
	swal({
		title:'',
		text: msg,
		type: type,
		timer: 1000,
		customClass: 'sweet-size',
		showConfirmButton: false
	});
}

var pieChart = function(){
	// 제품명 받아오기
	// 제품명 받아오기
	// 월 제품별 판매액 받아오기
	
	var data1_labels = new Array();
	var data1_datasets_data = new Array();
	<c:forEach items="${pieSushi}" var="salesSushi" varStatus="status">
		data1_labels[<c:out value="${status.index}" />] = "${salesSushi.prodName}";
		data1_datasets_data[<c:out value="${status.index}" />] = "${salesSushi.saleTotal}";
	</c:forEach>
	
	var data2_labels = new Array();
	var data2_datasets_data = new Array();
	<c:forEach items="${pieSide}" var="salesSide" varStatus="status">
		data2_labels[<c:out value="${status.index}" />] = "${salesSide.prodName}";
		data2_datasets_data[<c:out value="${status.index}" />] = "${salesSide.saleTotal}";
	</c:forEach>
	
	var data3_labels = new Array();
	var data3_datasets_data = new Array();
	<c:forEach items="${pieDrink}" var="salesDrink" varStatus="status">
		data3_labels[<c:out value="${status.index}" />] = "${salesDrink.prodName}";
		data3_datasets_data[<c:out value="${status.index}" />] = "${salesDrink.saleTotal}";
	</c:forEach>
	
	var borderColor = ['rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)','rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)','rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)','rgba(255, 159, 64, 1)','rgba(255, 159, 64, 1)']
	var backgroundColor = ['rgba(255, 99, 132, 0.5)','rgba(54, 162, 235, 0.5)','rgba(255, 206, 86, 0.5)','rgba(75, 192, 192, 0.5)','rgba(153, 102, 255, 0.5)','rgba(255, 159, 64, 0.5)','rgba(255, 159, 64, 0.5)','rgba(255, 159, 64, 0.5)']
	
	// pieChart 생성
	var data1 = {labels: data1_labels, datasets: [{data: data1_datasets_data, backgroundColor: borderColor, hoverBackgroundColor: backgroundColor}]};
	var data2 = {labels: data2_labels, datasets: [{data: data2_datasets_data, backgroundColor: borderColor, hoverBackgroundColor: backgroundColor}]};
	var data3 = {labels: data3_labels, datasets: [{data: data3_datasets_data, backgroundColor: borderColor, hoverBackgroundColor: backgroundColor}]};
	
	var options1 = {title: {display: true, text: '초밥류'}, legend: {position: 'bottom'}};
	var options2 = {title: {display: true, text: '사이드'}, legend: {position: 'bottom'}};
	var options3 = {title: {display: true, text: '주류'}, legend: {position: 'bottom'}};
	
	var ctx1 = document.getElementById('pieCanvas1').getContext('2d');
	var ctx2 = document.getElementById('pieCanvas2').getContext('2d');
	var ctx3 = document.getElementById('pieCanvas3').getContext('2d');
	
	
	var pieChart1 = new Chart(ctx1, {type: 'pie', data: data1, options: options1});
	var pieChart2 = new Chart(ctx2, {type: 'pie', data: data2, options: options2});	
	var pieChart3 = new Chart(ctx3, {type: 'pie', data: data3, options: options3});	
	 
}

var barChart = function(){

	var barLabels = new Array();
	<c:forEach items="${userList}" var="user" varStatus="status">
	barLabels[<c:out value="${status.index}" />] = "${user.userName}";
	</c:forEach>
	
	// 월 판매액 받아오기
	var datasets_data = new Array();
	<c:forEach items="${barChart}" var="bar" varStatus="status">
		datasets_data[<c:out value="${status.index}" />] = "${bar.saleTotal}";
	</c:forEach>
	
	var data = {labels: barLabels,datasets: [{data: datasets_data,
				  backgroundColor: [
   	                   'rgba(255, 99, 132, 0.2)',
   	                   'rgba(54, 162, 235, 0.2)',
   	                   'rgba(255, 206, 86, 0.2)',
   	                   'rgba(75, 192, 192, 0.2)',
   	                   'rgba(153, 102, 255, 0.2)',
   	                   'rgba(255, 159, 64, 0.2)',
   	                   'rgba(255, 159, 64, 0.2)',
   	                   'rgba(255, 159, 64, 0.2)'
                  ],
   	               borderColor: [
   	                   'rgba(255, 99, 132, 1)',
   	                   'rgba(54, 162, 235, 1)',
   	                   'rgba(255, 206, 86, 1)',
   	                   'rgba(75, 192, 192, 1)',
   	                   'rgba(153, 102, 255, 1)',
   	                   'rgba(255, 159, 64, 1)',
   	                   'rgba(255, 159, 64, 1)',
   	                   'rgba(255, 159, 64, 1)',
   	               ],
   	               borderWidth: 1
   	           }]
   	       }
	
	var option = {legend: {display: false},
				  scales: {xAxes: [{ticks: {fontSize : 15}}], 
				  yAxes: [{scaleLabel: {display: true, labelString: '매출액(원)', fontSize: 20},
				  ticks: {fontSize : 15, beginAtZero: true}}]}}
	var ctx = document.getElementById('barCanvas').getContext('2d');
	var barChart = new Chart(ctx, {type: 'bar', data: data, options: option})
}

var barChart_ajax = function(Chart_data){
	var barLabels = new Array();
	<c:forEach items="${userList}" var="user" varStatus="status">
		barLabels[<c:out value="${status.index}" />] = "${user.userName}";
	</c:forEach>
	
	// 월 판매액 받아오기
	var datasets_data = new Array();
	$(Chart_data).each(function(idx, data){
		datasets_data[idx] = data.saleTotal;
	})
	
	
	var data = {labels: barLabels,
				datasets: [{
							data: datasets_data,
								  backgroundColor: ['rgba(255, 99, 132, 0.2)',
								   	                'rgba(54, 162, 235, 0.2)',
								   	                'rgba(255, 206, 86, 0.2)',
								   	                'rgba(75, 192, 192, 0.2)',
								   	                'rgba(153, 102, 255, 0.2)',
								   	                'rgba(255, 159, 64, 0.2)',
								   	                'rgba(255, 159, 64, 0.2)',
								   	                'rgba(255, 159, 64, 0.2)'
								                   ],
								   	               borderColor: [
								   	                   'rgba(255, 99, 132, 1)',
								   	                   'rgba(54, 162, 235, 1)',
								   	                   'rgba(255, 206, 86, 1)',
								   	                   'rgba(75, 192, 192, 1)',
								   	                   'rgba(153, 102, 255, 1)',
								   	                   'rgba(255, 159, 64, 1)',
								   	                   'rgba(255, 159, 64, 1)',
								   	                   'rgba(255, 159, 64, 1)',
								   	                ],
								   	                borderWidth: 1}]}
	
	var option = {legend: {display: false},
				  scales: {xAxes: [{ticks: {fontSize : 15}}], 
				  yAxes: [{scaleLabel: {display: true, labelString: '매출액(원)', fontSize: 20},
				  ticks: {fontSize : 15, beginAtZero: true}}]}}
	var ctx = document.getElementById('barCanvas').getContext('2d');
	var barChart = new Chart(ctx, {type: 'bar', data: data, options: option})
	
	
}

var lineChart_ajax = function(lineChart, userId){
	console.log(lineChart);
	var data4_datasets_data = new Array(31);
	var end=0;
	$(lineChart).each(function(idx, lineData){
		var i = (Number(lineData.saleDate.substring(8,10)))-1;
		data4_datasets_data[i] = lineData.saleTotal;
		end = i;
	})
	$(data4_datasets_data).each(function(idx){
		if(end > idx){
			if(!data4_datasets_data[idx]){
				data4_datasets_data[idx] = 0;
			}
		}
	})
	
	var data4_labels = new Array();
	<c:forEach begin="1" end="31" var="idx" varStatus="status">
	data4_labels[<c:out value="${idx-1}" />] = "${idx}" + "일";
	</c:forEach>
	
	var borderColor = ['rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)','rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)','rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)','rgba(255, 159, 64, 1)','rgba(255, 159, 64, 1)']
	var backgroundColor = ['rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)','rgba(153, 102, 255, 0.2)','rgba(255, 159, 64, 0.2)','rgba(255, 159, 64, 0.2)','rgba(255, 159, 64, 0.2)']
	
	
	var ctx = document.getElementById('lineCanvas')
	var config = {type: 'line',
				  data: {labels: data4_labels,
				 		 datasets: [{label: "",
					 	 data: data4_datasets_data, 
					 	 borderColor: borderColor,
					 	 backgroundColor: backgroundColor,
					 	 fill: false,
					 	 lineTension: 0}]}, 
				  options: {responsive: true,
		                 	title: {display: false},
		        		 	tooltips: {mode: 'index', intersect: false},
		        		 	hover: {mode: 'nearest', intersect: true},
		        		 	legend: {display: false},
		        		 	scales: {xAxes: [{display: true, ticks: {fontSize : 15}, scaleLabel: {display: true, labelString: '일자', fontSize: 20}}],
		            				 yAxes: [{display: true, ticks: {fontSize : 15, suggestedMin: 0, suggestedMax: 10}, scaleLabel: {display: true,labelString: '매출액(원)', fontSize: 20}}]}}};
	
	var lineChart = new Chart(ctx, config);
	if(userId != 'admin'){
		$('#lineCanvas').show();
	}
};


var pieChart_ajax = function(pieChart_sushi, pieChart_side, pieChart_drink){
	// 제품명 받아오기
	// 월 제품별 판매액 받아오기
	var data1_labels = new Array();
	var data1_datasets_data = new Array();
	$(pieChart_sushi).each(function(idx, pieChart_sushi){
		data1_labels[idx] = pieChart_sushi.prodName;
		data1_datasets_data[idx] = pieChart_sushi.saleTotal;
		var end=0;
	})
	
	
	var data2_labels = new Array();
	var data2_datasets_data = new Array();
	$(pieChart_side).each(function(idx, pieChart_side){
		data2_labels[idx] = pieChart_side.prodName;
		data2_datasets_data[idx] = pieChart_side.saleTotal;
	})
	
	var data3_labels = new Array();
	var data3_datasets_data = new Array();
	$(pieChart_drink).each(function(idx, pieChart_drink){
		data3_labels[idx] = pieChart_drink.prodName;
		data3_datasets_data[idx] = pieChart_drink.saleTotal;
	})
	
	var borderColor = new Array();
	var backgroundColor = new Array();
	if(data3_datasets_data[0] != 1){
	borderColor = ['rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)','rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)','rgba(153, 102, 255, 1)','rgba(255, 159, 64, 1)','rgba(255, 159, 64, 1)','rgba(255, 159, 64, 1)']
	backgroundColor = ['rgba(255, 99, 132, 0.5)','rgba(54, 162, 235, 0.5)','rgba(255, 206, 86, 0.5)','rgba(75, 192, 192, 0.5)','rgba(153, 102, 255, 0.5)','rgba(255, 159, 64, 0.5)','rgba(255, 159, 64, 0.5)','rgba(255, 159, 64, 0.5)']
	}else{
		borderColor = ['rgba(0, 0, 0, 0.1)','rgba(0, 0, 0, 0.1)','rgba(0, 0, 0, 0.1)','rgba(0, 0, 0, 0.1)','rgba(0, 0, 0, 0.1)','rgba(0, 0, 0, 0.1)','rgba(0, 0, 0, 0.1)',];
		backgroundColor = ['rgba(0, 0, 0, 0.1)','rgba(0, 0, 0, 0.1)','rgba(0, 0, 0, 0.1)','rgba(0, 0, 0, 0.1)','rgba(0, 0, 0, 0.1)','rgba(0, 0, 0, 0.1)','rgba(0, 0, 0, 0.1)',];
	}
	// pieChart 생성
	var data1 = {labels: data1_labels, datasets: [{data: data1_datasets_data, backgroundColor: borderColor, hoverBackgroundColor: backgroundColor}]};
	var data2 = {labels: data2_labels, datasets: [{data: data2_datasets_data, backgroundColor: borderColor, hoverBackgroundColor: backgroundColor}]};
	var data3 = {labels: data3_labels, datasets: [{data: data3_datasets_data, backgroundColor: borderColor, hoverBackgroundColor: backgroundColor}]};
	
	var options1 = {title: {display: true, text: '초밥류'}, legend: {position: 'bottom'}};
	var options2 = {title: {display: true, text: '사이드'}, legend: {position: 'bottom'}};
	var options3 = {title: {display: true, text: '주류'}, legend: {position: 'bottom'}};
	
	var ctx1 = document.getElementById('pieCanvas1').getContext('2d');
	var ctx2 = document.getElementById('pieCanvas2').getContext('2d');
	var ctx3 = document.getElementById('pieCanvas3').getContext('2d');
	
	var pieChart1 = new Chart(ctx1, {type: 'pie', data: data1, options: options1});
	var pieChart2 = new Chart(ctx2, {type: 'pie', data: data2, options: options2});	
	var pieChart3 = new Chart(ctx3, {type: 'pie', data: data3, options: options3});	
}



var search1 = function(){
	var YY = $('#year1').val();
	var mm = $('#month1').val();
	var dd = $('#day2').val();
	var MM = '';
	if(mm.length < 2){
		MM = '0' + $('#month1').val();
	}
	else {
		MM = $('#month1').val();
	}
	if(dd.length < 2){
		DD = '0' + $('#day2').val();
	}
	else {
		DD = $('#day2').val();
	}
	
	$('#listTable').empty();
	var YYMM = YY + '/' + MM;
	var YYMMDD = YY + '/' + MM + '/' + DD;
	var userId = $('#searchId1 option:selected').val();
	
	
	
	
	$.ajax({
		method: 'POST',
		url: 'search1',
		data: {userId: userId, YYMM: YYMM, YYMMDD: YYMMDD},
		success: function(results){
			var barChart = results.barChart;
			var lineChart = results.lineChart;
			var pieSushi = results.pieSushi;
			var pieSide = results.pieSide;
			var pieDrink = results.pieDrink;
			
			console.log(lineChart);
			
			if(userId == 'admin'){
				$('#barCanvas').show();
		        $('#lineCanvas').hide();
		        
				$("#barCanvas").remove();
				$("#barChartArea").after('<canvas id="barCanvas" width="100" height="25"></canvas>');
				barChart_ajax(barChart, userId);
			}else{
				$('#barCanvas').hide();
		        $('#lineCanvas').show();
		        
				$("#lineCanvas").remove();
				$("#lineChartArea").after('<canvas id="lineCanvas" width="100" height="25" style="display: none;"></canvas>');
				lineChart_ajax(lineChart, userId);
			}
			
			$("#pieCanvas1").remove();
			$("#temp1").after('<canvas id="pieCanvas1"></canvas>');
			$("#pieCanvas2").remove();
			$("#temp2").after('<canvas id="pieCanvas2"></canvas>');
			$("#pieCanvas3").remove();
			$("#temp3").after('<canvas id="pieCanvas3"></canvas>');
			
			pieChart_ajax(pieSushi, pieSide, pieDrink);
			
			
			
			
			if(results.listTable.length > 0){
				var resultList = [];
				$(results.listTable).each(function(idx, result){
					resultList.push(
						'<tr>' + 
							'<td>' + result.userName + '</td>' +
							'<td>' + result.saleDate + '</td>' +
							'<td>' + result.saleNo + '</td>' +
							'<td>' + result.prodName + '</td>' +
							'<td>' + result.prodPrice + '</td>' +
							'<td>' + result.saleCnt + '</td>' +
							'<td>' + result.salePay + '</td>' +
						'<tr>'
					);
				});
				$('#listTable').append(resultList.join(''));
			}else{
				$('#listTable').empty();
				$('#listTable').append(
					'<tr><td colspan="7"><b>매출이 없습니다.</b></td></tr>');		
			}
			
		},
		error: function(a, b, errMsg){
			alert(errMsg, 'error');	
		}
	});
};


var search2 = function(){
	var YY = $('#year2').val();
	var MM = $('#month2').val();
	var dd = $('#day2').val();
	var DD = '';
	if(dd.length < 2){
		DD = '0' + $('#day2').val();
	}
	else {
		DD = $('#day2').val();
	}
	
	
	$('#listTable').empty();
	var userId = $('#searchId2 option:selected').val();
	var searchDate = YY + '/' + MM + '/' + DD;
	$.ajax({
		method: 'POST',
		url: 'search2',
		data: {userId: userId, searchDate: searchDate},
		success: function(results){
			if(results.length > 0){
				var resultList = [];
				$(results).each(function(idx, result){
					resultList.push(
						'<tr>' + 
							'<td>' + result.userName + '</td>' +
							'<td>' + result.saleDate + '</td>' +
							'<td>' + result.saleNo + '</td>' +
							'<td>' + result.prodName + '</td>' +
							'<td>' + result.prodPrice + '</td>' +
							'<td>' + result.saleCnt + '</td>' +
							'<td>' + result.salePay + '</td>' +
						'<tr>'
					);
				});
				$('#listTable').append(resultList.join(''));
			}else{
				$('#listTable').empty();
				$('#listTable').append(
					'<tr><td colspan="7"><b>매출이 없습니다.</b></td></tr>');		
			}
		},
		error: function(a, b, errMsg){
			alert(errMsg, 'error');	
		}
	});
};




$(document).ready(function(){
	$('#search1').bind('click', search1);
	$('#search2').bind('click', search2);
	barChart();
	pieChart();
	
	
})

      			
</script>



</head>
<body onload="search1()">
   <div class="container-fluid">
      <div class="row">
         <nav class="col-md-2 d-none d-md-block bg-light sidebar" id="sidebar">
            <div class="sidebar-sticky">
               <ul class="nav flex-column">
                  <li class="nav-item"><a class="nav-link active"
                     href="../main"> <span data-feather="home"></span>
                        <h2 class="logo">
                           <strong>LOGO</strong>
                        </h2><hr> <span class="sr-only"></span>
                  </a></li>
                  <li class="nav-item"><a class="nav-link" href="saleList"> <span
                        data-feather="file"></span>
                     <p class="childli">매출 조회</p>
                  </a>
                  <a class="nav-link" href="../user/list"> <span
                        data-feather="file"></span>
                     <p class="childli">가맹점</p>
                  </a>
                  <a class="nav-link" href="../product/list"> <span
                        data-feather="file"></span>
                     <p class="childli">제품 목록</p>
                  </a>
                  </li>
               </ul>
            </div>
         </nav>

         <div role="main" class="col-md-10 ml-sm-auto col-lg-10">
         <div id="top"
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">&nbsp;스시오</h1>
            <div class="btn-toolbar mb-2 mb-md-0">
               <div class="dropdown">
                     <button class="btn btn-warning dropdown-toggle" type="button"
                        id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">${user.userName}</button>
                     <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                        <button class="dropdown-item" type="button">
                           <a href="../user/join">가맹점 등록</a>
                        </button>
                        <button class="dropdown-item" type="button">
                           <a href="../user/logout">로그아웃</a>
                        </button>
                     </div>
                  </div>
            </div>
         </div>

            <div id="content">
               <h3>매출조회</h3><br>
               <form id="chartForm" class="form-inline mar-bottom">
                  <div class="form-group">
                     <select id="searchId1" class="form-control input-sm">
                     	<option selected="selected" value="${user.userId}">지점선택</option>
                        <c:forEach items="${userList}" var="users">
                        	<option value="${users.userId}">${users.userName}</option>
                     	</c:forEach>
                     </select>
                     <select id="year1" class="form-control">
                     	<option selected="selected" value="${year}">${year}년</option>
                     	<option value="${year-1}">${year-1}년</option>
                     	<option value="${year-2}">${year-2}년</option>
                     	<option value="${year-3}">${year-3}년</option>
                     	<option value="${year-4}">${year-4}년</option>
                     </select>
                     <select id="month1" class="form-control">
                     	<c:forEach var="i" begin="1" end="12">
                     		<c:choose>
                     			<c:when test="${i == month}">
                     				<option selected="selected" value="${i}">${i}월</option>
                     			</c:when>
                     			<c:otherwise>
                     				<option value="${i}">${i}월</option>
                     			</c:otherwise>
                     		</c:choose>
                     	</c:forEach>
                     </select>
                     <button id="search1" type="button" class="btn btn-secondary floatRight">조회</button>
                  </div>
                  <button type="button" class="btn btn-secondary floatRight" data-toggle="modal" data-target=".bd-example-modal-xl">리스트</button>
                  <button type="button" class="btn btn-secondary floatRight">새로고침</button>
               </form>
               <div id="chartArea">
               		<div class="chartArea">
               			<div id="barChartArea">
               				<canvas id="barCanvas" width="100" height="25"></canvas>
               			</div>
               			<div id="lineChartArea">
               				<canvas id="lineCanvas" width="100" height="25" style="display:none;"></canvas>
               			</div>
               		</div>
               		<div id="pieChartArea">
               			<div id="pieChartArea1">
               				<div id="temp1"></div>
               				<canvas id="pieCanvas1" ></canvas>
               			</div>
						<div id="pieChartArea2">
							<div id="temp2"></div>
               				<canvas id="pieCanvas2"></canvas>
               			</div>
               			<div id="pieChartArea3">
               				<div id="temp3"></div>
               				<canvas id="pieCanvas3"></canvas>
               			</div>
               		</div>
               </div>
               
               <div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-xl">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title" id="exampleModalCenterTitle">매출조회</h5>
                        </div>
                        <div class="modal-body">
                           <form id="listForm" action="downloadExcelFile" method="post" class="form-inline mar-bottom">
                              <div class="form-group">
                                 <select id="searchId2" name="userId" class="form-control input-sm">
                                 	<option selected="selected" value="${user.userId}">지점선택</option>
			                        <c:forEach items="${userList}" var="users">
			                     		<option value="${users.userId}">${users.userName}</option>
			                     	</c:forEach>
			                     </select>
			                     <select id="year2" name="year2" class="form-control" >
			                     	<option selected="selected" value="${year}">${year}년</option>
			                     	<option value="${year-1}">${year-1}년</option>
			                     	<option value="${year-2}">${year-2}년</option>
			                     	<option value="${year-3}">${year-3}년</option>
			                     	<option value="${year-4}">${year-4}년</option>
			                     </select>
			                     <select id="month2" name="month2" class="form-control">
			                     	<c:forEach var="i" begin="1" end="12">
			                     		<c:choose>
			                     			<c:when test="${i == month}">
			                     				<option selected="selected" value="${i}">${i}월</option>
			                     			</c:when>
			                     			<c:otherwise>
			                     				<option value="${i}">${i}월</option>
			                     			</c:otherwise>
			                     		</c:choose>
			                     	</c:forEach>
			                     </select>
			                     <select id="day2" class="form-control">
			                     	<c:forEach var="i" begin="1" end="31">
			                     		<c:choose>
			                     			<c:when test="${i == day}">
			                     				<option selected="selected" value="${i}">${i}일</option>
			                     			</c:when>
			                     			<c:otherwise>
			                     				<option value="${i}">${i}일</option>
			                     			</c:otherwise>
			                     		</c:choose>
			                     	</c:forEach>
			                     </select>
                              </div>
                              <button id="search2" type="button" class="btn btn-secondary floatRight">조회</button>
                              <button type="submit" class="btn btn-secondary floatRight" data-toggle="modal" data-target=".bd-example-modal-xl">Excel</button>
                              <button type="button" class="btn btn-secondary floatRight">새로고침</button>
                           </form>
                           <table class="table table-hover table-sm">
                              <thead>
                                 <tr>
                                 	<td>가맹지점</td>
                                 	<td>거래날짜</td>
                                 	<td>주문번호</td>
                                 	<td>제품명</td>
                                 	<td>판매단가</td>
                                 	<td>판매수량</td>
                                 	<td>판매금액</td>
                                 </tr>
                              </thead>
                              <tbody id="listTable">
                              	
                              	<c:choose>
                              		<c:when test="${empty listTable}">
		                              	<tr>
                              	 			<td colspan="7"><b>매출이 없습니다.</b></td>
                              	 		</tr>
                              	 	</c:when>
                              	 	<c:otherwise>
                              	 		<c:forEach items="${listTable}" var="list">
			                              	 <tr>
			                              	 	<td>${list.userName}</td>
			                              	 	<td>${list.saleDate}</td>
			                              	 	<td>${list.saleNo}</td>
			                              	 	<td>${list.prodName}</td>
			                              	 	<td>${list.prodPrice}</td>
			                              	 	<td>${list.saleCnt}</td>
			                              	 	<td>${list.salePay}</td>
			                              	 </tr>
		                              	 </c:forEach>
                              	 	</c:otherwise>
                              	 </c:choose>
                              	
                              </tbody>
                              <tfoot>
                                 
                              </tfoot>
                           </table>
                        </div>
                        <div class="modal-footer">
                           <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <hr>
         </div>
      </div>
   </div>
</body>
</html>