package com.Coffee.controller;

import com.Coffee.domain.Commodity;
import com.Coffee.domain.User;
import com.Coffee.service.CommodityService;
import com.Coffee.service.LoginService;
import com.Coffee.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private LoginService loginService;

    @Autowired
    private UserService userService;

    @Autowired
    private CommodityService commodityService;

    @RequestMapping("/login")
    public ModelAndView login(String username,String password,HttpSession session){
        ModelAndView mv = new ModelAndView();
        Boolean flog = loginService.login(username, password);
        if (flog){
            mv.setViewName("details");
            List<Commodity> list = commodityService.findAll();
            mv.addObject("list",list);
            mv.addObject("username",username);
            session.setAttribute("username",username);
            return mv;
        }else {
            mv.setViewName("login");
            return mv;
        }
    }

    @RequestMapping("/toRegister")
    public String toRegister(){
        return "register";
    }

    @RequestMapping("/register")
    public ModelAndView register(User user){
        ModelAndView mv = new ModelAndView();
        userService.addUser(user);
        mv.setViewName("login");
        return mv;
    }

    @RequestMapping("/toUpdate")
    public ModelAndView toUpdate(HttpSession session){
        ModelAndView mv = new ModelAndView();
        String username = (String) session.getAttribute("username");
        User user = userService.findUserByUsername(username);
        mv.addObject("user",user);
        mv.setViewName("update");
        return mv;
    }
}
