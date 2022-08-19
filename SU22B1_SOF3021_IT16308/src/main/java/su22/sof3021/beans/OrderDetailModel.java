package su22.sof3021.beans;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import su22.sof3021.entities.Order;
import su22.sof3021.entities.Product;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailModel implements Serializable{
	private Order order;
	private Product product;
	private double price;
	private int quatity;
}
