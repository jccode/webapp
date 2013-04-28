package tk.jcchen.miniweb.example.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import tk.jcchen.miniweb.example.user.domain.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	
}
