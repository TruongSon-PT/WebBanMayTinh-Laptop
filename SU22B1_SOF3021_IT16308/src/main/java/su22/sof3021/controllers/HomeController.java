package su22.sof3021.controllers;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import su22.sof3021.entities.Product;
import su22.sof3021.repositories.ProductRepository;
import su22.sof3021.repositories.ShoppingCartService;
@Controller
@RequestMapping("home")
public class HomeController {
	@Autowired
	HttpSession session;
	
	@Autowired
	ProductRepository productRepo;
	
	@Autowired
	HttpServletRequest req;
	
	@Autowired
	ShoppingCartService shoppingCartService;
	
	@GetMapping("filter")
	public String filter(Model model) {
		List<Product> listFilter;
		List<Product> listAll = productRepo.findAll();
		int value = Integer.parseInt(req.getParameter("filterPrice"));
		if(value==0) {
			listFilter = listAll.stream().limit(12).collect(Collectors.toList());
		}else if(value==1) {
			listFilter = listAll.stream()
					.filter(item -> item.getPrice()<=1000000)
					.collect(Collectors.toList());
		}else if(value==2) {
			listFilter = listAll.stream()
					.filter(item -> item.getPrice()>1000000&&item.getPrice()<=5000000)
					.collect(Collectors.toList());
		}else if(value==3) {
			listFilter = listAll.stream()
					.filter(item -> item.getPrice()>5000000&&item.getPrice()<=10000000)
					.collect(Collectors.toList());
		}else if(value==4) {
			listFilter = listAll.stream()
					.filter(item -> item.getPrice()>10000000&&item.getPrice()<=20000000)
					.collect(Collectors.toList());
		}else{
			listFilter = listAll.stream()
					.filter(item -> item.getPrice()>20000000)
					.collect(Collectors.toList());
		}
		
		if(session.getAttribute("user")==null) {
			model.addAttribute("admin", 2);
		}
		int count = shoppingCartService.getCount();
		model.addAttribute("count", count);
		model.addAttribute("listFilter", listFilter);
		model.addAttribute("views", "/views/home/filter.jsp");
		return "layout/index";
	}
	
	@GetMapping("index")
	public String index(Model model){
		List<Product> listAll = productRepo.findAll();
		
		List<Product> listLaptop = listAll.stream()
				.filter(item -> item.getCategory().getName().equalsIgnoreCase("Laptop"))
				.limit(3)
				.collect(Collectors.toList());
		model.addAttribute("listLaptop", listLaptop);
		
		List<Product> listDesktop = listAll.stream()
				.filter(item -> item.getCategory().getName().equalsIgnoreCase("Desktop"))
				.limit(3)
				.collect(Collectors.toList());
		model.addAttribute("listDesktop", listDesktop);
		
		
		List<Product> listIpad = listAll.stream()
				.filter(item -> item.getCategory().getName().equalsIgnoreCase("Ipad"))
				.limit(3)
				.collect(Collectors.toList());
		model.addAttribute("listIpad", listIpad);
		
		if(session.getAttribute("user")==null) {
			model.addAttribute("admin", 2);
		}
		int count = shoppingCartService.getCount();
		model.addAttribute("count", count);
		model.addAttribute("views", "/views/home/index.jsp");
		return "layout/index";
	}
}
