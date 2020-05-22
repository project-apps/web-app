 <%@ page session="true"%> <%@ page isELIgnored="false"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<style type="text/css" >
.position-static a.display-4 {
  line-height: 2;
  word-break: break-word;
  word-wrap: break-word;
}
</style>

<nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-toggleable-sm">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </button>
        <div class="menu-logo">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href='<c:url value="/home"/>'>
                         <img src='<c:url value="/views/images/logo-code-sm.png"/>' alt="DeepdiveCode"/>
                    </a>
                </span>
                <span class="navbar-caption-wrap"><a class="navbar-caption text-white display-4" href='<c:url value="/home"/>'>
                        DeepdiveCode</a></span>
            </div>
        </div>
        <div class="navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav nav-dropdown nav-right" data-app-modern-menu="true">
                
                <li class="nav-item dropdown position-static">
                <a class="nav-link link text-white dropdown-toggle display-4" href="#" aria-expanded="false" data-toggle="dropdown-submenu">
                		<span class="socicon socicon-rss mbr-iconfont mbr-iconfont-btn"></span>Courses</a>
	            <ul class="dropdown-menu w-100 shadow" id="navbarDropdownCourses">
				      <div class="row py-3">
				      	<div class="col-md-4 pb-2">
				      		<li class="dropdown-item text-white">
				                   <a href="#">
				                       <img src="<c:url value='/views/images/javaee.png'/>" class="img-fluid" style="height: 100px">
				                   </a>
				                   <div class="card-body">
				                       Learn Java Enterprise edition hear.
				                   </div>
				      		</li>
				      	</div>
				      	<div class="col-md-4 pb-2">
				      		<li class="dropdown-item text-white">
				                   <a href="#">
				                       <img src="<c:url value='/views/images/javaee.png'/>" class="img-fluid" style="height: 100px">
				                   </a>
				                   <div class="card-body">
				                       Learn Java Enterprise edition hear.
				                   </div>
				      		</li>
				      	</div>
				      	<div class="col-md-4 pb-2">
				      		<li class="dropdown-item text-white">
				                   <a href="#">
				                       <img src="<c:url value='/views/images/javaee.png'/>" class="img-fluid" style="height: 100px">
				                   </a>
				                   <div class="card-body">
				                       Learn Java Enterprise edition hear.
				                   </div>
				      		</li>
				      	</div>
					</div>
    			</ul>   
          	</li>
                
            <li class="nav-item dropdown">
                <a class="nav-link link text-white dropdown-toggle display-4" href="#" data-toggle="dropdown-submenu" aria-expanded="false">
                    <span class="mbri-home mbr-iconfont mbr-iconfont-btn"></span>
                    Services
                </a><div class="dropdown-menu"><a class="text-white dropdown-item display-4" href="#"><span class="mbri-pin mbr-iconfont mbr-iconfont-btn"></span>Pincode</a></div></li>
           	
           	<li class="nav-item dropdown position-static" style="align-self: auto;">
                <a class="nav-link link text-white dropdown-toggle display-4" href="#" aria-expanded="false" data-toggle="dropdown-submenu">
                		<span class="mbri-search mbr-iconfont mbr-iconfont-btn"></span>About Us</a>
	            <ul class="dropdown-menu w-100 shadow" id="navbarDropdownAboutUs">
				      <div class="row py-3">
				      	<div class="col-md-6 pb-2">
				      		<li class="dropdown-item text-white">
				                   <div class="card-body">
				                      <a href='<c:url value="/writewithus"/>'>
				                       <span class="mbri-edit mbr-iconfont mbr-iconfont-btn"></span>Write with us.
				                   </a>
				                   </div>
				      		</li>
				      	</div>
				      	<div class="col-md-6 pb-2">
				      		<li class="dropdown-item text-white">
				                   <div class="card-body">
				                   <a href='<c:url value="/contactus"/>'>
				                   	<span class="mbrib-pin mbr-iconfont mbr-iconfont-btn"></span>Contact us.
				                   </a>
				                   </div>
				      		</li>
				      	</div>
				      </div>
    			</ul>   
          	</li>
               	
	           <li class="nav-item">
	               <c:choose>
	             	<c:when test="${sessionScope.authuser ne null}">
	             		<div class="nav-item dropdown user-toogle">
	             		<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" id="dropdownMenuButton" aria-haspopup="true" aria-expanded="false">${sessionScope.authuser.name}</a>
	             	</c:when>
	              <c:otherwise>
	               <a class="nav-link link text-white display-4" href="<c:url value='/loginReg'/>" id="logginRegModalGenerator" data-toggle="modal">
	               	<span class="mbrib-user mbr-iconfont mbr-iconfont-btn"></span>Login</a>
	              	<%-- <a class="nav-link" href="<c:url value='/loginReg'/>" id="logginRegModalGenerator" data-toggle="modal">Login|Register&nbsp;<i class="fas fa-sign-in-alt"></i></a> --%>
	              	<div class="nav-item dropdown user-toogle hide">
	              	<a href="#" class="nav-link dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></a>
	              </c:otherwise>
	             </c:choose>
	               <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
				    <a class="dropdown-item" href="#"><i class="fas fa-users-cog"></i>Profile</a>
				    <a class="dropdown-item" href="#"><i class="fas fa-tools"></i>Settings</a>
				    <div class="dropdown-divider"></div>
				  	<a href="<c:url value="/logout"/>"class="dropdown-item"><i class="fas fa-sign-out-alt"></i>Logout</a>
				</div>
				</div>
	         </li>
               	
               	
               	<<!-- li class="nav-item"><a class="nav-link link text-white display-4" href="#">
               		<span class="mbrib-user mbr-iconfont mbr-iconfont-btn"></span>Login</a></li> -->
            </ul>
        </div>
    </nav>
 