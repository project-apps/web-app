<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%> <%@ page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   	<link rel="icon" href="<c:url value="/views/images/logo-code.png"/>"/>
   	<title><tiles:insertAttribute name="title" ignore="true" />|DeepdiveCode</title> 
   	<link rel="stylesheet" href="<c:url value='/views/bootstrap/4.4.1/css/bootstrap.min.css'/>">
   	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   	<link rel="stylesheet" href="<c:url value='/views/css/style.css'/>">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/Wruczek/Bootstrap-Cookie-Alert@gh-pages/cookiealert.css">
</head>

<body>
<div class="container-fluid">	
	<div class="wrapper">
		<tiles:insertAttribute name="navbar" />
		<div class="row" style="margin-top: 58px">
		<nav class="col-md-2 d-none d-md-block bg-dark">
			<div>
				<tiles:insertAttribute name="sidebar" />		
			</div>
			<div class="advertisement">
				<img src="<c:url value="/views/images/add-1.png"/>" width="100%" height="100%"/>
				<img src="<c:url value="/views/images/add-2.jpg"/>" width="100%" height="100%"/>
				<img src="<c:url value="/views/images/add-3.jpg"/>" width="100%" height="100%"/>
				<img src="<c:url value="/views/images/add-4.jpg"/>" width="100%" height="100%"/>
			</div>
		</nav>
	
		<div class="container col-md-9 ml-sm-auto col-lg-10 px-4">
			<div class="content" id="content">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
    </div>
</div>
<div class="modal-container"></div>
</div>
 <footer>
    <tiles:insertAttribute name="footer" />
 </footer>
<div class="alert text-center cookiealert" role="alert">
    <b>Do you like cookies?</b> &#x1F36A; We use cookies to ensure you get the best experience on our website. <a href="https://cookiesandyou.com/" target="_blank">Learn more</a>
    <button type="button" class="btn btn-primary btn-sm acceptcookies" aria-label="Close">
        I agree
    </button>
</div>

<script	type="text/javascript" src="<c:url value='/views/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript" src="<c:url value='/views/bootstrap/4.4.1/js/bootstrap.min.js'/>"></script>

<!-- <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"></script> -->
<script src="https://kit.fontawesome.com/bf48b5b943.js" crossorigin="anonymous"></script>

<script type="text/javascript" src="<c:url value='/views/js/app.js'/>"></script>
<script type="text/javascript" src="<c:url value='/views/js/login.js'/>"></script>
<script src="https://cdn.jsdelivr.net/gh/Wruczek/Bootstrap-Cookie-Alert@gh-pages/cookiealert.js"></script>

</body>
</html>
