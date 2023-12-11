package model;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

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
	private List<LineItem> items;

	public Cart() {
		items = new ArrayList<>();
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	
	public void setItems(List<LineItem> lineItems) {
        items = lineItems;
    }
	
	public List<LineItem> getItems()
    { 
        return items;
    }
	public void addItem(LineItem item, String type) {
        int code = item.getProduct().getProductId();
        String update = type.toString();
        int quantity = item.getQuantity();
        if(update.equals("true")) 
        {
        	for (int i = 0; i < items.size(); i++) {
                LineItem lineItem = items.get(i);
                if (lineItem.getProduct().getProductId()==(code)) {
                    lineItem.setQuantity(quantity);
                    return;
                }
            }
        } 
        else {
        	for (int i = 0; i < items.size(); i++) {
                LineItem lineItem = items.get(i);
                if (lineItem.getProduct().getProductId()==(code)) {
                    lineItem.setQuantity(lineItem.getQuantity() + quantity);
                    return;
                }
            }
            items.add(item);
        }
    }

    public void removeItem(LineItem item) {
        int code = item.getProduct().getProductId();
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getProduct().getProductId()==(code)) {
                items.remove(i);
                return;
            }
        }
    }
    
    public double totalBillWithoutShip()
    {
        double sum = 0;
        for (var item: items)
        {
            sum += item.getTotal();
        }
        return sum;
    }
    
    public String getTotalWithoutShipCurrencyFormat() {
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(this.totalBillWithoutShip());
    }
    
    public double Shipping(){
        return this.totalBillWithoutShip()*0.1;
    }
    
    public String getTotalCurrentFormat(){
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(this.totalBillWithoutShip()+ this.Shipping());
    }
    
    public String getShipCurrentFormat(){
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(this.Shipping());
    }
}
