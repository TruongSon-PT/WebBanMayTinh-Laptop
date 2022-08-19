package su22.sof3021.beans;

import java.io.Serializable;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import su22.sof3021.entities.Category;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductModel implements Serializable{
	private int id;
	private String name;
	private String image;
	private double price;
	private int available;
	private Category category;
}
