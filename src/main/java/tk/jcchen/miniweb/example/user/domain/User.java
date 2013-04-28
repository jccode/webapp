package tk.jcchen.miniweb.example.user.domain;

import javax.persistence.Entity;

import org.hibernate.validator.constraints.NotEmpty;

import tk.jcchen.miniweb.core.domain.BaseEntity;

@Entity
public class User extends BaseEntity {
	
	@NotEmpty
	private String name;

	@NotEmpty
	private String password;

	private String email;
	
	private String image;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "User [id=" + getId() + ", name=" + name + ", password=" + password + ", email="
				+ email + ", image=" + image + "]";
	}

}
