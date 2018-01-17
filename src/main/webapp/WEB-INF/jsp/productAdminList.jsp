<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<title>shop</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<jsp:include page="/WEB-INF/jsp/NewFile.jsp"></jsp:include>
<div class="container">
<h2>Product List for Admin</h2>
<table class="table table-hover" id="apl" class="display" border="2" width="80" align="center">
<tr>
<th>Sl No</th>
<th>PID</th>
<th>Product Name</th>
<th>Product Supplier</th>
<th>Product Category</th>
<th>Description</th>
<th>Stock</th>
<th>Price</th>
<th>Image</th>
<th class="span2">Action</th>
</tr>

<c:if test="${empty prodList }">
<tr>
<td colspan="10" align="center">No record exists!!</td>
</tr>

</c:if>
<c:forEach var="p" varStatus="st" items="${prodList }">
<tr>
<td><c:out value="${st.count }"></c:out></td>
<td><c:out value="${p.pid }"></c:out></td>
<td><c:out value="${p.pname }"></c:out></td>
<td><c:out value="${p.supplier.supplierName }"></c:out></td>
<td><c:out value="${p.category.cname }"></c:out></td>
<td class=""><c:out value="${p.description }"></c:out></td>
<td><c:out value="${p.price }"></c:out></td>
<td><c:out value="${p.stock }"></c:out></td>
<td><img src="${pageContext.request.contextPath }/resources/${p.imgName }" height="50px" width="50px"></td>
<td><c:set var="contexRoot" value="${pageContext.request.contextPath }"></c:set>
<a class="btn btn-info" role="button" href="${ContextRoot }/admin/updateProd?pid=<c:out value="${p.pid }"></c:out>"/>Edit</a>
<a class="btn btn-danger" role="button" href="<c:url value="/admin/deleteProd/${p.pid }"/>">Delete</a></td>
</tr>
</c:forEach>

</table>


</div>

</body>
</html>