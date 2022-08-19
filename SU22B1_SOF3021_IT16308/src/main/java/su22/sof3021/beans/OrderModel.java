package su22.sof3021.beans;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import su22.sof3021.entities.Account;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderModel implements Serializable{
	private Account user;
	private String phone;
	private String address;
	private int status = 0;
	private String notes;
}
