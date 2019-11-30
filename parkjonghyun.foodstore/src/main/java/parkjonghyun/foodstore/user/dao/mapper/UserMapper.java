package parkjonghyun.foodstore.user.dao.mapper;

import parkjonghyun.foodstore.user.domain.User;

public interface UserMapper {
	User loginUser(User user);
	int franCnt();
	int joinUser(User user);
}
