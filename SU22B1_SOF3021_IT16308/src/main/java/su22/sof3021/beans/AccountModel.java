package su22.sof3021.beans;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountModel implements Serializable{
	private String username;
	private String password;
	private String fullname;
	private String email;
	private String photo;
	private int activated;
	private int admin;
}
