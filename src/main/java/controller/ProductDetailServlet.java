package controller;

import java.io.IOException;
import java.util.List;

import data.CategoryDB;
import data.ProductDB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

@WebServlet(urlPatterns = {"/productdetail"})
public class ProductDetailServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/htm");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String pid = request.getParameter("pid");

		List<Product> list1 = ProductDB.selectTop4BestSeller();
		Product detail = ProductDB.getProductById(pid);
		List<Category> list2 = CategoryDB.selectAllCategory();


		request.setAttribute("list4bestseller", list1);
		request.setAttribute("pdetail", detail);
		request.setAttribute("listcate", list2);

		RequestDispatcher rq = request.getRequestDispatcher("productdetail.jsp");
		rq.forward(request, response);		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
