package parkjonghyun.foodstore.user.dao;

import parkjonghyun.foodstore.user.domain.User;

public interface UserDao {
	User loginUser(User user);
	int franCnt();
	int joinUser(User user);
}
