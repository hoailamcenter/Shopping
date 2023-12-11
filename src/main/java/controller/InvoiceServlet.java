package controller;

import java.io.IOException;

import data.InvoiceDB;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Invoice;

import model.User;
@WebServlet(urlPatterns = {"/order"}, name = "Invoice")
public class InvoiceServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		String url = "/home";
        ServletContext servletContext= getServletContext();
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (action == null){ action = "order";}
        if (action.equals("order"))
        {
            User khachHang = (User) session.getAttribute("khachHang");            
            Cart cart =(Cart) session.getAttribute("cart");
            
            Invoice invoice = new Invoice();
           
            invoice.setUser(khachHang);
            invoice.setLineItems(cart.getItems());
            InvoiceDB.insert(invoice);  
            
            session.removeAttribute("cart");
            url = "/khachhang/thanhcong.jsp";
        }       
        servletContext.getRequestDispatcher(url).forward(request, response);
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
