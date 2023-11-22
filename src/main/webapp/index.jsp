<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	<jsp:include page="header.jsp" />  
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
                        <img class="d-block w-100" src="https://dummyimage.com/855x365/a30ca3/fff" alt="First slide">
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
        <div class="col-12 col-md-3" >              	  	
            <div class="card">            
                <div class="card-header bg-success text-white text-uppercase">
                    <i class="fa fa-heart"></i> Top product
                </div>              
                <img class="img-fluid border-0" src="${top1product.imgLink}" alt="Card image cap">
                <div class="card-body">
                    <h4 class="card-title text-center"><a href="products.jsp" title="View Product">${top1product.productName}</a></h4>
                    <div class="row">
                        <div class="col">
                            <p class="btn btn-danger btn-block">${top1product.price}</p>
                        </div>
                        <div class="col">
                            <a href="product.jsp" class="btn btn-success btn-block">View</a>
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
                    <c:forEach items="${list4product}" var="o">
                        <div class="col-sm">
                            <div class="card">
                                <img class="card-img-top" src="${o.imgLink}" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title"><a href="products.jsp" title="View Product">${o.productName}</a></h4>
                                    <p class="card-text">${o.descript}</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">${o.price}</p>
                                        </div>
                                        <div class="col">
                                            <a href="cart.jsp" class="btn btn-success btn-block">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                      </c:forEach>                      
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
                    <c:forEach items="${list4bestseller}" var="o">
                        <div class="col-sm">
                            <div class="card">
                                <img class="card-img-top" src="${o.imgLink}" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title"><a href="products.jsp" title="View Product">${o.productName}</a></h4>
                                    <p class="card-text">${o.descript}</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">${o.price}</p>
                                        </div>
                                        <div class="col">
                                            <a href="cart.html" class="btn btn-success btn-block">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       </c:forEach>
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
<style>
    .col-sm {
        display: flex;
        flex-direction: column;
    }

    .card {
        flex: 1;
        display: flex;
        flex-direction: column;
        border: 1px solid #ccc;
        margin: 5px;
    }

    .card-img-top {
        width: 100%;
        height: auto;
    }

    .card-body {
        flex: 1;
        display: flex;
        flex-direction: column;
    }

    .card-text {
        overflow: hidden;
        display: -webkit-box;
        -webkit-line-clamp: 2; 
        -webkit-box-orient: vertical;
    }

    .row {
        display: flex;
    }

    .col {
        flex: 1;
        margin: 5px;
    }

    .btn-danger,
    .btn-success {
        flex: 1;
        margin: 5px;
    }

    .btn-danger {
        text-align: center;
    }
</style>
</html>