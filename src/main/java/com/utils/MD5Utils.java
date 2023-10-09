package com.utils;

import org.apache.commons.codec.digest.DigestUtils;

public class MD5Utils {

    private static final String SOLT = "xck666";

    public static String md5(String password){
        // 加密一次
        String md5Password = DigestUtils.md5Hex(password);

        // 再加密一次 而且加了盐
        return DigestUtils.md5Hex(md5Password + SOLT);
    }

    public static void main(String[] args) {
        System.out.println(md5("123456"));
    }
}
