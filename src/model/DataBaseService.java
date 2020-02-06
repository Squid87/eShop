package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DataBaseService {

	private Connection con;
	private ResultSet rs;
	private Statement stmt;
	private static DataBaseService instance;
	private String url = "jdbc:mysql://localhost/eShop";
	private String login = "root";
	private String pass = "";

	public DataBaseService() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, login, pass);
		stmt = con.createStatement();// создали объект для работы с SQL
	}

	/*
	 * Синглтон
	 */
	public DataBaseService getInstance() throws ClassNotFoundException, SQLException {
		if (instance == null) {
			synchronized (DataBaseService.class) {
				if (instance == null) {
					instance = new DataBaseService();
				}
			}
		}
		return instance;
	}

}
