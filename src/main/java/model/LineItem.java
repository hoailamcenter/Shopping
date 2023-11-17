package model;

import java.io.Serializable;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
@Entity
@Table(name="LineItem")
public class LineItem implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int lineItemId;
	@OneToOne
	private Product product;
	private int quantity;
	public int getLineItemId() {
		return lineItemId;
	}
	public void setLineItemId(int lineItemId) {
		this.lineItemId = lineItemId;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public LineItem() {
		super();
	}
	public LineItem(int lineItemId, Product product, int quantity) {
		super();
		this.lineItemId = lineItemId;
		this.product = product;
		this.quantity = quantity;
	}
}