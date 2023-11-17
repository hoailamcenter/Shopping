<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Document</title>
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
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="products.jsp">Products</a></li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="category.jsp" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Category </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Jean pant</a></li>
							<li><a class="dropdown-item" href="#">T-Shirt</a></li>
							<!-- <li><hr class="dropdown-divider"></li> -->
							<li><a class="dropdown-item" href="#">Shirt</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a>
					</li>
				</ul>
				<form class="d-flex" role="search" style="position: relative;display: block;float: right;">
					<!-- <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Find</button> -->
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
								<!-- <li><a class="dropdown-item" href="#">My Order</a></li>
								<li><a class="dropdown-item" href="#">Notice</a></li> -->
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
	<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading"></h1>
        <p class="lead text-muted mb-0"></p>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="https://dummyimage.com/855x365/55595c/fff" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://dummyimage.com/855x365/a30ca3/fff" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://dummyimage.com/855x365/1443ff/fff" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="col-12 col-md-3">
            <div class="card">
                <div class="card-header bg-success text-white text-uppercase">
                    <i class="fa fa-heart"></i> Top product
                </div>
                <img class="img-fluid border-0" src="https://dummyimage.com/600x400/55595c/fff" alt="Card image cap">
                <div class="card-body">
                    <h4 class="card-title text-center"><a href="product.html" title="View Product">Product title</a></h4>
                    <div class="row">
                        <div class="col">
                            <p class="btn btn-danger btn-block">99.00 $</p>
                        </div>
                        <div class="col">
                            <a href="product.html" class="btn btn-success btn-block">View</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container mt-3">
    <div class="row">
        <div class="col-sm">
            <div class="card">
                <div class="card-header bg-primary text-white text-uppercase">
                    <i class="fa fa-star"></i> Last products
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm">
                            <div class="card">
                                <img class="card-img-top" src="https://dummyimage.com/600x400/55595c/fff" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title"><a href="product.html" title="View Product">Product title</a></h4>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">99.00 $</p>
                                        </div>
                                        <div class="col">
                                            <a href="cart.html" class="btn btn-success btn-block">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm">
                            <div class="card">
                                <img class="card-img-top" src="https://dummyimage.com/600x400/55595c/fff" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title"><a href="product.html" title="View Product">Product title</a></h4>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">99.00 $</p>
                                        </div>
                                        <div class="col">
                                            <a href="cart.html" class="btn btn-success btn-block">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm">
                            <div class="card">
                                <img class="card-img-top" src="https://dummyimage.com/600x400/55595c/fff" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title"><a href="product.html" title="View Product">Product title</a></h4>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">99.00 $</p>
                                        </div>
                                        <div class="col">
                                            <a href="cart.html" class="btn btn-success btn-block">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm">
                            <div class="card">
                                <img class="card-img-top" src="https://dummyimage.com/600x400/55595c/fff" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title"><a href="product.html" title="View Product">Product title</a></h4>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">99.00 $</p>
                                        </div>
                                        <div class="col">
                                            <a href="cart.html" class="btn btn-success btn-block">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container mt-3 mb-4">
    <div class="row">
        <div class="col-sm">
            <div class="card">
                <div class="card-header bg-primary text-white text-uppercase">
                    <i class="fa fa-trophy"></i> Best products
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm">
                            <div class="card">
                                <img class="card-img-top" src="https://dummyimage.com/600x400/55595c/fff" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title"><a href="product.html" title="View Product">Product title</a></h4>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">99.00 $</p>
                                        </div>
                                        <div class="col">
                                            <a href="cart.html" class="btn btn-success btn-block">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm">
                            <div class="card">
                                <img class="card-img-top" src="https://dummyimage.com/600x400/55595c/fff" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title"><a href="product.html" title="View Product">Product title</a></h4>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">99.00 $</p>
                                        </div>
                                        <div class="col">
                                            <a href="cart.html" class="btn btn-success btn-block">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm">
                            <div class="card">
                                <img class="card-img-top" src="https://dummyimage.com/600x400/55595c/fff" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title"><a href="product.html" title="View Product">Product title</a></h4>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">99.00 $</p>
                                        </div>
                                        <div class="col">
                                            <a href="cart.html" class="btn btn-success btn-block">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm">
                            <div class="card">
                                <img class="card-img-top" src="https://dummyimage.com/600x400/55595c/fff" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title"><a href="product.html" title="View Product">Product title</a></h4>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">99.00 $</p>
                                        </div>
                                        <div class="col">
                                            <a href="cart.html" class="btn btn-success btn-block">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Footer -->
<footer class="text-light">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-lg-4 col-xl-3">
                <h5>About</h5>
                <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                <p class="mb-0">
                    Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.
                </p>
            </div>

            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto">
                <h5>Informations</h5>
                <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                <ul class="list-unstyled">
                    <li><a href="">Link 1</a></li>
                    <li><a href="">Link 2</a></li>
                    <li><a href="">Link 3</a></li>
                    <li><a href="">Link 4</a></li>
                </ul>
            </div>

            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto">
                <h5>Others links</h5>
                <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                <ul class="list-unstyled">
                    <li><a href="">Link 1</a></li>
                    <li><a href="">Link 2</a></li>
                    <li><a href="">Link 3</a></li>
                    <li><a href="">Link 4</a></li>
                </ul>
            </div>

            <div class="col-md-4 col-lg-3 col-xl-3">
                <h5>Contact</h5>
                <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                <ul class="list-unstyled">
                    <li><i class="fa fa-home mr-2"></i> My company</li>
                    <li><i class="fa fa-envelope mr-2"></i> email@example.com</li>
                    <li><i class="fa fa-phone mr-2"></i> + 33 12 14 15 16</li>
                    <li><i class="fa fa-print mr-2"></i> + 33 12 14 15 16</li>
                </ul>
            </div>
            <div class="col-12 copyright mt-3">
                <p class="float-left">
                    <a href="#">Back to top</a>
                </p>
                <p class="text-right text-muted">created with <i class="fa fa-heart"></i> by <a href="https://t-php.fr/43-theme-ecommerce-bootstrap-4.html"><i>t-php</i></a> | <span>v. 1.0</span></p>
            </div>
        </div>
    </div>
</footer>

<!-- JS -->
<script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>
	
</body>
</html>