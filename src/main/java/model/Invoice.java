package model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
@Entity
@Table(name="Invoice")
public class Invoice implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long invoiceNumber;
	@OneToOne
	private User user;
	@OneToMany(fetch=FetchType.EAGER, cascade= CascadeType.ALL)
	private List<LineItem> lineltems;
	private Date invoiceDate;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<LineItem> getLineltems() {
		return lineltems;
	}
	public void setLineltems(List<LineItem> lineltems) {
		this.lineltems = lineltems;
	}
	public Date getInvoiceDate() {
		return invoiceDate;
	}
	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	public Long getInvoiceNumber() {
		return invoiceNumber;
	}
	public void setInvoiceNumber(Long invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}
	public Invoice() {
		super();
	}
	public Invoice(User user, List<LineItem> lineltems, Date invoiceDate, Long invoiceNumber) {
		super();
		this.user = user;
		this.lineltems = lineltems;
		this.invoiceDate = invoiceDate;
		this.invoiceNumber = invoiceNumber;
	}
}
