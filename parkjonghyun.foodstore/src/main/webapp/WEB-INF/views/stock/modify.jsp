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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
<script>
function buttonBlue(id){
	Swal.fire({
		title: '수정 하시겠습니까?',
		text: "현재 수량이 수정됩니다.",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '수정',
		cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
		    Swal.fire(
		      '수정 되었습니다!',
		      '현재수량이 수정 되었습니다.',
		      'success'
		    )
		   $.ajax({
		   		method : 'post',
				url:'modify',
				data: {id : id,
					cnt : $("#"+id).val()	
				},
				success: function(str){
					if(str=="true"){
						setTimeout(function(){
				             location.reload();
				          }, 1500);	
					}
					else{
						console.log("관리자를 통해 에러를 확인해주세요");
					}
				},
				error: function(a, b, errMsg){
					alert(errMsg,'warning');
				}
			}); 
		  }
		})
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>음식매장</title>
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
.fieldset{
	border: 1px solid;
	width: 95%;
	display: block;
	padding-left: 4%;
}
.legend{
	border: 1px solid;
	padding-left:15px;
	padding-right:15px;
	display: inline;
	width: auto;
}
.main-title{
	border:1px solid;
	height:3%;
	width:200px;
	padding-left:10px;
	margin-bottom:20px;
}
.all{
	float: left;
}
.img{
	width: 100%;
	height: 300px;
	text-align: center;
	position:relative;
}
.img-form{
	height: 300px;
	text-align: center;
	position:relative;
}
.name{
	background: white;
	position:absolute;
  	bottom:10px;
  	right:40%;
	padding:5px 5px;
	font-size:15px;
	border:0.5px solid;
}
.current{
	width: 50%;
	height: 50px;
	text-align: center;
}

.num {
	width: 40%;
	text-align: center;
}

.tab{
	width: 350px;
	margin-top: 10px;
	margin-left: 20px;
	margin-right: 50px;
	float: center;
}

.btn-primary{
	margin-left:31%;
	margin-top:3%;
	margin-bottom:5%;
	width: 30%;
	border-radius:20px;
	cursor:pointer;
}
.btn-primary:hover{
	background:#2E9AFE;
}

</style>
</head>
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
						<li class="nav-item"><a class="nav-link"
							href="../order/check"> <span data-feather="file"></span>
								<p class="childli">주문 확인</p>
						</a> <a class="nav-link" href="../sale/saleList"> <span
								data-feather="file"></span>
								<p class="childli">매출 조회</p>
						</a> <a class="nav-link" href="../stock/modify"> <span
								data-feather="file"></span>
								<p class="childli">수량 수정</p>
						</a></li>

					</ul>


					<!--
        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Saved reports</span>
          <a class="d-flex align-items-center text-muted" href="#">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Current month
            </a>
          </li>
        </ul>
         -->
				</div>
			</nav><% User user = (User)session.getAttribute("user"); %>

			<div role="main" class="col-md-10 ml-sm-auto col-lg-10">
				<div id="top"
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">&nbsp;스시오</h1>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="dropdown">
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
						<legend class="legend">매장 상품 수량 수정</legend>


						<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
						<c:forEach items="${stocks}" var="stock">
							<c:forEach items="${products}" var="product">
								<c:if test="${product.prodNo == stock.prodNo}">
									<div class="all">
										<table border="1" class="tab">
											<tr>
												<th colspan="2" class="img-form">
													<img src="<c:url value="/upload/${product.prodImgPath}"/>" class="img">
													<div class="name">${product.prodName}</div>
												</th>
											</tr>
											<tr>
												<th class="current">현재수량 :</th>
												<th class="num"><input type="number" class="num" id="${stock.stockNo}" value="${stock.stockCnt}" />개</th>
											</tr>
											</table>
											<button type="button" class="btn btn-primary"
												onClick="buttonBlue(${stock.stockNo})">수정</button>
										</div>
									</c:if>
								</c:forEach>
						</c:forEach>
						<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

					</fieldset>


				</div>
			</div>
		</div>
	</div>
</html>