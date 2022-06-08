package com.interceptor;

import com.domain.Admin;
import com.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    // 在目标方法执行之前执行
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        if(url.endsWith("admin/") || url.endsWith("/index") || url.endsWith("/login") || url.endsWith("/register") || url.endsWith("/blog") || url.contains("static") || url.contains("editor-md") || url.contains("image") || url.contains("getComment")) {
            return true;
        }
        if(url.contains("admin")) {
            HttpSession session = request.getSession();
            Admin admin = (Admin) session.getAttribute("admin");
            if (admin == null) {
                request.getRequestDispatcher("/admin/").forward(request, response);
            }
        }else{
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user == null) {
                request.getRequestDispatcher("/login").forward(request, response);
            }
        }
        return true;
    }

    @Override
    // 在目标方法执行之后 视图对象返回之前
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("user");
//        if(user != null){
//            modelAndView.addObject("user", user);
//        }
//        else {
//            modelAndView.addObject("user", null);
//        }
    }

    @Override
    // 在流程都执行完毕后执行
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}