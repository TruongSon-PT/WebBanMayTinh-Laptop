package su22.sof3021.repositories;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import su22.sof3021.beans.CartItem;

@Service
@SessionScope
public class ShoppingCartServiceImp implements ShoppingCartService {
private Map<Integer, CartItem> map = new HashMap<Integer, CartItem>();
	
	@Override
	public void add(CartItem item) {
		CartItem existedItem = map.get(item.getId());
		if(existedItem != null) {
			existedItem.setQuantity(item.getQuantity()+existedItem.getQuantity());
		}else {
			map.put(item.getId(), item);
		}
	}
	
	@Override
	public void remove(int id) {
		map.remove(id);
	}
	
	@Override
	public Collection<CartItem> getCartItems() {
		return map.values();
	}
	
	@Override
	public void clean() {
		map.clear();
	}
	
	@Override
	public void update(int id, int quantity) {
		CartItem item = map.get(id);
		
		item.setQuantity(quantity);
		
		if(item.getQuantity()<=0) {
			map.remove(id);
		}
	}
	
	@Override
	public double getAmount() {
		return map.values().stream().mapToDouble(item->item.getQuantity()*item.getPrice()).sum();
	}
	
	@Override
	public int getCount() {
		if(map.isEmpty()) {
			return 0;
		}
		return map.values().size();
	}
}
