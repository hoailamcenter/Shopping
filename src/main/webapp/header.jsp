<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Shopping</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" >
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600" rel="stylesheet" type="text/css">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" ></script>
    <link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Home</a></li>				
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">Category</a>
						<ul class="dropdown-menu">
							<c:forEach items="${listcate}" var="o">
							<li><a class="dropdown-item" href="product?cid=${o.categoryId}">${o.categoryName}</a></li>
							</c:forEach>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="product">Products</a></li>		
					<li class="nav-item"><a class="nav-link" href="cart">Cart</a></li>												
					<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
				</ul>
				<form action="search" method="post" class="d-flex" role="search" style="position: relative;display: block;float: right;">
					<div class="input-group input-group-sm">
						<input value="${txts}" name="txt" type="text" class="form-control"
							aria-label="Small" aria-describedby="inputGroup-sizing-sm"
							placeholder="Search...">
						<div class="input-group-append">
							<button type="submit" class="btn btn-secondary btn-number">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
					<%
						Object obj = session.getAttribute("khachHang");
						User khachHang = null;
						if (obj!=null)
							khachHang = (User)obj;
						
						if(khachHang==null){
					%>
						<a class="btn btn-primary" style="white-space: nowrap;" href="khachhang/dangnhap.jsp">
							Login
						</a>
					<%} else { %>
					<ul class="navbar-nav me-auto mb-2 mb-lg-0 bg-infor ">
						<li class="nav-item dropdown dropstart">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Account</a>
							<ul class="dropdown-menu">											
								<li><a class="dropdown-item" href="khachhang/thaydoithongtin.jsp">Change Information</a></li>
								<li><a class="dropdown-item" href="khachhang/doimatkhau.jsp">Change Password</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="khachhang?action=dang-xuat">Log Out</a></li>
							</ul></li>
					</ul>				
						
					<% } %>
				</form>
			</div>
		</div>
	</nav>