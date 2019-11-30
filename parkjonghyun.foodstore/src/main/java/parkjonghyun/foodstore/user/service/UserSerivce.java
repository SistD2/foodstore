package parkjonghyun.foodstore.user.service;

import parkjonghyun.foodstore.user.domain.User;

public interface UserSerivce {
	User loginUser(User user);
	int franCnt();
	boolean joinUser(User user);
}
