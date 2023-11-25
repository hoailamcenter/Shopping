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
@WebServlet("/product")
public class ProductServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/htm");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String cid = request.getParameter("cid");
		List<Product> list = ProductDB.selectAllProduct();
		List<Product> list1 = ProductDB.selectTop4BestSeller();
		Product top = ProductDB.selectBestSellingProduct();
		List<Category> list2 = CategoryDB.selectAllCategory();
		List<Product> list3 = ProductDB.selectAllProductByCategoryId(cid);
		if (cid == null) {
			request.setAttribute("listAllproduct", list);
		} else {
			request.setAttribute("listAllproduct", list3);
		}
		request.setAttribute("list4bestseller", list1);
		request.setAttribute("top1product", top);
		request.setAttribute("listcate", list2);
		request.setAttribute("tagactive", cid);
		RequestDispatcher rq = request.getRequestDispatcher("product.jsp");
		rq.forward(request, response);		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
