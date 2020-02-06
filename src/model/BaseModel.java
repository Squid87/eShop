package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Goods;

public class BaseModel {

	private Statement stmt;
	private static ArrayList<Goods> goods = new ArrayList<Goods>();
	private static ArrayList<Basket> basket = new ArrayList<Basket>();

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost/eShop";
		return DriverManager.getConnection(url, "root", "");
	}

	// метод получения данных для отображния на экране магазина сервлет catalog
	public ArrayList<Goods> getGoods() throws SQLException, ClassNotFoundException {

		Connection c = getConnection();
		PreparedStatement ps = c.prepareStatement("select * from powerbank");
		ResultSet rs = ps.executeQuery();

		goods.clear();
		while (rs.next()) {
			int id = rs.getInt("id");
			String name = rs.getString("name");
			int count = rs.getInt("count");
			int price = rs.getInt("price");
			String info = rs.getString("info");
			String picture = rs.getString("picture");
			goods.add(new Goods(id, name, count, price, info, picture));

		}
		return goods;
	}

	// метод для получения данных по id товара и вывода в сервлет info
	public Goods getGoodsById(int id_good) throws ClassNotFoundException, SQLException {
		Connection c = getConnection();
		PreparedStatement ps = c.prepareStatement(
				"select id, name, count, price, info, picture from powerbank WHERE id =" + '"' + id_good + '"');
		ResultSet rs = ps.executeQuery();

		goods.clear();

		rs.next();
		int id = rs.getInt("id");
		String name = rs.getString("name");
		int count = rs.getInt("count");
		int price = rs.getInt("price");
		String info = rs.getString("info");
		String picture = rs.getString("picture");
		Goods g = new Goods(id, name, count, price, info, picture);
		return g;
	}

	// метод добавления товара в корзину
	public boolean addToBasket(int id_good) throws ClassNotFoundException, SQLException {
		Connection c = getConnection();
		PreparedStatement ps = c.prepareStatement("insert into basket(id_good) values(" + id_good + ")");
		if (ps.executeUpdate() > 0) {
			return true;
		}
		return false;
	}

	// получение данных из корзины
	public ArrayList<Basket> getDataFromBasket() throws ClassNotFoundException, SQLException {
		Connection c = getConnection();
		PreparedStatement ps = c.prepareStatement(
				"select powerbank.id as id, powerbank.name as name, powerbank.price as price, powerbank.picture as picture, basket.id_basket as id_basket from powerbank inner join basket on powerbank.id=basket.id_good");
		ResultSet rs = ps.executeQuery();
		basket.clear();
		while (rs.next()) {
			int id = rs.getInt("id");
			int id_basket = rs.getInt("id_basket");
			String name = rs.getString("name");
			int price = rs.getInt("price");
			String picture = rs.getString("picture");
			basket.add(new Basket(id, id_basket, name, price, picture));
		}
		return basket;
	}

	// удаление продукта из корзины
	public ArrayList<Basket> delItemFromBasket(int id_good) throws SQLException, ClassNotFoundException {
		Connection c = getConnection();
		stmt = c.createStatement();
		stmt.executeUpdate("delete from basket WHERE id_basket =" + '"' + id_good + '"');
		return basket;
	}

	// сохранение пользователя
	public void saveCustumer(String name, String email, String phone, String adress, String city, String country,
			String pass) throws SQLException, ClassNotFoundException {
		Connection c = getConnection();
		stmt = c.createStatement();
		stmt.executeUpdate("insert into custumers (name, email, phone, adress, city, country, password) values(" + '"'
				+ name + '"' + "," + '"' + email + '"' + "," + '"' + phone + '"' + "," + '"' + adress + '"' + "," + '"'
				+ city + '"' + "," + '"' + country + '"' + "," + '"' + pass + '"' + ")");
	}

	public boolean getUser(String user) throws ClassNotFoundException, SQLException {
		Connection c = getConnection();
		stmt = c.createStatement();
		PreparedStatement ps = c.prepareStatement("select  name from custumers WHERE name =" + '"' + user + '"');
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			String name = rs.getString("name");
			if (user.equals(name)) {
				return true;
			}
		}
		return false;

	}

	// public static void main(String[] args) throws ClassNotFoundException,
	// SQLException {

	// for (Goods goods : goods) {
	// System.out.println(getGoodsById(5));

	// }

	// }

}
