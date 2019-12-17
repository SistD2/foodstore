package parkjonghyun.foodstore.user.service;

import java.util.List;

import parkjonghyun.foodstore.user.domain.User;

public interface UserService {
	User loginUser(User user);
	String franCnt();
	boolean joinUser(User user);
    List<User> listUsers();         //회원목록
    User getUser(String userId);     //회원한명
    boolean updateUser(User user);   //회원수정
    boolean deleteUser(String userId); // 회원삭제
	List<User> getUserSearch(String searchVal, String searchCnt);
	
	List<User> getUsers();
}
