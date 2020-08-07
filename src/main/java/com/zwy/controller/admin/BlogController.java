package com.zwy.controller.admin;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zwy.pojo.Blog;
import com.zwy.pojo.Type;
import com.zwy.pojo.User;
import com.zwy.vo.BlogQuery;
import com.zwy.vo.SearchBlog;
import com.zwy.vo.ShowBlog;
import com.zwy.service.BlogService;
import com.zwy.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;
import java.util.List;

/**
 * @Description: 博客管理控制器
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Controller
@RequestMapping("/admin")
public class BlogController {

    @Autowired
    private BlogService blogService;
    @Autowired
    private TypeService typeService;

    /**
     * @Description: blogs 博客列表
     * @Param: [model, pageNum]
     * @return: java.lang.String
     * @Author: ZXP
     * @Date: 2020/6/28-11:12
     */
    @RequestMapping("/blogs")
    public String blogs(Model model, @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) {
        //按照排序字段 倒序 排序
        String orderBy = "update_time desc";
        PageHelper.startPage(pageNum, 10, orderBy);
        List<BlogQuery> list = blogService.getAllBlogQuery();
        PageInfo<BlogQuery> pageInfo = new PageInfo<BlogQuery>(list);
        model.addAttribute("types", typeService.getBaseMapper().selectList(null));
        model.addAttribute("pageInfo", pageInfo);
        return "admin/blogs";
    }

    /**
     * @Description: toAdd 跳转博客新增页面
     * @Param: [model]
     * @return: java.lang.String
     * @Author: ZXP
     * @Date: 2020/6/28-11:12
     */
    @GetMapping("/blogs/input")
    public String toAdd(Model model) {
        model.addAttribute("types", typeService.getBaseMapper().selectList(null));
        model.addAttribute("blog", new Blog());
        return "admin/blogs-input";
    }

    /**
     * @Description: add 博客新增
     * @Param: [blog, attributes, session]
     * @return: java.lang.String
     * @Author: ZXP
     * @Date: 2020/6/28-11:12
     */
    @PostMapping("/blogs")
    public String add(Blog blog, RedirectAttributes attributes, HttpSession session) {
        blog.setUser((User) session.getAttribute("user"));
        //设置blog的type
        blog.setType(typeService.getById(blog.getType().getId()));
        blog.setCreateTime(new Date());
        blog.setUpdateTime(new Date());
        //设置blog中typeId属性
        blog.setTypeId(blog.getType().getId());
        //设置用户id
        blog.setUserId(blog.getUser().getId());
        boolean b = blogService.save(blog);

        if (b) {
            attributes.addFlashAttribute("message", "新增成功");
        } else {
            attributes.addFlashAttribute("message", "新增失败");
        }
        return "redirect:/admin/blogs";
    }

    /**
     * @Description: delete 删除文章
     * @Param: [id, attributes]
     * @return: java.lang.String
     * @Author: ZXP
     * @Date: 2020/6/28-11:12
     */
    @GetMapping("/blogs/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes attributes) {
        boolean b = blogService.removeById(id);
        if (b) {
            attributes.addAttribute("message", "删除成功");
        } else {
            attributes.addAttribute("message", "删除失败");
        }
        return "redirect:/admin/blogs";
    }

    /**
     * @Description: toEdit 跳转编辑文章
     * @Param: [id, model]
     * @return: java.lang.String
     * @Author: ZXP
     * @Date: 2020/6/28-11:13
     */
    @GetMapping("/blogs/{id}/input")
    public String toEdit(@PathVariable Long id, Model model) {
        model.addAttribute("blog", blogService.getById(id));
        model.addAttribute("types", typeService.getBaseMapper().selectList(null));
        return "admin/blogs-input";
    }

    /**
    * @Description: edit 编辑文章
    * @Param: [showBlog, attributes]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:13
    */
    @PostMapping("/blogs/{id}")
    public String edit(@Valid ShowBlog showBlog, RedirectAttributes attributes) {
        boolean update = blogService.update(new UpdateWrapper<Blog>()
                .eq("id", showBlog.getId())
                .set("published", showBlog.isPublished())
                .set("flag", showBlog.getFlag())
                .set("title", showBlog.getTitle())
                .set("content", showBlog.getContent())
                .set("type_id", showBlog.getTypeId())
                .set("first_picture", showBlog.getFirstPicture())
                .set("description", showBlog.getDescription())
                .set("recommend", showBlog.isRecommend())
                .set("share_statement", showBlog.isShareStatement())
                .set("appreciation", showBlog.isAppreciation())
                .set("commentabled", showBlog.isCommentabled())
                .set("update_time", new Date()));
        if (update) {
            attributes.addAttribute("message", "修改成功");
        } else {
            attributes.addAttribute("message", "修改失败");
        }
        return "redirect:/admin/blogs";
    }

    /**
    * @Description: search 搜索博客
    * @Param: [searchBlog, model, pageNum]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:13
    */
    @PostMapping("/blogs/search")
    public String search(SearchBlog searchBlog, Model model,
                         @RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum) {
        List<BlogQuery> blogBySearch = blogService.getBlogBySearch(searchBlog);
        PageHelper.startPage(pageNum, 10);
        PageInfo<BlogQuery> pageInfo = new PageInfo<>(blogBySearch);
        model.addAttribute("pageInfo", pageInfo);
        return "admin/blogs :: blogList";
    }
}


