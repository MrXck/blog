package com.controller.api;


import com.VO.Return;
import com.domain.Blog;
import com.domain.BlogType;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.BlogService;
import com.service.BlogTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class BlogApiController {

    @Autowired
    private BlogService blogService;

//    @Autowired
//    private BlogTagService blogTagService;

    @Autowired
    private BlogTypeService blogTypeService;

    @RequestMapping(value = "/index")
    public Return index(
            @RequestParam(value = "page", defaultValue = "1") int page,
//            @RequestParam(value = "tag_id", defaultValue = "0") int tag_id,
            @RequestParam(value = "type_id", defaultValue = "0") int type_id,
            @RequestParam(value = "title", defaultValue = "") String title,
            @RequestParam(value = "date", defaultValue = "") String date
    ){
//        List<BlogTag> blogTagList = blogTagService.findAll();
        List<BlogType> blogTypeList = blogTypeService.findAll();
        List<Blog> blogList;
        PageHelper.startPage(page, 10);
        if(type_id > 0 && !"".equals(title)){
            blogList = blogService.findByTitleAndTypeId(title, type_id);
        }else if(type_id > 0){
            blogList = blogService.findByTypeId(type_id);
        }else if(type_id == 0 && !"".equals(title)){
            blogList = blogService.findByTitle(title);
        }else if(!"".equals(date)){
            blogList = blogService.findByDate(date);
        }else {
            blogList = blogService.findAll();
        }
        List<String> archives = blogService.findArchives();
        PageInfo<Blog> pageInfo = new PageInfo<>(blogList);
        Return retu = new Return();
        Map<String, Object> data = new HashMap<>();
        data.put("blogList", blogList);
        data.put("blogTypeList", blogTypeList);
        data.put("blogDateList", archives);
        retu.setData(data);
        retu.setCode(0);
        retu.setPage(pageInfo);
        return retu;
    }

    @RequestMapping(value = "/blog")
    public Return blog(int id){
        Blog blog = blogService.findById(id);
        Return retu = new Return();
        Map<String, Object> data = new HashMap<>();
        data.put("blog", blog);
        retu.setData(data);
        retu.setCode(0);
        return retu;
    }

}
