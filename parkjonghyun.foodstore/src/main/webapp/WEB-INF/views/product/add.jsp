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
function button(){
	Swal.fire({
	title: '등록 하시겠습니까?',
	text: "해당제품이 등록됩니다.",
	icon: 'info',
	showCancelButton: true,
	confirmButtonColor: '#3085d6',
	cancelButtonColor: '#d33',
	confirmButtonText: '제품 등록',
	cancelButtonText: '취소'
	}).then((result) => {
	  if (result.value) {
	    Swal.fire(
	      '등록가 완료되었습니다!',
	      '제품 등록 되었습니다.',
	      'success'
	    )
	    setTimeout(function(){
            $("#addform").submit();
         }, 1500);
	  }
	})
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
	width: 5.8em;
	height: 2.8em;
	font-size: 1em;
	margin-right: 1em;
}

#context {
	margin-left: 5%;
	margin-top: 5%;
	margin-right: 10%;
	margin-bottom: 10%
}

#carousel-set {
	background-color: lightgray;
	border: 2px black solid;
	height: 30em;
}

#sidebar {
	background-color: orange !important;
	height: 51em;
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

.nav-link2 {
	margin-left: 3em;
	color: black;
}

.fieldset{
	border: 1px solid;
	width: 750px;
	display: block;
	padding-left: 4%;
	padding-right: 4%;
    padding-bottom: 4%;
    padding-top: 2%;
    margin:0 auto;
}
.legend{
	border: 1px solid;
	padding-left:15px;
	padding-right:15px;
	display: inline;
	width: auto;
}

.table{
	text-align: center;
}
.file_input label {
	float: right;
	margin-right: 10px;
	margin-top:2px;
	margin-bottom:1px;
    position:relative;
    cursor:pointer;
    display:inline-block;
    vertical-align:middle;
    overflow:hidden;
    width:100px;
    height:30px;
    background:#F3F781;
    color:black;
    text-align:center;
    line-height:30px;
    font-size:15px;
    border: 1px solid #BDBDBD;
}
.file_input label input {
    position:absolute;
    width:0;
    height:0;
    overflow:hidden;
}
.file_input input[type=text] {
    vertical-align:middle;
    display:inline-block;
    width:225px;
    height:28px;
    line-height:28px;
    font-size:11px;
    margin-left:119px;
    padding:0;
    border:0;
    border:1px solid #777;
}
.btn-primary{
	margin-top:30px;
	margin-left:30px;
	margin-right:40px;
	margin-bottom:-20px;
	width:100px;
	height:40px;
}
.btn-danger{
	margin-top:30px;
	margin-bottom:-20px;
	width:100px;
	height:40px;
}

</style>
<title>foodStore</title>
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
                        </h2><hr> <span class="sr-only"></span>
                  </a></li>
                  <li class="nav-item"><a class="nav-link" href="../sale/saleList"> <span
                        data-feather="file"></span>
                     <p class="childli">매출 조회</p>
                  </a>
                  <a class="nav-link" href="../user/list"> <span
                        data-feather="file"></span>
                     <p class="childli">가맹점</p>
                  </a>
                  <a class="nav-link" href="list"> <span
                        data-feather="file"></span>
                     <p class="childli">제품 목록</p>
                  </a>
                 </li>
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
   			<fieldset class="fieldset"><legend class="legend">제품 등록</legend>
	   			<form method="POST" enctype="multipart/form-data" id="addform">
	   			<table class="table">
	   				<tr>
	   					<th>제품번호:</th><td><input type="text" name="prodNo" value="${NEXTPROD}" readonly="readonly" style = "text-align:center; background: lightgray" required></td>
	   				</tr>
	   				<tr>
	   					<th>제품분류 :</th><td>
	   							<select id="case" name="prodCase" class="searchOption">
									<option value="초밥류" selected>초밥류</option>
									<option value="사이드" >사이드</option>
									<option value="주류">주류</option>
								</select> </td>
	   				</tr>
	   				<tr>
	   					<th>제품명 :</th><td><input name="prodName" type="text" required></td>
	   				</tr>
	   				<tr>
	   					<th>원가 :</th><td><input name="prodCost" type="text" required></td>
	   				</tr>
	   				<tr>
	   					<th>판매가 :</th><td><input name="prodPrice" type="text" required></td>
	   				</tr>
	   				<tr>
	   					<th>사진 :</th><td><div class="file_input">
    						<label>
       						파일 업로드
        					<input type="file" required name="prodImgPath" onchange="javascript:document.getElementById('file_route').innerHTML=this.value">
    						</label>
    						<p id="file_route" style="font-size:0.7em"></p>
							</div>
									</td>
	   				</tr>
	   				<tr>
	   					<td colspan="2" align="center"><input type="button" value="등록" onClick="button()" class="btn btn-primary">
	   					<a href="list" class="btn btn-danger">취소</a></td></td>
	   				</tr>
	   			</table>
	   			</form>
	   		</fieldset>
	   	</div>
            <br>

         </div>
      </div>

      </div>

  </body>
</html>