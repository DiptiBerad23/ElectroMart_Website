package com.tka.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tka.dao.UserDao;
import com.tka.model.User;

@Service
public class UserService {

	@Autowired
	UserDao userDao;

	public boolean addUser(User user) {
		User saveUser = userDao.save(user);
		if (saveUser != null) {
			return true;
		}
		return false;
	}

	public User verifyLogin(User user) {

		List<User> allUsers = userDao.findAll();		
		for (User u : allUsers) {
			if (u.getUsername().equals(user.getUsername()) && u.getPassword().equals(user.getPassword())) {
				return u;
			}
		}
		return null;
	}

	
	public List<User> getAllUsers() {
		return userDao.findAll();
	}

	public User getUser(int id) {
	    return userDao.findById(id)
	            .orElseThrow(() -> new RuntimeException("User not found!"));
	}

	public boolean updateUser(User user) {
		User save = userDao.save(user);
		if(save != null) {
			return true;
		}
		return false;
	}

	public void deleteUser(int id) {
		userDao.deleteById(id);
	}




	
	
}
