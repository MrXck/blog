package com.controller;


import com.domain.Picture;
import com.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;

@Controller
@RequestMapping("/image")
public class PictureController {
    @Autowired
    @Qualifier("pictureService")
    private PictureService pictureService;

    @RequestMapping(value = "/upload", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String upload(@RequestParam("editormd-image-file") MultipartFile multipartFile, HttpServletRequest request) throws Exception {
        String filename = multipartFile.getOriginalFilename().split("\\.")[0];
        byte[] content = multipartFile.getBytes();
        Picture picture = new Picture();
        picture.setPicture_name(filename);
        picture.setContent(content);
        String json;
        String local = request.getRequestURL().toString();
        local = local.replace("//", ",");
        local = local.split("/")[0] + "/" + local.split("/")[1];
        local = local.replace(",", "//");
        try{
            pictureService.save(picture);
            json = "{\"success\": 1, \"url\": \"" + local + "/image/getImage/" + filename + "\"}";
        }catch (Exception e){
            e.printStackTrace();
            json = "{\"success\": 0, \"message\": \"" + "文件上传错误" + "\"}";
        }
        return json;
    }

    @RequestMapping("/getImage/{filename}")
    public void getImage(@PathVariable String filename, HttpServletResponse response) throws Exception {
        Picture picture = pictureService.findByFilename(filename);
        OutputStream out = response.getOutputStream();
        out.write(picture.getContent());
    }

}
