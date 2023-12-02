package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

import java.io.IOException;
import java.util.List;
import data.ProductDB;



@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String txtsearch = request.getParameter("txt");

		List<Product> List = ProductDB.SearchByName(txtsearch);
		List<Product> list1 = ProductDB.selectTop4BestSeller();
		Product top = ProductDB.selectBestSellingProduct();
;

		request.setAttribute("listAllproduct", List);
		request.setAttribute("txts", txtsearch);
		request.setAttribute("list4bestseller", list1);
		request.setAttribute("top1product", top);
		request.getRequestDispatcher("product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
