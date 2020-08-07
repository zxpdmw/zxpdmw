package com.zwy.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwy.dao.BlogDao;
import com.zwy.pojo.Comment;
import com.zwy.service.MessageService;
import com.zwy.vo.DetailedBlog;
import com.zwy.vo.FirstPageBlog;
import com.zwy.vo.RecommendBlog;
import com.zwy.service.BlogService;
import com.zwy.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;


/**
 * @Description: 首页控制器
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Controller
public class IndexController {

    @Autowired
    private BlogService blogService;
    @Autowired
    MessageService messageService;
    @Autowired
    private CommentService commentService;

    /**
    * @Description: index 分页查询博客列表
    * @Param: [model, pageNum, attributes]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:19
    */
    @GetMapping("/")
    public String index(Model model, @RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, RedirectAttributes attributes){
        PageHelper.startPage(pageNum,10);
        List<FirstPageBlog> allFirstPageBlog = blogService.getAllFirstPageBlog();
        List<RecommendBlog> recommendedBlog = blogService.getRecommendedBlog();

        PageInfo<FirstPageBlog> pageInfo = new PageInfo<>(allFirstPageBlog);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("recommendedBlogs", recommendedBlog);

        return "index";
    }

    /**
    * @Description: search 搜索博客
    * @Param: [model, pageNum, query]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:20
    */
    @PostMapping("/search")
    public String search(Model model,
                         @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum,
                         @RequestParam String query) {
        PageHelper.startPage(pageNum, 1000);
        List<FirstPageBlog> searchBlog = blogService.getSearchBlog(query);
        PageInfo<FirstPageBlog> pageInfo = new PageInfo<>(searchBlog);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("query", query);
        return "search";
    }

    /**
    * @Description: blog 跳转博客详情页面
    * @Param: [id, model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:20
    */
    @GetMapping("/blog/{id}")
    public String detailBlog(@PathVariable Long id, Model model) {
        DetailedBlog detailedBlog = blogService.getDetailedBlog(id);
        List<Comment> comments = commentService.listCommentByBlogId(id);
        model.addAttribute("comments", comments);
        model.addAttribute("blog", detailedBlog);
        return "blog";
    }

    /**
    * @Description: blogMessage 博客信息
    * @Param: [model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:20
    */
    @GetMapping("/footer/blogmessage")
    public String blogMessage(Model model){
        int blogTotal = blogService.getBaseMapper().selectCount(null);
        int blogViewTotal = blogService.getBlogViewTotal();
        int blogCommentTotal = commentService.getBaseMapper().selectCount(null);
        int blogMessageTotal = messageService.getBaseMapper().selectCount(null);

        model.addAttribute("blogTotal",blogTotal);
        model.addAttribute("blogViewTotal",blogViewTotal);
        model.addAttribute("blogCommentTotal",blogCommentTotal);
        model.addAttribute("blogMessageTotal",blogMessageTotal);
        return "index::blogMessage";
    }
}