package controller;

import java.io.IOException;
import data.Encrypt;
import data.UserDB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
@WebServlet(urlPatterns = {"/khachhang"}, name = "User")
public class UserServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equals("dang-nhap")) {
			dangNhap(request, response);
		} else if (action.equals("dang-xuat")) {
			dangXuat(request, response);
		} else if (action.equals("dang-ky")) {
			dangKy(request, response);
		} else if (action.equals("doi-mat-khau")) {
			doiMatKhau(request, response);
		} else if (action.equals("thay-doi-thong-tin")) {
			thayDoiThongTin(request, response);
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	private void dangNhap(HttpServletRequest request, HttpServletResponse response) {
		try {
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			password = Encrypt.toSHA1(password);

			User user = new User();
			user.setUserName(userName);
			user.setPassword(password);
			
			UserDB khd = new UserDB();
			User khachHang = khd.selectByUsernameAndPassword(user);
			String url = "";
			if (khachHang != null) {
				HttpSession session = request.getSession();
				session.setAttribute("khachHang", khachHang);
				User adminUser = khd.selectAdmin(user);
	            if (adminUser != null) {
	                url = "/admin/manage.jsp"; 
	            } else {
	                url = "/home"; 
	            }
			} else {			
				request.setAttribute("baoLoi", "Incorrect username or password!");
				url = "/khachhang/dangnhap.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	private void dangXuat(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			session.invalidate();

			String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath();

			response.sendRedirect(url + "/home");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void dangKy(HttpServletRequest request, HttpServletResponse response) {
		try {
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			String reEnterPassword = request.getParameter("reEnterPassword");
			String fullName = request.getParameter("fullName");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			request.setAttribute("userName", userName);
			request.setAttribute("fullName", fullName);
			request.setAttribute("gender", gender);
			request.setAttribute("address", address);;
			request.setAttribute("phone", phone);
			String url = "";
			String baoLoi = "";
			UserDB khachHangDAO = new UserDB();

			if (khachHangDAO.kiemTraTenDangNhap(userName)) {
				baoLoi += "The username already exists, please select another username.<br/>";
			}

			if (!password.equals(reEnterPassword)) {
				baoLoi += "Aperture pattern mismatch.<br/>";
			} else {
				password = Encrypt.toSHA1(password);
			}

			request.setAttribute("baoLoi", baoLoi);

			if (baoLoi.length() > 0) {
				url = "/khachhang/dangky.jsp";
			} else {				
				User kh = new User();
				kh.setAddress(address);
				kh.setEmail(email);
				kh.setFullName(fullName);
				kh.setGender(gender);
				kh.setPassword(password);
				kh.setPhone(phone);
				kh.setUserName(userName);
				UserDB.insert(kh);
				url = "/khachhang/thanhcong.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void doiMatKhau(HttpServletRequest request, HttpServletResponse response) {
		try {
			String currentPassword = request.getParameter("currentPassword");
			String newPassword = request.getParameter("newPassword");
			String reEnterPassword = request.getParameter("reEnterPassword");

			String currentPassword_Sha1 = Encrypt.toSHA1(currentPassword);

			String baoLoi = "";
			String url = "/khachhang/doimatkhau.jsp";

			HttpSession session = request.getSession();
			Object obj = session.getAttribute("khachHang");
			User khachHang = null;
			if (obj != null)
				khachHang = (User) obj;
			if (khachHang == null) {
				baoLoi = "You are not logged into the system!";
			} else {
				if (!currentPassword_Sha1.equals(khachHang.getPassword())) {
					baoLoi = "The current password is incorrect!";
				} else {
					if (!newPassword.equals(reEnterPassword)) {
						baoLoi = "The password re-entered does not match!";
					} else {
						String matKhauMoi_Sha1 = Encrypt.toSHA1(newPassword);
						khachHang.setPassword(matKhauMoi_Sha1);
						UserDB khd = new UserDB();
						if (khd.changePassword(khachHang)) {
							baoLoi = "Password changed successfully!";
						} else {
							baoLoi = "The password change process failed!";
						}
					}
				}
			}

			request.setAttribute("baoLoi", baoLoi);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	private void thayDoiThongTin(HttpServletRequest request, HttpServletResponse response) {
		try {
			String fullName = request.getParameter("fullName");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			request.setAttribute("fullName", fullName);
			request.setAttribute("gender", gender);
			request.setAttribute("address", address);
			request.setAttribute("phone", phone);
			request.setAttribute("email", email);
			String url = "";

			String baoLoi = "";

			request.setAttribute("baoLoi", baoLoi);

			if (baoLoi.length() > 0) {
				url = "/khachhang/thaydoithongtin.jsp";
			} else {
				Object obj = request.getSession().getAttribute("khachHang");
				User khachHang = null;
				if (obj != null)
					khachHang = (User) obj;
				if (khachHang != null) {
					url = "/khachhang/thaydoithongtin.jsp";
					User kh = new User();
					kh.setFullName(fullName);
					kh.setAddress(address);
					kh.setEmail(email);
					kh.setGender(gender);
					kh.setPhone(phone);
					kh.setEmail(email);
					UserDB.update(kh);
					User kh2 = UserDB.selectById(kh);
					request.getSession().setAttribute("khachHang", kh2);
					url = "/khachhang/thanhcong.jsp";
				}

			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

