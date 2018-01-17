package controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dao.userdao;
import com.daoimpl.*;
import com.model.*;
@EnableAspectJAutoProxy(proxyTargetClass = true) 
@Controller
public class indexcontroller {
	
	@Autowired
	Userdaoimpl userdaoimpl;
	
	@Autowired
	Productdaoimpl productdaoimpl;
	
	@Autowired
	Categorydaoimpl categorydaoimpl;
	
	@RequestMapping("/")
	public String index()
	{
		return "home";
	}
	
	@RequestMapping("/index")
	public String home()  //for coming to homepage after getting login
	{
		return "index";
	}
	
	@RequestMapping("/news1")
	public String news1()
	{
		return "news1";
	}

	
	@RequestMapping("/news2")
	public String news2()
	{
		return "news2";
	}    
	
	@RequestMapping("/news3")
	public String news3()
	{
		return "news3";
	}    
	
	@RequestMapping(value = "/goToRegister", method = RequestMethod.GET)
	public ModelAndView goToRegister() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("user",new User());
		mv.setViewName("register");
		return mv;
	}
	
	@RequestMapping(value = "/saveRegister", method = RequestMethod.POST)
	public ModelAndView saveRegister(@ModelAttribute("user") User user, BindingResult res) {
		ModelAndView mv = new ModelAndView();
		if (res.hasErrors())
		{
			mv.setViewName("register");
			return mv;
		} 
		else 
		{
			user.setRole("ROLE_USER");
			userdaoimpl.insertUser(user);// this will enter all data from
										// register.jsp
										// to H2 TABLE
			mv.setViewName("index");
		}
			return mv;
		
     }
	
	@RequestMapping(value="/productcustList")
	public ModelAndView getcustTable(@RequestParam("cid") int cid )
	{
		ModelAndView mv=new ModelAndView();
		mv.addObject("prodList",productdaoimpl.getprodbycatid(cid)); //load all product data
		mv.setViewName("Products");  //but it will display product based on cid
		return mv;

	}
	
	@ModelAttribute
	public void detData(Model m)
	{
		m.addAttribute("catList", categorydaoimpl.retrieve());
	}
	
	@RequestMapping(value="/gotoLogin")
	public String gotologin()
	{
		return "login";
	}
	
	@RequestMapping(value="/userLogged")
	public String userlogged()
	{
		return "redirect:/index";
	}
	
	@RequestMapping(value="/error")
	public String error()
	{
		return "error";
	}
	
	@RequestMapping(value="/reLogin")
	public String relogin()
	{
		return "redirect:/gotoLogin"; //redirecting to login page from error page
	}

	@RequestMapping(value="/login")
	public String login()
	{
		return "redirect:/error";
	}
}

