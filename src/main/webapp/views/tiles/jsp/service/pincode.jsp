<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="true"%> <%@ page isELIgnored="false"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<form:form class="form-inline" action="pincode" modelAttribute="pincodeDto" method="GET">
  <div class="form-row">
  	<div class="form-group col-md-6">
      <form:input class="form-control" placeholder="Enter pincode" path="pincode"/>
    </div>
    <div class="form-group col-md-4">
      <label for="inputState"  class="sr-only">Data View</label>
      <form:select path="dataView" class="form-control">
        <form:option value="0" label="All"/>
        <form:option value="1" label="Single"/>
      </form:select>
    </div>
    <div class="form-group col-md-2">
    	<button type="submit" class="btn btn-primary">Submit</button>
    </div>
  </div>
</form:form>
<c:out value='${pincodeJSON}'/>