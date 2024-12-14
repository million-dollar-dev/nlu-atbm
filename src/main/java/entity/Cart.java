package entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.StringTokenizer;


import dao.ProductDAO;

public class Cart {
	private List<CartItem> items;

	public Cart() {
		items = new ArrayList<>();
	}

	public List<CartItem> getItems() {
		return items;
	}
	
	public int getQuantityById(int id, String size) {
		return getItemById(id, size).getQuantity();
	}
	
	public CartItem getItemById(int id, String size) {
		for (CartItem c: items) {
			if(c.getProduct().getId() == id && c.getSize().equals(size))
				return c;
		}
		return null;
	}
	
	public void addItem(CartItem c) {
		CartItem item = getItemById(c.getProduct().getId(), c.getSize());
		
		if (item != null) {			
			item.setQuantity(item.getQuantity() + c.getQuantity());
		} else {
			items.add(c);
		}			 
	}
	
	public void removeItem(int id, String size) {
		if (getItemById(id, size) != null)
			items.remove(getItemById(id, size));
	}
	
	public int getTotalAmount() {
		int total = 0;
		for (CartItem c: items)
			total += (c.getQuantity()  * (c.getPrice() / 100 * (100 - c.getProduct().getSale())));
		return total;
	}
	private Product getProductById(int id, List<Product> list) {
		for (Product p: list) {
			if  (p.getId() == id)
				return p;
		}
		return null;
	}
	
	public Cart(String txtCookie, List<Product> list) {
		items = new ArrayList<>();
		try {
			if (txtCookie != null && txtCookie.length() != 0) {
				StringTokenizer token = new StringTokenizer(txtCookie, "/");
				while (token.hasMoreTokens()) {
					StringTokenizer tokenSon = new StringTokenizer(token.nextToken(), ":");
					int id = Integer.parseInt(tokenSon.nextToken());
					String size = tokenSon.nextToken();
					Product product = getProductById(id, list);
					CartItem cartItem = new CartItem(product, 1, (int) product.getPrice(), size);
					addItem(cartItem);
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	public String getSizeOfProductById(int id) {
		for (CartItem c: items) {
			if(c.getProduct().getId() == id)
				return c.getSize();
		}
		return null;
	}
	
	public void showCart() {
		for (CartItem i: items) {
			System.out.println(i.toString());
		}
	}
	
	public static void main(String[] args) {
//		ProductDAO dao = new ProductDAO();
//		List<Product> list = dao.getAllProduct();
//		Cart cart = new Cart("1:13/1:14/3:15/4:13/1:13", list);
//		System.out.println(cart.getItems().size());
//		for (CartItem c: cart.getItems()) {
//			System.out.println(c.toString());
//		}
//		cart.addItem(cart.getItemById(1, "13"));
//		System.out.println("---------------");
//		cart.showCart();
//		System.out.println(cart.getQuantityById(1, "13"));
		Random rd = new Random(); 
		for (int i = 25; i < 37; i++) {
			for (int j = 1; j < 4; j++) {
				System.out.println("(" + i + ", " + "'" + j + "', " + rd.nextInt(10, 100) + "),");
			}
		}
		
	}
	
}
