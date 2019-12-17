<%@page import="parkjonghyun.foodstore.user.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src='http://code.jquery.com/jquery-3.1.1.min.js'></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

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

.imgdiv {
	overflow: auto;
}

.img3 {
	float: left;
	background: #58FA82;
	border: 2px black solid;
	border-radius: 10%;
	width: 30%;
	height: 10em;
	display: table;
}

#img3 {
	margin-left: 5%;
	margin-right: 5%;
	margin-bottom: 3%;
}

.img3a {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

.img2 {
	float: left;
	background: white;
	border: 2px black solid;
	border-radius: 5%;
	width: 45%;
	height: 10em;
	display: table;
}

#img2 {
	margin-left: 10%;
	margin-bottom: 3%;
}

.img2p {
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

#context {
   margin-top: 3%;
   margin-left: 5%;
   margin-right: 0%;
   margin-bottom: 17%;
}

#carousel-set {
	background-color: lightgray;
	border: 2px black solid;
	height: 30em;
}

#sidebar {
   font-size: 19px;
   background-color: orange !important;
   height: 1000px;
}

.nav-link {
	color: black;
}
.logo {
   margin-left: -5px;
   margin-top: 10px;
   padding-bottom: 7px;
}
.childli {
	margin-left: 1em;
}

.fieldset {
	border: 1px solid;
	width: 750px;
	display: block;
	padding-left: 4%;
	padding-right: 4%;
	padding-bottom: 4%;
	padding-top: 2%;
	margin: 0 auto;
}

.legend {
	border: 1px solid;
	padding-left: 15px;
	padding-right: 15px;
	display: inline;
	width: auto;
}

.list {
	text-align: center;
	float: left;
	border: 1px solid;
	padding: 15px 0px 15px 0px;
	margin-top: 15px;
	margin-left: 5%;
	margin-bottom: 30px;
	margin-right: 4%;
	width: 65%;
}

.btn-danger {
	width: 20%;
	height: 90px;
	margin-top: 14px;
}

.btn-info {
	width: 20%;
	height: 90px;
	margin-top: 14px;
	background-color: orange;
}

.btn-primary {
	width: 20%;
	height: 90px;
	margin-top: 14px;
}

.tot {
	margin-top: 30px;
}
</style>
</head>
<script>
function buttonRed(id){
	Swal.fire({
	title: '매출등록 하시겠습니까?',
	text: "매출에 등록됩니다.",
	icon: 'warning',
	showCancelButton: true,
	confirmButtonColor: '#3085d6',
	cancelButtonColor: '#d33',
	confirmButtonText: '매출 등록',
	cancelButtonText: '취소'
	}).then((result) => {
	  if (result.value) {
	    Swal.fire(
	      '완료 되었습니다!',
	      '매출등록 되었습니다.',
	      'success'
	    )
	    updateState(id, 3);
	  }
	})
}

function buttonYellow(id){
	Swal.fire({
		title: '조리완료 하시겠습니까?',
		text: "조리가 완료됩니다.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '조리 완료',
		cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
		    Swal.fire(
		      '완료 되었습니다!',
		      '조리완료 되었습니다.',
		      'success'
	    )
	    updateState(id, 2);
	  }
	})
}

function buttonBlue(id){
	Swal.fire({
		title: '주문확인 하시겠습니까?',
		text: "조리 중으로 표시됩니다.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '주문 확인',
		cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
		    Swal.fire(
		      '주문확인 되었습니다!',
		      '조리 중으로 표시 되었습니다.',
		      'success'
		    )
		    updateState(id, 1);
		  }
		})
}
function updateState(id, type){
	$.ajax({
		method: 'POST',
		url:'update',
		data:{id : id, type : type},
		success:function(tt){
			if(type == 1){
				$("#"+id).attr('class','btn btn-info');
				$("#"+id).attr('onClick','buttonYellow('+id+')');
				$("#"+id).html('조리 중');
			}else if(type == 2){
				$("#"+id).attr('class','btn btn-danger');
				$("#"+id).attr('onClick','buttonRed('+id+')');
				$("#"+id).html('매출 등록');
			}else if(type == 3){
				location.reload();
			}
			
		},
		error: function(a, b, errMsg){
			alert(errMsg,'error');
		}
	});
}
	</script>
<body>

	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar" id="sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"
                  			href="../main"> <span data-feather="home"></span>
                     		<h2 class="logo">
                        		<strong>LOGO</strong>
                     		</h2>
                     		<hr> <span class="sr-only"></span>
              		 </a></li>
						<li class="nav-item"><a class="nav-link" href="check"> <span
								data-feather="file"></span>
								<p class="childli">주문 확인</p>
						</a> <a class="nav-link" href="../sale/saleList"> <span
								data-feather="file"></span>
								<p class="childli">매출 조회</p>
						</a> <a class="nav-link" href="../stock/modify"> <span
								data-feather="file"></span>
								<p class="childli">수량 수정</p>
						</a></li>

					</ul>

				</div>
			</nav>

			<div role="main" class="col-md-10 ml-sm-auto col-lg-10">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">&nbsp;스시오</h1>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="dropdown">
						<% User user = (User)session.getAttribute("user"); %>
                    		 <button class="btn btn-warning dropdown-toggle" type="button"
                        		id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
                        		aria-expanded="false"><%=user.getUserName() %></button>
                     	<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                        <button class="dropdown-item" type="button">
                           <a href="../user/check">정보 확인</a>
                        </button>
                        <button class="dropdown-item" type="button">
                           <a href="../user/logout">로그아웃</a>
                        </button>
                     </div>
                  </div>
					
					</div>
				</div>

				<div id="context">

					<fieldset class="fieldset">
						<legend class="legend">주문 내역</legend>
						<c:forEach items="${sales}" var="sale">
							<c:forEach items="${prods}" var="prod">
								<c:if test="${sale.prodNo eq prod.prodNo}">
									<c:choose>

										<c:when test="${sale.saleState eq 0}">
											<div class="tot">
												<div class="list">
													${prod.prodName} ${sale.saleCnt }개 <br>
													${sale.saleDate} - ${sale.saleState}
												</div>

												<button type="button" id="${sale.saleNo}"
													class="btn btn-primary" onClick="buttonBlue(${sale.saleNo})">주문확인</button>
											</div>
										</c:when>

										<c:when test="${sale.saleState eq 1}">
											<div class="tot">
											<div class="list">
												${prod.prodName} ${sale.saleCnt }개 <br>
												${sale.saleDate}
											</div>

											<button type="button" id="${sale.saleNo}"
												class="btn btn-info" onClick="buttonYellow(${sale.saleNo})">조리
												중</button>
											</div>
										</c:when>

										<c:when test="${sale.saleState eq 2}">
											<div class="tot">
											<div class="list">
												${prod.prodName} ${sale.saleCnt }개 <br>
												${sale.saleDate}
											</div>

											<button type="button" id="${sale.saleNo}"
												class="btn btn-danger" onClick="buttonRed(${sale.saleNo})">매출
												등록</button>
										</div>
										</c:when>
									</c:choose>
								</c:if>
							</c:forEach>
						</c:forEach>
					</fieldset>


				</div>
			</div>

		</div>
</html>

