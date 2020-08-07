package com.zwy.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zwy.pojo.Comment;

import java.util.List;

/**
 * @Description: 博客评论业务层接口
 * @Author: ZXPDMW
 * @Date: Created in 16:18 2020/6/25
 * @QQ: 75028210
 * @URL: http://39.96.113.190/
 */
public interface CommentService extends IService<Comment> {

    List<Comment> listCommentByBlogId(Long blogId);



//    查询子评论
//    List<Comment> getChildComment(Long blogId,Long id);


}