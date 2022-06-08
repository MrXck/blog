package com.controller;


import com.utils.MD5Utils;
import com.domain.Admin;
import com.domain.Blog;
import com.domain.BlogType;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.AdminService;
import com.service.BlogService;
import com.service.BlogTagService;
import com.service.BlogTypeService;
import com.wf.captcha.utils.CaptchaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    @Qualifier("adminService")
    private AdminService adminService;

    @Autowired
    @Qualifier("blogService")
    private BlogService blogService;

    @Autowired
    @Qualifier("blogTypeService")
    private BlogTypeService blogTypeService;

    @Autowired
    @Qualifier("blogTagService")
    private BlogTagService blogTagService;

    @RequestMapping("/blogs")
    public ModelAndView blog(
            ModelAndView modelAndView,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "type_id", defaultValue = "0") int type_id,
            @RequestParam(value = "title", defaultValue = "") String title
    ){
        List<BlogType> blogTypeList = blogTypeService.findAll();
        List<Blog> blogList;
        String path = "";
        int num = blogService.findAllNum();
        PageHelper.startPage(page, 13);
        if(type_id > 0 && !"".equals(title)){
            path = "title=" + title + "&type_id=" + type_id;
            blogList = blogService.findByTitleAndTypeId(title, type_id);
        }else if(type_id > 0){
            path = "type_id=" + type_id;
            blogList = blogService.findByTypeId(type_id);
        }
        else if(type_id == 0 && !"".equals(title)){
            path = "title=" + title;
            blogList = blogService.findByTitle(title);
        }else {
            blogList = blogService.findAll();
        }
        PageInfo<Blog> pageInfo = new PageInfo<>(blogList);
        modelAndView.setViewName("/pages/admin/blogs");
        modelAndView.addObject("blogList", blogList);
        modelAndView.addObject("blogTypeList", blogTypeList);
        modelAndView.addObject("num", num);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("title", title);
        modelAndView.addObject("type_id", type_id);
        modelAndView.addObject("path", path);
        return modelAndView;
    }

    @RequestMapping("/index")
    public ModelAndView index(ModelAndView modelAndView){
        modelAndView.setViewName("/pages/admin/index");
        return modelAndView;
    }

    @RequestMapping("/blogs/add")
    public ModelAndView add(ModelAndView modelAndView, HttpServletRequest request, Blog blog){
        String method = request.getMethod();
        if("GET".equals(method)){
            List<BlogType> blogTypeList = blogTypeService.findAll();
            modelAndView.setViewName("/pages/admin/blogs_edit_add");
            modelAndView.addObject("blogTypeList", blogTypeList);
        }else {
            HttpSession session = request.getSession();
            Admin admin = (Admin) session.getAttribute("admin");
            blog.setDate(new Date());
            blog.setAdmin_id(admin.getId());
            blogService.save(blog);
            modelAndView.setViewName("redirect:/admin/blogs");
        }
        return modelAndView;
    }

    @RequestMapping("/blogs/edit")
    public ModelAndView edit(ModelAndView modelAndView, HttpServletRequest request, Blog blog){
        String method = request.getMethod();
        if("GET".equals(method)){
            List<BlogType> blogTypeList = blogTypeService.findAll();
            Blog blog1 = blogService.findById(blog.getId());
            modelAndView.setViewName("/pages/admin/blogs_edit_add");
            modelAndView.addObject("blog", blog1);
            modelAndView.addObject("blogTypeList", blogTypeList);
        }else {
            HttpSession session = request.getSession();
            Admin admin = (Admin) session.getAttribute("admin");
            blog.setDate(new Date());
            blog.setAdmin_id(admin.getId());
            blogService.update(blog);
            modelAndView.setViewName("redirect:/admin/blogs");
        }
        return modelAndView;
    }

    @RequestMapping("/blogs/delete")
    public ModelAndView delete(ModelAndView modelAndView, @RequestParam("id") int id){
        blogTagService.deleteByBlogId(id);
        blogService.deleteById(id);
        modelAndView.setViewName("redirect:/admin/blogs");
        return modelAndView;
    }

    @RequestMapping("/types")
    public ModelAndView types(
            ModelAndView modelAndView,
            @RequestParam(value = "page", defaultValue = "1")int page
            ){
        PageHelper.startPage(page, 13);
        List<BlogType> blogTypeList = blogTypeService.findAll();
        PageInfo<BlogType> pageInfo = new PageInfo<>(blogTypeList);
        modelAndView.setViewName("/pages/admin/types");
        modelAndView.addObject("blogTypeList", blogTypeList);
        modelAndView.addObject("pageInfo", pageInfo);
        return modelAndView;
    }

    @RequestMapping("/types/add")
    public ModelAndView typeAdd(ModelAndView modelAndView, HttpServletRequest request, BlogType blogType){
        String method = request.getMethod();
        if("GET".equals(method)){
            modelAndView.setViewName("/pages/admin/types_edit_add");
        }else {
            blogTypeService.save(blogType);
            modelAndView.setViewName("redirect:/admin/types");
        }
        return modelAndView;
    }

    @RequestMapping("/types/edit")
    public ModelAndView typeEdit(ModelAndView modelAndView, HttpServletRequest request, BlogType blogType){
        String method = request.getMethod();
        if("GET".equals(method)){
            BlogType blogType1 = blogTypeService.findById(blogType.getId());
            modelAndView.setViewName("/pages/admin/types_edit_add");
            modelAndView.addObject("blogType", blogType1);
        }else {
            blogTypeService.update(blogType);
            modelAndView.setViewName("redirect:/admin/types");
        }
        return modelAndView;
    }

    @RequestMapping("/types/delete")
    public ModelAndView typeDelete(ModelAndView modelAndView, HttpServletRequest request, @RequestParam("id") int id){
        blogTypeService.deleteById(id);
        modelAndView.setViewName("redirect:/admin/types");
        return modelAndView;
    }

    @RequestMapping("/info")
    public ModelAndView info(ModelAndView modelAndView, HttpServletRequest request, Admin admin1){
        String method = request.getMethod();
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        admin1.setId(admin.getId());
        if("GET".equals(method)){
            modelAndView.addObject("admin", admin);
        }else {
            admin1.setPassword(MD5Utils.md5(admin1.getPassword()));
            adminService.update(admin1);
            session.setAttribute("admin", admin1);
        }
        modelAndView.setViewName("/pages/admin/info");
        return modelAndView;
    }


    @RequestMapping("/")
    public ModelAndView admin(ModelAndView modelAndView, HttpServletRequest request, Admin admin, String verCode){
        String method = request.getMethod();
        HttpSession session = request.getSession();
        if("GET".equals(method)){
            modelAndView.setViewName("pages/admin/admin");
        }else {
            if (!CaptchaUtil.ver(verCode, request)) {
                CaptchaUtil.clear(request);  // 清除session中的验证码
                modelAndView.setViewName("pages/admin/admin");
                modelAndView.addObject("error1", "验证码错误");
                return modelAndView;
            }
            admin.setPassword(MD5Utils.md5(admin.getPassword()));
            Admin admin1 = adminService.findByUsernameAndPassword(admin);
            if(admin1 == null){
                modelAndView.setViewName("pages/admin/admin");
                modelAndView.addObject("error", "用户名或密码错误");
            }else {
                modelAndView.setViewName("redirect:/admin/blogs");
                session.setAttribute("admin", admin1);
            }
        }
        return modelAndView;
    }

}
