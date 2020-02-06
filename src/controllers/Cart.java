package controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BaseModel;

@WebServlet("/Basket")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BaseModel bModel = new BaseModel();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			request.setAttribute("basket", bModel.getDataFromBasket());
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("WEB-INF/view/cart.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doGet(request, response);
		int id_good = Integer.parseInt(request.getParameter("id_good"));
		if (id_good > 0) {
			try {
				bModel.delItemFromBasket(id_good);

			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
