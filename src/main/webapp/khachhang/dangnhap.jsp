<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Log In</title>
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
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>
<link href="<%=url%>" rel="stylesheet">
</head>
<body>
	<main class="form-signin w-100 m-auto">
		<form class="text-center" action="/FinalProject/khachhang" method="POST">
			<input type="hidden" name="action" value="dang-nhap"/>
		
			<img class="mb-4" src="<%=url %>/img/logo/logo.png" alt="" width="72">
			<h1 class="h3 mb-3 fw-normal">LOG IN</h1>
			<%
				String baoLoi = request.getAttribute("baoLoi")+"";
				if(baoLoi.equals("null")){
					baoLoi = "";
				}
			%>
			<div class="text-center"><span class="red"><%=baoLoi %></span></div>
			<div class="form-floating">
				<input type="text" class="form-control" id="userName" placeholder="userName" name="userName"> <label for="userName">UserName</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="password" placeholder="password" name="password"> <label for="password">Password</label>
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me">
					Save account
				</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">Log In</button>
			<a href="dangky.jsp">Sign up</a>
			<p class="mt-5 mb-3 text-muted">&copy;</p>
		</form>
	</main>
</body>
<style>
body {
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f8f9fa;
}     
.form-signin {
    max-width: 400px;
    padding: 15px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-signin img {
	width: 72px;
	margin-bottom: 20px;
}

.form-signin h1 {
	font-size: 1.5rem;
	margin-bottom: 20px;
	color: #007bff;
}

.red {
	color: red;
}

.form-floating {
	margin-bottom: 15px;
}

.form-floating label {
	color: #007bff;
}
.form-floating input {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}
.checkbox {
	margin-bottom: 15px;
}
.checkbox label {
	color: #007bff;
}

.btn-primary {
	background-color: #007bff;
	border: none;
}

a {
	color: #007bff;
	text-decoration: none;
	display: block;
	margin-top: 15px;
}
a:hover {
	text-decoration: underline;
}
.text-muted {
	color: #6c757d;
	margin-top: 30px;
	text-align: center;
}
</style>

</html>

