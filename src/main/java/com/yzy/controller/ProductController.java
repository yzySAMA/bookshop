package com.yzy.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzy.pojo.Category;
import com.yzy.pojo.Product;
import com.yzy.service.CategoryService;
import com.yzy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;
    /**查询商品信息*/
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
    public String productUpdate(Product product,@RequestParam(value = "pn")Integer pn){
        productService.productUpdate(product);
        return "redirect:productInfo.do?pn="+pn;
    }

    @RequestMapping("productDel.do")
    public String productDel(String pid,@RequestParam(value = "pn")Integer pn){
        productService.productDel(pid);
        return "redirect:productInfo.do?pn="+pn;
    }
}
