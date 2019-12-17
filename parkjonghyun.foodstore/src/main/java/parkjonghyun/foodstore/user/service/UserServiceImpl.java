package parkjonghyun.foodstore.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import parkjonghyun.foodstore.user.dao.UserDao;
import parkjonghyun.foodstore.user.domain.User;


@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;

	@Override
	public User loginUser(User user) {
		return userDao.loginUser(user);
	}

	@Override
	public String franCnt() {
		return String
				.valueOf((Integer.parseInt(userDao.franCnt().substring(4)) + 1));
	}

	@Transactional
	@Override
	public boolean joinUser(User user) {
		return userDao.joinUser(user) > 0;
	}

	@Override
	public User getUser(String userId) {
		return userDao.getUser(userId);
	}

	@Override
	public List<User> listUsers() {
		return userDao.getUsers();
	}
	
	@Transactional
	@Override
	public boolean updateUser(User user) {
		return userDao.updateUser(user) > 0;
	}

	@Override
	public boolean deleteUser(String userId) {
		return userDao.deleteUser(userId)>0;
	}
	
	@Override
	public List<User> getUserSearch(String searchVal, String searchCnt) {
		return userDao.getUserSearch(searchVal, searchCnt);
	}


	
	@Override
	public List<User> getUsers() {
		return userDao.getUsers();
	}
}

