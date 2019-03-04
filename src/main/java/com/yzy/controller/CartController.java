package com.yzy.controller;

import com.yzy.pojo.Cart;
import com.yzy.pojo.CartItem;
import com.yzy.pojo.Product;
import com.yzy.pojo.User;
import com.yzy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class CartController {

    @Autowired
    private ProductService productService;

    /**
     * 购物车页面跳转
     */
    @RequestMapping("cartAdd")
    public String cartAdd(String pid, Integer buyNum, HttpSession session) {
        User user = (User) session.getAttribute("user");
//        if (user == null) {
//            return "cartNeedToLogin";
//        } else {
            Product product = productService.findProductByPid(pid);
            CartItem cartItem = new CartItem();
            cartItem.setProduct(product);
            cartItem.setBuyNum(buyNum);
            cartItem.setSubTotal(product.getPrice() * buyNum);
            Cart cart = (Cart) session.getAttribute("cart");

            if (cart == null) {
                cart = new Cart();
            }
            Map<String, CartItem> map = cart.getCartItemMap();

            //判断购物车中是否有了这一项商品

            if (map.containsKey(product.getPid())) {
                //如果有
                CartItem cartItem1 = map.get(pid);
                Integer oldBuyNum = cartItem1.getBuyNum();
                Integer newBuyNum = oldBuyNum + buyNum;
                cartItem1.setBuyNum(newBuyNum);
                cartItem1.setSubTotal(newBuyNum*product.getPrice());
                map.put(pid,cartItem1);
                cart.setCartItemMap(map);
                cart.setTotal(cart.getTotal() +buyNum*product.getPrice());

            } else {
                //如果没有
                map.put(product.getPid(), cartItem);
                cart.setCartItemMap(map);
                cart.setTotal(cart.getTotal() + cartItem.getSubTotal());
            }
                session.setAttribute("cart", cart);

            return "redirect:cart";
       // }
    }

    @RequestMapping("cartItemDel")
    public String cartItemDel(String pid,HttpSession session){
        Cart cart= (Cart) session.getAttribute("cart");
        if(cart!=null){
            Map<String, CartItem> cartItems = cart.getCartItemMap();
            cart.setTotal(cart.getTotal()-cartItems.get(pid).getSubTotal());
            cartItems.remove(pid);
            cart.setCartItemMap(cartItems);
            session.setAttribute("cart",cart);
        }
        return "redirect:cart";
    }

    @RequestMapping("cartDel")
    public String cartDel(HttpSession session){
        session.removeAttribute("cart");
        return "redirect:cart";
    }
}
