<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="NewFile.jsp"></jsp:include>
<div class="container">
<h2>Registration Form</h2>
<div class="col-sm-8">
<div class="row">
<form:form modelAttribute="user" action="saveRegister" method="post">
<div class="form-group">
<label>Name:</label><br>
<form:input path="name" class="form-control" placeholder="Enter Name"/>
</div>



<div class="form-group">
<label>Password:</label><br>
<form:input path="password" type="password" class="form-control" placeholder="Enter Password"/>
</div>

<div class="form-group">
<label>Email:</label><br>
<form:input path="email" class="form-control" placeholder="Enter Email"/>
</div>

<div class="form-group">
<label>Address:</label><br>
<form:input path="address" class="form-control" placeholder="Enter Address"/>
</div>

<div class="form-group">
<label>Phone:</label><br>
<form:input path="phone" class="form-control" placeholder="Enter Phone"/>
</div>

<br><br>
<button type="submit" class="btn btn-lg btn-info">SUBMIT</button>

<button type="reset" class="btn btn-lg btn-info">CANCEL</button>
<br><br><br>

</form:form>
</div>





</div>






</div>



</body>
</html>