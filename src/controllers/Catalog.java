package controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BaseModel;

@WebServlet("/Catalog")
public class Catalog extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BaseModel bModel;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		bModel = new BaseModel();

		request.setCharacterEncoding("UTF-8");
		try {
			request.setAttribute("goods", bModel.getGoods());
			request.setAttribute("basket", bModel.getDataFromBasket());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("WEB-INF/view/shop.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id_good = Integer.parseInt(request.getParameter("id_good"));
		if (id_good > 0) {
			try {
				if (bModel.addToBasket(id_good)) {
					response.getWriter().print("The good add to basket success!");
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
