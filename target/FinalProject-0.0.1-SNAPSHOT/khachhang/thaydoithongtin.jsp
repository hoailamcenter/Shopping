<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Account Information</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"></script>
<style>
.red {
	color: red;
}
</style>
</head>
<body>
	<%
		Object obj = session.getAttribute("khachHang");
		User khachHang = null;
		if (obj!=null)
			khachHang = (User)obj;		
			if(khachHang==null){		
	%>
	<h1>You are not logged into the system. Please return to home page!</h1>
	<%
			}else {
				
	%>
	<div class="container">
	<%
		String baoLoi = request.getAttribute("baoLoi")+"";
		baoLoi = (baoLoi.equals("null"))?"":baoLoi;
		
		String fullName= khachHang.getFullName();
		
		String gender= khachHang.getGender();
				
		String address= khachHang.getAddress();
		
		String phone= khachHang.getPhone();
		
		String email= khachHang.getEmail();
		
	%>
	<div class="container">
		<div class="text-center">
			<h1>Account Information</h1>
		</div>
		
		<div class="red" id="baoLoi">
			<%=baoLoi %>
		</div>
		<form class="form" action="../khachhang" method="post">
			<input type="hidden" name="action" value="thay-doi-thong-tin"/>
			<div class="row">
				<div class="col-sm-6">
					
					<h3>Your Information</h3>
					<div class="mb-3">
						<label for="gender" class="form-label">name</label> <input
							type="text" class="form-control" id="fullName" name="fullName" value="<%=fullName%>">
					</div>
					<div class="mb-3">
						<label for="gender" class="form-label">gender</label> 
						<select class="form-control" id="gender" name="gender">
							<option></option>
							<option value="Nam" <%=(gender.equals("Nam"))?"selected='selected'":"" %> >Male</option>
							<option value="Nữ" <%=(gender.equals("Nữ"))?"selected='selected'":"" %> >Female</option>
							<option value="Khác" <%=(gender.equals("Khác"))?"selected='selected'":"" %> >Other</option>
						</select>
					</div>
				</div>
				<div class="col-sm-6">
					<h3>Address</h3>
					<div class="mb-3">
						<label for="address" class="form-label">address</label> <input type="text" class="form-control"
							id="address" name="address" value="<%=address%>">
					</div>
					<div class="mb-3">
						<label for="phone" class="form-label">Phone</label> <input
							type="tel" class="form-control" id="phone" name="phone" value="<%=phone%>">
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">Email</label> <input
							type="email" class="form-control" id="email" name="email"  value="<%=email%>">
					</div>
					<hr />					
					<input class="btn btn-primary form-control" type="submit"
						value="Save" name="submit" id="submit" />
				</div>
			</div>
		</form>
	</div>
	</div>
	<%} %>
</body>
<style>
.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
}

.text-center {
    text-align: center;
}

.red {
    color: red;
}

.form {
    margin-top: 20px;
}

.row {
    display: flex;
    justify-content: space-between;
}

.col-sm-6 {
    width: 48%;
}


.form-control {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    box-sizing: border-box;
}


.btn-primary {
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
}


hr {
    border: 1px solid #ddd;
    margin-top: 20px;
    margin-bottom: 20px;
}

h1, h3 {
    color: #333;
}

</style>
</html>