<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<c:url value="productUpdate" var="pru"></c:url>

<form method="post" action="productUpdate" class="form-signin" enctype="multipart/form-data">
<span id="reauth-email" class="reauth-email"></span>
<h4 class="input-title">Product Name</h4>
<input class="form-control" type="text" name="pName" required/>

<h4 class="input-title">Product Description</h4>
<input class="form-control" type="text" name="pDescription" required/>

<h4 class="input-title">Product Price</h4>
<input class="form-control" type="number" name="pPrice" required/>

<h4 class="input-title">Product Stock</h4>
<input class="form-control" type="number" name="pStock" required/>

<div class="form-group">
<table>
<tr>
	<td>Select Supplier</td>
	<td><select class="form-control" name="pSupplier" required>
	<option value="">---Select Supplier---</option>
	<c:forEach items="${sList}" var="sat">
	<option value="${sat.sid }">${sat.SupplierName }</option>
	</c:forEach>
	</select>
	</tr>
</table>
</div>

<div class="form-group">
<table>
<tr>
	<td>Select Category</td>
	<td><select class="form-control" name="pCategory" required>
	<option value="">---Select Category---</option>
	<c:forEach items="${cList}" var="cat">
	<option value="${cat.cid }">${cat.cname }</option>
	</c:forEach>
	</select>
	</tr>
</table>
</div>

<div calss="fileinput fileinput-new" data-provides="fileinput">
<td>Product Image</td>
<td><input class="form-control" type="file" name="file" accept="image/*"></td><!--browser & upload-->



</div>
<br>
<button class="btn btn-lg btn-primary" type="submit">Save</button>
<button class="btn btn-lg btn-warning" type="reset">Cancel</button>
</form>

</div>


</body>
</html>