package parkjonghyun.foodstore.user.dao;

import java.util.List;

import parkjonghyun.foodstore.user.domain.User;

public interface UserDao {
	User loginUser(User user);
	String franCnt();
	int joinUser(User user);
	List<User> getUsers();         //회원목록
    User getUser(String userId);   //회원한명
    int updateUser(User user);  //회원수정
    int deleteUser(String userId); //화원삭제
	List<User> getUserSearch(String searchVal, String searchCnt);
	
	
}
