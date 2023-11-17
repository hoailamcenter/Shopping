package model;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="Product")
public class Product implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productId;
	private String productName;
	private String descript;
	private double price;
	private String imgLink;
	private String brand;
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	private List<Size> size;
	@OneToOne
	private Sale sale;
	
	public Product(int productId, String productName, String descript, double price, String imgLink, String brand) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.descript = descript;
		this.price = price;
		this.imgLink = imgLink;
		this.brand = brand;
	}
	public Product() {
		super();
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDescription() {
		return descript;
	}
	public void setDescription(String description) {
		this.descript = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImgLink() {
		return imgLink;
	}
	public void setImgLink(String imgLink) {
		this.imgLink = imgLink;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public Sale getSale() {
		return sale;
	}
	public void setSale(Sale sale) {
		this.sale = sale;
	}
	public List<Size> getSize() {
		return size;
	}
	public void setSize(List<Size> size) {
		this.size = size;
	}
}
