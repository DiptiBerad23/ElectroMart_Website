package com.tka.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.graphql.GraphQlProperties.Http;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.tka.ShopmateApplication;
import com.tka.model.User;
import com.tka.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	private final ShopmateApplication shopmateApplication;

	@Autowired
	UserService userService;

	UserController(ShopmateApplication shopmateApplication) {
		this.shopmateApplication = shopmateApplication;
	}

	@GetMapping("/")
	public String getIndexPage(Model model) {
		model.addAttribute("msg","You are logged out");
		return "index";
	}

	@GetMapping("/home-page")
	public String getHomePage() {
		return "home";
	}

	@GetMapping("/login-page")
	public String getLoginPage() {
		return "login";
	}

	@GetMapping("/shop-page")
	public String getShopPage() {
		return "shop";
	}

	@GetMapping("/register-page")
	public String getRegisterPage(String username, String password) {

		return "register";
	}

	@PostMapping("/verify-login")
	public String verifyLogin(@ModelAttribute User user,Model model, HttpSession session) {

		User dbUser = userService.verifyLogin(user);
		if (dbUser != null) {
			model.addAttribute("msg",user.getUsername()+" Logged in successfully !!!");
			session.setAttribute("userId", dbUser.getUserId());
			session.setAttribute("loginUser", dbUser);
			
			if(dbUser.getUsername().equalsIgnoreCase("ADMIN"))
				session.setAttribute("role", "ADMIN");
			else 
				session.setAttribute("role", "USER");
			
			return "home";
		}
		model.addAttribute("msg",user.getUsername()+" Login failed !!!");
		return "login";		
		}

	@PostMapping("/register")
	public String addUser(@ModelAttribute User user) {

		System.err.println("in UserController >> addUser ");
		boolean isUserAdded = userService.addUser(user);

		if (isUserAdded == true) {
			return "login";
		}
		return "register";
	}

	@GetMapping("/users")
	public String getMathodName(Model model, HttpSession session) {
		
		String role =  (String) session.getAttribute("role");		 
		if(role!= null && role.equalsIgnoreCase("admin")) {
			List<User> userList = userService.getAllUsers();		
			model.addAttribute("usersList", userList);
			return "allUsersDetails";
		}
		model.addAttribute("msg","Only admin can access the users data!!!!!!");
		return "home";
		
	}
	
	
	@GetMapping("/single-user")
	public String getLoggedInUser(Model model, HttpSession session) {
		
		int id = (int) session.getAttribute("userId");
		User user = userService.getUser(id);		
		model.addAttribute("user", user);
		return "userDetails";
	}
	
	@GetMapping("/update-req/{id}")
	public String fetchProfile(@PathVariable int id,Model model)	{
		User user = userService.getUser(id);		
		model.addAttribute("user", user);
		//sending old data to new update[Edit]
		return "updateProfile";
	}
	
	@PostMapping("/update-user")
	public String updateProfile(@ModelAttribute User user, Model model)	{
		boolean isUpdated = userService.updateUser(user);
		
		if(isUpdated) {
			model.addAttribute("msg",user.getUsername()+" Updated successfully !!!");
		return "home";
		}
		model.addAttribute("msg",user.getUsername()+" Update failed !!!");
		return "updateProfile";
	}
	
	@GetMapping("/delete-req/{id}")
	public String deleteProfile(@PathVariable int id,Model model)	{
		userService.deleteUser(id);		
		return "login";
	}
	
	@GetMapping("/delete-by-admin/{id}")
	public String deleteByAdmin(@PathVariable int id,Model model)	{
		userService.deleteUser(id);		
		return "allUsersDetails";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/login-page";
	}

}
