package controller;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

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

import com.daoimpl.Categorydaoimpl;
import com.daoimpl.Productdaoimpl;
import com.daoimpl.Supplierdaoimpl;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;


@Controller
@RequestMapping("/admin")
public class admincontroller {

@Autowired
Supplierdaoimpl supplierdaoimpl;

@Autowired
Categorydaoimpl categorydaoimpl;

@Autowired
Productdaoimpl productdaoimpl;

	@RequestMapping("/adding")
	public String adding()
	{
		return "adding";
	}
	
	@RequestMapping(value="/saveSupp",method=RequestMethod.POST)
	@Transactional
	public ModelAndView saveSuppData(@RequestParam("sid")int sid, @RequestParam("sname")String sname)
	{
		ModelAndView mv=new ModelAndView();
		Supplier ss=new Supplier();
		ss.setSid(sid);
		ss.setSupplierName(sname);
		supplierdaoimpl.insertSupplier(ss);
		mv.setViewName("modal");
		return mv;
	}
	
	@RequestMapping(value="/saveCat",method=RequestMethod.POST)
	@Transactional
	public ModelAndView saveCatData(@RequestParam("cid")int cid, @RequestParam("cname")String cname)
	{
		ModelAndView mv=new ModelAndView();
		Category cc=new Category();
		cc.setCid(cid);
		cc.setCname(cname);
		categorydaoimpl.insertCategory(cc);
		mv.setViewName("modal");
		return mv;
	}
	
	@RequestMapping(value="/saveProduct" ,method=RequestMethod.POST)
	public String saveProd(HttpServletRequest request, @RequestParam("file") MultipartFile file)
	{
		Product prod=new Product();
		prod.setPname(request.getParameter("pName"));
		prod.setPrice(Double.parseDouble(request.getParameter("pPrice")));
		prod.setDescription(request.getParameter("pDescription"));
		prod.setStock(Integer.parseInt(request.getParameter("pStock")));
		prod.setCategory(categorydaoimpl.findByCatId(Integer.parseInt(request.getParameter("pCategory"))));
		prod.setSupplier(supplierdaoimpl.findBySuppId(Integer.parseInt(request.getParameter("pSupplier"))));

		String filepath=request.getSession().getServletContext().getRealPath("/");
		String filename=file.getOriginalFilename();
		prod.setImgName(filename);
		productdaoimpl.insertProduct(prod);
		
		System.out.println("File Path= "+ filepath);
		
		try
		{
			byte imagebyte[]=file.getBytes();
			BufferedOutputStream fos=new BufferedOutputStream(new FileOutputStream(filepath+"/resources/"+filename));
			
			fos.write(imagebyte);
			fos.close();
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		
		return "modal";
		
		}
		
	@ModelAttribute
	public void loadingDataInPage(Model m)
	{
		m.addAttribute("satList",supplierdaoimpl.retrieve());
		m.addAttribute("catList",categorydaoimpl.retrieve());
		m.addAttribute("prodList",productdaoimpl.retrieve());
	}
	
	@RequestMapping("/productList")
	public ModelAndView prodlist()
	{
		ModelAndView mv=new ModelAndView();
		mv.addObject("prodList",productdaoimpl.retrieve());
		mv.setViewName("productAdminList");
		return mv;
	}
	
	@RequestMapping("/supplierList")
	public ModelAndView satlist()
	{
		ModelAndView mv=new ModelAndView();
		mv.addObject("satList",supplierdaoimpl.retrieve());
		mv.setViewName("suppAdminList");
		return mv;
	}
	
	@RequestMapping("/categoryList")
	public ModelAndView catlist()
	{
		ModelAndView mv=new ModelAndView();
		mv.addObject("catList",categorydaoimpl.retrieve());
		mv.setViewName("categoryAdminList");
		return mv;
	}
	
	@RequestMapping("/deleteProd/{pid}")
	public String deleteProduct(@PathVariable("pid") int pid)
	{
		productdaoimpl.deleteProd(pid);
		return "redirect:/admin/productList?del";
		
		
	}
	
	@RequestMapping("/updateProd")
	public ModelAndView updateProduct(@RequestParam("pid") int pid)
	{
		ModelAndView mv=new ModelAndView();
		Product p=productdaoimpl.findByPID(pid);
		mv.addObject("prod",p);
		mv.addObject("cList",categorydaoimpl.retrieve());
		mv.addObject("sList",supplierdaoimpl.retrieve());
		mv.setViewName("updateProduct");
		return mv;
	}
	
	@RequestMapping("/deleteSupp/{sid}")
	public String deleteSupplier(@PathVariable("sid") int sid)
	{
		supplierdaoimpl.deleteSupp(sid);
		return "redirect:/admin/supplierList?del";
	}
	
	@RequestMapping("/deleteCat/{cid}")
	public String deleteCatgory(@PathVariable("cid") int cid)
	{
		categorydaoimpl.deleteCat(cid);
		return "redirect:/admin/categoryList?del";
	}
	
	@RequestMapping(value="/productUpdate" ,method=RequestMethod.POST)
	public String updateProd(HttpServletRequest request, @RequestParam("file") MultipartFile file)
	{
		String pid=request.getParameter("pid");
		Product prod=new Product();
		prod.setPid(Integer.parseInt(pid));
		prod.setPname(request.getParameter("pName"));
		prod.setPrice(Double.parseDouble(request.getParameter("pPrice")));
		prod.setDescription(request.getParameter("pDescription"));
		prod.setStock(Integer.parseInt(request.getParameter("pStock")));
		String sat=request.getParameter("pCategory");
		String cat=request.getParameter("pSupplier");
		prod.setCategory(categorydaoimpl.findByCatId(Integer.parseInt(cat)));
		prod.setSupplier(supplierdaoimpl.findBySuppId(Integer.parseInt(sat)));

		String filepath=request.getSession().getServletContext().getRealPath("/");
		String filename=file.getOriginalFilename();
		prod.setImgName(filename);
		productdaoimpl.update(prod);
		
		System.out.println("File Path= "+ filepath);
		
		try
		{
			byte imagebyte[]=file.getBytes();
			BufferedOutputStream fos=new BufferedOutputStream(new FileOutputStream(filepath+"/resources/"+filename));
			
			fos.write(imagebyte);
			fos.close();
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		
		return "redirect:/admin/productList?update";
		
	}
		
	
	
}

