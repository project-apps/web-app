 <%@ page session="true"%> <%@ page isELIgnored="false"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<style type="text/css">
/* 	nav.navbar.shrink {
    width: 100%;
    height: 35px;
    background-color: #111;
    box-shadow: 0 1px 0 0 #dadada;
    position: fixed;
    left: 0px;
    transition: all 1.5s ease;

}
nav.navbar.shrink .navbar-brand  img{
  height: 50px;
  width: 120px;
  transition: all 1.5s ease;
} */
.card {
  margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
}
</style>
<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top mb-0">
    <a class="navbar-brand nav-lg" href="<c:url value='/home'/>"><img src="<c:url value="/views/images/logo-code.png"/>" style="width: 30px;"/>DeepdiveCode</a>
    <a class="navbar-brand nav-sm" href="<c:url value='/home'/>"><img src="<c:url value="/views/images/logo-code.png"/>" style="width: 30px;"/></a>
	
	  <div class="input-group" style="width: auto;">
            <input class="form-control py-2 border-right-0 border" type="search" id="search-input" placeholder="Search">
            <span class="input-group-append">
            <button class="btn btn-outline-secondary border-left-0 border" type="button">
                    <i class="fa fa-search"></i>
              </button>
            </span>
        </div>
	
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
            aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarContent">
        <ul class="navbar-nav">
            <%-- <li class="nav-item">
                <a href="<c:url value='/home'/>" class="nav-link"><i class="fas fa-home" style='font-size:24px'></i>&nbsp;Home</a>
            </li> --%>
			<li class="nav-item dropdown position-static">
			<a class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class='fab fa-java' style='font-size:24px'></i>&nbsp;Java</a>
			<ul class="dropdown-menu w-100 shadow p-0" id="navbarDropdownMega">
			    <li class="dropdown-item" style="margin-top: -10px">
			       <div class="row py-3">
			           <div class="col-md-6 pb-2">
			               <div class="card" style="border: 0px;">
			                   <a href="#">
			                       <img src="<c:url value='/views/images/javaee.png'/>" class="img-fluid" style="height: 100px">
			                   </a>
			                   <div class="card-body">
			                       Learn Java Enterprise edition hear.
			                   </div>
			               </div>
			           </div>
			           <div class="col-md-6 pb-2">
			               <div class="card" style="border: 0px;">
			                   <a href="<c:url value='/course/java'/>">
			                       <img src="<c:url value='/views/images/java.png'/>" class="img-fluid" style="height: 100px">
			                        </a>
			                        <div class="card-body">
			                            Learn Core Java hear.
			                        </div>
			                    </div>
			                </div>
			           
			            
			            </div>
			        </li>
			    </ul>
			</li>
            <li class="nav-item">
                <a href="<c:url value='/course/nodejs'/>" class="nav-link">Node<i class='fab fa-node-js' style='font-size:24px'></i></a>
            </li>
            <li class="nav-item dropdown">
        		<a class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fab fa-servicestack"></i>&nbsp;Services</a>
        		<div class="dropdown-menu dropdown-menu-right w-auto shadow p-0" id="navbarDropdown" aria-labelledby="navbarDropdownLbl">
            		<a class="dropdown-item d-flex flex-nowrap align-items-center px-0 py-3" rel="nofollow" href="<c:url value='/service/pincode'/>">
	                	<div class="flex-shrink-1 text-center px-3"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
	                	<div class="pl-0 pr-4">
	                    	<h6 class="mb-0">Pincode</h6><small> Postal details by zipcode.</small>
	               		</div>
            		</a>
        		</div>
    		</li>
            <li class="nav-item">
                <a href="<c:url value='/contactus'/>" class="nav-link">AboutUs</a>
        	</li>

        	</ul>
		<div class="navbar-nav ml-auto">
	    	<ul class="navbar-nav">
	            <li class="nav-item">
	                <c:choose>
	                	<c:when test="${sessionScope.authuser ne null}">
	                		<div class="nav-item dropdown user-toogle">
	                		<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" id="dropdownMenuButton" aria-haspopup="true" aria-expanded="false">${sessionScope.authuser.name}</a>
	                	</c:when>
		                <c:otherwise>
		                	<a class="nav-link" href="<c:url value='/loginReg'/>" id="logginRegModalGenerator" data-toggle="modal">Login|Register&nbsp;<i class="fas fa-sign-in-alt"></i></a>
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
	        </ul>
        </div>
    </div>
</nav>
<%-- <script	type="text/javascript" src="<c:url value='/views/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript" src="<c:url value='/views/bootstrap/4.4.1/js/bootstrap.min.js'/>"></script>
 --%><script type="text/javascript">

</script>
				
