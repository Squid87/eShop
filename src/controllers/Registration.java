package controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BaseModel;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BaseModel bModel;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		bModel = new BaseModel();
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		if (request.getParameter("name").equals("") || request.getParameter("password").equals("")) {
			response.getWriter().print("Name or password is empty" + "<a href='index.html'>GO BACK</a>");
			return;
		}

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String adress = request.getParameter("adress");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		String pass = request.getParameter("password");

		try {
			if (bModel.getUser(name) == false) {
				bModel.saveCustumer(name, email, phone, adress, city, country, pass);
			}else {
				response.getWriter().print("User already exists, please enter another name" + "<a href='index.html'>GO BACK</a>");
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

}
