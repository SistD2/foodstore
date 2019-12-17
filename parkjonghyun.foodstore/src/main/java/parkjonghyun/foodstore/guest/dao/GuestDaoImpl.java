package parkjonghyun.foodstore.guest.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import parkjonghyun.foodstore.guest.dao.mapper.GuestMapper;

@Repository
public class GuestDaoImpl implements GuestDao {
	@Autowired private GuestMapper guestMapper;
	
	@Override
	public int addGuest() {
		return guestMapper.addGuest();
	}

	@Override
	public String findGuest() {
		return guestMapper.findGuest();
	}
	
}
