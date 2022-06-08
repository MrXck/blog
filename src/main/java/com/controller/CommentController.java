package com.controller;


import com.domain.Comment;
import com.domain.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    @Qualifier("commentService")
    private CommentService commentService;

    @RequestMapping(value = "/getComment", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getComment(@RequestParam(value = "id") int id){
        List<Comment> commentList = commentService.findByBlogId(id);
        ObjectMapper objectMapper = new ObjectMapper();
        String json;
        try {
            for (Comment comment : commentList) {
                User user = comment.getUser();
                user.setPassword("");
                comment.setUser(user);
            }
            json = objectMapper.writeValueAsString(commentList);
        } catch (Exception e) {
            e.printStackTrace();
            json = "{\"code\":false}";
        }
        return json;
    }

    @RequestMapping("/add")
    public ModelAndView add(ModelAndView modelAndView, Comment comment, HttpSession session){
        User user = (User) session.getAttribute("user");
        comment.setUser_id(user.getId());
        comment.setCreate_time(new Date());
        comment.setContent(comment.getContent().replace("<", "&lt;").replace(">", "&gt;"));
        commentService.save(comment);
        modelAndView.setViewName("redirect:/blog?id=" + comment.getBlog_id());
        return modelAndView;
    }


}
