package su22.sof3021.controllers.order;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import su22.sof3021.beans.Login;
import su22.sof3021.entities.Order;
import su22.sof3021.repositories.AccountRepository;
import su22.sof3021.repositories.OrderRepository;

@Controller
@RequestMapping("order")
public class OrderController {
	@Autowired
	OrderRepository orderRepo;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest req;
	
	@Autowired
	AccountRepository accountRepository;
	
	@GetMapping("add")
	public boolean add(Order order) {
		try{
            orderRepo.save(order);
            return true;
        } catch (Exception e) {
        	return false;
        }
	}
	
	@GetMapping("index")
	public String index(Model model) {
		List<Order> list = orderRepo.findAll();
		list.stream().filter(item -> item.getStatus()==0).collect(Collectors.toList());
		model.addAttribute("list", list);
		if(session.getAttribute("user")==null) {
			model.addAttribute("admin", 2);
		}
		model.addAttribute("views", "/views/order/index.jsp");
		return "layout/index";
	}
	

	
	@GetMapping("views")
	public String edit(Model model) {
		if (session.getAttribute("user") == null) {
			model.addAttribute("admin", 2);
		}
		Login user = (Login) session.getAttribute("user");
		List<Order> list = orderRepo.findAll();
		model.addAttribute("list", list);
		model.addAttribute("user", user);
		model.addAttribute("views", "/views/order/views.jsp");
		return "layout/index";
	}
	
	@GetMapping("filter/{status}")
	public String filter(Model model,@PathVariable("status") Integer status) {
		List<Order> listFilter;
		List<Order> listAll = orderRepo.findAll();
		if(status==0) {
			listFilter = listAll.stream()
					.filter(item -> item.getStatus()==0)
					.collect(Collectors.toList());
		}else if(status==1) {
			listFilter = listAll.stream()
					.filter(item -> item.getStatus()==1)
					.collect(Collectors.toList());
		}else{
			listFilter = listAll.stream()
					.filter(item -> item.getStatus()==2)
					.collect(Collectors.toList());
		}
		
		if(session.getAttribute("user")==null) {
			model.addAttribute("admin", 2);
		}
		model.addAttribute("list", listFilter);
		model.addAttribute("views", "/views/order/index.jsp");
		return "layout/index";
	}
}
