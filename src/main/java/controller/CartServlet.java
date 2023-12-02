package controller;

import java.io.IOException;

import data.ProductDB;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.LineItem;
import model.Product;

@WebServlet(urlPatterns = {"/cart"}, name = "Cart")
public class CartServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException{
		ServletContext sc = getServletContext();
		String action = request.getParameter("action");
        if (action == null) {
            action = "cart";  
        }
        String url = "";
        if (action.equals("shop")) {
            url = "/home";    
        } 
        else if (action.equals("cart")) {
            String pid = request.getParameter("pid");
            String type = request.getParameter("update");
            
            if (pid != null && !pid.isEmpty()) {
                String quantityString = request.getParameter("quantity");
                int quantity;
                
                try {
                    quantity = Integer.parseInt(quantityString);
                    if (quantity < 0) {
                        quantity = 1;
                    }
                } catch (NumberFormatException nfe) {
                    quantity = 1;
                }
                if(type == null) type = "false";
                HttpSession session = request.getSession();
                Cart cart = (Cart) session.getAttribute("cart");
                
                if (cart == null) {
                    cart = new Cart();
                }
                
                Product product = ProductDB.getProductById(pid);
                
                if (product != null) {
                    LineItem lineItem = new LineItem();
                    lineItem.setProduct(product);
					lineItem.setQuantity(quantity); 
					
                    if (quantity > 0) {
                        cart.addItem(lineItem, type);
                    } else if (quantity == 0) {
                        cart.removeItem(lineItem);
                    }
                    
                    session.setAttribute("cart", cart);
                }
            }           
            url = "/cart.jsp";
        } else if (action.equals("checkout")) {
            url = "/checkout.jsp";
        }        
        sc.getRequestDispatcher(url).forward(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
