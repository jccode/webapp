package tk.jcchen.miniweb.example.user.service;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import tk.jcchen.miniweb.example.user.domain.User;

public interface UserService {

	public abstract User saveUser(User user);

	public abstract List<User> findUsers();

	public abstract User findOneUser(int id);

	public abstract void deleteUser(int id);

	public abstract Page<User> findUsers(Pageable pageable);

}