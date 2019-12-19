package parkjonghyun.foodstore.user.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import parkjonghyun.foodstore.user.domain.User;

public interface UserMapper {
	User loginUser(User user);
	String franCnt();
	int joinUser(User user);
	List<User> getUsers();
	User getUser(String userId);
	int updateUser(User user);
	int deleteUser(String userId);
	List<User> getUserSearch(@Param("searchVal") String searchVal, @Param("searchCnt") String searchCnt);
}