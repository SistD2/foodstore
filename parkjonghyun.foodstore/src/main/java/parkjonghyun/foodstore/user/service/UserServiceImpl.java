package parkjonghyun.foodstore.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import parkjonghyun.foodstore.user.dao.UserDao;
import parkjonghyun.foodstore.user.domain.User;

@Service
public class UserServiceImpl implements UserSerivce{
	@Autowired private UserDao userDao;
	
	@Override
	public User loginUser(User user) {
		return userDao.loginUser(user);
	}
	
	@Override
	public int franCnt() {
		return userDao.franCnt()+1;
	}
	
	@Transactional
	@Override
	public boolean joinUser(User user) {
		return userDao.joinUser(user)>0;
	}
	
}
