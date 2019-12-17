package parkjonghyun.foodstore.guest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import parkjonghyun.foodstore.guest.dao.GuestDao;

@Service
public class GuestServiceImpl implements GuestService{
	@Autowired private GuestDao guestDao;

	@Override
	public int addGuest() {
		return guestDao.addGuest();
	}
	@Transactional
	@Override
	public String findGuest() {
		return guestDao.findGuest();
	}
	
}
