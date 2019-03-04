package com.yzy.pojo;

import java.util.HashMap;
import java.util.Map;

/**购物车*/
public class Cart {
    //该购物车中的购物项
    private Map<String,CartItem> cartItemMap=new HashMap<>();
    //总计
    private Double total=0.0;

    public Map<String, CartItem> getCartItemMap() {

        return cartItemMap;
    }

    public void setCartItemMap(Map<String, CartItem> cartItemMap) {
        this.cartItemMap = cartItemMap;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
}
