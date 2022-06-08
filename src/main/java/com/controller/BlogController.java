package com.controller;


import com.domain.Blog;
import com.domain.BlogTag;
import com.domain.BlogType;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.BlogService;
import com.service.BlogTagService;
import com.service.BlogTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class BlogController {

    @Autowired
    @Qualifier("blogService")
    private BlogService blogService;

//    @Autowired
//    @Qualifier("blogTagService")
//    private BlogTagService blogTagService;

    @Autowired
    @Qualifier("blogTypeService")
    private BlogTypeService blogTypeService;

    @RequestMapping(value = "/index")
    public ModelAndView index(
            @RequestParam(value = "page", defaultValue = "1") int page,
            ModelAndView modelAndView,
//            @RequestParam(value = "tag_id", defaultValue = "0") int tag_id,
            @RequestParam(value = "type_id", defaultValue = "0") int type_id,
            @RequestParam(value = "title", defaultValue = "") String title
    ){
//        List<BlogTag> blogTagList = blogTagService.findAll();
        List<BlogType> blogTypeList = blogTypeService.findAll();
        List<Blog> blogList;
        int num = blogService.findAllNum();
        PageHelper.startPage(page, 10);
        if(type_id > 0 && !"".equals(title)){
            blogList = blogService.findByTitleAndTypeId(title, type_id);
        }else if(type_id > 0){
            blogList = blogService.findByTypeId(type_id);
        }
        else if(type_id == 0 && !"".equals(title)){
            blogList = blogService.findByTitle(title);
        }else {
            blogList = blogService.findAll();
        }
        PageInfo<Blog> pageInfo = new PageInfo<>(blogList);
        modelAndView.setViewName("pages/index");
        modelAndView.addObject("blogList", blogList);
        modelAndView.addObject("blogTypeList", blogTypeList);
        modelAndView.addObject("num", num);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("title", title);
        modelAndView.addObject("type_id", type_id);
        return modelAndView;
    }

    @RequestMapping(value = "/blog")
    public ModelAndView blog(ModelAndView modelAndView, int id){
        Blog blog = blogService.findById(id);
        List<BlogType> blogTypeList = blogTypeService.findAll();
        modelAndView.addObject("blog", blog);
        modelAndView.addObject("blogTypeList", blogTypeList);
        modelAndView.setViewName("pages/blog");
        return modelAndView;
    }

}
