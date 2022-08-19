package su22.sof3021.controllers;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import su22.sof3021.beans.Login;
import su22.sof3021.entities.Account;
import su22.sof3021.repositories.AccountRepository;
import su22.sof3021.repositories.ShoppingCartService;

@Controller
@RequestMapping("admin")
public class LoginController {
	@Autowired
	AccountRepository accountRepo;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest req;
	
	@Autowired
	ShoppingCartService shoppingCartService;
	
	@GetMapping("open")
	public String index(Model model){	
		return "login";
	}
	
	@GetMapping("login")
	public String login(Model model) {
		Login login = new Login(req.getParameter("username"), req.getParameter("password"));
		model.addAttribute("login", login);
		if(login.getUsername().isEmpty()) {
			model.addAttribute("err1", "Tên đăng nhập không được để trống!");
		}else {
			model.addAttribute("err1", null);
		}
		if(login.getPassword().isEmpty()) {
			model.addAttribute("err2", "Tên đăng nhập không được để trống!");
		}else {
			model.addAttribute("err2", null);
		}
		if(!login.getUsername().isEmpty()&&!login.getPassword().isEmpty()) {
			Account acc = accountRepo.findByUsername(login.getUsername());
			if (acc == null) {
				model.addAttribute("err1", "Tên đăng nhập không tồn tại!");
			} else {
				model.addAttribute("err1", null);
				if (!acc.getPassword().equalsIgnoreCase(login.getPassword())) {
					model.addAttribute("err2", "Mật khẩu không chính xác!");
				} else {
					model.addAttribute("err2", null);
					this.session.setAttribute("user", login);
					model.addAttribute("user", acc);
					model.addAttribute("admin", acc.getAdmin());
					shoppingCartService.clean();
					model.addAttribute("success", "Đăng nhập thành công!");
					shoppingCartService.clean();
				}
			}
		}
		return "login";
	}
	
	@GetMapping("logout")
	public String logout(Model model) {
		this.session.setAttribute("user", null);
		model.addAttribute("user", null);
		model.addAttribute("admin", 2);
		shoppingCartService.clean();
		return "redirect:/home/index";
	}
}
