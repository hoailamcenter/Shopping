package model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Size")
public class Size {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sizeId;
	private double size;
	public Size(int sizeId, double size) {
		super();
		this.sizeId = sizeId;
		this.size = size;
	}
	public Size() {
		super();
	}
	public int getSizeId() {
		return sizeId;
	}
	public void setSizeId(int sizeId) {
		this.sizeId = sizeId;
	}
	public double getSize() {
		return size;
	}
	public void setSize(double size) {
		this.size = size;
	}
	
}
