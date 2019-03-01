package com.yzy.utils;

import java.util.UUID;

public class CommonsUtils {
    public static String getUUID(){
        return UUID.randomUUID().toString().substring(0,6);
    }
}
