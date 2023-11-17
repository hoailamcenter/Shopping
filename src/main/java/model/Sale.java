package model;

import java.io.Serializable;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name="Sale")
public class Sale implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int saleId;
	private double salePrice;
	public int getSaleId() {
		return saleId;
	}
	public void setSaleId(int saleId) {
		this.saleId = saleId;
	}
	public double getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(double salePrice) {
		this.salePrice = salePrice;
	}
	public Sale() {
		super();
	}
	public Sale(int saleId, double salePrice) {
		super();
		this.saleId = saleId;
		this.salePrice = salePrice;
	}
}
