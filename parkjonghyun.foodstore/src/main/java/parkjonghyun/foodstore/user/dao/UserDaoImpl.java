package parkjonghyun.foodstore.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import parkjonghyun.foodstore.user.dao.mapper.UserMapper;
import parkjonghyun.foodstore.user.domain.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private UserMapper userMapper;

	@Override
	public User loginUser(User user) {
		return userMapper.loginUser(user);
	}

	@Override
	public String franCnt() {
		return userMapper.franCnt();
	}

	@Override
	public int joinUser(User user) {
		return userMapper.joinUser(user);
	}

	@Override
    public List<User> getUsers(){
        return userMapper.getUsers();
    }
   
   @Override
   public User getUser(String userId){
        return userMapper.getUser(userId);
    }
   
   @Override
    public int updateUser(User user){
        return userMapper.updateUser(user);
    }

   @Override
   public int deleteUser(String userId) {
	   return userMapper.deleteUser(userId);
   }
   
	@Override
	public List<User> getUserSearch(String searchVal, String searchCnt) {
		return userMapper.getUserSearch(searchVal, searchCnt);
	}
	

}