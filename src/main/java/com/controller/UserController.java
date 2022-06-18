package com.controller;


import com.utils.MD5Utils;
import com.domain.User;
import com.service.UserService;
import com.wf.captcha.utils.CaptchaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    @Qualifier("userService")
    private UserService userService;

    @RequestMapping("/login")
    public ModelAndView login(User user, String verCode, ModelAndView modelAndView, HttpServletRequest request, @RequestHeader(value = "referer", required = false) String referer){
        String method = request.getMethod();
        if("GET".equals(method)){
            modelAndView.setViewName("pages/login");
            HttpSession session = request.getSession();
            if (!referer.contains("register") && !referer.contains("login")){
                session.setAttribute("next", referer);
            }
        }else {
            String password = user.getPassword();
            String username = user.getUsername();
            modelAndView.addObject("username", username);
            if (!CaptchaUtil.ver(verCode, request)) {
                CaptchaUtil.clear(request);  // 清除session中的验证码
                modelAndView.setViewName("pages/login");
                modelAndView.addObject("error1", "验证码错误");
                modelAndView.addObject("password", password);
                return modelAndView;
            }
            user.setPassword(MD5Utils.md5(password));
            User user1 = userService.findByUsernameAndPassword(user);
            if(user1 == null){
                modelAndView.setViewName("pages/login");
                modelAndView.addObject("error", "用户名或密码错误");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("user", user1);
                String next = (String) session.getAttribute("next");
                modelAndView.setViewName("redirect:" + next);
            }
        }
        return modelAndView;
    }

    @RequestMapping("/register")
    public ModelAndView register(User user, String verCode, ModelAndView modelAndView, HttpServletRequest request){
        String method = request.getMethod();
        if("GET".equals(method)){
            modelAndView.setViewName("pages/register");
        }else {
            String password = user.getPassword();
            String username = user.getUsername();
            modelAndView.addObject("username", username);
            modelAndView.addObject("password", password);
            if (!CaptchaUtil.ver(verCode, request)) {
                CaptchaUtil.clear(request);  // 清除session中的验证码
                modelAndView.setViewName("pages/register");
                modelAndView.addObject("error1", "验证码错误");
                return modelAndView;
            }
            if(user.getUsername().length() < 1){
                modelAndView.setViewName("pages/register");
                modelAndView.addObject("error2", "请输入用户名");
                return modelAndView;
            }else if(user.getPassword().length() < 1){
                modelAndView.setViewName("pages/register");
                modelAndView.addObject("error", "请输入密码");
                return modelAndView;
            }
            user.setPassword(MD5Utils.md5(user.getPassword()));
            if(userService.save(user)){
                modelAndView.setViewName("pages/login");
            }else {
                modelAndView.setViewName("pages/register");
                modelAndView.addObject("error2", "用户名已存在");
            }
        }
        return modelAndView;
    }

    @RequestMapping("/about")
    public ModelAndView about(ModelAndView modelAndView){
        modelAndView.setViewName("about");
        return modelAndView;
    }

    @RequestMapping("/captcha")
    public void captcha(HttpServletRequest request, HttpServletResponse response) throws Exception {
        CaptchaUtil.out(request, response);
    }

}
