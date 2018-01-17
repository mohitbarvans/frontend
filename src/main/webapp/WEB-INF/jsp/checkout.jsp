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
<div class="col-xs-6" id="jumbotron">
<div class="head">
<label>Customer Shipping Details</label>
</div>
<div class="outer">
<div class="well" style="width:100%">
<form action="${pageContext.request.contextPath }/invoiceprocess" method="post">
<c:set var="gtot" value="0" ></c:set>
<c:forEach var="c" items="${cart }">
<c:set var="gtot" value="${gtot+ c.price * c.qty }"/>
</c:forEach>
<div class="well">
<table>
<tr>
<td colspan="3">NAME</td><td>${user.name }</td>
</tr>

<tr>
<td colspan="3">EMAIL</td><td>${user.email }</td>
</tr>

<tr>
<td colspan="3">Address</td><td>${user.address }</td>
</tr>

<tr>
<td colspan="3">Phone</td><td>${user.phone }</td>
</tr>
</table>
<div class="outer">
<h3>Enter Payment Details</h3>
<br>
<label>Select Payment</label>
<select name="payment">
<option value="COD">Cash On Delivery</option>
<option value="Net">Net Banking</option>
</select><br><br>
<div>
Name:<input type="text" name="name on card" >
Card number:<input type="number" name="card number">

</div>

</div>
<input type="submit" value="PROCEED" style="width:50%" class="btn btn-danger">


</div>
</form>
</div>


</div>


</div>

</div>


</body>
</html>