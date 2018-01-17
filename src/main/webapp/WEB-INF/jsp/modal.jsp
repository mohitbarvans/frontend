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
<hr>
<div class="modal fade bs-example-modal-sm" tabindex="1" role="dialog"
aria-labelledby="myModal" aria-hidden="true" id="onload">
<div class="modal-dialog modal-sm">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">X</button>
</div>

<div class="modal-body"><span>Added Successfully</span>
 <div class="modal-footer">
 <a href="${pageContext.request.contextPath }/admin/adding" class="btn btn-primary" role="button">Back</a>
 
 
 </div>
 </div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
${document}.ready(function()
{
	${'#onload' }.modal('show');});
</script>
</body>
</html>