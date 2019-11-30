package parkjonghyun.foodstore.user.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import parkjonghyun.foodstore.user.dao.mapper.UserMapper;
import parkjonghyun.foodstore.user.domain.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMapper userMapper;
	
	@Override
	public User loginUser(User user) {
		return userMapper.loginUser(user);
	}

	@Override
	public int franCnt() {
		return userMapper.franCnt();
	}

	@Override
	public int joinUser(User user) {
		return userMapper.joinUser(user);
	}
	
}
