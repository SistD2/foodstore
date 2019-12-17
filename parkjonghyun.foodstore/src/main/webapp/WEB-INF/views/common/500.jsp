<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ page import="org.apache.logging.log4j.LogManager"%>
<%@ page import="org.apache.logging.log4j.Logger" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
body {
	font-size: 1.5em;
  text-align: center;
  margin : 20%;
}

div {
  border : 3px solid black;
  box-shadow : 5px 5px 5px 5px gray;
  padding : 5%;
  padding-top : 0;
}
</style>
</head>
<body>
  <div>
    <h1>페이지 에러</h1><hr>
    <p>페이지에 에러가 생겼습니다.</p>
    <em>
  <% Logger logger = null;
  	 if(application.getAttribute("logger") != null){
  		 logger = (Logger)application.getAttribute("logger");
  	 }else{
  		 logger = LogManager.getLogger();
  		 application.setAttribute("logger", logger);
  	 }
  	 logger.error(exception);
  %>
  	</em>
    <strong>관리자 번호 (1577-1577)로 연락해주세요.</strong><br>
    <strong><a href="/foodstore/main">메인으로 돌아가기</a></strong>
    <br>
  </div>
</body>
</html>
