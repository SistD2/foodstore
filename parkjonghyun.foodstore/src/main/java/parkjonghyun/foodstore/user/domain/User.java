package parkjonghyun.foodstore.user.domain;

import java.sql.Date;

public class User {
	private String userId;
	private String userPw;
	private String userName;
	private Date regDate;
	private String userAddress;
	private String userTel;
	private String userEmail;
	
	public User(){}

	public User(String userId, String userPw, String userName, Date regDate,
			String userAddress, String userTel, String userEmail) {
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.regDate = regDate;
		this.userAddress = userAddress;
		this.userTel = userTel;
		this.userEmail = userEmail;
	}



	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	
	
}
