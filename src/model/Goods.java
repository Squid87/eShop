package model;

public class Goods {
	private int id;
	private String name;
	private int count;
	private int price;
	private String info;
	private String picture;

	public Goods(int id, String name, int count, int price, String info, String picture) {
		this.id = id;
		this.name = name;
		this.count = count;
		this.price = price;
		this.info = info;
		this.picture=picture;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public int getCount() {
		return count;
	}

	public int getPrice() {
		return price;
	}

	public String getInfo() {
		return info;
	}

	public String getPicture() {
		return picture;
	}

	public String toString() {
		return "Goods{" + "id= " + id + ",name= '" + name + "'" + ",count= " + count + ",price= " + price + ", info= "
				+ info + "'" + ", picture " + picture + "}";
	}

}
