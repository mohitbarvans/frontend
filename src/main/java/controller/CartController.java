package controller;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.daoimpl.Cartdaoimpl;
import com.daoimpl.Categorydaoimpl;
import com.daoimpl.Ordersdaoimpl;
import com.daoimpl.Productdaoimpl;
import com.daoimpl.Supplierdaoimpl;
import com.daoimpl.Userdaoimpl;
import com.model.Cart;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;
import com.model.User;


@Controller

public class CartController {

@Autowired
Supplierdaoimpl supplierdaoimpl;

@Autowired
Categorydaoimpl categorydaoimpl;

@Autowired
Productdaoimpl productdaoimpl;

@Autowired
Cartdaoimpl cartdaoimpl;

@Autowired
Ordersdaoimpl ordersdaoimpl;
@Autowired
Userdaoimpl userdaoimpl;

	@RequestMapping(value="/prodDetails/${p.pid }")
	public ModelAndView prodDet(@PathVariable("pid")int pid)
	{
		ModelAndView mv=new ModelAndView();
		Product prod=productdaoimpl.findByPID(pid);
		mv.addObject("prod",prod);
		mv.setViewName("prodDetails");
		return mv;
	}
	
	@RequestMapping(value="/addToCart", method=RequestMethod.POST)
	public ModelAndView addtocart(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		Principal principal=request.getUserPrincipal();
		String userEmail=principal.getName();
		
		try
		{
			int pid=Integer.parseInt(request.getParameter("pid"));
			Double price=Double.parseDouble(request.getParameter("pPrice"));
			int qty=Integer.parseInt(request.getParameter("pQty"));
			String pname=request.getParameter("pname");
			String imgName=request.getParameter("imgName");
			Cart cartexist=cartdaoimpl.getCartById(pid, userEmail);
			if(cartexist==null)
			{
				Cart cm=new Cart();
				cm.setCartPrice(price);
				cm.setCartproductId(pid);
				cm.setCartStock(qty);
				cm.setCartImage(imgName);
				cm.setCartProductName(pname);
				User u=userdaoimpl.findUserByEmail(userEmail);
				cm.setCartUserDetails(u);
				cartdaoimpl.insert(cm);
			}
			else if(cartexist!=null)
			{
				Cart cm=new Cart();
				cm.setCartPrice(price);
				cm.setCartId(cartexist.getCartId());
				cm.setCartproductId(pid);
				cm.setCartStock(cartexist.getCartStock()+qty);
				cm.setCartImage(imgName);
				cm.setCartProductName(pname);
				User u=userdaoimpl.findUserByEmail(userEmail);
				cm.setCartUserDetails(u);
				cartdaoimpl.updateCart(cm);
				}
			mv.addObject("cartInfo",cartdaoimpl.findBycartID(userEmail));
			mv.setViewName("cart");
			return mv;
		} catch(Exception e)
		{
			e.printStackTrace();
			mv.addObject("cartInfo", cartdaoimpl.findBycartID(userEmail));
			mv.setViewName("cart");
			return mv;
		}
	}
	
}

