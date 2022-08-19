package su22.sof3021.controllers;

import java.time.LocalDate;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import su22.sof3021.beans.CartItem;
import su22.sof3021.beans.Login;
import su22.sof3021.entities.Account;
import su22.sof3021.entities.Order;
import su22.sof3021.entities.OrderDetail;
import su22.sof3021.entities.Product;
import su22.sof3021.repositories.AccountRepository;
import su22.sof3021.repositories.OrderDetailRepository;
import su22.sof3021.repositories.OrderRepository;
import su22.sof3021.repositories.ProductRepository;
import su22.sof3021.repositories.ShoppingCartService;

@Controller
@RequestMapping("cart")
public class ShoppingCartController {
	@Autowired
	AccountRepository accountRepo;
	
	@Autowired
	ProductRepository productRepo;
	
	@Autowired
	ShoppingCartService shoppingCartService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	OrderRepository orderRepo;
	
	@Autowired
	OrderDetailRepository orderDetailRepo;
	
	@GetMapping("list")
	public String list(Model model) {
		if(session.getAttribute("user")==null) {
			return "login";
		}else {
			Collection<CartItem> cartItems = shoppingCartService.getCartItems();
			int count = shoppingCartService.getCount();
			model.addAttribute("count", count);
			model.addAttribute("cartItems", cartItems);
			model.addAttribute("total", shoppingCartService.getAmount());
			model.addAttribute("NoOfItems", shoppingCartService.getCount());
			model.addAttribute("views", "/views/cart/index.jsp");
			return "layout/index";
		}
	}
	
	@GetMapping("add/{id}")
	public String add(@PathVariable("id") Integer id) {
		if(session.getAttribute("user")==null) {
			return "login";
		}else {
			Product product = productRepo.findById(id).get();
			if (product != null) {
				CartItem item = new CartItem();
				BeanUtils.copyProperties(product, item);
				item.setQuantity(1);
				shoppingCartService.add(item);
			}
			return "redirect:/home/index";
		}
	}
	
	@GetMapping("remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		shoppingCartService.remove(id);
		return "redirect:/cart/list";
	}
	
	@GetMapping("update")
	public String update(@RequestParam("id") Integer id, @RequestParam("quantity") Integer quantity) {
		shoppingCartService.update(id, quantity);
		return "redirect:/cart/list";
	}
	
	@GetMapping("clean")
	public String clean() {
		shoppingCartService.clean();
		return "redirect:/cart/list";
	}
	
	@GetMapping("order")
	public String order(Model model) {
		Login user = (Login)session.getAttribute("user");
		Account acc = accountRepo.findByUsername(user.getUsername());
		String date = LocalDate.now().toString();
		model.addAttribute("date", date);
		model.addAttribute("account", acc);
		
		Collection<CartItem> list = shoppingCartService.getCartItems();
		model.addAttribute("list", list);
		
		Double amount = shoppingCartService.getAmount();
		model.addAttribute("amount", amount);
		
		model.addAttribute("views","/views/order/create.jsp");
		return "layout/index";
	}
	
	@GetMapping("buy")
	public String buy(Model model,HttpServletRequest req) {
		Login user = (Login)session.getAttribute("user");
		Account acc = accountRepo.findByUsername(user.getUsername());
		model.addAttribute("account", acc);
		
		Collection<CartItem> list = shoppingCartService.getCartItems();
		model.addAttribute("list", list);
		
		Double amount = shoppingCartService.getAmount();
		model.addAttribute("amount", amount);
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		if(phone==null) {
			model.addAttribute("err1", "Số điện thoại không được để trống!");
		}else {
			model.addAttribute("err1", null);
		}
		if(address==null) {
			model.addAttribute("err2", "Địa chỉ không được để trống!");
		}else {
			model.addAttribute("err2", null);
		}
		model.addAttribute("phone", phone);
		model.addAttribute("address", address);
		model.addAttribute("success",null);
		if(phone!=null && address!=null) {
			Order o = new Order();
			o.setUser(acc);
			o.setAddress(address);
			o.setStatus(0);
			o.setPhone(phone);
			o.setNotes("Chưa duyệt đơn");
			orderRepo.save(o);
			model.addAttribute("order",o);
			list.stream().collect(Collectors.toList());
			for (CartItem cartItem : list) {
				OrderDetail od = new OrderDetail();
				Product p = productRepo.getById(cartItem.getId());
				od.setOrder(o);
				od.setProduct(p);
				od.setQuantity(cartItem.getQuantity());
				od.setPrice(cartItem.getPrice());
				orderDetailRepo.save(od);
			}
			
			model.addAttribute("success","Thanh toán thành công!");
		}
		shoppingCartService.clean();
		model.addAttribute("views","/views/order/create.jsp");
		return "layout/index";
	}
}
