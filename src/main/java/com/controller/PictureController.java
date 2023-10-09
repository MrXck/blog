package com.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.util.*;

@Controller
@RequestMapping("/image")
public class PictureController {

    public static final String PATH = System.getProperty("user.dir") + "/files/";

    @RequestMapping(value = "/upload")
    @ResponseBody
    public Map<String, Object> upload(@RequestParam("editormd-image-file") MultipartFile multipartFile, HttpServletRequest request) throws Exception {
        Map<String, Object> map = new HashMap<>();

        File file = new File(PATH);
        if (!file.exists()) {
            file.mkdirs();
        }

        try {
            String[] split = multipartFile.getOriginalFilename().split("\\.");
            String path = UUID.randomUUID() + "." + split[1];
            multipartFile.transferTo(new File(PATH + path));

            map.put("success", 1);
            map.put("url", "/image/getImage/" + path);
        } catch (Exception e) {
            map.put("success", 0);
            map.put("message", "文件上传错误");
            e.printStackTrace();
        }

        return map;
    }

    @RequestMapping(value = "/getImage/{filename:.+}")
    public void getImage(@PathVariable("filename") String filename, HttpServletResponse response) throws Exception {
        try {
            FileInputStream fileInputStream = new FileInputStream(new File(PATH + filename));
            ServletOutputStream outputStream = response.getOutputStream();
            int len = 0;
            byte[] bytes = new byte[1024];
            while ((len = fileInputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, len);
                outputStream.flush();
            }
            outputStream.close();
            fileInputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
