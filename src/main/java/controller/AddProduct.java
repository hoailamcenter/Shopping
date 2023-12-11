package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import data.ProductDB;

public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String pname = request.getParameter("name");
		String pdescription = request.getParameter("description");
		String priceStr = request.getParameter("price");
		String pimage = request.getParameter("image");
		String pcategoryStr = request.getParameter("category");
		String pamountStr = request.getParameter("amount");

		double price = Double.parseDouble(priceStr);
		int pcategory = Integer.parseInt(pcategoryStr);
		int pamount = Integer.parseInt(pamountStr);

		ProductDB pdb = new ProductDB();
		pdb.insertProduct(pname, pdescription, price, pimage, pcategory, pamount);
		response.sendRedirect("manager");
	}

}
