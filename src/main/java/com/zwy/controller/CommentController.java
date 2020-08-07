package com.zwy.controller;

import com.zwy.pojo.Comment;
import com.zwy.pojo.User;
import com.zwy.vo.DetailedBlog;
import com.zwy.service.BlogService;
import com.zwy.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Description: 评论控制器
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private BlogService blogService;

    @Value("${comment.avatar}")
    private String avatar;

    /**
    * @Description: comments 查询评论列表
    * @Param: [blogId, model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:18
    */
    @GetMapping("/comments/{blogId}")
    public String comments(@PathVariable Long blogId, Model model) {
        List<Comment> comments = commentService.listCommentByBlogId(blogId);
        model.addAttribute("comments", comments);
        return "blog :: commentList";
    }

    /**
    * @Description: add 新增评论
    * @Param: [comment, session, model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:18
    */
    @PostMapping("/comments")
    public String add(Comment comment, HttpSession session,Model model) {
        Long blogId = comment.getBlogId();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            comment.setAvatar(user.getAvatar());
            comment.setAdminComment(true);
        } else {
            //设置头像
            comment.setAvatar(avatar);
        }

        if (comment.getParentComment().getId() != null) {
            comment.setParentCommentId(comment.getParentComment().getId());
        }
        commentService.save(comment);
        List<Comment> comments = commentService.listCommentByBlogId(blogId);
        model.addAttribute("comments", comments);
        return "blog :: commentList";
    }

    /**
    * @Description: delete 删除评论
    * @Param: [blogId, id, attributes, model]
    * @return: java.lang.String
    * @Author: ZXP
    * @Date: 2020/6/28-11:19
    */
    @GetMapping("/comment/{blogId}/{id}/delete")
    public String delete(@PathVariable Long blogId, @PathVariable Long id, RedirectAttributes attributes, Model model){
        commentService.removeById(id);
        DetailedBlog detailedBlog = blogService.getDetailedBlog(blogId);
        List<Comment> comments = commentService.listCommentByBlogId(blogId);
        model.addAttribute("blog", detailedBlog);
        model.addAttribute("comments", comments);
        return "blog";
    }

}