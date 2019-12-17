<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script><style type="text/css">
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
   background-color: orange !important;
   height: 51em;
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

.formlabel {
   width: 90px;
}
</style>
<script type="text/javascript">

var searchCnt = 0;

var searchVal = '${requestScope.searchVal}';
function addlist() {
	   		searchCnt += 5;
		   	$('#cnt').val(searchCnt);
            $.ajax({
            type : 'POST',
            url : 'search',
           data : {searchCnt : searchCnt,
        			searchVal : searchVal
           },
            success : function(data){
               $("tbody").empty();
               $(data).each(function(idx, user){
            	   $("tbody").append(
            	   "<tr>"+
                   "<td><a href='modify?userId="+user.userId+"'>"+user.userName+"</a></td>"+
                   "<td>"+user.userEmail+"</td>"+
                   "<td>"+user.userAddress+"</td>"+
                   "<td>"+user.userTel+"</td>"+
                   "<td>"+user.regDate+"</td>"+
               		"</tr>"
            	)
               })
            },
            error : function(a, b, errMsg) {
               alert(errMsg, 'error');
            },
         });
      }
function searchsubmit() {
	$('#cnt').val(0);
	$('#myform').submit();
}
document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
}, true);
</script>
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
                  <a class="nav-link" href="list"> <span
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
                        aria-expanded="false">본사</button>
                     <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                        <button class="dropdown-item" type="button">
                           <a href="join">가맹점 등록</a>
                        </button>
                        <button class="dropdown-item" type="button">
                           <a href="logout">로그아웃</a>
                        </button>
                     </div>
                  </div>
            </div>
         </div>

         <div id="context">
            <div style="border-bottom: 2px solid black; margin-bottom: 30px; padding-bottom: 10px;">
               <h2>가맹점 목록</h2>
            </div>
            <div>
                  <div style="float: left;">
                     <a href="join" class="btn btn-secondary" role="button" aria-pressed="true" style>등록</a>
                  </div>
                <form class="form-inline" action='list' method="get" id="myform" style="margin-bottom: 20px; float: right;">
                     <div class="form-group" style="margin-right: 5px;">
                          <input type="text" name="searchVal" class="textInput">
                     </div>
                     <input name="searchCnt" type="hidden" id="cnt">
                     
                     <input type="button" class="btn btn-secondary" onclick="searchsubmit()" value="검색">
                </form>
                <div>
                     <table class="table table-hover">
                         <thead>
                              <tr>
                                  <td scope="col"><strong>지점명</strong></td>
                                  <td scope="col"><strong>이메일</strong></td>
                                  <td scope="col"><strong>주소</strong></td>
                                  <td scope="col"><strong>전화번호</strong></td>
                                  <td scope="col"><strong>등록일</strong></td>
                              </tr>
                         </thead>
                        	<tbody id="tbody">
                        <c:forEach items="${users}" var="user">
                           <tr>
                              <td><a href="modify?userId=${user.userId}"><div class="userName">${user.userName}</div></a></td>
                              <td><div class="userEmail">${user.userEmail}</div></td>
                              <td><div class="userAddress">${user.userAddress}</div></td>
                              <td><div class="userTel">${user.userTel}</div></td>
                              <td><div class="userDate">${user.regDate}</div></td>
                           </tr>
                        </c:forEach>
                        </tbody>
                        
                     </table>
                        <div style="margin-top: 30px; margin-left: 500px;">
                        <input type="button" class="btn btn-secondary" onclick="addlist()" role="button" aria-pressed="true" style="width: 200px; height: 40px;" value="더보기">
                        </div>
                     <div>
                </div>
            </div>
         </div>
      </div>

      </div>

   </div>
</html>