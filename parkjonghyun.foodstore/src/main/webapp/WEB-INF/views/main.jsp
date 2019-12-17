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
>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
></script>
<style type="text/css">
@font-face{
	font-family: 'Binggrae';
	src:url("../resources/css/Binggrae-Bold.ttf") format('truetype');
}
body {
	font-size: 1.2em;
	font-family: Binggrae;
}

footer {
	background-color: black;
	height: 8em;
	width: 100%;
	color: white;
	text-align: center;
}
.btn1{
   margin-right: 1em !important;
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
.logo {
   margin-left: -5px;
   margin-top: 10px;
   padding-bottom: 7px;
}
.childli {
	margin-left: 1em;
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
	background-color: orange !important;
}

.nav-link {
	color: black;
}


</style>

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css' />
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js'></script>
<script type="text/javascript">
    // F12 버튼 방지
    $(document).ready(function(){
        $(document).bind('keydown',function(e){
            if ( e.keyCode == 123 /* F12 */) {
                e.preventDefault();
                e.returnValue = false;
            }
        });
    });
    
    // 우측 클릭 방지
    document.onmousedown=disableclick;
    status="Right click is not available.";
    
    function disableclick(event){
        if (event.button==2) {
            alert(status);
            return false;
        }
    }
</script>

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
		Object.defineProperty(console, '_commandLineAPI', { get: function () { throw '콘솔을 사용할 수 없습니다.' } });
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
<body onload="a()" oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	<div id="wrap" class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar" id="sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active" href="main">
								<h2 class="logo">
									<strong>LOGO</strong>
									
								</h2> <hr><span class="sr-only"></span>
						</a></li>
						<%
							User user = (User) session.getAttribute("user");
							if (user == null) {
						%>
						
						<%
							}else{
								if (user.getUserId().contains("admin")) {
						%>
						<li class="nav-item"><a class="nav-link" href="sale/saleList"> <span
								data-feather="file"></span>
								<p class="childli">매출 조회</p>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="user/list"> <span
								data-feather="file"></span>
								<p class="childli">가맹점</p>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="product/list"> <span
								data-feather="file"></span>
								<p class="childli">제품 목록</p>
						</a></li>
						<%
								}else{
						%>
						<li class="nav-item"><a class="nav-link" href="sale/order"> <span
								data-feather="file"></span>
								<p class="childli">주문 하기</p>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="order/check"> <span
								data-feather="file"></span>
								<p class="childli">주문 확인</p>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="sale/saleList"> <span
								data-feather="file"></span>
								<p class="childli">매출 조회</p>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="stock/modify"> <span
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

			<div role="main" class="col-md-10 ml-sm-auto col-lg-10">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">&nbsp;스시오</h1>
					<div class="btn-toolbar mb-2 mb-md-0">
						<p>
							<%
								
								if (user == null) {
							%>
							<div class="dropdown">
								<a class="btn btn-warning dropdown-toggle btn1" href="user/login"><strong>Login</strong></a>&nbsp;&nbsp;
							</div>
							<%
								} else {
									if (user.getUserId().contains("admin")) {
							%>
						
						<div class="dropdown">
							<button class="btn btn-warning dropdown-toggle" type="button"
								id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"><strong><%=user.getUserName() %></strong></button>
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
								aria-expanded="false"><strong><%=user.getUserName() %></strong></button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
								<button class="dropdown-item" type="button">
									<a href="user/check">정보 확인</a>
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
