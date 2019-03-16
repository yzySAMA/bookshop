package com.yzy.controller;

import com.github.pagehelper.PageInfo;
import com.yzy.pojo.Category;
import com.yzy.pojo.Product;
import com.yzy.service.CategoryService;
import com.yzy.service.ProductService;
import com.yzy.utils.CommonsUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;
    /**后台查询所有商品信息*/
    @RequestMapping("productInfo.do")
    public String getProducts(@RequestParam(value = "pn",defaultValue="1")Integer pn, Model model){
        //分页查询
        PageInfo<Product> page= productService.getProducts(pn);
        //封装了详细的分页信息，包括有我们查询出来的数据，传入连续显示的页数

       model.addAttribute("page",page);
        return "admin";
    }

    /**根据pid查找商品的信息，用于更新商品的数据展示*/
    @RequestMapping("productMsg.do")
    public String findProductByPid(String pid,Model model,@RequestParam(value = "pn")Integer pn){
        Product product=productService.findProductByPid(pid);
        List<Category> list=categoryService.findCategorys();
        model.addAttribute("product",product);
        model.addAttribute("categoryList",list);
        model.addAttribute("pn",pn);
        return "product_update";
    }

    /**更新数据*/
    @RequestMapping("update.do")
    public String productUpdate(Product product,@RequestParam(value = "pn")Integer pn,MultipartFile pictureFile) throws IOException {
        //保存图片到G:\images
        String name = CommonsUtils.getUUID();
        //获得扩展名
        String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
        pictureFile.transferTo(new File("G:\\images\\"+name+"."+ext));
        product.setPimage(name+"."+ext);
        productService.productUpdate(product);
        return "redirect:productInfo.do?pn="+pn;
    }

    /**删除数据*/
    @RequestMapping("productDel.do")
    public String productDel(String pid,@RequestParam(value = "pn")Integer pn){
        productService.productDel(pid);
        return "redirect:productInfo.do?pn="+pn;
    }

    /**进入商品添加页面*/
    @RequestMapping("addMsg.do")
    public String findAllCategory(Model model){
        List<Category> list = categoryService.findCategorys();
        model.addAttribute("categoryList",list);
        return "product_add";
    }

    /**商品添加*/
    @RequestMapping("add.do")
    public String productAdd(Product product, MultipartFile pictureFile) throws IOException {
        //set pid
        String pid = CommonsUtils.getUUID();
        product.setPid(pid);
        //保存图片到G:\images
        String name = CommonsUtils.getUUID();
        //获得扩展名
        String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
        pictureFile.transferTo(new File("G:\\images\\"+name+"."+ext));
        product.setPimage(name+"."+ext);
        productService.productAdd(product);
        return "redirect:productInfo.do";
    }

    /**首页商品展示*/
    @RequestMapping("index")
    public String index(Model model){
       List<Product> list= productService.findHotProduct();
        List<Category> categorys = categoryService.findCategorys();
        model.addAttribute("hotProduct",list);
        model.addAttribute("categoryList",categorys);
        return "index";
    }

    /**同种类型的商品展示*/
    @RequestMapping("productInfoByCid")
    public String productInfoByCid(String cid,Model model){
        List<Product> list=productService.productInfoByCid(cid);
        Category category=categoryService.findCategoryByCid(cid);
        model.addAttribute("productList",list);
        model.addAttribute("category",category);

        return "product_list";
    }

    /**单个商品页面展示*/
    @RequestMapping("productInfoByPid")
    public String productInfoByPid(String pid,Model model){
        Product product = productService.findProductByPid(pid);
        Category category = categoryService.findCategoryByCid(product.getCid());
        model.addAttribute("product",product);
        model.addAttribute("category",category);
        return "product_info";
    }

    /**根据商品名模糊查询*/
    @RequestMapping("getProductBypname.do")
    @ResponseBody
    public List<Product> getProductBypname(String pname) throws UnsupportedEncodingException {
        List<Product> products=productService.getProductBypname(pname);
        return products;
    }

    /**通过搜索查询数据*/
    @RequestMapping("productInfoByPname.do")
    public String productInfoByPname(String pname,Model model){
        System.out.println(pname);
        List<Product> products=productService.findProductByPname(pname);
        System.out.println(products);
        Category category=null;
        if(products!=null&&products.size()>0){
            String cid = products.get(0).getCid();
            category=categoryService.findCategoryByCid(cid);
        }
        model.addAttribute("productList",products);
        model.addAttribute("category",category);

        return "product_list";
    }
}
