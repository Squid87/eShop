package model;

public class Basket {
	private int id;
	private String name;
	private int price;
	private String picture;
	private int id_basket;

	public Basket(int id, int id_basket, String name, int price, String picture) {
		this.id_basket = id_basket;
		this.id = id;
		this.name = name;
		this.price = price;
		this.picture = picture;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public int getPrice() {
		return price;
	}

	public String getPicture() {
		return picture;
	}

	public int getId_basket() {
		return id_basket;
	}
	
	public String toString() {
		return "Basket{" + "name='" + name + "'" + ",price=" + price + "}";
	}

}
