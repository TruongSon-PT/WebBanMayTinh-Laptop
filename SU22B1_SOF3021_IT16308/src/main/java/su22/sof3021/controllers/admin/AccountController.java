package su22.sof3021.controllers.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import su22.sof3021.beans.AccountModel;
import su22.sof3021.beans.Login;
import su22.sof3021.entities.Account;
import su22.sof3021.repositories.AccountRepository;

@Controller
@RequestMapping("admin/accounts")
public class AccountController {
	@Autowired
	private AccountRepository accountRepo;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest req;

	@GetMapping("/create")
	public String create(@ModelAttribute("account") AccountModel account, Model model) {
		model.addAttribute("views", "/views/admin/accounts/create.jsp");
		return "layout/index";
	}

	@PostMapping("/store")
	public String store(AccountModel model) {

		Account a = new Account();
		a.setFullname(model.getFullname());
		a.setEmail(model.getEmail());
		a.setUsername(model.getUsername());
		a.setPassword(model.getPassword());
		a.setPhoto(model.getPhoto());
		a.setActivated(1);
		a.setAdmin(0);
		this.accountRepo.save(a);
		return "redirect:/admin/accounts/index/0";
	}

	@GetMapping("/create1")
	public String create1(@ModelAttribute("account") AccountModel account, Model model) {
		model.addAttribute("views", "/views/admin/accounts/register.jsp");
		model.addAttribute("user", null);
		model.addAttribute("admin", 2);
		return "layout/index";
	}

	@PostMapping("/store1")
	public String store1(AccountModel am, Model model) {

		Account a = new Account();
		a.setFullname(am.getFullname());
		a.setEmail(am.getEmail());
		a.setUsername(am.getUsername());
		a.setPassword(am.getPassword());
		a.setPhoto(am.getPhoto());
		a.setActivated(1);
		a.setAdmin(2);
		this.accountRepo.save(a);
		this.session.setAttribute("user", new Login(a.getUsername(), a.getPassword()));
		model.addAttribute("user", a);
		model.addAttribute("admin", 2);
		return "redirect:/home/index";
	}

	@PostMapping("/update")
	public String update(Account account) {
		this.accountRepo.save(account);
		return "redirect:/admin/accounts/index/0";
	}

	@GetMapping("edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Account account = this.accountRepo.findById(id).get();
		model.addAttribute("account", account);
		model.addAttribute("views", "/views/admin/accounts/edit.jsp");
		return "layout/index";
	}

	@GetMapping("index/{filterAdmin}")
	public String index(Model model, @RequestParam(name = "page", defaultValue = "0") Integer page,
			@RequestParam(name = "size", defaultValue = "10") Integer size, @PathVariable("filterAdmin") Integer filterAdmin) {

		if (filterAdmin == 0) {
			Pageable pageable = PageRequest.of(page, size);
			Page<Account> data = this.accountRepo.findAllStaff(pageable);
			model.addAttribute("data", data);
			model.addAttribute("views", "/views/admin/accounts/index.jsp");
			return "layout/index";
		} else if (filterAdmin == 1) {
			Pageable pageable = PageRequest.of(page, size);
			Page<Account> data = this.accountRepo.findAllStaffFilter(1, pageable);
			model.addAttribute("data", data);
			model.addAttribute("views", "/views/admin/accounts/index.jsp");
			return "layout/index";
		} else {
			Pageable pageable = PageRequest.of(page, size);
			Page<Account> data = this.accountRepo.findAllStaffFilter(0, pageable);
			model.addAttribute("data", data);
			model.addAttribute("views", "/views/admin/accounts/index.jsp");
			return "layout/index";
		}
	}

	@GetMapping("index1")
	public String index1(Model model, @RequestParam(name = "page", defaultValue = "0") Integer page,
			@RequestParam(name = "size", defaultValue = "10") Integer size) {
		Pageable pageable = PageRequest.of(page, size);
		Page<Account> data = this.accountRepo.findAllClient(pageable);
		model.addAttribute("data", data);
		model.addAttribute("views", "/views/admin/accounts/client.jsp");
		return "layout/index";
	}
}
