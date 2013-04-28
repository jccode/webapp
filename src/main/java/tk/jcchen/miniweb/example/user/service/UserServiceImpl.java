package tk.jcchen.miniweb.example.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tk.jcchen.miniweb.example.user.domain.User;
import tk.jcchen.miniweb.example.user.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	private UserRepository userRepository;

	@Autowired
	public UserServiceImpl(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	/* (non-Javadoc)
	 * @see tk.jcchen.miniweb.example.user.service.UserService#saveUser(tk.jcchen.miniweb.example.user.domain.User)
	 */
	@Override
	@Transactional(readOnly = true)
	public User saveUser(User user) {
		return userRepository.save(user);
	}
	
	@Override
	@Transactional(readOnly = true)
	public void deleteUser(int id) {
		userRepository.delete(id);
	}
	
	@Override
	@Transactional(readOnly = true)
	public User findOneUser(int id) {
		return userRepository.findOne(id);
	}
	
	/* (non-Javadoc)
	 * @see tk.jcchen.miniweb.example.user.service.UserService#findUsers()
	 */
	@Override
	@Transactional(readOnly = true)
	public List<User> findUsers() {
//		List<User> list = new ArrayList<User>();
//		Iterable<User> iterable = userRepository.findAll();
//		Iterator<User> iter = iterable.iterator();
//		while(iter.hasNext()) {
//			list.add(iter.next());
//		}
//		return list;
		return userRepository.findAll();
	}
	
	@Override
	@Transactional(readOnly = true)
	public Page<User> findUsers(Pageable pageable) {
		return userRepository.findAll(pageable);
	}
}
