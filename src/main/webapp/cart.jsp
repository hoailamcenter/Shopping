<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	<jsp:include page="header.jsp" /> 
<link href="css/style.css" rel="stylesheet" type="text/css">
	<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">CART</h1>
     </div>
</section>

<div class="container mb-4">
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col">Product</th>
                            <th scope="col">Available</th>
                            <th scope="col" >Quantity</th>
                            <th scope="col" class="text-right">Price</th>
                            <th scope="col" class="text-right">Total</th>
                            <th> </th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${cart.items}">
                        <tr>
                            <td><img src="https://dummyimage.com/50x50/55595c/fff" /> </td>
                            <td>${item.product.productName}</td>
                            <td>In stock</td>
                            <td>                                    		         
                            <form action="" method="post">
                			<input type="hidden" name="pid" value="${item.product.productId}">                
                			<input type=text name="quantity" value="${item.quantity}" id="quantity"> 
                       		<input type="hidden" name="update" value="true">
                			<input type="submit" value="Update">
            				</form> 
                           </td>
                            <td class="text-right">${item.product.price}</td>
                            <td class="text-right">${item.total}</td>
                            <td class="text-right">                           
                            	<form action="" method="get">
               						<input type="hidden" name="pid" value="<c:out value='${item.product.productId}'/>">
                					<input type="hidden" name="quantity" value="0">
                					<input type="submit" value="Remove">
            					</form>                            
                            </td>  
                        </tr>  
                     </c:forEach>                    
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><strong>Total</strong></td>
                            <td class="text-right"><strong></strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col mb-2">
            <div class="row">
                <div class="col-sm-12  col-md-6">
                    <form action="" method="get">
        				<input type="hidden" name="action" value="shop">
        				<input class="btn btn-block btn-light" type="submit" value="Continue Shopping">
    				</form>
                </div>
                <div class="col-sm-12 col-md-6 text-right">
                    <form action="" method="get">
        				<input type="hidden" name="action" value="checkout">
        				<input class="btn btn-lg btn-block btn-success text-uppercase" type="submit" value="Checkout">
    				</form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
<!-- JS -->
<script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>