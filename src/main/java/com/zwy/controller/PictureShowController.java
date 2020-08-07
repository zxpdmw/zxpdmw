package com.zwy.controller;

import com.zwy.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @Description: 照片墙页面显示控制器
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Controller
public class PictureShowController {

    @Autowired
    private PictureService pictureService;

    /**
    * @Description: friends 跳转相册页面并显示数据
    * @Param: [model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:21
    */
    @GetMapping("/picture")
    public String friends(Model model) {
        model.addAttribute("pictures",pictureService.getBaseMapper().selectList(null));
        return "picture";
    }

}