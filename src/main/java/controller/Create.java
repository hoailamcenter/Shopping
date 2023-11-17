package controller;

import java.io.IOException;

import data.UserDB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
@WebServlet("/create")
public class Create extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		User k = new User();
		k.setAddress("tp hcm");
		k.setEmail("admin@gmail.com");
		k.setFullName("nguyenvana");
		k.setGender("nam");
		k.setPassword("1234");
		k.setPhone("111");
		k.setUserName("admin1");
		UserDB.insert(k);
	}
}
