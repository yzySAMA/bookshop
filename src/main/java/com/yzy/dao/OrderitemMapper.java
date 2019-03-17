package com.yzy.dao;

import com.yzy.pojo.Orderitem;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderitemMapper {

    void addOrderitem(Orderitem orderitem);
}