<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script>
function button(id){
	Swal.fire({
	title: '삭제 하시겠습니까?',
	text: "판매제품이 삭제됩니다.",
	icon: 'warning',
	showCancelButton: true,
	confirmButtonColor: '#3085d6',
	cancelButtonColor: '#d33',
	confirmButtonText: '제품 삭제',
	cancelButtonText: '취소'
	}).then((result) => {
	  if (result.value) {
	    Swal.fire(
	      '삭제가 완료되었습니다!',
	      '판매제품이 삭제 되었습니다.',
	      'success'
	    )
	    setTimeout(function(){
	    	prodDelete(id);
         }, 1500);
	  }
	})
}
function prodDelete(id){
	$.ajax({
		method: 'POST',
		url:'delete',
		data:{id : id},
		success:function(tt){
			if(tt=="true"){
				location.reload();			
			}else{
				alert('서버에 문제가 있습니다.');
			}
		},
		error: function(a, b, errMsg){
			alert(errMsg,'error');
		}
	});
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
@font-face{
	font-family: 'Binggrae';
	src:url("../../resources/css/Binggrae-Bold.ttf") format('truetype');
}
body {
	font-size: 1.2em;
	font-family: Binggrae;
}

#main {
	max-width: 90%;
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
	padding-left: 1em;
}

.nav-link2 {
	margin-left: 3em;
	color: black;
}

.fieldset {
	border: 1px solid;
	width: 1200px;
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

.textInput {
	width: 40%;
	height: 40px;
	margin-right: 15px;
}

.btn-outline-dark {
	width: 10%;
	height: 42px;
	margin-bottom: 6px;
}

.searchOption {
	width: 120px;
	height: 40px;
	margin-right: 15px;
	padding: 7px;
}

.table-striped {
	margin-right: 5px;
	text-align: center;
	font-size: 16px;
	width: 1050px;
	height: 500px;
}

.btn-danger {
	color: white;
}

.prod-add {
	text-align: right;
}

.btn-outline-dark {
	margin-right: 25px;
	width: 120px;
	height: 40px;
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
							href="../sale/saleList"> <span data-feather="file"></span>
								<p class="childli">매출 조회</p>
						</a> <a class="nav-link" href="../user/list"> <span
								data-feather="file"></span>
								<p class="childli">가맹점</p>
						</a> <a class="nav-link" href="list"> <span
								data-feather="file"></span>
								<p class="childli">제품 목록</p>
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
			</nav>

			<div role="main" class="col-md-10 ml-sm-auto col-lg-10">
				<div id="top"
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">&nbsp;스시오</h1>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="dropdown">
							<button class="btn btn-warning dropdown-toggle" type="button"
								id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">본사</button>
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
				<div id="context">
					<fieldset class="fieldset">
						<legend class="legend">제품 목록</legend>
						<br>
						<div align="center">
							<form action="list" method="get">
								<select name="searchCase" class="searchOption">
									<option value="product_name" selected>제품명</option>
									<option value="product_case">제품종류</option>
								</select> <input type="text" name="searchVal" class="textInput"> <input
									type="submit" class="btn btn-outline-dark" value="검색" />
							</form>
						</div>
						<span class=”glyphicon glyphicon-align-left” aria-hidden=”true”></span>
						<br>
						<table class="table table-striped">
							<tr>
								<th>제품번호</th>
								<th>제품분류</th>
								<th>제품명</th>
								<th>원가</th>
								<th>판매가</th>
								<th>등록일</th>
								<th>사진</th>
								<th>수정</th>
							</tr>
							<c:if test="${maxPage == 0 }">
								<tr>
									<td colspan="8">검색한 결과가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${prods}" var="prod">
								<tr>
									<td>${prod.prodNo}</td>
									<td>${prod.prodCase}</td>
									<td>${prod.prodName}</td>
									<td>￦${prod.prodCost}</td>
									<td>￦${prod.prodPrice}</td>
									<td>${prod.regDate}</td>
									<td>${prod.prodImgPath}</td>
									<td><a href="update?num=${prod.prodNo}" class="btn btn-warning">수정</a>&nbsp;&nbsp;
										<div onclick="button(${prod.prodNo})" class="btn btn-danger">삭제</div></td>
								</tr>
							</c:forEach>
						</table>
						<div align="center">
							<c:if test="${page != 1}">
								<a class="btn btn-light" href="list?page=${page-1}&searchCase=${searchCase }&searchVal=${searchVal }">◀</a>
							</c:if>
								<strong>${page}</strong>
							<c:if test="${page != maxPage and maxPage != 0}">
								<a class="btn btn-light" href="list?page=${page+1}&searchCase=${searchCase }&searchVal=${searchVal }">▶</a>
							</c:if>
						</div>
						<div class="prod-add">
							<a href="add"><button class="btn btn-outline-dark">제품
									추가</button></a>
						</div>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
</body>
</html>