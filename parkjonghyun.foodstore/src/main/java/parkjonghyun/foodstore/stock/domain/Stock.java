package parkjonghyun.foodstore.stock.domain;

public class Stock {
	private int stockNo;
	private String userId;
	private int prodNo;
	private int stockCnt;
	
	public Stock(){	}
	
	public Stock(int stockNo, String userId, int prodNo, int stockCnt) {
		this.stockNo = stockNo;
		this.userId = userId;
		this.prodNo = prodNo;
		this.stockCnt = stockCnt;
	}

	public int getStockNo() {
		return stockNo;
	}
	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int productNo) {
		this.prodNo = productNo;
	}
	public int getStockCnt() {
		return stockCnt;
	}
	public void setStockCnt(int stockCnt) {
		this.stockCnt = stockCnt;
	}
	
	
}
