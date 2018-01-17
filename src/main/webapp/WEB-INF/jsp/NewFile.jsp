<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<title>shop</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<nav class="navbar navbar-inverse navbar-static-top" role="topnav">
<div class="container">
<div class="navbar-inverse" id="topnav">
      <a class="navbar-brand"  href="#">Shop</a>

<ul class="nav navbar-nav">

<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navdemo">

<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
</ul>
</div>


<div class="collapse navbar-collapse" id="navdemo">
<ul class="nav navbar-nav">
<li><a href="index.jsp">Home</a>
<a href=#contact><i class="fa fa-address-book" aria-hidden="true"></i></a>
<a href="#product">Product List</a>
<a href="${pageContext.request.contextPath }/admin/adding">Admin</a></li>
<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"href="#">Admin List<span class="caret"></span></a>
<ul class="dropdown-menu">
<li><a href="${pageContext.request.contextPath }/admin/productList">Product</a></li>
<li><a href="${pageContext.request.contextPath }/admin/supplierList">Supplier</a></li>
<li><a href="${pageContext.request.contextPath }/admin/categoryList">Category</a></li>
</ul>
</li>

</ul>
<li class="dropdown">
<a class="navbar-brand" class="dropdown-toggle" data-toggle="dropdown" href="#">Category Choice<span class="caret"></span></a>
<ul class="dropdown-menu">
<c:forEach var="catVal" items="${catList}">
<li><a href="${pageContext.request.contextPath}/productcustList?cid=${catVal.cid}">${catVal.cname}</a></li>
</c:forEach> 
</ul>

<ul class="nav navbar-nav navbar right">
<c:if test="${pageContext.request.userPrincipal.name==null }">
<li><a href="${pageContext.request.contextPath}/goToRegister">Register</a></li>
<li><a href="${pageContext.request.contextPath}/gotoLogin">LogIn</a></li>

</c:if>

<c:if test="${pageContext.request.userPrincipal.name!=null }">
<li><a>Welcome: "${pageContext.request.userPrincipal.name}</a></li>
<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>

</c:if>

</ul>
</li>
</div>

</div>


</nav>
</body>
</html>