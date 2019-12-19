package parkjonghyun.foodstore.sale.domain;

public class Receipt {
	private int saleNo;
	private String userId;
	private String userName;
	private String prodName;
	private String prodPrice;
	private int guesNo;
	private int saleCnt;
	private String saleDate;
	private String salePay;
	private String saleTotal;
	
	public Receipt() {
	}
	
	public Receipt(String prodName, String saleTotal) {
		this.prodName = prodName;
		this.saleTotal = saleTotal;
	}
	public String getSaleTotal() {
		return saleTotal;
	}
	public void setSaleTotal(String saleTotal) {
		this.saleTotal = saleTotal;
	}
	public int getSaleNo() {
		return saleNo;
	}
	public void setSaleNo(int saleNo) {
		this.saleNo = saleNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(String prodPrice) {
		this.prodPrice = prodPrice;
	}
	public int getGuesNo() {
		return guesNo;
	}
	public void setGuesNo(int guesNo) {
		this.guesNo = guesNo;
	}
	public int getSaleCnt() {
		return saleCnt;
	}
	public void setSaleCnt(int saleCnt) {
		this.saleCnt = saleCnt;
	}
	public String getSaleDate() {
		return saleDate;
	}
	public void setSaleDate(String saleDate) {
		this.saleDate = saleDate;
	}
	public String getSalePay() {
		return salePay;
	}
	public void setSalePay(String salePay) {
		this.salePay = salePay;
	}
	
	
}
