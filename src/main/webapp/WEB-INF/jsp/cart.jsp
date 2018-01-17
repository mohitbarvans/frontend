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
<table class="table table-hover" id="apl" class="display" border="2" width="80" align="center">
<tr>
<th>Sl No</th>
<th>PID</th>
<th>Product Name</th>
<th>Product Quatity</th>
<th>Product Price</th>
<th>Product Image</th>
<th>Sub Total</th>
<th>Action</th>
<th class="span2">Action</th>
</tr>

<c:if test="${empty cartInfo }">
<tr>
<td colspan="10" align="center">No record exists!!</td>
</tr>

</c:if>
<c:forEach var="p" varStatus="st" items="${cartInfo }">
<tr>

<td><c:out value="${p.prodName }"></c:out></td>
<td><c:out value="${p.qty }"></c:out></td>
<td><c:out value="${p.price }"></c:out></td>

<td><img src="${pageContext.request.contextPath }/resources/${p.imgname }" height="50px" width="50px">
<td><c:out value="${p.qty * p.price }"/></td>

<td class="span2">
<c:set var="contextRoot" value="${pageContext.request.contextPath }"></c:set>
<a class="btn btn-danger" role="button" href="<c:url value="/DeletePCart/${p.cartId }"/>">Delete</a>


</td>

</tr>
</c:forEach>
<td>
<c:set var="gtot" value="${gtot+ p.price * p.qty }"></c:set>
<span class="col-lg-9" align="right"><label>Grand Total</label><c:out value="${gtot }"/></span>
</td>
<tfoot>
<td>
<a class="btn btn-warning btn-lg" href="${pageContext.request.contextPath }/index">Continue Shopping</a>
</td>
<td>
<a class="btn btn-success btn-lg" href="${pageContext.request.contextPath }/checkout">Checkout</a>
</td>
</tfoot>

</table>
</body>
</html>