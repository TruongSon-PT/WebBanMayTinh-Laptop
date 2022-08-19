package su22.sof3021.controllers.product;

import java.io.File;
import java.util.List;

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
import su22.sof3021.beans.ProductModel;
import su22.sof3021.entities.Category;
import su22.sof3021.entities.Product;
import su22.sof3021.repositories.CategoryRepository;
import su22.sof3021.repositories.ProductRepository;

@Controller
@RequestMapping("product")
public class ProductController {
	@Autowired
	private ProductRepository productRepo;
	
	@Autowired
	private CategoryRepository categoryRepo;
	
	@Autowired
	HttpSession session;
	
	@PostMapping("/store")
	public String store(@ModelAttribute("product") Product product,@RequestParam("image") File image)
	{
		product.setImage(image.getName());
		Product p = product;
		this.productRepo.save(p);
		session.setAttribute("message", "Lưu thành công!");
		return "redirect:/product/index";
	}
	
	@RequestMapping("edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		model.addAttribute("create", false);
		
		Product product = productRepo.findById(id).get();
		model.addAttribute("product", product);
		
		List<Category> list = categoryRepo.findAll();
		model.addAttribute("listCategory", list);
		
		model.addAttribute("views", "/views/product/create.jsp");
		return "layout/index";
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Integer id)
	{
		this.productRepo.deleteById(id);
		session.setAttribute("message", "Xóa thành công!");
		return "redirect:/product/index";
	}
	
	@GetMapping("index")
	public String index(
		Model model,
		@ModelAttribute("product") Product product,
		@RequestParam(name="page", defaultValue="0") Integer page,
		@RequestParam(name="size", defaultValue="10") Integer size
	) {	
		model.addAttribute("create", true);
		List<Category> list = categoryRepo.findAll();
		model.addAttribute("listCategory", list);
		
		Pageable pageable = PageRequest.of(page, size);
		Page<Product> data = this.productRepo.findAll(pageable);
		model.addAttribute("data", data);
		
		model.addAttribute("views", "/views/product/index.jsp");
		
		return "layout/index";
	}
}
