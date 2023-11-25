<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" >
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
</head>
<body >
	<%
		Object obj = session.getAttribute("khachHang");
		User user = null;
		if (obj!=null)
			user = (User)obj;		
			if(user==null){		
	%>
	<h1>You are not logged into the system. Please return to home page!</h1>
	<%
			}else {
				String baoLoi = request.getAttribute("baoLoi")+"";
				if(baoLoi.equals("null")){
					baoLoi = "";
				}
	%>
	<div class="container">
		<h3>CHANGE PASSWORD</h3>
		<span style="color: red">
			<%=baoLoi%>
		</span>
		<form action="/FinalProject/khachhang" method="POST">
			<input type="hidden" name="action" value="doi-mat-khau"/>
		  <div class="mb-3">
		    <label for="currentPassword" class="form-label">Current Password</label>
		    <input type="password" class="form-control" id="currentPassword" name="currentPassword">
		  </div>
		  <div class="mb-3">
		    <label for="newPassword" class="form-label">New Password</label>
		    <input type="password" class="form-control" id="newPassword" name="newPassword">
		  </div>
		  <div class="mb-3">
		    <label for="reEnterPassword" class="form-label">New PassWord</label>
		    <input type="password" class="form-control" id="reEnterPassword" name="reEnterPassword">
		  </div>
		  <button type="submit" class="btn btn-primary">Save Password</button>
		</form>
	</div>
	<%} %>
</body>
<style>
.container {
    max-width: 400px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h3 {
    text-align: center;
    color: #333;
}

span {
    color: red;
    display: block;
    margin-bottom: 15px;
}

form {
    display: flex;
    flex-direction: column;
}

.form-label {
    margin-bottom: 5px;
}

.form-control {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.btn-primary {
    background-color: #007bff;
    color: #fff;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.btn-primary:hover {
    background-color: #0056b3;
}

</style>
</html>