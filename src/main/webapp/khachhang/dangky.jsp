<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Sign Up</title>
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
		String baoLoi = request.getAttribute("baoLoi")+"";
		baoLoi = (baoLoi.equals("null"))?"":baoLoi;	
		
		String userName= request.getAttribute("userName")+"";	
		userName = (userName.equals("null"))?"":userName;
		
		String fullName= request.getAttribute("fullName")+"";
		fullName = (fullName.equals("null"))?"":fullName;
		
		String gender= request.getAttribute("gender")+"";
		gender = (gender.equals("null"))?"":gender;
		
		String address= request.getAttribute("address")+"";
		address = (address.equals("null"))?"":address;

		String phone= request.getAttribute("phone")+"";
		phone = (phone.equals("null"))?"":phone;
		
		String email= request.getAttribute("email")+"";
		email = (email.equals("null"))?"":email;

	%>
	<div class="container">
		<div class="text-center">
			<h1>SIGN UP</h1>
		</div>
		
		<div class="red" id="baoLoi">
			<%=baoLoi %>
		</div>
		<form class="form" action="../khachhang" method="post">
			<input type="hidden" name="action" value="dang-ky"/>
			<div class="row">
				<div class="col-sm-6">
					<h3>Account</h3>
					<div class="mb-3">
						<label for="userName" class="form-label">user name<span class="red">*</span></label> 
						<input type="text" class="form-control" id="userName" name="userName" required="required" value="<%=userName%>">
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">password<span class="red">*</span></label> 
						<input type="password" class="form-control" id="password" name="password" required="required" onkeyup="kiemTraMatKhau()">
					</div>
					<div class="mb-3">
						<label for="reEnterPassword" class="form-label" >re-enter password<span class="red">*</span> 
						<span id="msg" class="red" ></span>
						</label> 
						<input type="password" class="form-control" id="reEnterPassword" name="reEnterPassword" required="required" onkeyup="kiemTraMatKhau()">
					</div>
					<hr />
					<h3>Information</h3>
					<div class="mb-3">
						<label for="fullName" class="form-label">name</label> 
						<input type="text" class="form-control" id="fullName" name="fullName" value="<%=fullName%>">
					</div>
					<div class="mb-3">
						<label for="gender" class="form-label">gender</label> <select
							class="form-control" id="gender" name="gender">
							<option></option>
							<option value="Nam" <%=(gender.equals("Nam"))?"selected='selected'":"" %> >Male</option>
							<option value="Nữ" <%=(gender.equals("Nữ"))?"selected='selected'":"" %> >Female</option>
							<option value="Khác" <%=(gender.equals("Khác"))?"selected='selected'":"" %> >Others</option>
						</select>
					</div>
				</div>
				<div class="col-sm-6">
					<h3>Address</h3>
					<div class="mb-3">
						<label for="address" class="form-label">address</label> 
						<input type="text" class="form-control" id="address" name="address" value="<%=address%>">
					</div>	
					<div class="mb-3">
						<label for="phone" class="form-label">phone</label> 
						<input type="tel" class="form-control" id="phone" name="phone" value="<%=phone%>">
					</div>
					<div class="mb-3">
						<label for="email" class="form-label">email</label> 
						<input type="email" class="form-control" id="email" name="email"  value="<%=email%>">
					</div>
					<hr />
					<input class="btn btn-primary form-control" type="submit"
						value="Đăng ký" name="submit" id="submit" style="visibility: hidden;" />
				</div>
			</div>
		</form>
	</div>
</body>

<script>
	function kiemTraMatKhau(){
		password = document.getElementById("password").value;
		reEnterPassword = document.getElementById("reEnterPassword").value;
		if(password!=reEnterPassword){
			document.getElementById("msg").innerHTML = "password mismatch!";
			return false;
		}else{
			document.getElementById("msg").innerHTML = "";
			return true;
		}
	}
</script>
 <style>
body {
	background-color: #f8f9fa;
	font-family: Arial, sans-serif;
}
.container {
	max-width: 800px;
	margin: 50px auto;
	padding: 20px;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.text-center h1 {
	color: black;
}
.red {
	color: red;
}
.form-label {
	font-weight: bold;
	color: black;
}
.form-control {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	box-sizing: border-box;
	border: 1px solid #ced4da;
	border-radius: 5px;
}
.form-check-input {
	margin-top: 8px;
}
.btn-primary {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px;
	cursor: pointer;
}
a {
	color: #007bff;
	text-decoration: none;
}
@media (max-width: 768px) {
.col-sm-6 {
	width: 100%;
	}
}
</style>
</html>