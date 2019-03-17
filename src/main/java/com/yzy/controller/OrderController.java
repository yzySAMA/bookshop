package com.yzy.controller;

import com.yzy.pojo.*;
import com.yzy.service.OrderService;
import com.yzy.utils.CommonsUtils;
import com.yzy.utils.PaymentUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    /**提交订单*/
    @RequestMapping("submitOrder.do")
    public String submitOrder(HttpSession session){
        User user=(User)session.getAttribute("user");
        if(user==null){
            return "login";
        }
        Orders order=new Orders();
        //订单号
        order.setOid(CommonsUtils.getUUID());
        //下单时间
        order.setOrdertime(new Date());
        //订单总金额
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart!=null){
            order.setTotal(cart.getTotal());
        }
        //订单支付状态
        order.setState(0);
        //收货人信息
        order.setAddress(null);
        order.setName(null);
        order.setTelephone(null);
        //订单所属用户
        order.setUser(user);
        //订单中的订单项
        //获得购物车中的购物项集合
        Map<String, CartItem> cartItems = cart.getCartItemMap();
        Set<Map.Entry<String, CartItem>> entries = cartItems.entrySet();
        for (Map.Entry<String, CartItem> entry : entries) {
            //获得每个购物项
            CartItem cartItem = entry.getValue();
            //创建新的订单项
            Orderitem orderitem = new Orderitem();
            orderitem.setItemid(CommonsUtils.getUUID());
            orderitem.setCount(cartItem.getBuyNum());
            orderitem.setSubtotal(cartItem.getSubTotal());
            orderitem.setProduct(cartItem.getProduct());
            orderitem.setOrders(order);
            // 将订单项添加到订单集合中
            order.getOrderitems().add(orderitem);
        }
        //传递数据到service
        orderService.submitOrder(order);
        session.setAttribute("order",order);
        return "redirect:order_info";
    }

    /**确认订单 更新收货人信息+在线支付*/
    @RequestMapping("confirmOrder.do")
    public String confirmOrder(Orders order,String pd_FrpId){
        orderService.confirmOrder(order);


        //获得支付必须的基本数据
        String orderid = order.getOid();
        //String  money =order.getTotal()+"";
        String  money ="0.01";
        // 银行
        //pd_FrpId

        // 发给支付公司需要哪些数据
        String p0_Cmd = "Buy";
        String p1_MerId = ResourceBundle.getBundle("merchantInfo").getString("p1_MerId");
        String p2_Order = orderid;
        String p3_Amt = money;
        String p4_Cur = "CNY";
        String p5_Pid = "";
        String p6_Pcat = "";
        String p7_Pdesc = "";
        // 支付成功回调地址 ---- 第三方支付公司会访问、用户访问
        // 第三方支付可以访问网址
        String p8_Url = ResourceBundle.getBundle("merchantInfo").getString("callback");
        String p9_SAF = "";
        String pa_MP = "";
        String pr_NeedResponse = "1";
        // 加密hmac 需要密钥
        String keyValue = ResourceBundle.getBundle("merchantInfo").getString(
                "keyValue");
        String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
                p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
                pd_FrpId, pr_NeedResponse, keyValue);


        String url = "https://www.yeepay.com/app-merchant-proxy/node?pd_FrpId="+pd_FrpId+
                "&p0_Cmd="+p0_Cmd+
                "&p1_MerId="+p1_MerId+
                "&p2_Order="+p2_Order+
                "&p3_Amt="+p3_Amt+
                "&p4_Cur="+p4_Cur+
                "&p5_Pid="+p5_Pid+
                "&p6_Pcat="+p6_Pcat+
                "&p7_Pdesc="+p7_Pdesc+
                "&p8_Url="+p8_Url+
                "&p9_SAF="+p9_SAF+
                "&pa_MP="+pa_MP+
                "&pr_NeedResponse="+pr_NeedResponse+
                "&hmac="+hmac;

        //重定向到第三方支付平台
       // response.sendRedirect(url);
        return "redirect:"+url;
    }

    @RequestMapping("callback.do")
    public void callback(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
        // 获得回调所有数据
        String p1_MerId = request.getParameter("p1_MerId");
        String r0_Cmd = request.getParameter("r0_Cmd");
        String r1_Code = request.getParameter("r1_Code");
        String r2_TrxId = request.getParameter("r2_TrxId");
        String r3_Amt = request.getParameter("r3_Amt");
        String r4_Cur = request.getParameter("r4_Cur");
        String r5_Pid = request.getParameter("r5_Pid");
        String r6_Order = request.getParameter("r6_Order");
        String r7_Uid = request.getParameter("r7_Uid");
        String r8_MP = request.getParameter("r8_MP");
        String r9_BType = request.getParameter("r9_BType");
        String rb_BankId = request.getParameter("rb_BankId");
        String ro_BankOrderId = request.getParameter("ro_BankOrderId");
        String rp_PayDate = request.getParameter("rp_PayDate");
        String rq_CardNo = request.getParameter("rq_CardNo");
        String ru_Trxtime = request.getParameter("ru_Trxtime");
        // 身份校验 --- 判断是不是支付公司通知你
        String hmac = request.getParameter("hmac");
        String keyValue = ResourceBundle.getBundle("merchantInfo").getString(
                "keyValue");

        // 自己对上面数据进行加密 --- 比较支付公司发过来hamc
        boolean isValid = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd,
                r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid,
                r8_MP, r9_BType, keyValue);


        if (isValid) {
            // 响应数据有效
            if (r9_BType.equals("1")) {
                //修改订单状态
                orderService.updateOrderState(r6_Order);
                //清空购物车
                session.removeAttribute("cart");
                // 浏览器重定向
                response.setContentType("text/html;charset=utf-8");
                response.sendRedirect("payOk");
            } else if (r9_BType.equals("2")) {
                // 服务器点对点 --- 支付公司通知你
                System.out.println("付款成功！");
                // 修改订单状态 为已付款
                // 回复支付公司
                response.getWriter().print("success");
            }
        } else {
            // 数据无效
            System.out.println("数据被篡改！");
        }

    }

    @RequestMapping("myOrders.do")
    public String myOrders(HttpSession session,Model model){
        User user=(User)session.getAttribute("user");
        if(user==null){
            return "login";
        }

        List<Orders> ordersList= orderService.findAllOrders(user.getUid());
        if(ordersList!=null){
            for (Orders order : ordersList) {
                //获得每个订单的oid
                String oid = order.getOid();
                List<Map<String,Object>> mapList= orderService.findAllOrderItemByOid(oid);
                for (Map<String, Object> map : mapList) {
                    Orderitem orderitem =new Orderitem();
                    orderitem.setCount(Integer.parseInt(map.get("count").toString()));
                    orderitem.setSubtotal(Double.parseDouble(map.get("subtotal").toString()));
                    Product product = new Product();
                    product.setPimage(map.get("pimage").toString());
                    product.setPname(map.get("pname").toString());
                    product.setPrice(Double.parseDouble(map.get("price").toString()));
                    orderitem.setProduct(product);
                    order.getOrderitems().add(orderitem);
                }
            }
        }
        //orderList封装完成
        model.addAttribute("orderList",ordersList);
        return "order_list";
    }
}
