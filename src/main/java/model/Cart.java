package model;

import java.io.Serializable;
import java.util.ArrayList;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
@Entity
@Table(name = "Cart")
public class Cart implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cartId;
	@OneToMany(fetch=FetchType.EAGER, cascade= CascadeType.ALL)
	private ArrayList<LineItem> items;
	public Cart() {
		super();
	}
	public Cart(int cartId, ArrayList<LineItem> items) {
		super();
		this.cartId = cartId;
		this.items = items;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

    public void setItems(ArrayList<LineItem> items) {
		this.items = items;
	}
	public ArrayList<LineItem> getItems()
    { 
        return items;
    }
}
