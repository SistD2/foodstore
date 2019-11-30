<%@page import="parkjonghyun.foodstore.user.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<style type="text/css">
body {
	font-size: 1.2em;
}

footer {
	background-color: black;
	height: 8em;
	width: 100%;
	color: white;
	text-align: center;
}

.dropdown-toggle {
	background: #ECC45D;
	color: black;
	border: 2px solid;
	width: 7em;
	height: 2.5em;
	font-size: 1.1em;
	margin-right: 1em;
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
	margin-top: 5%;
	margin-left: 10%;
	margin-right: 10%;
}

#carousel-set {
	background-color: lightgray;
	border: 2px black solid;
	height: 30em;
}

#sidebar {
	background-color: orange !important;
}

.nav-link {
	color: black;
}

.childli {
	margin-left: 1em;
}
</style>

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css' />
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js'></script>
<script type="text/javascript">
	//쓰기 작업 결과 출력창을 띄운다.
	function alert2(msg, type) {
		swal({
			title : '',
			text : msg,
			type : type,
			timer : 1000,
			customClass : 'sweet-size',
			showConfirmButton : false
		});
	}
</script>
<script type="text/javascript">
	var model = ${type};
	function a() {
		if (model == "00") {
			alert2('로그인 실패', 'error');

		} else if (model == "01") {
			alert2('로그인 성공', 'success');
		} else if (model == "10") {
			alert2('회원가입 실패', 'error');
			
		} else if (model == "11") {
			alert2('회원가입 성공', 'success');
		} else {

		}
	}
</script>

</head>
<body onload="a()">
	<div id="wrap" class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar" id="sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active" href="main">
								<h2>
									<strong>LOGO</strong>
								</h2>
						</a></li>
						<%
							User user = (User) session.getAttribute("user");
							if (user == null) {
						%>
						<li class="nav-item"><a class="nav-link active" href="main">주문하기</a>
						</li>
						<%
							}else{
								if (user.getUserId().contains("admin")) {
						%>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file"></span>
								<p class="childli">매출 조회</p>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file"></span>
								<p class="childli">가맹점</p>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file"></span>
								<p class="childli">제품 목록</p>
						</a></li>
						<%
								}else{
						%>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file"></span>
								<p class="childli">주문 확인</p>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file"></span>
								<p class="childli">매출 조회</p>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="file"></span>
								<p class="childli">수량 변경</p>
						</a></li>
						<%
								}
							}
						%>
						
					</ul>
				</div>
			</nav>

			<div role="main" class="col-md-10 ml-sm-auto col-lg-10"
				style="padding: 0">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">&nbsp;스시오</h1>
					<div class="btn-toolbar mb-2 mb-md-0">
						<p>
							<%
								
								if (user == null) {
							%>
							<a class="btn btn-warning dropdown-toggle" href="user/login">Login</a>&nbsp;&nbsp;
							<%
								} else {
									if (user.getUserId().contains("admin")) {
							%>
						
						<div class="dropdown">
							<button class="btn btn-warning dropdown-toggle" type="button"
								id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">본사</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
								<button class="dropdown-item" type="button">
									<a href="user/join">가맹점 등록</a>
								</button>
								<button class="dropdown-item" type="button">
									<a href="user/logout">로그아웃</a>
								</button>
							</div>
						</div>
						<%
							} else {
						%>
						<div class="dropdown">
							<button class="btn btn-warning dropdown-toggle" type="button"
								id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">가맹점</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
								<button class="dropdown-item" type="button">
									<a href="#">정보 확인</a>
								</button>
								<button class="dropdown-item" type="button">
									<a href="user/logout">로그아웃</a>
								</button>
							</div>
						</div>
						<%
							}
							}
						%>
						</p>
					</div>
				</div>

				<div id="context">

					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0"
								class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner" id="carousel-set">
							<div class="carousel-item active">
								<img src="" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="" class="d-block w-100" alt="...">
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
					<br>
					<div class="imgdiv">
						<div class="img3">
							<a class="img3a"><img>음식 이미지</a>
						</div>
						<div class="img3" id="img3">
							<a class="img3a"><img>음식 이미지</a>
						</div>
						<div class="img3">
							<a class="img3a"><img>음식 이미지</a>
						</div>
					</div>
					<div class="imgdiv">
						<div class="img2">
							<img>
							<p class="img2p">전화번호 이미지</p>
						</div>
						<div class="img2" id="img2">
							<img>
							<p class="img2p">전화번호 이미지</p>
						</div>
					</div>
				</div>

				<footer>
					<h3>
						<br> © copyright 2000 ~ 2019 스시오 <br> 대한민국 서울 마포구 월드컵대로
						풍성빌딩 2F_D2
					</h3>
				</footer>
			</div>

		</div>

	</div>
</html>
