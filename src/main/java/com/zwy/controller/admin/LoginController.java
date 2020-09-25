package com.zwy.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zwy.pojo.User;
import com.zwy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
 * @Description: 用户登录控制器
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Controller
@RequestMapping("/admin")
public class LoginController {

    @Autowired
    private UserService userService;
   /**
   * @Description: login 登录检验
   * @Param: [username, password, session, attributes]
   * @return: java.lang.String
   * @Author: ZXP
   * @Date: 2020/6/28-11:16
   */
    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        RedirectAttributes attributes) {
        User user = userService.getOne(new QueryWrapper<User>()
                .eq("username",username)
                .eq("password", DigestUtils.md5DigestAsHex(password.getBytes())));
        if (user != null) {
            user.setPassword(null);
            session.setAttribute("user",user);
            return "admin/index";
        } else {
            attributes.addFlashAttribute("message", "用户名和密码错误");
            return "redirect:/admin";
        }
    }

    /**
    * @Description: logout 注销
    * @Param: [session]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:16
    */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/admin";
    }

}