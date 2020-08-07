package com.zwy.controller;

import com.zwy.vo.BlogQuery;
import com.zwy.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

/**
 * @Description: 时间轴页面显示控制器
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Controller
public class ArchiveShowController {

    @Autowired
    private BlogService blogService;

    /** 
    * @Description: archive
    * @Param: [model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:22
    */
    @GetMapping("/archives")
    public String archive(Model model){
        List<BlogQuery> blogs = blogService.getAllBlogQuery();
        model.addAttribute("blogs", blogs);
        return "archives";
    }

}