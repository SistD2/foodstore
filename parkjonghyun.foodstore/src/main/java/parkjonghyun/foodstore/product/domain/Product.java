package parkjonghyun.foodstore.product.domain;

public class Product {
	private int prodNo;
	private String prodName;
	private String prodCase;
	private int prodCost;
	private int prodPrice;
	private String regDate;
	private String prodImgPath;
	
	public Product(){}
	
	public Product(int prodNo, String prodName, String prodCase, int prodCost,
			int prodPrice, String regDate, String prodImgPath) {
		this.prodNo = prodNo;
		this.prodName = prodName;
		this.prodCase = prodCase;
		this.prodCost = prodCost;
		this.prodPrice = prodPrice;
		this.regDate = regDate;
		this.prodImgPath = prodImgPath;
	}

	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getProdCase() {
		return prodCase;
	}
	public void setProdCase(String prodCase) {
		this.prodCase = prodCase;
	}
	public int getProdCost() {
		return prodCost;
	}
	public void setProdCost(int prodCost) {
		this.prodCost = prodCost;
	}
	public int getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "Product [prodNo=" + prodNo + ", prodName=" + prodName
				+ ", prodCase=" + prodCase + ", prodCost=" + prodCost
				+ ", prodPrice=" + prodPrice + ", regDate=" + regDate
				+ ", prodImgPath=" + prodImgPath + "]";
	}

	public String getProdImgPath() {
		return prodImgPath;
	}
	public void setProdImgPath(String prodImgPath) {
		this.prodImgPath = prodImgPath;
	}
}
