package com.tka.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tka.dao.ProductDao;
import com.tka.model.Product;

@Service
public class ProductService {

	@Autowired
	ProductDao productDao;

	List<Product> cartList;
	
	public List<Product> getProducts() {
		List<Product> products = productDao.findAll();
		return products;
	}

	public Product addToCart(int id) {
		Product product = productDao.getById(id);
		
		if(cartList == null) {
			cartList = new ArrayList<>();
		}
		cartList.add(product);
		
		return product;
	}

	public List<Product> getCartProducts() {
		return cartList;
	}


	public void clearCart() {
		cartList.clear();		
	}

	public Product addProduct(Product product) {
		
		Product p = productDao.save(product);
		return p;
	}
}
