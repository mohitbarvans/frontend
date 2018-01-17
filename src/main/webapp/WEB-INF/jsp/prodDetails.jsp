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
<jsp:include page="/WEB-INF/jsp/NewFile.jsp"></jsp:include>
<div class="container">
<div class="row">
<div class="col-sm-4 item-photo">
<img style="max-width:100%; margin-top:30px" src="${pageContext.request.contextPath }/resources/${prod.imgName }">
</div>

<div class="col-sm-5" style="border:0px solid gray">
<h3>${prod.pname }</h3>
<h4>${prod.description }</h4>
<h4>${prod.price }</h4>
<h5>${prod.supplierName }</h5>
<div class="section" syle="padding-bottom:20px;">

<form action="${pageContext.request.contextPath }/addToCart" method="post">

<input type="hidden" value="${prod.pid }" name="pid"/>
<input type="hidden" value="${prod.price }" name="pprice"/>
<input type="hidden" value="${prod.pname }" name="pName"/>
<input type="hidden" value="${prod.imgName }" name="imgName"/>

<label>Qty</label><input type="number" class="form-control" name="pQty" required/><br><br>
<input class="btn btn-warning btn-lg" type="submit" value="Add To Cart">
<h6><span style="color:red;" class="glyphicon-heart-empty" style="cursor:pointer;"></span></h6>
</form>
</div>
</div>
<hr>
<div class="col-sm-9">
<h3>Product Details</h3>
<ul class="menu-item">
<li>All land properties</li>

</ul>

</div>
<br><br>
<h5>we are authorized</h5>

</div>

</div>

</body>
</html>