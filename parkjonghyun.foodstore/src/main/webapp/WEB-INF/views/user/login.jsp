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
@font-face{
	font-family: 'Binggrae';
	src:url("../../resources/css/Binggrae-Bold.ttf") format('truetype');
}
body {
	font-size: 1.2em;
	font-family: Binggrae;
}
input[type=password]{
	font-family: serif;
}
.dropdown-toggle {
   background: #ECC45D;
   color: black;
   border: 2px solid;
   width: 7.5em;
   height: 2.8em;
   font-size: 1em;
   margin-right: 1em;
}
.logo {
   margin-left: -5px;
   margin-top: 10px;
   padding-bottom: 7px;
}

#context {
	margin-top: 10%;
	margin-left: 30%;
	margin-right: 30%;
	margin-bottom:17%;
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

.childli {
	margin-left: 1em;
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
								</h2> <hr><span class="sr-only"></span>
						</a></li>
					</ul>
				</div>
			</nav>

			<main role="main" class="col-md-10 ml-sm-auto col-lg-10">
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
				<h1 class="h2">&nbsp;스시오</h1>
				<div class="btn-toolbar mb-2 mb-md-0">
                  <div class="dropdown">
                    	<div class="dropdown">
								<a class="btn btn-warning dropdown-toggle" href="login">Login</a>&nbsp;&nbsp;
						</div>
                  </div>
				</div>
			</div>

			<div id="context">
				<form class="form-signin" method="post">
					<h2 class="logo">
					<strong>LOGO</strong>
					</h2>
					<hr>
					<h1 class="h3 mb-3 font-weight-normal">로그인</h1>
					<label for="inputEmail" class="sr-only">ID</label>
						<input type="text" id="inputEmail" class="form-control" name="userId"
						placeholder="ID" required autofocus> <label
						for="inputPassword" class="sr-only">PW</label><br> <input
						type="password" id="inputPassword" class="form-control" name="userPw"
						placeholder="PW" required>
					<div class="checkbox mb-3">
					</div><br>
					<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
					
				</form>
				<br>
				
			</div>
			<hr>
		</div>
			
		</main>
		
	</div>
</html>
