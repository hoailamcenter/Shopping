<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	<jsp:include page="header.jsp" />  

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
                        <img class="d-block w-100" src="https://m.media-amazon.com/images/S/aplus-media/sota/30de4df8-bf62-474f-bb5d-7830a5ebb0e3.__CR0,0,600,180_PT0_SX600_V1___.png" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://m.media-amazon.com/images/S/aplus-media/sota/30de4df8-bf62-474f-bb5d-7830a5ebb0e3.__CR0,0,600,180_PT0_SX600_V1___.png" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://m.media-amazon.com/images/S/aplus-media/sota/30de4df8-bf62-474f-bb5d-7830a5ebb0e3.__CR0,0,600,180_PT0_SX600_V1___.png" alt="Third slide">
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
            <div class="card" style="height: 100%;">            
                <div class="card-header bg-success text-white text-uppercase">
                    <i class="fa fa-heart"></i> Top product
                </div>              
                <img class="img-fluid border-0" src="${top1product.imgLink}" alt="Card image cap">
                <div class="card-body">                  
                    <div class="row">
                        <div class="col">
                            <p class="btn btn-danger btn-block">${top1product.price}</p>
                        </div>
                        <div class="col">
                            <a href="productdetail?pid=${top1product.productId}" class="btn btn-success btn-block">View</a>
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
                        <div class="col-sm-3">
                            <div class="card">
                                <img class="card-img-top" src="${o.imgLink}" alt="Card image cap">
                                <div class="card-body">
                                    <h6 class="card-title"><a href="productdetail?pid=${o.productId}" title="View Product">${o.productName}</a></h6>
                                    <p class="card-text">${o.descript}</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">${o.price}</p>
                                        </div>
                                        <div class="col">
                                            <a href="cart?pid=${o.productId}" class="btn btn-success btn-block">Add to cart</a>
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
                        <div class="col-sm-3">
                            <div class="card">
                                <img class="card-img-top" src="${o.imgLink}" alt="Card image cap">
                                <div class="card-body">
                                    <h6 class="card-title"><a href="productdetail?pid=${o.productId}" title="View Product">${o.productName}</a></h6>
                                    <p class="card-text">${o.descript}</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">${o.price}</p>
                                        </div>
                                        <div class="col">
                                            <a href="cart?pid=${o.productId}" class="btn btn-success btn-block">Add to cart</a>
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
<jsp:include page="footer.jsp" />
<style>
.card {
    flex: 1;
    display: flex;
    flex-direction: column;
    border: 1px solid #ccc;
    margin: 5px;
}

.card-body {
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: center; 
    justify-content: center; 
}
.card-img-top {
    width: 230px; 
  	height: 230px; 
  	object-fit: cover;
}
.card-text {
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 2; 
    -webkit-box-orient: vertical;
}
</style>
<!-- JS -->
<script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>
	
</body>
</html>