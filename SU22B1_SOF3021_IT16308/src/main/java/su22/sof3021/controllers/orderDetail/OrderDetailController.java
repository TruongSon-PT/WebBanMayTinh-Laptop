package su22.sof3021.controllers.orderDetail;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import su22.sof3021.entities.Order;
import su22.sof3021.entities.OrderDetail;
import su22.sof3021.repositories.OrderDetailRepository;
import su22.sof3021.repositories.OrderRepository;

@Controller
@RequestMapping("orderDetail")
public class OrderDetailController {
	@Autowired
	OrderDetailRepository orderDetailRepository;
	
	@Autowired
	OrderRepository orderRepository;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("edit/{id}")
	public String edit(Model model,@PathVariable("id") Integer id) {
		Order o = orderRepository.findById(id).get();
		model.addAttribute("order", o);
		List<OrderDetail> list = orderDetailRepository.findAll();
		list.stream().filter(item -> item.getOrder().getId()==o.getId()).collect(Collectors.toList());
		Double all_price = list.stream().mapToDouble(item -> item.getPrice()*item.getQuantity()).sum();
		model.addAttribute("all_price", all_price);
		model.addAttribute("list", list);
		model.addAttribute("views", "/views/orderDetail/index.jsp");
		return "layout/index";
	}
	
	@GetMapping("edit1/{id}")
	public String edit1(Model model,@PathVariable("id") Integer id) {
		Order o = orderRepository.findById(id).get();
		model.addAttribute("order", o);
		List<OrderDetail> list = orderDetailRepository.findAll();
		list.stream().filter(item -> item.getOrder().getId()==o.getId()).collect(Collectors.toList());
		Double all_price = list.stream().mapToDouble(item -> item.getPrice()*item.getQuantity()).sum();
		model.addAttribute("all_price", all_price);
		model.addAttribute("list", list);
		model.addAttribute("views", "/views/orderDetail/views.jsp");
		return "layout/index";
	}
	
	@GetMapping("update1/{id}")
	public String update1(Model model,@PathVariable("id") Integer id) {
		Order o = orderRepository.findById(id).get();
		o.setStatus(1);
		orderRepository.save(o);
		return "redirect:/order/index";
	}
	
	@GetMapping("update2/{id}")
	public String update2(Model model,@PathVariable("id") Integer id) {
		Order o = orderRepository.findById(id).get();
		o.setStatus(2);
		orderRepository.save(o);
		return "redirect:/order/index";
	}
	
	@GetMapping("update3/{id}")
	public String update3(Model model,@PathVariable("id") Integer id) {
		Order o = orderRepository.findById(id).get();
		o.setStatus(2);
		orderRepository.save(o);
		return "redirect:/order/views";
	}
}
