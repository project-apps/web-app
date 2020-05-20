<%@ page session="true"%> <%@ page isELIgnored="false"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
 <style>
  /* Make the image fully responsive */
  .carousel-inner img {
 	max-width: 100%;
    max-height: 100%;
  }
  </style>
<a href="<c:url value='/home'/>" style="font-size: 22px;"><span class="label">DeepDiveCode</span></a>
<div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  <div class="carousel-inner">
    <div class="carousel-item  active">
     <%--  <img src="<c:url value='/views/images/img-4.png'/>" alt="Java" width="1100" height="100"> --%>
      <div class="carousel-caption">
      </div>   
    </div>
    <div class="carousel-item">
     <%--  <img src="<c:url value='/views/images/img-2.jpg'/>" alt="NodeJS" width="1100" height="100"> --%>
      <div class="carousel-caption">
      </div>   
    </div>
    <div class="carousel-item">
     <%--  <img src="<c:url value='/views/images/img-1.png'/>" alt="Spring" width="1100" height="100"> --%>
      <div class="carousel-caption">
      </div>   
    </div>
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>