package parkjonghyun.foodstore.sale.domain;


public class Sale {
	private int saleNo;
	private String userId;
	private String prodNo;
	private int guestNo;
	private int saleCnt;
	private String saleDate;
	private int saleState;
	
	@Override
	public String toString() {
		return "Sale [saleNo=" + saleNo + ", userId=" + userId + ", prodNo="
				+ prodNo + ", guestNo=" + guestNo + ", saleCnt=" + saleCnt
				+ ", saleDate=" + saleDate + ", saleState=" + saleState + "]";
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
	public String getProdNo() {
		return prodNo;
	}
	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}
	public int getGuestNo() {
		return guestNo;
	}
	public void setGuestNo(int guestNo) {
		this.guestNo = guestNo;
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
	public int getSaleState() {
		return saleState;
	}
	public void setSaleState(int saleState) {
		this.saleState = saleState;
	}
}
