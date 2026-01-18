package com.tka.controller;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tka.model.Product;
import com.tka.model.User;
import com.tka.service.ProductService;

import jakarta.persistence.criteria.Path;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	@GetMapping("/products")
	public String getProducts(Model model) {
		List<Product> products = productService.getProducts();
		model.addAttribute("productList", products);
		return "products";
	}
	
	@GetMapping("/cart")
	public String getCartProducts(Model model) {
		List<Product> cartList = productService.getCartProducts();
		model.addAttribute("cartList", cartList);
		return "cart";
	}
	
	@PostMapping("/add-to-cart/{id}")
	public String addToCart(@PathVariable int id,RedirectAttributes ra, HttpSession session) {
		
		User user = (User) session.getAttribute("loginUser");
		if(user == null) {
			return "login";
		}
		Product product = productService.addToCart(id);
		ra.addFlashAttribute("msg",  product.getProductName()+ " : is added to cart");
		return "redirect:/products";
	}
	
	@GetMapping("/buy-from-cart")
	public String buyFromCart(Model model) {
		List<Product> cartList = productService.getCartProducts();
		model.addAttribute("cartList", cartList);
		return "buy";
	}
	
	@GetMapping("/pay-bill")
	public String payBill(RedirectAttributes ra) {
	    productService.clearCart();
	    ra.addFlashAttribute("msg", "Order placed successfully!!!!!!");
	    return "redirect:/cart";
	}
	
	@GetMapping("/fetch-add-product")
	public String fetchAddProduct(HttpSession session, Model model) {

		String role = (String) session.getAttribute("role");
		 
		if(role != null && role.equalsIgnoreCase("admin") ) {
			return "addProduct";
		}
		model.addAttribute("msg","Only admin can add the products!!!!!!");
		return "home";
	}

	@PostMapping("/add-product")
	public String addProduct(@ModelAttribute Product product,
							@RequestParam("imageFile") MultipartFile file,
	                         RedirectAttributes ra) {

	    try {
	        String fileName = file.getOriginalFilename();
	        String uploadDir = "src/main/webapp/images/";
	        java.nio.file.Path filePath = Paths.get(uploadDir + fileName);
	        Files.write(filePath, file.getBytes());
	        product.setImageUrl("/images/" + fileName);
	    } catch (Exception e) {
	        ra.addFlashAttribute("msg", "Image upload failed!");
	        return "redirect:/fetch-add-product";
	    }

	    productService.addProduct(product);
	    ra.addFlashAttribute("msg", product.getProductName() + " added successfully");
	    return "redirect:/products";
	}
}
	
	

