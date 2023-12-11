package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

import java.io.IOException;
import java.util.List;

import data.CategoryDB;
import data.ProductDB;

@WebServlet("/paging")
public class PagingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PagingServlet() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String indexPage = request.getParameter("index");
		if (indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);

		int count = ProductDB.getTotalProduct();
		int endPage = count / 4;
		if (count % 4 != 0) {
			endPage++;
		}

		List<Product> list = ProductDB.getPagingProduct(index, 4);
		List<Category> list2 = CategoryDB.selectAllCategory();
		Product top = ProductDB.selectBestSellingProduct();

		request.setAttribute("listAllproduct", list);
		request.setAttribute("endP", endPage);
		request.setAttribute("top1product", top);
		request.setAttribute("listcate", list2);

		request.getRequestDispatcher("/product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
