package controller;

import java.io.IOException;

import data.InvoiceDB;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Invoice;
import model.User;

public class InvoiceServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		String url = "/home";
        ServletContext servletContext= getServletContext();
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (action == null){ 
        	action = "order";
        	}
        else if (action.equals("order")){
            User customer = (User) session.getAttribute("khachHang");            
            Cart cart =(Cart) session.getAttribute("cart");
            Invoice invoice = new Invoice();
            invoice.setInvoiceNumber(invoice.getInvoiceNumber());
            invoice.setUser(customer);
            invoice.setLineltems(cart.getItems());
            InvoiceDB.insert(invoice);                      
            }       
        servletContext.getRequestDispatcher(url).forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
