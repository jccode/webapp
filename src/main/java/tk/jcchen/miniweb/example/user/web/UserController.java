package tk.jcchen.miniweb.example.user.web;

import java.util.Collection;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tk.jcchen.miniweb.example.user.domain.User;
import tk.jcchen.miniweb.example.user.service.UserService;
import tk.jcchen.miniweb.util.FileuploadUtils;

/**
 * UserControler
 * 
 * /user		GET		to list
 * /user		POST	insert
 * /user/{id}	POST	update a user(multipart request, PUT not supported)
 * /user/{id}	GET		get a user
 * /user/{id}	DELETE	del a user
 * 
 * @author jcchen
 * 
 */
@Controller
public class UserController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private static final int PAGE_SIZE = 6;
	
	@Autowired
	private UserService userService;
	
	/**
	 * to user list. not pagination
	 * @param model
	 * @return
	 */
	@RequestMapping("/user")
	public String toUserList(Model model) {
		Collection<User> users = userService.findUsers();
		model.addAttribute("users", users);
		return "user/user";
	}
	
	/**
	 * to user list. with pagination.
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user", params="n")
	public String toUserList(@RequestParam("n") int pageNo, Model model) {
		if(pageNo < 1) pageNo = 1;
		Page<User> page = userService.findUsers(new PageRequest(pageNo-1, PAGE_SIZE)); //前台的分页是从1开始的.
		
		model.addAttribute("pageSize", PAGE_SIZE);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("pageCount", page.getTotalPages());
		model.addAttribute("users", page.getContent());
		return "user/user";
	}
	
	/**
	 * get user list. for ajax.<br>
	 * mapping: /user + application/json
	 * 
	 * @return
	 */
	@RequestMapping(value="/user", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<User> findUsers() {
		List<User> users = userService.findUsers();
		return users;
	}
	
	/**
	 * Get user list for paging.<br>
	 * mapping: /user?n=&s= + application/json
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value="/user",  method=RequestMethod.GET, params={"n","s"}, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<User> findUsers(@RequestParam("n") int pageNo, @RequestParam("s") int pageSize) {
		Page<User> page = userService.findUsers(new PageRequest(pageNo, pageSize));
		return page.getContent();
	}
	
	@RequestMapping(value="/user/{id}", method=RequestMethod.GET)
	public @ResponseBody User findOneUser(@PathVariable int id) {
		return userService.findOneUser(id);
	}
	
	@RequestMapping(value="/user", method=RequestMethod.POST)
	public @ResponseBody User insertUser(@ModelAttribute User user, @RequestParam MultipartFile file, 
			BindingResult result) throws Exception {
		String image = FileuploadUtils.saveImage(file);
		user.setImage(image);
		User newUser = userService.saveUser(user);
		return newUser;
	}
	
	@RequestMapping(value="/user/{id}", method={RequestMethod.POST, RequestMethod.PUT})
	public @ResponseBody User updateUser(@ModelAttribute User user, @PathVariable int id, 
			@RequestParam(required=false) MultipartFile file, BindingResult result) throws Exception {
		if(file != null) {
			String image = FileuploadUtils.saveImage(file);
			user.setImage(image);
		}
		User newUser = userService.saveUser(user);
		
		return newUser;
	}
	
	@RequestMapping(value="/user/{id}", method=RequestMethod.DELETE)
	public @ResponseBody void deleteUser(@PathVariable int id) {
		userService.deleteUser(id);
	}
	
	
	@ExceptionHandler
	public String handle(Exception e) {
		e.printStackTrace();
		logger.error(e.getMessage());
		return "error/500";
	}
	
	
	@RequestMapping("/test")
	public String toUserTest() {
		logger.info("-------- test -------");
		return "test";
	}
}
