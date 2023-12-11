<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	<jsp:include page="header.jsp" /> 
	<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">PRODUCTS AND CATEGORIES</h1>
        <p class="lead text-muted mb-0"></p>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                    <li class="breadcrumb-item"><a href="product">Category</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Sub-category</li>
                </ol>
            </nav>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-12 col-sm-3">
            <div class="card bg-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                <ul class="list-group category_block">
                	<c:forEach items="${listcate}" var="o">
                    <li class="list-group-item"><a href="product?cid=${o.categoryId}">${o.categoryName}</a></li>  
                    </c:forEach>               
                </ul>
            </div>
            <div class="card bg-light mb-3">
                <div class="card-header bg-success text-white text-uppercase">Last product</div>
                <div class="card-body">
                    <img class="img-fluid" src="${top1product.imgLink}" />
                    <h5 class="card-title">${top1product.productName}</h5>
                    <p class="card-text">${top1product.descript}</p>
                    <p class="btn btn-danger btn-block">${top1product.price}</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="row">
            	<c:forEach items="${listAllproduct}" var="p">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card">
                        <img class="card-img-top" src="${p.imgLink}" alt="Card image cap">
                        <div class="card-body">
                            <h6 class="card-title"><a href="productdetail?pid=${p.productId}" title="View Product">${p.productName}</a></h6>
                            <p class="card-text">${p.descript}</p>
                            <div class="row">
                                <div class="col">
                                    <p class="btn btn-danger btn-block">${p.price}</p>
                                </div>
                                <div class="col">
                                <form action="cart" method="get">
                                    <a href="cart?pid=${p.productId}" class="btn btn-success btn-block">Add to cart</a>
                                   </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>             
                <ul class="pagination">
					<c:forEach begin="1" end="${endP}" var="i">
					<li class="page-item active"><a href="paging?index=${i}"
					class="page-link">${i}</a></li>
					</c:forEach>
			</ul>
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
    width: 243.5px; 
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