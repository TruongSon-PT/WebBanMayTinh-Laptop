package su22.sof3021.repositories;


import java.util.Collection;

import su22.sof3021.beans.CartItem;


public interface ShoppingCartService {

	int getCount();

	double getAmount();

	void update(int id, int quantity);

	void clean();

	Collection<CartItem> getCartItems();

	void remove(int id);

	void add(CartItem item);

}
